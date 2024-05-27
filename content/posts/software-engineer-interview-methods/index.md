---
title: "ソフトウェアエンジニアを小さなプロダクトチームで採用するためにやっていたこと"
date: 2024-05-27T16:10:00+09:00
tags: ["採用", "転職活動"]
---

[株式会社 MIXI を退職しました]({{< relref "retirement-2024-06/index.md" >}}) にあるようにすでに退職しておりますが前チームでソフトウェアエンジニアの中途採用をエンジニア側の責任者としてリードしておりそのときに何を考えて行なっていたかを書き下しておきます。
意外とソフトウェアエンジニアの採用に関する手法などに関して、特に面接の受ける側ではなくする側は何を考えて実践すべきかなどがまとまっておらず初めて面接官となった際にかなり困りました。そこで採用を進めるにあたり何をやっていくとよさそうかということを私自身の経験を踏まえてまとめておきたいと思います。あらたなソフトウェアエンジニアの採用を目指す方々の一助になれば幸いです。

# 前提

まず私自身事業会社としては 1000〜2000 人規模の企業で勤めておりましたが中途採用に関しては各チームにかなりの裁量がありました。私が所属しているチームはエンジニア職だと 10〜20 名程度の規模の組織でした。

# 想定読者

前提にあることをふまえ想定読者は以下のような課題を持つ人々を考えています。

- 10 名程度のエンジニア組織に新たにエンジニアを採用したいがどう進めていけばいいかわからない。
- 面接官が特定の人によりがちでスケールしないことをどうにかしたい。

# 用意しておくと良さそうなもの

これは私自身が転職活動をしていて気づいたのですがここ最近の企業では皆さん会社紹介資料やチーム紹介資料などを用意していました。私が在籍していたチームでは用意していなかったのでこれはぜひ用意しておくべきものでしょう。
例として個人的に感動した 2 つの会社の資料を紹介します。

## SmartHR

https://hello-world.smarthr.co.jp/

会社紹介資料はもちろんのこと、パッとわかるような 1 問 1 答形式の文章が記載されています。事例についても書かれており求められていることや組織として何を大切にしているのかといった点が容易に想像ができました。また SmartHR では資料自体に給与レンジを丁寧に記載しており報酬に対する誠実さを如実に表している企業かと思います。

## カミナシ

