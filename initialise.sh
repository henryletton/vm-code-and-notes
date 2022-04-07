# To be run when initialising new vm or adding new repo/process

sudo apt-get -y update
sudo apt-get -y upgrade

# Install required packages
sudo apt-get -y install git-all
sudo apt-get -y install python3
sudo apt-get -y install python3-pip
sudo apt-get -y install cron

# Ask for any private information (for .env files)
echo What is the spotify client id?
read spotify_client_id
echo What is the spotify client secret?
read spotify_client_secret
echo What is the spotify redirect url?
read spotify_redirect_uri
echo What is the sql db url?
read sql_db
echo What is the sql db user?
read sql_user
echo What is the sql db password?
read sql_pw

SPOTIFY_ENV="
spotify_client_id = $spotify_client_id
spotify_client_secret = $spotify_client_secret
spotify_redirect_uri = $spotify_redirect_uri
sql_db = $sql_db
sql_user = $sql_user
sql_pw = $sql_pw
"

# Clone and setup required repos
## spotify-v2
if [ -d "spotify-v2" ] 
then
    echo "Directory spotify-v2 exists." 
else
    git clone https://github.com/HenryLetton/spotify-v2.git
	cd spotify-v2
	pip3 install -r requirements.txt
	printf "$SPOTIFY_ENV" > .env
	python3 hourly_spotify.py
	cd ..
fi

# Set up crontab tasks
cd vm-code-and-notes
dos2unix vm-crontab.txt
crontab vm-crontab.txt
cd ..
