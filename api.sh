#!/bin/bash

# Documentation
read -r -d '' DOCUMENTATION <<EOF
Utility for efficiently setting up environments, unit tests, and populated databases.

Usage:
  $CMD setup - Install programs and add api alias to bashrc
  $CMD db - Set up a populated database
  $CMD test - Run unit tests on application

EOF

# Define location globals
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[@]}" )" && pwd )"

# Add bash alias for script and install all required programs and git hooks
function setup() {

    # Add alias to bashrc (NOTE: Change this to bash_profile if running on a macOS machine)
    echo "Adding alias to bashrc..."
	echo "alias api='bash $SCRIPT_DIR/api.sh'" >> $HOME/.bashrc
	source $HOME/.bashrc

    # Add commit hooks to repository
    echo "Creating commit hooks..."
    cp hooks/pre-commit .git/hooks
    chmod -x .git/hooks/pre-commit

    cp hooks/commit-msg .git/hooks
    chmod -x .git/hooks/commit-msg

	# If pip is not installed, install it
	if [[ $(which pip) == "" ]] || [[ $(which pip3) == "" ]]; then
  		curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py | python get-pip.py --user
	fi

	# pip install --user -r $SCRIPT_DIR/requirements.txt
	pip3 install --user -r $SCRIPT_DIR/requirements.txt

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
