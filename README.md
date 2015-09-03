# whoa

Tinier version of [rackerlabs' whoa](https://github.com/rackerlabs/whoa).

```shell
11:59:20 $ docker rmi whoa/tiny # nothing up my sleeve
Error response from daemon: No such image whoa/tiny
FATA[0000] Error: failed to remove one or more images
11:59:33 $ docker run -d --name tiny -p 80:8080 whoa/tiny
c05221baf60a5885dbbd0458712440a8b6a21a0b7ea4f37d609a8eef5bf255b4
11:59:36 $ curl $( docker port tiny 8080 )
🎉 Whoa! 🎉
11:59:37 $ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED              VIRTUAL SIZE
whoa/tiny           latest              0f29e8c41570        12 minutes ago       1.093 MB
```

3 seconds from fresh Docker Swarm cluster to running webserver

This builds upon `rackerlabs/whoa`, this time using a statically built C web server called [mongoose](https://github.com/cesanta/mongoose). This whittles the little demo down to a 1.093 MB Docker image vs. that bloated go image. 4 MB, seriously?!?!

```
REPOSITORY          TAG                 IMAGE ID            CREATED              VIRTUAL SIZE
whoa/tiny           latest              0f29e8c41570        12 minutes ago       1.093 MB
rackerlabs/whoa     latest              5ad725856153        18 hours ago         4.437 MB
```
