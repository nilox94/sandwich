#!/bin/bash
[ $INPUT ] || printf "No INPUT variable defined.\nReading from stdin\n\n"
input=`mktemp`
cat ${INPUT:-/dev/stdin} > $input
output=`mktemp`

trap "docker stop -t 0 sandwich && echo Program interrupted && exit 130" SIGINT SIGTERM
docker run -d --rm --name sandwich -v $input:/input -v $output:/output:rw sandwich:eng-spa bash -c "pdfsandwich /input -o /app/output $* && cp /app/output /output"
docker logs -f sandwich

[ $OUPUT ] || printf "\nNo OUTPUT variable defined. Writing into output.pdf\n"

cp $output ${OUTPUT:-output.pdf}
rm $input $output
