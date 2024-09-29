---
title: "macOS 15 Sequoia にアップデートすると発生するウィンドウの余白を解消する方法"
date: 2024-09-30T10:00:00+09:00
tags: ["macos"]
---

macOS 15.0 Sequoia にアップデートしたところ、ウィンドウに余白ができるようになりました。

![macOS 15.0 Sequoia にアップデートしたときの余白](./macos15-window-margin.png)

(この黄色く囲った部分が macOS 15.0 にアップデートしたときに発生した余白です)

さて、元々ウィンドウ内でアプリケーションのウィンドウを半分にしたりなど Windows ライクの操作を実現するために BetterTouch Tool というアプリケーションを使用しており、これが最新 OS になってバグっているのかなぁと放置しておりましたが数週間経っても治らないのでどうやら違うようです。

そういうわけでもう少し深掘りしてみると、macOS 15.0 から [Mac でウィンドウをタイル表示する](https://support.apple.com/ja-jp/guide/mac-help/mchlef287e5d/15.0/mac/15.0) ことができるようになったようです。

macOS の設定で、Desktop & Dock の項目の中の Windows の項目の中に *Tiled windows have margins* という項目がありこれをオフにすれば余計な余白がなくなり、ウィンドウいっぱいにアプリケーションが詰め込まれるようになりました。

![macOS 15.0 Sequoia で余白を解消する方法](./macos15-window-margin-settings.png)

これで余白がなくなり、ウィンドウ目一杯にアプリケーションを表示することができるようになりました。

![macOS 15.0 Sequoia で余白を解消した後](./macos15-window-margin-fixed.png)

めでたしめでたし。
