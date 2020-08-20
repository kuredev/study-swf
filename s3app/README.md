## 概要

- AWS Flow Framework for Rubyのサンプル
- S3からオブジェクトをダウンロードし、ファイル名を変更してアップロードする
- 面倒でバケット名以外のパラメータはハードコーディングしてるので適宜調整すること

## 実行方法
    - 以下を作成しておく
        - S3バケット
            - 「test_image.jpg」がある（ファイル名は適当に読み替えること）
        - SWF
            - ドメイン： Booking3
            - 以下のアクティビティタイプ/ワークフロータイプを作っておく

### アクティビティタイプ

| タイプ名                     | バージョン | タスクリスト           |
|------------------------------|------------|------------------------|
| S3UploadActivity.upload2     | 1          | s3-activity-task-list2 |
| S3UploadActivity2.upload2    | 〃         | 〃                     |
| S3DownloadActivity.download4 | 1          | s3-activity-task-list  |

### ワークフロータイプ

| タイプ名             | バージョン | タスクリスト          |
|----------------------|------------|-----------------------|
| S3AppWorkFlow.s3app  | 1          | s3-decition-task-list |
| S3AppWorkFlow2.s3app | 〃         | 〃                    |

## 実行手順

```
$ pwd
study-swf/s3app/flow
$ bundle exec ruby ../starter.rb
$ bundle exec ruby s3app_workflow_worker.rb
$ bundle exec ruby s3_download_acivity_worker.rb
$ bundle exec ruby s3_upload_acivity_worker.rb
```
