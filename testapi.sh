#!/bin/sh -x
export AWS_DEFAULT_REGION=us-west-2
domain=dom$RANDOM

aws sdb list-domains
aws sdb create-domain --domain-name $domain
aws sdb list-domains

aws sdb put-attributes --domain-name $domain --item-name item0 --attributes Name=attr0,Value=value0
aws sdb get-attributes --domain-name $domain --item-name item0
aws sdb get-attributes --domain-name $domain --item-name item0 --consistent-read

aws sdb batch-put-attributes --domain-name $domain --items '[{"Name":"item1","Attributes":[{"Name":"attr1","Value":"value1"}]},{"Name":"item2","Attributes":[{"Name":"attr2","Value":"value2"}]}]'

aws sdb select --select-expression "select * from $domain limit 1" | tee /dev/stderr | jq .NextToken | xargs aws sdb select --select-expression "select * from $domain" --next-token

aws sdb delete-attributes --domain-name $domain --item-name item0
aws sdb batch-delete-attributes --domain-name $domain --items '[{"Name":"item1","Attributes":[{"Name":"attr1","Value":"value1"}]},{"Name":"item2","Attributes":[{"Name":"attr2","Value":"value2"}]}]'

aws sdb select --select-expression "select * from $domain"

aws sdb domain-metadata --domain-name $domain
aws sdb delete-domain --domain-name $domain
aws sdb list-domains

