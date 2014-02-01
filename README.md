aws-cli-sdb
===========

botocore json definition file to use Amazon SimpleDB with AWS CLI.
place sdb.json to /path/to/botocore/data/aws , then you can use it like:

~~~
$ aws sdb list-domains --output json
{
    "Domains": [
        "ElasticMapReduce-2013-11",
        "hoge"
    ]
}
~~~

TODO

* BatchDeleteAttributes
* BatchPutAttributes
* CreateDomain
* DeleteAttributes
* DeleteDomain
* DomainMetadata
* GetAttributes
* ~~ListDomains~~ done
* PutAttributes
* Select


 WSDL
 http://sdb.amazonaws.com/doc/2009-04-15/AmazonSimpleDB.wsdl