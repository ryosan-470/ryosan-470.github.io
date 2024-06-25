---
title: "AWS Observability ワークショップをやってみる"
date: 2024-06-24T14:00:00+09:00
tags: ["技術", "学習記録", "日常"]
---

先日は AWS Amplify Gen2 のワークショップに取り組んでいましたが今日からはさらに別のワークショップとして [Observability のワークショップ](https://catalog.us-east-1.prod.workshops.aws/workshops/31676d37-bbe9-4992-9cd1-ceae13c5116c/ja-JP/intro#aws-observability) に取り組んでみます。このワークショップは日本語で書かれているので取り組みやすいですね。

# はじめに

さて今回も前回同様[自分の AWS アカウントを利用](https://catalog.us-east-1.prod.workshops.aws/workshops/31676d37-bbe9-4992-9cd1-ceae13c5116c/ja-JP/installation)してワークショップを進めていきます。

実は初めに Cloud9 を利用しない方向で進めていたのですが、Macbook Air (M1 2020) ではイメージのビルドあたりで先に進めなくなってしまったので大人しく Cloud9 を使うようにしました。

```console
AWSReservedSSO_AdministratorAccess_daa2d0b4e715509f:~/environment/one-observability-demo/PetAdoptions/cdk (main) $ cdk bootstrap aws://${ACCOUNT_ID}/${AWS_REGION}
 ⏳  Bootstrapping environment aws://645756205742/ap-northeast-1...
Trusted accounts for deployment: (none)
Trusted accounts for lookup: (none)
Using default execution policy of 'arn:aws:iam::aws:policy/AdministratorAccess'. Pass '--cloudformation-execution-policies' to customize.
 ✅  Environment aws://645756205742/ap-northeast-1 bootstrapped (no changes).

AWSReservedSSO_AdministratorAccess_daa2d0b4e715509f:~/environment/one-observability-demo/PetAdoptions/cdk (main) $
```

こんな感じで CDK のブートストラップを進めます。次にデプロイをするのですが Cloud9 のデフォルトのディスク容量 (10GB) では容量不足となるので EBS を 50GB に更新してから行います。ディスクの拡張方法については [Amazon EBS のドキュメント](https://docs.aws.amazon.com/ebs/latest/userguide/recognize-expanded-volume-linux.html?icmpid=docs_ec2_console)を参照して対応してください。

ディスクが増えれば問題なく先に進むことができました。あとはデプロイをしていきます。

```console
% kubectl get nodes

NAME                                              STATUS   ROLES    AGE   VERSION
ip-11-0-174-31.ap-northeast-1.compute.internal    Ready    <none>   10m   v1.28.8-eks-ae9a62a
ip-11-0-221-213.ap-northeast-1.compute.internal   Ready    <none>   10m   v1.28.8-eks-ae9a62a
```

ここまでくるのに紆余曲折あり 2 時間ほどかかりました 😭

# アプリケーションアーキテクチャ

![概要図](https://static.us-east-1.prod.workshops.aws/public/2f24c4fd-c314-4a62-951b-d6134f3d21fb/static/images/arch/PetAdoptions_architecture.png)

アーキテクチャ図を見てみると、大きく 4 つの要素に分かれたマイクロサービスアーキテクチャのようになっているようですね。このアプリケーションではペットを探しお家に連れ帰ることのできるサービスのようで引き取るときにお金を支払う必要があるようです。

## フロントエンドサービス

ユーザーが一番最初にアクセスするフロントエンドサービスは C# で構築されています。ソースコードは [petsite](https://github.com/aws-samples/one-observability-demo/tree/main/PetAdoptions/petsite/petsite) にあります。

## 検索サービス

検索サービスは Java となっており、ソースコードは [petsearch-java](https://github.com/aws-samples/one-observability-demo/tree/main/PetAdoptions/petsearch-java) にあります。ペットの色や種別を絞ることができます。

![](search_service_overview.png)

## ペット一覧

ペットの一覧を返す API サービスは Golang で書かれており、ソースコードは [petlistadoptions-go](https://github.com/aws-samples/one-observability-demo/tree/main/PetAdoptions/petlistadoptions-go) にあります。ざっくり読んでみる限りこの API は読み込みのみの対応のようです。

## ペット引取り一覧

引き取ったペットたちの一覧を確認することのできる API で Python で書かれておりソースコードは [petadoptionshistory-py](https://github.com/aws-samples/one-observability-demo/tree/main/PetAdoptions/petadoptionshistory-py) にあります。この API も基本的には読み込みのみ行います。

![ペット引取り一覧](petadoptionhistory.png)

## 支払い

ペットを引き取るには金額が決まっておりカードを用いて決済を行います。このときのサービスが支払いサービスで [PayForAdoptionsAPI](https://github.com/aws-samples/one-observability-demo/tree/main/PetAdoptions/payforadoption-go) にコードがあります。ここで購入に成功すると Adoption History 等が更新されるようです。

## 他

そのほかにも Lambda 関数で何かが動いているようですが一旦は割愛していきます。

# AWS ネイティブ Observability

CloudWatch と X-Ray について機能を確認できるようです。CloudWatch については私自身経験があるので軽く進めていきます。

## Log

### Logs Insight

`dedup` というクエリについては知らなかったので勉強になりました。重複排除を行えば大量に出力される同じメッセージのログを落とし 1 件だけ表示することができるようになります。さらに自然言語でも一部リージョンでクエリを行うことができるようになっているようです。(残念ながら東京リージョンではまだ利用できない模様)

### ログの異常検知

異常検知機能については使ったことがなかったので早速触れてみます。

[前の期間とパターンを比較する](https://catalog.us-east-1.prod.workshops.aws/workshops/31676d37-bbe9-4992-9cd1-ceae13c5116c/ja-JP/aws-native/logs/loganomaly/compare)ことでログイベントの変化を追うことができるのは非常に便利ですね。

# X-Ray

![](xray_service_map.png)

X-Ray のトレースマップを開いてみました。

トレース ID をクリックすると色々なことが詳しく確認できます。

![](xray_trace_detail.png)

このように図解されるのでどのサービスがどう関わっているのかパッと理解できるのは良いですね。さらに下部にはセグメントごとのタイムラインもありどこでエラーになっているかなどが確認できます。

![](xray_segment_tl.png)

# AWS Managed open-source Obserbability

AWS Distro for OpenTelemetry を体験してみたかったので早速取り掛かってみます。ひとまず上から順番に進めてみようということで Prometheus と Grafana の構築を行います。

## Amazon Managed Service for Prometheus

手順に書いてあるように CloudFormation を用いてサクッとワークスペースを作成していきます。EKS ワークロードからメトリクスを収集するには AWS Distro for Open Telemetry (ADOT) コレクターをデプロイしていきます。

メトリクスの取り込みのセクションは問題なく進みましたが、[EKS からメトリクスを取り込む](https://catalog.us-east-1.prod.workshops.aws/workshops/31676d37-bbe9-4992-9cd1-ceae13c5116c/ja-JP/aws-managed-oss/amp/ingest-metrics-managed-collector)の部分にあるコマンドは以下のように直しました。

```console
% aws eks update-cluster-config \
    --region $AWS_REGION \
    --name PetSite \
    --resources-vpc-config endpointPrivateAccess=true,endpointPublicAccess=false
```

さらに `scraper` を作るセクションも以下のように直してコマンドを実行していきます。私の環境ではセキュリティグループやサブネットは次のようになっていました。

![](eks_cluster_network.png)

```console
CONFIGURATION_BLOB=$(aws amp get-default-scraper-configuration --region $AWS_REGION | jq -r .configuration)
CLUSTER_ARN=$(aws eks describe-cluster --name PetSite | jq -r .cluster.arn)
WORKSPACE_ARN=arn:aws:aps:ap-northeast-1:645756205742:workspace/ws-37ada0b3-85d9-4dad-9881-f4585b1b121d

aws amp create-scraper \
  --source eksConfiguration="{clusterArn='${CLUSTER_ARN}', securityGroupIds=['sg-04c695bf2d025205a'],subnetIds=['subnet-01f7cf6db2d3105fe', 'subnet-051b72b515d109863']}" \
  --scrape-configuration configurationBlob=${CONFIGURATION_BLOB} \
  --destination ampConfiguration="{workspaceArn='${WORKSPACE_ARN}'}"
```

20 分くらいたってやっとこさ、Scraper は Active になりました。しかしこの後でなぜか `kubectl` がタイムアウトするようになってしまいました。原因究明は一旦諦めて、ECS メトリクスの取り込みも行います。こちらは指示通りあらたな ECS タスク定義を作成しそれをデプロイするようにサービスを更新することで問題なくデプロイできました。

## Amazon Managed Grafana

Amazon Managed Grafana を利用するためには SAML ベースの IdP または AWS SSO が必要とのことですが私が利用している AWS アカウントではすでに SSO を有効化しているのでそのまま利用します。

Amazon Managed Grafana の設定で AWS SSO の `Admin` グループを Grafana の管理者として設定しました。

![](grafana_user.png)

続いて表示されている URL を踏めば SSO のログイン画面が出てきてログインすれば普通に Grafana の画面に遷移できました。このまま AWS データソースの設定を行います。これも Prometheus の章で作成したものが表示されています。

![](grafana_aws_datasource.png)

さらに続けてダッシュボードのインポートを行います。まずは EKS のダッシュボードです。

![](grafana_dashboard_eks.png)

問題なさそうです。ECS メトリクスに関しては手動でダッシュボードを構築していくようなので一旦スキップしました。

# AWS Distro for OpenTelemetry

まずは [OpenTelemetry の説明](https://catalog.us-east-1.prod.workshops.aws/workshops/31676d37-bbe9-4992-9cd1-ceae13c5116c/ja-JP/aws-managed-oss/adot/concepts)を読んでいきます。

続いて各言語の実装による ADOT コレクターや OpenTelemetry ライブラリの説明が書かれていました。

# まとめ

このワークショップはかなり巨大で全部をしっかりやろうと思ったら数日はかかるようなボリューム感でした。今回は私が気になる部分だけをピックアップして取り組んでみましたがそれでも環境構築を含め 8 時間ほど要しました。さらに様々な AWS リソースを使うためかなりコストがかかるワークショップでもありました。もし取り組むならば 100 ドルクーポンなどをもらってやりたいものですね。
ワークショップのありがたいところとして一時的に ECS クラスターなどを止めるというやり方が公式で存在しているところです。ゼロにはできませんがある程度抑えることができるように設計されており非常に助かりました。([リソースをクリーンアップせずにコストを節約](https://catalog.us-east-1.prod.workshops.aws/workshops/31676d37-bbe9-4992-9cd1-ceae13c5116c/ja-JP/cleanup#))
