# VM Set-up Repo

The purpose of this repo is to serve as a reproducable way of seting up my personal VM.<br/>
This uses shell scripting and crontab for scheduling tasks.<br/>

## Set-up

Once in the VM, follow these steps in the the terminal:
1. `sudo apt-get install git-all`
2. `git clone https://github.com/henryletton/vm-code-and-notes.git`
3. `chmod +x vm-code-and-notes/initialise.sh`
4. `./vm-code-and-notes/initialise.sh`
5. When prompted, provide an passwords, keys, login details... etc.
...If provided incorrectly: stop script, delete any additional git repos, return to step 4.
6. Spotify API will require interaction to authenticate (only needed once).
7. If completed without errors, the vm is now set up.

## Maintenance

Any changes to the crontab file, or the linked repos will automatically be updated on the VM.<br/>
Any changes to the `initialise.sh` file will need it to be rerun manually (i.e. added a new repo project).
