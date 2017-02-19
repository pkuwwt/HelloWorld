#!/bin/bash

commands=()
command=

print_usage() {
	echo "$0 source_code"
	echo "NOTE: the beginning consecutive comments lines are viewed as commands"
	echo "Example: Hello.c
// gcc -o Hello Hello.c
// ./Hello
// 
int main(int argc, char* argv[]) {
	printf(\"Hello world!\\n\"); 
	return 0;
}" 
}

get_command_from_line() {
	command=${1#* }
	if [[ "-$command" == "-$1" ]];then
		command=
	fi
	if [[ "-$command" == "-" ]];then
		return 1
	else
		commands+=("$command")
		return 0
	fi
}

get_commands() {
	while read line; do
		get_command_from_line "$line"
		if (( $? != 0 )); then
			break
		fi
	done <"$1"
}

execute_commands() {
	for (( i=0;$i<${#commands[@]};i=$i+1 )); do
		if [[ $? != 0 ]]; then
			break
		fi
		echo "> ${commands[$i]}"
		bash -c "${commands[$i]}"
	done
}

if (( $# == 0 )); then
	print_usage
else
	get_commands "$1"
	execute_commands
fi

