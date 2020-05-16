#!/bin/bash
# script to bootstrap setting up a mac with ansible 

function uninstall {

echo "WARNING : This will remove homebrew and all applications installed through it"
echo -n "are you sure you want to do that? [y/n] : "
read confirmation

if [ $confirmation == "y" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
    exit 0
else
  echo "keeping everything intact"
  exit 0
fi

}

function bootstrap_ansible {

    sudo easy_install pip
    sudo pip install ansible

}

if [ $1 == "uninstall" ]; then
    uninstall
fi

bootstrap_ansible

echo "==========================================="
echo "Setting up your mac using lambchop4prez/setupmac"
echo "==========================================="

# is ansible-playbook installed?
if [ -x "$(command -v ansible-playbook)" ]; then
    ansible-playbook -i ./hosts playbook.yml --verbose
fi

echo "cleaning up..."

echo "and we are done! Enjoy!"

exit 0