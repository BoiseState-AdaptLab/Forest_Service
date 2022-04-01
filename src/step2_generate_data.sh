# !/bin/bash

############################################################################################################
#                                                                                                          #
#  if this script is called with the -p flag, it means that you want to run the production pipeline        #
#    OR                                                                                                    #
#  if this script is called with the -g flag, it means that you want to run the google vision API          #
#                                                                                                          #
############################################################################################################
#                                                                                                          #
#  if this script is called with the -1 flag, it means that you want to run the software using template 1  #
#    OR                                                                                                    #
#  if this script is called with the -2 flag, it means that you want to run the software using template 2  #
#    OR                                                                                                    #
#  if this script is called with the -3 flag, it means that you want to run the software using template 3  #
#                                                                                                          #
############################################################################################################

############################################################
# Help                                                     #
############################################################
Help()
{
   # Display Help
   echo "Here's the flags you can choose from."
   echo
   echo "Syntax: bash step2_generate_data [-v] [-n]"
   echo "options:"
   echo "-v     Defines the version to run: 'pipeline' or 'google'."
   echo "-n     Defines the template you want to run the software with: 1, 2, or 3."
   echo
}

# Run the pipeline from here. The -p flag means that you're running the production 
sh ./../../OCR_4_Forest_Service/setup.sh 

while getopts i:v:n: opt; 
do
    case ${opt} in
        # Input file name
        i) input=${OPTARG};;
        # run the production pipeline
        v)  version=${OPTARG};;
        # run the production pipeline 
        n)  number=${OPTARG};;

        \?) # Invalid option
            echo "Error: You entered and invalid flag."
            exit 1;;
    esac
done

sh ./../../OCR_4_Forest_Service/build.sh -i $input -v $version -n $number


# this script generates the insertion statement that the next command runs. The data to generate the insert statement
# is either taken from the pipeline or form the google vision results. 
python3 ../../ForestryServiceDatabase/db/orm_scripts/create_report.py 

# connect and query the database
./../..//tools/postgresql-install/bin/psql -U flociaglia forestservicedb < ../../insert_report.txt
echo "-- Inserted values in report table"

# connect and query the database
./../../tools/postgresql-install/bin/psql -U flociaglia forestservicedb < ../../validation_tables.txt
echo "-- Connected to the forestservicedb"

# query the report table
./../../tools/postgresql-install/bin/psql -U flociaglia forestservicedb < ../../select_report.txt

# isert entire report data
./../../tools/postgresql-install/bin/psql -U flociaglia forestservicedb < ../../insert_report.txt
echo "-- Inserted values in report table"

# query the report table
./../../tools/postgresql-install/bin/psql -U flociaglia forestservicedb < ../../select_report.txt