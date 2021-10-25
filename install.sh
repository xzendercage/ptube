#!/bin/bash
clear
echo "

 ██████╗ █████╗  ██████╗ ███████╗
██╔════╝██╔══██╗██╔════╝ ██╔════╝
██║     ███████║██║  ███╗█████╗  
██║     ██╔══██║██║   ██║██╔══╝  
╚██████╗██║  ██║╚██████╔╝███████╗
 ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝
                                            
 /_  __/  / __ \  / __ \   / /   / ___/  ~ Tools Instaler By Xzender Cage ~
  / /    / / / / / / / /  / /    \__ \ 
 / /    / /_/ / / /_/ /  / /___ ___/ / 
/_/     \____/  \____/  /_____//____/  
                                       
";

 INSTALL_DIR="/usr/share/doc/ptube"

echo "[✔] Checking directories...";
if [ -d "$INSTALL_DIR" ];
then
    echo "[◉] A directory ptube was found! Do you want to replace it? [Y/n]:" ;
    read mama
    if [ $mama == "y" ] ;
    then
      sudo rm -R "$INSTALL_DIR"
    else
        exit
    fi
fi

echo "[✔] Installing ...";
echo "";
sudo apt-get install -y python-pip
sudo pip install --upgrade youtube_dl
sudo apt-get install -y libav-tools
git clone https://github.com/xzendercage/ptube.git $INSTALL_DIR;
echo "#!/bin/bash
python $INSTALL_DIR/ptube.py" '${1+"$@"}' > ptube;
chmod +x ptube;
sudo cp ptube /usr/bin/;


if [ -d "$INSTALL_DIR/ptube" ];
then
    echo "";
    echo "[✔]Tool istalled with success![✔]";
    echo "";
    echo "[✔]====================================================================[✔]";
    echo "[✔] ✔✔✔  All is done!! You can execute tool by typing ptube   !   ✔✔✔ [✔]";
    echo "[✔]====================================================================[✔]";
    echo "";
else
    echo "[✘] Installation failed![✘] ";
    exit
fi
