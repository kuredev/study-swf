- AWS Flow Framework for Rubyのサンプル
- S3からオブジェクトをダウンロードし、ファイル名を変更してアップロードする
- 面倒でバケット名以外のパラメータはハードコーディングしてるので適宜調整すること
- 実行方法
    - 以下を作成しておく
        - ドメイン： Booking3
        - ワークフロータイプ：S3AppWorkFlow.s3app(1.0)
        - ワークフロータイプ：S3AppWorkFlow2.s3app(1.0)
        - アクティビティタイプ：S3DownloadActivity.download4(1.0)
        - アクティビティタイプ:S3UploadActivity.upload2(1.0)
        - アクティビティタイプ:S3UploadActivity2.upload2(1.0)
    - S3バケットに「test_image.jpg」がある
    - 以下を順に実行（starter以外のコマンドは別ターミナル）
- ワークフローを複数ハンドリング可能
    - ワークフロー実行時にワークフロータイプの引数を調整すれば切り替え可能

以下のようにワークフローワーカを作成するときに各ワークフローやアクティビティを複数登録しておく
```ruby
# ワークフロータスクリスト
workflow_worker = AWS::Flow::WorkflowWorker.new(
    swf.client, domain, "s3-decition-task-list", *[S3AppWorkFlow2, S3AppWorkFlow])
```

```ruby
# アクティビティタスクリスト
active_worker = AWS::Flow::ActivityWorker.new(
    domain.client, domain, "s3-activity-task-list2", *[S3UploadActivity, S3UploadActivity2] )
```


実行方法
```
$ ruby ../starter.rb
$ ruby s3app_workflow_worker.rb
$ ruby s3_download_acivity_worker.rb
$ ruby s3_upload_acivity_worker.rb
```


