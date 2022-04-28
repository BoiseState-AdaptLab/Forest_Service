# Forest_Service

This document will walk you through the steps to take to to run the Forest Service OCR pipeline and store the results in the Forest Service Database. 

### Clone repos

Clone this repo with this command ``` git clone https://github.com/BoiseState-AdaptLab/Forest_Service.git```

Make sure that you have the Forest Service OCR repo and the database repo cloned in the same folder as the above one. 

Run: ```git clone https://github.com/BoiseState-AdaptLab/OCR_4_Forest_Service.git``` 

and ```git clone https://github.com/BoiseState-AdaptLab/ForestryServiceDatabase.git```.

IMPORTANT: Make sure you have Python installed on your machine. 

Congrats :tada: you now have all the repositories you need to run the project. 

### Setup

You will always ever interact with this main repository. We have written scripts that automate the interations between repos for you. 

* #### Setup.sh
  This script sets up the virtual enviroment in the Forest Service OCR pipeline repo so that all the dependencies get installed automatically. 
  
  Run ``` bash setup.sh```
 
### Run Project
 
* #### Step0_initialize_db.sh
  This script will start the PostGres server and connect to it, create the database tables and populate the validation tables. 
  
  Run ``` bash step0_initialize_db.sh```
  
  
* #### Step1_connect_db.sh
* #### Step2_generate_data.sh
* #### Step3_save_leave.sh

### Important Tips

* If you need to add valid options for the Allotment and Ranger District fields, make those changes in ```ForestryServiceDatabase/db/orm_scripts/populate_tables.py``` by adding the options to the fields lists. 

* If you need to run a new form, add its image format (png or jpeg -- :x: it can't be a pdf file!!) into the ```Forest_Service/data``` folder. 

* 
  

