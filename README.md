# **CSE-Scripts**
Scripts for Chadwick's Intro to Software Engineering class.

## Scripts
The major scripts in this directory are ```api.sh``` and ```cmesg.sh```, which incorporates the use of ```mesg_check.py```. ```api.sh``` installs dependencies for the class's workflow (```pycodestyle```, ```pylint```, ```pytest```, ```Flask```, ```CORS```, ```oauth```, ```redis```, and ```travis-ci```), adds git hooks, and also sets up testing and application environments. ```cmesg.sh``` is run in a Travis-CI instance and checks the commit history for any violations in the class's git commit template.

## Script Usages
#### _API_
```
    Utility for efficiently setting up environments, unit tests, and populated databases.

    Usage:
      api setup - Install programs and add api alias to bashrc
      api db - Set up a populated database
      api test - Run unit tests on application
```

In order to install dependencies having just recently downloaded the script, run ```bash api.sh setup```, and that will install dependencies, hooks, and aliases.
