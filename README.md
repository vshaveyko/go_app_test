## installation :
1. `sudo docker run -d -v pg-data:/var/lib/postgresql/data --name postgres postgres`
2. `bundle`
3. `sudo docker build -t test_go .`
4. `sudo docker run -d --name test_go --env-file=.env.prod --link postgres:postgres --link go_app:go_app -p 4000:4000 test_go sh bin/web`


## actions :

```
sudo docker stop test_go
sudo docker rm test_go
sudo docker build -t test_go .
sudo docker run -d --name test_go --env-file=.env.prod --link postgres:postgres --link go_app:go_app -p 4000:4000 test_go sh bin/web
sudo docker ps
```
