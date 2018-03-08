# 概要
* メールを３発シーケンシャルに送信する
* 事前にSNSトピックを作成しておく
    * TOPICのARNを.envに書いておく
* クレデンシャルは登録済みを前提

# 使い方

```commandline
$ aws-flow-ruby -f worker.json
$ ruby start.rb
```



