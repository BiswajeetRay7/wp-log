#!/bin/bash
cat << "EOF" | lolcat

 __       __  _______           __        ______    ______  
|  \  _  |  \|       \         |  \      /      \  /      \ 
| $$ / \ | $$| $$$$$$$\        | $$     |  $$$$$$\|  $$$$$$\
| $$/  $\| $$| $$__/ $$ ______ | $$     | $$  | $$| $$ __\$$
| $$  $$$\ $$| $$    $$|      \| $$     | $$  | $$| $$|    \
| $$ $$\$$\$$| $$$$$$$  \$$$$$$| $$     | $$  | $$| $$ \$$$$
| $$$$  \$$$$| $$              | $$_____| $$__/ $$| $$__| $$
| $$$    \$$$| $$              | $$     \\$$    $$ \$$    $$
 \$$      \$$ \$$               \$$$$$$$$ \$$$$$$   \$$$$$$ 
                                                            
                                                            
                                                            

                          Author: Biswajeet Ray
                     Github:github.com/BiswajeetRay7
EOF

LISTS=$1

if [[ ! -f ${LISTS} ]]; then
        echo "ERROR: ${LISTS} not found"
        echo "usage: ./wp-log list.txt"
        exit
fi

for SITE in $(cat $LISTS);
do
    if [[ $(curl --connect-timeout 3 --max-time 3 -kLs "${SITE}/wp-content/debug.log" ) =~ 'PHP Notice: ' ]]; then
                echo -e "\e[32m[+] FOUND: ${SITE}/wp-content/debug.log"
        else
                echo -e "\e[31m[-] NOT FOUND: ${SITE}"
        fi
    
done

