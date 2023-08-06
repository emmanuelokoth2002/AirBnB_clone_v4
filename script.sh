#!/bin/bash

# Step 1: Create a new folder called web_dynamic in the AirBnB_v4 directory
mkdir -p AirBnB_v4/web_dynamic

# Step 2: Copy the necessary files to the web_dynamic folder
cp AirBnB_v4/web_flask/static AirBnB_v4/web_dynamic/ -r
cp AirBnB_v4/web_flask/templates/100-hbnb.html AirBnB_v4/web_dynamic/
cp AirBnB_v4/web_flask/__init__.py AirBnB_v4/web_dynamic/
cp AirBnB_v4/web_flask/100-hbnb.py AirBnB_v4/web_dynamic/

# Step 3: Rename 100-hbnb.py to 0-hbnb.py
mv AirBnB_v4/web_dynamic/100-hbnb.py AirBnB_v4/web_dynamic/0-hbnb.py

# Step 4: Rename 100-hbnb.html to 0-hbnb.html
mv AirBnB_v4/web_dynamic/100-hbnb.html AirBnB_v4/web_dynamic/0-hbnb.html

# Step 5: Update the 0-hbnb.py file to replace the existing route with /0-hbnb/
sed -i 's@app.route("/100-hbnb/")@app.route("/0-hbnb/")@g' AirBnB_v4/web_dynamic/0-hbnb.py

# Step 6: If 100-hbnb.html is not present, use 8-hbnb.html instead
if [ ! -f "AirBnB_v4/web_dynamic/0-hbnb.html" ]; then
    cp AirBnB_v4/web_flask/templates/8-hbnb.html AirBnB_v4/web_dynamic/0-hbnb.html
fi

# Set environment variables
export HBNB_MYSQL_USER=hbnb_dev
export HBNB_MYSQL_PWD=hbnb_dev_pwd
export HBNB_MYSQL_HOST=localhost
export HBNB_MYSQL_DB=hbnb_dev_db
export HBNB_TYPE_STORAGE=db

# Change directory to the web_dynamic folder
cd AirBnB_v4/web_dynamic/

# Start the Flask web application
python3 -m 0-hbnb
