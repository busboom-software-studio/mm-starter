#! /bin/bash 


# Put the cursor ( where you type ) on the line after the prompt, since
# the prompts can get long. 
echo 'export PS1="$PS1\n\$ "' >> ~/.bashrc

bundle install 
