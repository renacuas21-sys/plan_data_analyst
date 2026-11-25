
from pathlib import Path
from pypdf import PdfReader
from docx import Document

BASE = Path(__file__).resolve().parent / "cv"

archivos = sorted(
    p for p in BASE.rglob("*")
    if p.is_file() and p.suffix.lower() in (".pdf", ".docx")
)

correctos = 0
observaciones = 0

for archivo in archivos:
    errores = []

    try:
        if archivo.suffix.lower() == ".pdf":
            pdf = PdfReader(archivo)
            paginas = len(pdf.pages)

            texto = "\n".join(
                p.extract_text() or "" for p in pdf.pages
            )

            if paginas > 2:
                errores.append(f"Excede 2 paginas: {paginas}")

        else:
            doc = Document(archivo)

            partes = [doc.element]

            for seccion in doc.sections:
                partes.extend([
                    seccion.header._element,
                    seccion.footer._element,
                    seccion.first_page_header._element,
                    seccion.first_page_footer._element,
                    seccion.even_page_header._element,
                    seccion.even_page_footer._element
                ])

            texto = "\n".join(
                nodo.text or ""
                for parte in partes
                for nodo in parte.xpath(".//w:t")
            )

        if len(texto.strip()) < 500:
            errores.append("Texto insuficiente o no extraible")

        if "@" not in texto:
            errores.append("Correo no detectado")

        if archivo.parent.name.startswith(
            ("01_", "02_", "03_", "04_", "05_", "06_", "07_")
        ):
            extension = (
                ".docx"
                if archivo.suffix.lower() == ".pdf"
                else ".pdf"
            )

            if not archivo.with_suffix(extension).exists():
                errores.append("Falta archivo equivalente")

        if errores:
            observaciones += 1
            print(f"[REVISAR] {archivo.name}")

            for error in errores:
                print(f"  - {error}")

        else:
            correctos += 1
            print(f"[OK] {archivo.name}")

    except Exception as error:
        observaciones += 1
        print(f"[ERROR] {archivo.name}: {error}")

porcentaje = (
    correctos / len(archivos) * 100
    if archivos else 0
)

print("\n" + "=" * 50)
print("RESULTADO DE AUDITORIA")
print("=" * 50)
print(f"Documentos encontrados: {len(archivos)}")
print(f"Documentos correctos: {correctos}")
print(f"Documentos con observaciones: {observaciones}")
print(f"Porcentaje de aprobacion: {porcentaje:.2f}%")
print("=" * 50)
