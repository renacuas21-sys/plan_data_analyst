
from pathlib import Path
from pypdf import PdfReader
from docx import Document
from difflib import SequenceMatcher
import re

BASE = Path(__file__).resolve().parent / "cv"


def normalizar(texto):
    return re.sub(r"\W+", "", texto.lower())


def texto_word(archivo):
    doc = Document(archivo)

    return " ".join(
        nodo.text or ""
        for nodo in doc.element.xpath(".//w:t")
    )


def texto_pdf(archivo):
    pdf = PdfReader(archivo)

    return " ".join(
        pagina.extract_text() or ""
        for pagina in pdf.pages
    )


def contar_imagenes(doc):
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

    return sum(
        len(parte.xpath(".//w:drawing | .//w:pict"))
        for parte in partes
    )


correctos = 0
observaciones = 0
total = 0

for carpeta in sorted(BASE.iterdir()):

    if not carpeta.is_dir():
        continue

    if not carpeta.name.startswith(
        ("01_", "02_", "03_", "04_", "05_", "06_", "07_")
    ):
        continue

    print(f"\n--- {carpeta.name} ---")

    for archivo in sorted(carpeta.glob("*.docx")):

        total += 1
        errores = []

        try:
            doc = Document(archivo)
            pdf = archivo.with_suffix(".pdf")

            imagenes = contar_imagenes(doc)
            nombre = archivo.stem.lower()

            # Validacion del formato ATS

            if "ats" in nombre and imagenes > 0:
                errores.append(
                    f"ATS contiene elementos graficos: {imagenes}"
                )

            if "ats" in nombre and doc.tables:
                errores.append("ATS contiene tablas")

            # Validacion del formato profesional

            if "profesional" in nombre and imagenes == 0:
                errores.append(
                    "Profesional sin elemento grafico detectado"
                )

            # Validacion de equivalencia Word/PDF

            if not pdf.exists():
                errores.append("PDF equivalente no encontrado")

            else:
                word = normalizar(texto_word(archivo))
                pdf_texto = normalizar(texto_pdf(pdf))

                similitud = SequenceMatcher(
                    None,
                    word,
                    pdf_texto,
                    autojunk=False
                ).ratio() * 100

                if similitud < 90:
                    errores.append(
                        f"Similitud Word/PDF: {similitud:.2f}%"
                    )

            # Resultado individual

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


# Resultado consolidado

porcentaje = (
    correctos / total * 100
    if total else 0
)

print("\n" + "=" * 50)
print("AUDITORIA AVANZADA DE CV")
print("=" * 50)
print(f"Pares Word/PDF evaluados: {total}")
print(f"Pares correctos: {correctos}")
print(f"Pares con observaciones: {observaciones}")
print(f"Porcentaje de aprobacion: {porcentaje:.2f}%")
print("=" * 50)
