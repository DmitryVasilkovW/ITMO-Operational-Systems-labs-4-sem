#!/bin/bash

file_name=$1

if [[ ! -f "$file_name" ]]; then
    echo "No such file"
    exit 1
fi

if [[ $file_name =~ [^a-zA-Z0-9\._-] ]]; then
    echo "Invalid characters in file name"
    exit 2
fi

sed '/#TEMPLATE/d' $file_name > "${file_name%.*}.sh"

file_name="${file_name%.*}.sh"

sed -i '1i #!/bin/bash' ${file_name}

trap 'rm -f "${file_name%.*}.sh" exit 1' INT

echo "Press ^C to cancel the installation"
sleep 5
echo -e "\033[2K\033[1A\033[2K"

if [[ -f "$file_name" ]]; then
    chmod +x "$$file_name"
    echo "Created $$file_name"
fi
