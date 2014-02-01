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

* ~~BatchDeleteAttributes~~ done
* ~~BatchPutAttributes~~ done
* ~~CreateDomain~~ done
* ~~DeleteAttributes~~ done
* ~~DeleteDomain~~ done
* ~~DomainMetadata~~ done
* ~~GetAttributes~~ done
* ~~ListDomains~~ done
* ~~PutAttributes~~ done
* ~~Select~~ done


 WSDL
 http://sdb.amazonaws.com/doc/2009-04-15/AmazonSimpleDB.wsdl
