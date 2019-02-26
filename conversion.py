import pdfkit
import easygui
import os
# from pathlib import Path
import pdftotext



pdf_file_path = input("Enter the input pdf file path::")
if os.path.exists(pdf_file_path):
    path, pdf_filename = os.path.split(pdf_file_path)
    (name,ext) = os.path.splitext(pdf_filename)
    if(ext ==  '.pdf'):
        op = name+".html"
        tp = name+"1.pdf"
        html_file_path = path+'/' + op
        out_pdf = path +'/'+ tp   
        os.system("pdftotext '%s' '%s' " % (pdf_file_path, html_file_path))
        pdfkit.from_file(html_file_path, out_pdf)
        print("Converted html file path:")
        print(html_file_path)
        print("Output file location:")
        print(out_pdf) 
    else:
        print ("Error : Please check your specified path.")
else:
    print ("Error : PDF file not exists in specified path.")














