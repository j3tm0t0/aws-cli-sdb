#!/bin/sh -x
export AWS_DEFAULT_REGION=us-west-2
domain=dom$RANDOM
item=item$RANDOM

aws sdb list-domains
aws sdb create-domain --domain-name $domain
aws sdb list-domains

aws sdb put-attributes --domain-name $domain --item-name $item --attributes Name=name1,Value=value1
aws sdb get-attributes --domain-name $domain --item-name $item
aws sdb get-attributes --domain-name $domain --item-name $item --consistent-read
aws sdb select --select-expression "select * from $domain"
aws sdb delete-attributes --domain-name $domain --item-name $item

aws sdb delete-domain --domain-name $domain
aws sdb list-domains

