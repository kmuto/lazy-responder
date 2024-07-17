# lazy-responder

レスポンスを待機したり、任意のステータスコードを返したり、stressコマンドを呼び出して負荷をかけたりするための、簡易な実験用Webサーバーです。

※世界に開けた環境で使うことは絶対に推奨しません。

## 使い方

Ruby環境で動作します。

```
bundle install
bundle exec ruby lazy-responder.rb
```

ローカルホストのポート4567でWebサーバーが起動します。

`/`にアクセスすると`Hello World`が表示されます。

```
$ curl http://localhost:4567
Hello World
```

`/status/数字`にアクセスするとそのステータスコードが返ります。

```
$ curl -v http://localhost:4567/status/404
...
< HTTP/1.1 404 Not Found
...
Hello World with status 404

$ curl -v http://localhost:4567/status/501
...
< HTTP/1.1 501 Not Implemented
...
Hello World with status 501
```

`/sleep/秒数`にアクセスするとその秒数だけ待機してから返答します。

```
$ curl http://localhost:4567/sleep/5
(5秒返事がこない)
Hello World after 5 seconds
```

`/stress/CPU数/秒数`にアクセスするとCPU数ぶんの負荷を秒数だけかけます。stressコマンドを呼び出しています。

```
$ curl http://localhost:4567/stress/2/5
(CPU2つぶん、5秒負荷をかける)
Hello World after 5 seconds with stress 2 CPUs
```

ポート10080で、全インターフェイスバインドで実行するには、以下のようにします。

```
bundle exec ruby lazy-responder.rb -p 10080 -e production
```
