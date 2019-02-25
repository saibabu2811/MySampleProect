import pdfkit
import easygui
from pathlib import Path
import pdb


# pdf2txt.py test.pdf -t html -o test.html
pdf2txt.py -o output.html -t html test.pdf
filepath = easygui.fileopenbox()
filename = Path(filepath).stem
pdfkit.from_file(filepath, filename +'.pdf')
filename = Path(filepath)
location = filename.with_suffix('.pdf')
print("Created File Location:")
print(location)






