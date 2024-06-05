---
title: "2024年のフロントエンド技術学び直し (5)"
date: 2024-05-31T17:17:00+09:00
tags: ["技術", "フロントエンド", "学習記録", "日常"]
---

前回は [2024 年のフロントエンド技術学び直し (4)]({{< relref "studying-of-frontend-technology-2024-04/index.md" >}}) にて Next.js のチュートリアルのうち、7 章まで終わりました。本日は 8 章から進めていきます。

## [8. Static and Dynamic Rendering](https://nextjs.org/learn/dashboard-app/static-and-dynamic-rendering)

章のタイトル通りですが、レンダリングについて学べそうです。

まず初めに Static Rendering についてですが、その名の通りであらかじめデータの取得などがビルド時に行われるのでレンダリング結果を CDN 等にキャッシュさせることができ高速に配信できるようになるということだそう。対して Dynamic Rendering はユーザーのリクエスト時に内容をレンダリングするというもの。ひとまずチュートリアルでは、ダッシュボードを動的レンダリングにしてみようというお話しです。

`data.ts` に `unstable_noStore` と言う関数を追加しまくります。さらにデータ取得に時間がかかる例をシミュレーションするために、`fetchRevenue()` 関数に 3 秒待ち時間を入れます。確かにブラウザで一番最初のロード時にクルクルが長くなりました。

## [9. Streaming](https://nextjs.org/learn/dashboard-app/streaming) {id="streaming"}

8 章ではデータ取得に時間がかかる場合のシミュレーションコードを追加しましたが、で？と言う感覚で終わりました。どうやらこの章で解決方法を学べるようですね。

書いてある通りでストリーミングを使うことで各データを小さなチャンクに分けてデータを転送し到着したパーツからレンダリングをすることで全てのデータが到着するまでレンダリングされないと言う問題を解消することができます。Next.js では `loading.tsx` というファイルをいじるようです。

チュートリアルに従って追加してみると確かにサイドバーは一瞬で表示されますがダッシュボードの細かいページは表示されず、`Loading...` となり最終的に画面が表示されています。しかしどうやらこうしてしまうと、さらに下のパスである invoices や customers にも適用されてしまうようです。これを防ぐため新たに `(overview)` というフォルダを作成します。つまり、

```
dashboard
├── (overview)
│   ├── loading.tsx
│   └── page.tsx
├── customers
│   └── page.tsx
├── invoices
│   └── page.tsx
└── layout.tsx
```

このような構成になりました。これを [Route Group](https://nextjs.org/docs/app/building-your-application/routing/route-groups) と呼ぶようで、`dashboard/(overview)/page.tsx` を表示する際は `http://localhost:3000/dashboard` のようになるようです。これで `loading.tsx` はダッシュボードの overview のみに適用されるようになります。

### コンポーネントのストリーミング

ここまではページ全体をストリーミングしていますが、React Suspense というものを使うことで特定のコンポーネントだけをストリーミングすることができるようです。今回は `fetchRevenue()` が遅いのでストリーミングをさせていますが Suspense を使えばこの部分だけをストリーミングし他のページはすぐに表示させるように帰ることができるようです。

まぁざっくりいうと今までは `page.tsx` の中でデータ取得関数を呼び出していたところを Suspense を使いつつ、UI モジュールの方で呼ぶのでコンポーネントの引数としては何も受け取らないようにする... といった感じでしょうか。

### コンポーネントのグルーピング

ここからは `<Card>` コンポーネントを Suspense の中に入れるという方法を学びます。各々のカードをストリーミングにすると視覚効果がうざいから、グルーピング化しようということなんでしょうか？

チュートリアル通りにやると確かにカードの部分だけはまとめて一斉に表示されるようになりました。

ここまでみてきた [Suspense をどこで使うか](https://nextjs.org/learn/dashboard-app/streaming#deciding-where-to-place-your-suspense-boundaries)と言う話もチュートリアルで指摘されています。まぁ正解はないので色々試して自分で最適な使い方を見つけてや！と言うような感じに見えますね。

## [10. Partial Prerendering (Optional)](https://nextjs.org/learn/dashboard-app/partial-prerendering)

ざっくり中身だけ読みました。

# まとめ

本日は 10 章まで進めました。レンダリング関連について学ぶことができました。
