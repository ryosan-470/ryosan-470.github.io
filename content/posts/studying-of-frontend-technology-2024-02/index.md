---
title: "2024年のフロントエンド技術学び直し (2)"
date: 2024-05-27T16:00:00+09:00
tags: ["技術", "フロントエンド", "学習記録", "日常"]
---

前回は [2024 年のフロントエンド技術学び直し (1)]({{< relref "studying-of-frontend-technology-2024-01/index.md" >}}) にて React のチュートリアルを進めました。今回も引き続きチュートリアルを進めていきます。

## [6. Displaying Data with Props](https://nextjs.org/learn/react-foundations/displaying-data-with-props)

- `props` は引数を表していて、コンポーネントに渡すことができるようになっている。
- JavaScript の[分割代入](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment) の記法を書くことでパラメーター名に明示的な名前をつけることができる。
- JSX コード内で JavaScript の変数を使いたい場合は `{}` で囲めば JavaScript として評価される。

## [7. Adding Interactivity with State](https://nextjs.org/learn/react-foundations/updating-state)

**状態**と**イベントハンドラー**を用いて React がどのように対話性を追加するかをみてみます。

React には **フック** と呼ばれる関数があり、これを使うことで状態などの追加ロジックをコンポーネントに追加できます。。そして状態を管理するために使われる関数を `useState()` といいます。

この章をやることで Button コンポーネントのクリックイベントをトリガーとして状態を更新する方法を学ぶことができました。さらに React における状態の管理やデータフローについて学ぶには、React の公式ドキュメントにおける

- [Adding Interactivity](https://react.dev/learn/adding-interactivity)
- [Managing State](https://react.dev/learn/managing-state)

を読めば深まるそうです。

## [8. From React to Next.js](https://nextjs.org/learn/react-foundations/from-react-to-nextjs)

ここまでのサマリー。

## [9. Installing Next.js](https://nextjs.org/learn/react-foundations/installation)

先ほどまで作っていた `index.html` を改造して Next.js のコンポーネントに書き換えていく作業を進めます。

`npm run dev` まで実行すると `layout.js` は自動生成される模様。私の環境では以下のようなディレクトリ構成になった。

```
% tree app
app
├── layout.js
└── page.js
```

`npm run dev` を実行して `http://localhost:3000` を開いても書いてある通りエラーになるがこれに関しては次の章で深めることができるとのことだったので早速次の章に向かいます。

## [10. Server and Client Components](https://nextjs.org/learn/react-foundations/server-and-client-components) {id="server_and_client_component"}

まずはサーバーとクライアントの環境についての定義が書かれていますが、これに関してはまぁ問題なく理解できます。
コンポーネントにはサーバーとクライアントの 2 つのモジュールがあり、多くのコンポーネントはサーバーで処理するためにサーバーコンポーネントとして定義されているが、DOM 操作が必要な部分などはクライアントコンポーネントに所属しているということなのだろうか。さらにサーバーコンポーネントでレンダリングされた結果は React Server Payload (RSC) というフォーマットで表現されるデータ構造となってクライアントに返却されるということでしょうか。

Next.js ではデフォルトでサーバーコンポーネントを使うので、クライアントコンポーネントに移してしまえば問題なく動くということのように見えます。

クライアントコンポーネントとして定義するにはファイルの先頭に [React の `use client`](https://react.dev/reference/react/use-client) と書けば良いとのこと。

---

ここまでやってきてひとまず、React の基礎は理解できました。[React のチュートリアル](https://react.dev/learn) を少し改造したようなものだったんですね。もう少し、React のことを理解する必要があれば React 側の公式ページを見つつ今回はここらへんで終わり次回からは [Next.js のチュートリアル](https://nextjs.org/learn/dashboard-app) に進んでみようかと思います。
