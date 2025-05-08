---
title: "GitHub Copilot 料金変更を徹底解説：BYOKとの費用比較で最適なプランを探る"
date: 2025-05-07T19:00:00+09:00
tags: ["技術", "GitHub", "Copilot", "LLM"]
---

# 更新: 2025/05/08

[Enforcement of Copilot premium request limits moved to June 4, 2025](https://github.blog/changelog/2025-05-07-enforcement-of-copilot-premium-request-limits-moved-to-june-4-2025/) が公開されていました。これによると元々明日の 2025/05/08 に変更される予定だった Copilot のプレミアムリクエストの制限が **2025/06/04 に変更** されるとのことです。

# 概要
GitHub Copilot は **2025/05/08** より**リクエスト数に応じた**課金モデルが変更になりました。本記事ではこの変更に伴い Copilot を使っていくのならどのプランを選ぶのが良さそうか調査してみたのでその内容をまとめます。

![Copilot](https://docs.github.com/assets/cb-345/images/social-cards/copilot.png)

# GitHub Copilot のプレミアムリクエストについて

[About premium requests - GitHub Docs](https://docs.github.com/en/copilot/managing-copilot/monitoring-usage-and-entitlements/about-premium-requests) に書かれています。主な変更点をざっくりまとめると以下のようになります。まず通常の LLM を用いたコード補完に関しては Free プランは月2000回まで、**有料プラン (Pro または Pro+)** に加入していれば無制限に使えます。

ただし下記の機能が**2025/05/08**よりプレミアム機能ということになり有料になります。
- チャット
- エージェントモード
- コードレビュー
- 拡張機能

無料ユーザーでは月50回分の回数が付与され、Proプラン (10ドル) では 300回、新たにできた Pro + プラン (39ドル) で1500回です。さらに有料プランではベースモデルと指定されたモデルに関しては無料で使えますがその他のモデルに関しては各モデルにおいて係数が設定されており例えば現時点で一番係数が大きい GPT-4.5 のモデルを使うと 50 となっているので Proプランでは6回しか呼び出せないようになります。詳しくは [About premium requests - GitHub Docs - model multipliers](https://docs.github.com/en/copilot/managing-copilot/monitoring-usage-and-entitlements/about-premium-requests#model-multipliers) をご覧ください。

さらに有料プランにおいてはプランに含まれているプレミアムリクエスト数を超過した場合、追加で課金することでさらに利用できます。(0.04ドル/req)

**これらの変更を踏まえると**、例えば Claude 3.7 Sonnet Thinking モデル (係数 1.25) を使った Agent モードを Pro プランで利用する場合は、月間の無料枠は、 `300 (回) / 1.25 = 240 (回)` となります。

この回数が高いのか安いのか、費用対効果を判断するために、他の LLM モデルの料金プランと比較して検討しました。

# VS Code の Bring your own LLM key (BYOK)

![VS Code](https://code.visualstudio.com/assets/docs/copilot/shared/github-copilot-social.png)

現時点では Preview 機能なのですが、VS Code に限り、Copilot が提供するモデルに加えてユーザー自身の LLM の API キーを設定することができるようになりました。([Ref](https://code.visualstudio.com/docs/copilot/language-models#_bring-your-own-language-model-key))おそらく、チャットとエージェントモードでは活用できそうです。なのでこの機能を用いて API キーを使ってみようと言う試みです。

# 前提
まず大前提として各種 LLM API の課金モデルと GitHub Copilot の課金モデルは大きく異なります。

- 各種 LLM API: 主に入出力のトークン数で課金されます。
- GitHub Copilot: プレミアム機能を利用するリクエスト数で課金されます。

この違いを考慮すると以下のような特性があると考えられます。
- 入出力が小さい、コーディングに対する質問などに関しては LLM API 課金モデルだと安く済む
- 対して Cline や Agent モードのように大量のコードを読みこませ、大量のコードをアウトプットするような使い方では、Copilot のリクエスト課金の方が安くなる可能性が高い。

現在のところ、これらの特性を**ユーザーが細かく制御して**使い分けることは難しいです。そのため今回は以下の条件で費用を計算し比較検討してみることとしました。これらの条件は利用方法によって大きく変わるためご自身の使い方に合わせて適宜変更して計算してみてください。

- 比較対象とする LLM のモデルは Gemini 2.5 Pro か Claude 3.7 Sonnet Thinking とする。
	- Gemini 2.5 Pro に関しては現在エージェントモードでは利用できないが、**将来的に利用可能になったと仮定して**計算しました。
- Copilot のプレミアム機能 (主に Agentモード) を1日20回使う。
	- 月間の利用日数を平均的な営業日数である。20日とします。したがって月間の合計利用回数は `20 (回) * 20 (日) = 400` となります。
- 1回あたりのリクエストにおける平均的なトークン数を入出力合計して2000と仮定します。
	- 内訳は入力を300トークン、出力を1700トークンと仮定します。
	- ここは大きくユースケースによって異なると思います。

## GitHub Copilot Pro プラン
Claude 3.7 Sonnet Thinking の乗数は1.25のため、ざっくり計算すると必要なプレミアムリクエストの数は次のようになる。

- `1.25 * 20 * 20 = 500.0 (req)`
- 300リクエストは Pro プランに含まれるので、残りの Additional Fee は `200.0 * 0.04 = 8.0 USD`

合計すると、18.0 ドルかかることとなる。

## 上記プランのうち、はみ出した分のみを BYOK する
はみ出した分のみを BYOK することにします。240回はプレミアムリクエストで賄えるのではみ出した分は160回となります。

現在の [Claude 3.7 Sonnet の料金](https://www.anthropic.com/pricing)は以下のようになっています。
- Input: $3 / MTok
- Output: $15 / MTok

すると次のように計算できます。
- Input: `3.00 / 1000000 * 300 (tok) * 160 (req) = $0.144`
- Output: `15.0 / 1000000 * 1700 (tok) * 160 (req) = $4.08`

はみ出した分で、4.224ドルかかるので足すと 14.224ドルになります。

## すべてのリクエストを Claude 3.7 Sonnet Thinking の BYOK で実施する
以下のように計算します。
- Input: `3.00 / 1000000 * 300 * 400 = 0.36`
- Output: `15.0 / 1000000 * 1700 * 400 = 10.2`
合計して、10.6ドルかかります。

## すべてのリクエスト Gemini 2.5 Pro の BYOK で実施する

![Gemini](https://ai.google.dev/static/site-assets/images/share-gemini-api.png)

残念ながら Copilot の Agent モードでは Gemini 2.5 Pro は利用できませんが利用できるようになったと仮定して計算してみます。

[Gemini Developer API Pricing  |  Gemini API  |  Google AI for Developers](https://ai.google.dev/gemini-api/docs/pricing) によると Paid Tier は 200k トークンで大きく変わります。今回は 200k トークン未満として計算しています。
- Input: $1.25 /MTok
- Output: $10.0 /MTok
上記として計算すると以下のようになります。
- Input: `1.25 / 1000000 * 300 * 400 = 0.15`
- Output: `10.0 / 1000000 * 1700 * 400 = 6.8`
合計して、6.95ドルかかります。

## プラン別の費用まとめ
上記のプランをまとめると以下のようになりました。

- すべて GitHub Copilot のプラン料金で支払う (超過分は追加課金) **18.0 ドル**
- 基本的には GitHub Copilot を使いつつ超過分を Claude 3.7 の BYOK を利用する: **14.24 ドル**
- すべて BYOK した LLM モデルを使う (Claude 3.7 Sonnet Thinking): **10.6 ドル**
- すべて BYOK した LLM モデルを使う (Gemini 2.5 Pro): **6.95 ドル**

価格だけでまとめると、**今回の前提条件においては** 、BYOK の機能を直接使うことが最も安価になるという結果になりました。特に Gemini 2.5 Pro が利用可能になればさらに費用を抑えられる可能性があります。

また、Anthropic が提供する [Prompt caching](https://www.anthropic.com/news/prompt-caching) のような機能が利用できる場合、特に長いプロンプトを繰り返し使うようなケースでは BYOK を利用する LLM の料金をさらに大幅に削減できる可能性があります。

# まとめ
今回の調査と計算（**設定した前提条件に基づく**）の結果、GitHub Copilotのプレミアム機能（特にAgentモード）を頻繁に利用する場合、BYOK機能を用いてLLMプロバイダーと直接契約する方が、費用を抑えられる可能性が高いことが分かりました。特にClaude 3.7 Sonnet Thinkingや、将来的に利用可能になるかもしれないGemini 2.5 ProのBYOKは、CopilotのProプランに追加課金する場合と比較して、より安価になる試算となりました。

ただし、これはあくまで特定の利用頻度とトークン数を仮定した試算です。実際の最適なプランは、個々のCopilotの利用方法（どの機能をどれだけ使うか、入出力のトークン数はどの程度か）によって異なります。

個人的には、GitHub Copilotのコード補完機能や、BYOKでは利用できない可能性のあるその他の機能も活用しつつ、プレミアム機能の利用がProプランの無料枠を超える場合に、超過分を他のLLMプロバイダーのBYOKで補う、というハイブリッドな使い方が現実的かつ費用対効果が高いのではないかと考えています。
