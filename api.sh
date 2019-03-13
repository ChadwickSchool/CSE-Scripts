#!/bin/bash

# Documentation
read -r -d '' DOCUMENTATION <<EOF
Usage: api [OPERATION]
Operation: app   - Set up application using test database
		   db    - Set up a populated database
		   setup - Install programs and add api alias to bashrc
		   test  - Run unit tests on application
EOF

# Define location globals
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[@]}" )" && pwd )"

# Add bash command for script and install all required programs
function setup() {

	echo "alias api='bash $SCRIPT_DIR/api.sh'" >> $HOME/.bashrc
	source $HOME/.bashrc

	# If pip is not installed, install it
	if [[ $(which pip) == "" ]] || [[ $(which pip3) == "" ]]; then
    		curl https://bootstrap.pypa.io/get-pip.py | python
	fi

	pip install --user -r $SCRIPT_DIR/requirements.txt

}

# Parse desired action and execute corresponding function
ACTION=$1
case "$ACTION" in
	app)
		bash $SCRIPT_DIR/backend.sh
		;;
	db)
		bash $SCRIPT_DIR/db_gen.sh
		;;
	setup)
		setup
		;;
	test)
		bash $SCRIPT_DIR/test.sh
		;;
	*)
		echo "'$ACTION' is not a valid operation."
		echo "$DOCUMENTATION"
		echo "Exiting..."
esac
