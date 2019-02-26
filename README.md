# MySampleProject
Explore knowledge
# Getting Started
These will provide you solutions for the below issues<br />
1)Write A python program that convert PDF files in to HTML files and HTML files in to PDF<br />
input:- html file out<br />
output :- Converted pdf file path<br />
2)Write a program that take a JSON as a input and return a json with removing empty values keys<br />
input :- {"name": "Edge Networks", "Employee": 101, "phone": {"local": {"mobile": {}}}, "address": [{}, {}, "Bengalore"], "skills": {"java": 10, "python": 0, html: ""}}<br />
output:-{"name": "Edge Networks", "Employee": 101,  "address": [{}, {}, "Bengalore"], "skills": {"java": 10, "python": 0}}<br />
3)Make the SQL schema for Bus Booking mobile app.<br />
# Prerequisites
System : Ubuntu 18.04 LTS

# Installing
python 3.6.7 <br  />
virtualenv 15.1.0<br>
# Clone GitHub Repo
git clone https://github.com/saibabu2811/MySampleProject.git <br>
These will clone the copy in Project folder.
# Create Virtual environment
#### virtualenv {environment_name} --python=python3

# Activate Virtualenv
Activate virtual environment with the below command<br> 
#### source {environment_name}/bin/activate

# Install  requirements.pip 
Enter 'cd {project folder}'
##### pip install -r requirements.pip

# Run commands
--Write A python program that convert PDF files in to HTML files and HTML files in to PDF
#### python conversion.py

--Write a program that take a JSON as a input and return a json with removing empty values keys
#### python remove_empty.py

# SQL schema for Bus Booking mobile app

#### Install sql server
Reference: https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-16-04
--brs.sql is the generated dump file. we can test on importing file to local database 














