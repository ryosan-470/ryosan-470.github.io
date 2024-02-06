---
title: "FIDO2 SSHキーの利用のすすめ"
date: 2024-02-06T14:00:00+09:00
tags: ["OpenSSH", "Linux", "macOS"]
---

‼️ 社内向け記事を公開用に少し修正した記事になります。‼️

みなさん毎日 SSH をしていますか？どのように使っていますか？私は数年前に Yubikey 5C を購入してそこにSSH秘密鍵を保有しています。
本記事は私が、macOS を普段使っているので、macOS が前提にはなっていますがおそらく少しの工夫で Linux や WSL でも利用できるのではないかと思います。
macOS ユーザーの私はすでに数年使っていたのですが、macOS ではいろいろ頑張らないと快適に使えずイライラを募らせておりました。
ところが、macOS Sonoma に更新したところ割とまともに使えるようになり:smile:な気持ちになったためこの記事を書きました。

# 概要

OpenSSH 8.2p1 から FIDO2/U2F ハードウェア認証器がサポートされたようです。[^1]

[^1]: [OpenSSL 8.2 リリースノート](https://www.openssh.com/txt/release-8.2)

なのでクライアントのバージョンをそこまであげてください。ちなみに macOS の場合、Sonoma まであげないとデフォルトでは使えません😇

通常、SSH秘密鍵は各デバイスに保存して利用します。なので端末を移行する際に、

- 新しく鍵を作り直し前の鍵を revoke する
- 前の鍵をコピーする
のやり方があるかなと思います。これを FIDO 2 SSH キーを利用すると FIDO2 認証器 (ex. Yubikey) に保存されるので新しい端末にキーを差しエクスポートするだけで利用できます。また鍵の作り方によりますが鍵を利用するときに認証器による認証を必要とするのでわりとセキュアに利用できるかと思います。

## 鍵の生成

https://gist.github.com/Kranzes/be4fffba5da3799ee93134dc68a4c67b#evaluating-additional-authentication-factors に綺麗にまとまっています。
私は上から3つ目の No PIN but touch is required な鍵を生成して利用しています。

## 使い方

例えば、GitHub に SSH をしたいとき、

```console
% ssh -T git@github.com
```

と入力するとナーンも表示されないのでこのときに Yubikey の金色のところをタッチすると認証できます。

# macOS の場合

macOS では、Sonoma 以前のプリインストール済 OpenSSH クライアントでは FIDO2 認証器を利用できません😔
- [Appleユーザーの悲痛な叫びスレッド](https://developer.apple.com/forums/thread/698683)

Homebrew でインストールすれば使えるには使えますが、SSH Agent はおそらくまともに動きません。(私は格闘しましたがどうしようもなく諦めました)

ところが、Sonoma になりプリインストールされた OpenSSH クライアントでサポートはされるようになりました。
ありがとう、Apple！
ただし少し工夫が必要になります。詳しくは書かないので https://github.com/Yubico/libfido2/issues/464#issuecomment-1738972718 を参考にしてみてください。

そんなわけで macOS ユーザーはおとなしく Sonoma に更新するか Linux を使いましょう (適当)

# 終わりに

快適な SSH ライフを。
最近は、1password も便利になったのでこちらを使うのも手かもしれません。