カミナシでは、[カミナシの抱える 100 問「カミナシ採用ウィッシュリスト」](https://noiseless-fold-f68.notion.site/100-30ea19b34fdc405aa162f41aa7e7050f) というものを公開しています。これを読めばざっくり組織の課題を理解でき自分がどこに活きるか想像することができます。さらに職種ごとにもドキュメントを公開しており非常にわかりやすいです。

- [カミナシ Entrance Book 全社版](https://noiseless-fold-f68.notion.site/Entrance-Book-ee407ecb3a89420180c4a0a9e5976f71)

---

このように事業内容や組織規模、現在の課題、考え方やどういう人に来て欲しいかといったメッセージを 1 つの採用ページにまとめておくと応募者は容易に情報を収集でき興味につながるのではないでしょうか。またよくあるカジュアル面談などでもこの資料を投影しながら説明できるので話す方としてもコスト低く話すことができます。

# カジュアル面談

採用プロセスは各組織で様々かと思いますが私はカジュアル面談を 1 度行なった方が良いと考えています。(もちろん選考を急いでいる場合などはスキップしますが。)
上記で用意した資料だけでは足りない知識の共有やチームの雰囲気を応募者の方に共有する場として使いましょう。さらにカジュアル面談で応募者の状況についても断りを入れて伺うようにするとお互いのミスマッチが起きづらいかと思います。カジュアル面談では応募者の方に以下の内容を聞いていました。

## カジュアル面談での採用企業側から応募者へのヒアリング内容

- 応募者の方が今後どういう仕事や業務を行いたいのか。
  - カジュアル面談でこの部分をヒアリングすることで選考に進むべきかアドバイスすることができ有意義かと思います。
  - ただし注意点として「カジュアル面談なのに選考されてしかも落とされた」と思われないようなフィードバックを行うようにします。
    - あなたのスキルでは不足しているよ、という話にするのではなくスキルマッチしていないからきついかも、というような伝え方をしたほうがよい。
- 転職活動自体の温度感

個人的には一方的に情報を教えてもらうよりも上記のようなヒアリングがあったほうが有意義な時間を過ごせたと思います。この時点でポジションアンマッチであることがわかれば選考に進む必要はないと判断できますし資料では読み取れなかった業務内容などの理解を深めることができます。

## カジュアル面談をスケールさせるためには

多くの企業でカジュアル面談はエンジニアリングマネージャーやリーダーといったチームを率いる者が行うことが多いと思います。(実際私の転職活動中にカジュアル面談を多くの企業で行なっていただきましたがそのほとんどがそういう方々でした。)

こうなると課題として EM の業務集中などによってカジュアル面談の実施に支障が出ることがあげられます。さらに面接ではないにせよこういう場の経験を行うことが他のメンバーはできません。そこで私はチームメンバーから数名ピックアップしてカジュアル面談を行なってもらうようにしました。
カジュアル面談はこういう場の中では一番ハードルの低い場だと考えています。なぜなら、カジュアル面談はあくまで会社側の説明会がメインであり人物評価などを行う必要はなく自身の開発しているサービスや所属しているチームについて説明できれば十分です。さらに上記に書いたような会社紹介資料のようなものを用意しておけばある程度台本がありながら話すことができます。さらに応募者の方には一緒に働くメンバーの一部と話すことでマネージャー等と話すよりも具体的にチームの雰囲気や考えたかを触れることができます。

このようにしてチームメンバーの中途採用等に関わるハードルを少しずつ下げることで今度は採用面接に臨むことができます。

# 採用面接

採用面接は多くの企業で 2 回から 3 回行われます。今回は 1 回目の面接の仕方についてフォーカスします。

## 1 回目の面接

これも各社様々な面接プロセスがあるかと思いますが、今回の 1 回目の面接では技術的なスキルやエンジニアリングの経験具合からチームに採用しても良いか判断するという視点で考えていきます。(企業の MVV [^1]などへの共感、他のチームでも活躍できるかなどはここでは確認しないものとします。)

[^1]: ミッション、ビジョン、バリューの略語。詳しくは https://biz.moneyforward.com/payroll/basic/65388/ などを参考にしてください。

まずはどういう人を採用したいか、チームに招きたいかという人物像を定義します。もちろん技術スキルだけの判断でもいいのですが前提でも話した通り採用した場合自分と同じチームで働くということになります。そうなると技術力だけでなくきちんとしたコミュニケーション力なども重視した方がよいでしょう。例えばですが次のような人物像を定義します。

### バックエンドエンジニアにおける人物像の定義例

- ソフトウェアエンジニアとして 5 年以上の開発経験がある
- Ruby や Python、Go などといったプログラミング言語の経験
- コンピューターサイエンスにおける基礎知識
- データベースシステム等における設計経験
- コミュニケーションの温度感のマッチ
  - 例えばみんなで議論をしながら仕事をしていきたい、といったチームであれば一人でもくもくという方より議論が好きです、みたいなメンバーを採りたくなる。

など。これらは各組織、各チーム内で文章化して定義しておくことをお勧めします。もちろん上記の内容は JD にも一部は記載しておくと良いでしょう。

このうちここは絶対に必要と言った項目やこのくらいは欲しいといった目安を作ります。
私の経験としてここの定義が緩いと面接をしたけど結局採っていいかダメかあまり判断できなかったという人が増え困りました。なのでここは内部でしっかりとした定義を作ることをお勧めします。

## 面接で聞くことを考えてみる

さて面接を行う上でカジュアル面談同様、面接官になれるメンバーが限られるという問題があると思います。面接官として何を聞けば効果的に候補者のスキルが測れるのかと言った点やそもそも候補者が提出する職務経歴書の内容が薄く何を聞けばいいかわからない、など様々な課題が挙げられます。

私は今まで応募者が提出してきた職務経歴書の内容を確認しそれについて幾つか質問をするという形式で行なっていましたがこれはかなり難しいということに気づきました。以下にその理由を箇条書きで記載します。

- 相手の話を面接の短い時間で理解し効果的な質問をするのが難しい
  - もちろん事前に読み込んである程度想定した質問を考えてくるべきだが話していてそれをしないなども結構ありうる。
- 相手の職務経歴を掘るということは相手のフィールドで戦うことになるので自身がそこに詳しくない場合それ以上話を聞けないことが多い
  - 例えば私は Ruby on Rails について詳しくないですが応募者がそこを強調している場合かつそこについて話された場合、書かれた以上のことは質問できないし効果的に聞くこともできない。

このように「面接の短い時間で相手の話を聞きつつそれを理解し効果的な質問を繰り出す」というのは簡単なものではありません。そうなるとそれができるメンバーは自然とシニアなエンジニアなどに限られてしまい面接官自体が少ないため採用に人を割けない、といった問題が発生します。さらに同時に A さんと B さんの面接を行いどちらが良かったか比較するということも比較的難しくなります。

そこで私は以下のような面接手法を考えました。

## 1 次面接で質問事項をあらかじめ作っておく

面接で聞く質問事項をあらかじめ作っておくという手法です。つまり台本を用意します。ここにはさらに想定回答も事前に考えておきます。
この中にはいくつか画一した回答があるものと意見を聞く、考え方を聞くような質問を混ぜておきます。
例えば、応募者が Ruby と Java の経験があったとすれば、「Ruby と Java の違い」について聞き話をしてもらいます。ここで表面的ではなくある程度理解している方なら、型の話やオブジェクト指向といった話、JVM や YARV の話などが出てくるでしょう。
考え方を聞く質問などに関しては、「あなたがチームでとある PJ を進めることになりました。どう進めていきますか？」などと聞いてみます。そうすると回答としては、「一人で黙々とやっていきます」とか「ある程度仕様を考えたらデザインドキュメントを書きレビューをもらってから進めます」などといった様々な回答が得られるでしょう。

こうすることである程度画一した評価を行うことができます。さらにカジュアル面談のときと同様で台本があるのでどんなメンバーでも面接に出席し判断することができるようになっていきます。

## 面接官の面接練習

面接官として面接に慣れるためにも面接練習を行うと良いと思います。いくら台本を用意していても台本通り進まなかったり予想外の回答が帰ってきてあたふたするなんてことも考えられます。ここ最近では LLM の台頭のおかげで ChatGPT などが応募者として振る舞ってもらうこともできるのでテキストベースのやりとりなどで事前に考えた質問を行いどのような回答が得られるかなどを確認すると良いかと思います。

# 技術課題について

技術課題に関しては考慮すべき点がたくさんあるように感じています。私自身の直近の転職活動を通じて効果的な技術課題について論じていきたいのですがすでに文章が長くなってしまったので一旦はここまでにして別の記事で論じたいと思います。

# まとめ

私自身の経験に基づき小さな規模のソフトウェアエンジニアの採用を行う際の考え方等を書いてみました。冒頭に書いてある通り意外と面接を受ける側のノウハウは多いような気がしますが**面接をする**側の方法論等に関してはあまりみないような気がしました。(もちろん私が不勉強で実はあるのかもしれませんが...) この記事が採用を進める上でどなたかの一助になることを願ってやみません。