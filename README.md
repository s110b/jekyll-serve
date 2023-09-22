## 进入容器命令

```shell

启动docker

docker run -p 4000:4000 -d xiquwugou/s110b

进入zsh，执行命令

docker exec -it $(docker ps --format '{{.ID}}\t{{.Image}}\t{{.Status}}' | grep 's110b' | grep 'Up' | awk '{print $1}') zsh
```

- I wanted two images, one for easy CLI (`bretfisher/jekyll`) and one for

