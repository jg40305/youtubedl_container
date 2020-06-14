# youtubedl_container

A repo of container which download videos from youtube.

## ENV

Docker Engine: 19.03.8
Compose: 1.12.5
CentOS: 7.7.1908
Python 3.7
其他的看 Dockerfile

## 目錄

```yaml
- type: bind
  source: ./youtubedl
  target: /proj/youtubedl

下載的影片都放這裡
```

## 啟動指令

```shell
$ docker-compose build --force-rm
$ docker-compose up -d
```

## 下載指令

```shell
$ youtube-dl -F https://{{ youtube_url }} # 查看 format code
$ youtube-dl -v https://{{ youtube_url }} -f 137+251 --merge-output-format mkv
$ youtube-dl -v https://{{ youtube_url }}  # download by default
```
