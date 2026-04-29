#!/bin/bash

#Z1
cat $1 | grep -i -P "(?<![-+])0x[123456789aAbBcCdDeEfF][123456789aAbBcCdDeEfF](?!,)$"

#Z2
cat $1 | grep -i -P "^(?<= )|[[:alnum:],.;:]@[[:alnum:]\-\.][[:alnum:]\-\.]"

#Z3 
cat $1  | grep -P "(?<=[\+\-[:digit:]])\.[[:digit:]](?= )|\.[[:digit:]]$"