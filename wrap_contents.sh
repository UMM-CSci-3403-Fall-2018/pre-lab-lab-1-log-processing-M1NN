#! /bin/bash

Content=$1
Header="$2_header.html"
Footer="$2_footer.html"
Result=$3

cat $Header $Content $Footer > $Result








