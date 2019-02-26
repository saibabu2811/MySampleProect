import pdfkit
import easygui
import os
from pathlib import Path
import pdftotext

a = input("Enter the input file::")
b = input("Enter the output path (Ex:/home/john/MySampleProject/)::")
pdf_filename = Path(a).stem
op = pdf_filename+".html"
html_file_path = b + op

if os.path.exists(a):
    os.system("pdftotext '%s' '%s' " % (a,html_file_path))
    pdfkit.from_file(html_file_path, pdf_filename+'1.pdf')
    print("Created File Location:")
    print(b+ pdf_filename+ '1.pdf')
else:
    print ("Error : PDF file not exists in specified path")












