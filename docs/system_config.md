# Important System Configuration
- Disable swapping
- Increase file descriptors
- Ensure sufficient virtual memory
- Ensure sufficient threads
- JVM DNS cache settings
- Temporary directory not mounted with noexec

> https://www.elastic.co/guide/en/elasticsearch/reference/6.8/system-config.html

## Disable swapping
Most operating systems try to use as much memory as possible for file system caches and eagerly swap out unused application memory. This can result in parts of the JVM heap or even its executable pages being swapped out to disk.

```
curl -X GET "localhost:9200/_nodes?filter_path=**.mlockall&pretty"
```


## file descriptors 
Elasticsearch uses a lot of file descriptors or file handles. Running out of file descriptors can be disastrous and will most probably lead to data loss. Make sure to increase the limit on the number of open files descriptors for the user running Elasticsearch to 65,536 or higher.

```
curl -X GET "localhost:9200/_nodes/stats/process?filter_path=**.max_file_descriptors&pretty"
```

## Virtual memoryedit
Elasticsearch uses a `mmapfs` directory by default to store its indices. The default operating system limits on mmap counts is likely to be too low, which may result in out of memory exceptions.

```
# On Linux, you can increase the limits by running the following command as root:
sysctl -w vm.max_map_count=262144
```

To set this value permanently, update the `vm.max_map_count` setting in `/etc/sysctl.conf`. To verify after rebooting, run `sysctl vm.max_map_count`.

## Number of threads
Elasticsearch uses a number of thread pools for different types of operations. It is important that it is able to create new threads whenever needed. Make sure that the number of threads that the Elasticsearch user can create is at least 4096.

This can be done by setting `ulimit -u 4096` as root before starting Elasticsearch, or by setting nproc to 4096 in `/etc/security/limits.conf`.


## Reference
[Important System Configuration](https://www.elastic.co/guide/en/elasticsearch/reference/6.8/system-config.html#system-config)



