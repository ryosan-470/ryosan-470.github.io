---
title: "FIDO2 SSHキーの利用のすすめ"
date: 2024-02-06T14:00:00+09:00
tags: ["OpenSSH", "Linux", "macOS"]
---

‼️ この記事は元々社内向けに書かれたものを、公開用に修正したものです。‼️

みなさん毎日 SSH をしていますか？どのように使っていますか？私は数年前に Yubikey 5C を購入し、SSH秘密鍵を保管しています。
この記事は主に macOS を前提にしていますが、Linux や WSL でも少しの工夫で利用可能です。
macOS ユーザーの私はすでに数年使っていたのですが、macOSでは、快適に使用するためにはいくつかの工夫が必要で、その過程でいくつかの不便さを感じていました。
ところが、macOS Sonoma に更新したところ割とまともに使えるようになり:smile:な気持ちになったためこの記事を書きました。

# 概要

OpenSSH 8.2p1 から FIDO2/U2F ハードウェア認証器がサポートされています。[^1]

[^1]: [OpenSSL 8.2 リリースノート](https://www.openssh.com/txt/release-8.2)

そのため、クライアントのバージョンをアップデートしてください。ちなみに macOS の場合、Sonoma まであげないとデフォルトでは使えません😇

通常、SSH秘密鍵は各デバイスに保存して利用します。なので端末を移行する際に、

- 新しく鍵を作り直し前の鍵を revoke する
- 前の鍵をコピーする

のやり方があるかなと思います。FIDO2 SSHキーを利用する場合、鍵はFIDO2認証器（例：Yubikey）に保存されます。そのため、新しい端末での利用は認証器を差し込んでエクスポートするだけで済みます。
また鍵の作り方によりますが鍵を利用するときに認証器による認証を必要とするのでわりとセキュアに利用できるかと思います。

## 鍵の生成

[こちら](https://gist.github.com/Kranzes/be4fffba5da3799ee93134dc68a4c67b#evaluating-additional-authentication-factors)に綺麗にまとまっています。
私は上から3つ目の No PIN but touch is required な鍵を生成して利用しています。

## 使い方

例えば、GitHub に SSH をしたいとき、

```console
% ssh -T git@github.com
```

何も表示されない場合、Yubikey の金色の部分をタッチして認証を完了させます。

# macOS の場合

macOS では、Sonoma 以前のプリインストール済 OpenSSH クライアントでは FIDO2 認証器を利用できません😔
- [Appleユーザーの悲痛な叫びスレッド](https://developer.apple.com/forums/thread/698683)

Homebrewを使用してインストールすることで利用可能になりますが、SSH Agentの動作は保証されません。(私は格闘しましたがどうしようもなく諦めました)

ところが、Sonoma になりプリインストールされた OpenSSH クライアントでサポートはされるようになりました。
ありがとう、Apple！
ただし少し工夫が必要になります。詳細は [GitHub イシュー](https://github.com/Yubico/libfido2/issues/464#issuecomment-1738972718) を参照してください。

そんなわけで macOS ユーザーはおとなしく Sonoma に更新するか Linux を使いましょう (適当)

# 終わりに

快適な SSH ライフを。
