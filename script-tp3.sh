#! /bin/bash
echo "@hourly ./script-tp3.sh"
while IFS= read -r site 
do
	if curl -I "$site" 2>&1 | grep -w "200\|301"; then
	    echo "$site está activo"
	else
	    echo "$site está caído"
	fi
done < sitios > status_"$(date +%Y-%m-%d_%H_%M_%S)"
