#!/usr/bin/env bash

VENV_DIRECTORY=venv38

if [[ ! -z "$VIRTUAL_ENV" ]]; then
    echo "Virtualenv is already activated: $VIRTUAL_ENV"
    return 1
fi

[[ ! -d "$VENV_DIRECTORY" ]] && virtualenv -p python3.8 $VENV_DIRECTORY

source $VENV_DIRECTORY/bin/activate

CLEARML_INSTALLED=$(pip list | grep -F clearml)

[[ -z "$CLEARML_INSTALLED" ]] && pip install clearml~=1.1.0
