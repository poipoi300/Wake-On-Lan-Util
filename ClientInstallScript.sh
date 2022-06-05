#!/bin/bash
#Setup passwordless ssh for main server and make WoL client script

DEVICE_NAME=$1 #No device name will default the resolution to 1920x1080


CMD_NAME="WoL"
CMD_LOC="/usr/local/bin/$CMD_NAME" #Different platforms may require a different path.
SERVER_USERNAME="poipoi"
SERVER_IP="tommy-srv.box" #You can put either a direct ip or a domain name(local or not, as long as the client's DNS can reach it).


if [[ $EUID > 0 ]]; then 
    echo "Elevated privileges are required to make the script into a command."
    echo "Without them, you need to manually move the file to your binaries directory in order to make it globally executable."
fi

echo "Beginning SSH passwordless setup"

SSHFILE="~/.ssh/id_rsa"
if [ -f "$SSHFILE" ]; then
    echo "Default key already exists, not generating new key."
else
    echo "Did not find default key. Generating new key."
    ssh-keygen -b 4096 -N "" -f "$SSHFILE" -q
fi
ssh-copy-id $SERVER_USERNAME@$SERVER_IP

echo "Passworldless SSH setup complete"


echo "Beginning Wake on Lan (WoL) client setup"

NewScriptFile="WoLClientScript.sh"

if [ -f "./$NewScriptFile" ]; then
    echo "WoL client script($NewScriptFile) already exists, do you want to overwrite it? ([y]/n)"
    read -r response
fi
if [[ $response =~ ^([yY][eE][sS]|[yY]|[ ]|)$ ]]; then
    echo "Generating new script"
    printf "#!/bin/bash\n" > "./$NewScriptFile"
    printf "#Execute WoL command on server with given argument(s) and device name\n" >> "./$NewScriptFile"
    printf "#if execution was normal (root), the below should look like this:\n" >> "./$NewScriptFile"
    printf "#ssh $SERVER_USERNAME@$SERVER_IP WoL DEVICE_NAMEHERE \$@\n" >> "./$NewScriptFile"
    printf "cmd=\`ssh $SERVER_USERNAME@$SERVER_IP \"WoL $DEVICE_NAME \$@\"\`\n" >> "./$NewScriptFile"
    printf "echo \$cmd\n" >> "./$NewScriptFile"

else
    echo "Not overwriting script."
fi

#Move Script to /usr/local/bin
if [[ $EUID > 0 ]]; then 
    mv "./$NewScriptFile" "$CMD_LOC"
    chmod +x "$CMD_LOC"
else
    chmod +x "./$NewScriptFile"
    echo "Made script executable, name is ./$NewScriptFile"
fi
 
#Check if the script was moved successfully
if [ -f "$CMD_LOC" ]; then
    echo "WoL client script successfully moved to $CMD_LOC"
    echo "It is now ready to be executed using $CMD_NAME" 
else
    echo "Script could not be made into a command, are you root?"
fi





