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
