

hex_file=${1:-hello.intelhex}
readmemh_file=${2:-hello.readmemh}

cat $hex_file |sed -n 's#^:......00\(.*\)...$#\1#p' |sed 's/......../&\n/g' | sed '/^$/d' |awk '{print tolower($0)}' |tee $readmemh_file


