# 概要

技術書典 19 の記事をあげてもらうためのリポジトリです。

# 使い方

- このリポジトリを git pull する
- ブランチを作成し、↓ にあるファイル構成に従ってディレクトリを作成し記事、画像を配置する
- catlog.yml の CHAPS に記事を追加する
- git push してプルリクを作成する

# ファイル構成

```
├─ README.md
├─ catlog.yml
└─ articles
    ├─ contents
    |    └── chap01-damuha.re(自分の記事。名前はchapDD-yourname.re DDはAdventCarendarの担当日)
    └─ images
            └── chap01-damuha(記事に使用する画像を入るフォルダ. フォルダ名は記事と同じ)
                 ├─ image01.jpg
                 └─ image02.jpg

```

# 注意点

- 絵文字を使うとビルドエラーになるので、絵文字は使わないように！
- 記事の最後に著者紹介を入れてください！

# RE: View 記法チートシートはこちら

https://github.com/kmuto/review/blob/master/doc/format.ja.md

# Q&A

## 記事の内容を編集したい！

いつでも編集可能です。
編集してプルリクをだしてください。

## ローカルで PDF を確認したい！

以下の 3 つの方法で PDF 出力できます。**Docker を使う方法が最も簡単で推奨です。**

### 方法 1: Docker を使う場合（推奨）

環境構築不要で確実にビルドできます。

```bash
# Docker イメージをダウンロード
$ docker pull ghcr.io/vvakame/review:5.8

# PDF を生成
$ ./build-in-docker.sh
```

生成された PDF は `articles/techbookfest19.pdf` に保存されます。

### 方法 2: ローカル環境を使う場合

事前に以下の環境が必要です：

- Ruby 2.7 以上（rbenv 推奨）
- Node.js 4.x 系以上（nodebrew 推奨）
- graphviz（`brew install graphviz`）

```bash
# 初回のみ：依存関係をインストール
$ bundle install
$ npm install

# PDF を生成
$ npm run pdf
```

### 方法 3: Re:VIEW コマンドを直接使う場合

上記の環境準備が完了していれば、以下のコマンドでも生成可能です：

```bash
$ cd articles
$ rake pdf
```

または

```bash
$ cd articles
$ review-pdfmaker config.yml
```

## Git の使い方がわからない…

代わりに作成します！気軽に slack でご相談ください。

# わからないことがある場合

WAKECommunityslack の#技術書典 17 執筆チャンネルで気軽に聞いてください！

==ここからはテンプレの説明===

# Re:VIEW Template

このリポジトリは Re:VIEW 用の書籍テンプレートです。Re:VIEW バージョン 5.8 に対応します。
メンテナンスは TechBooster が行っています。

- [B5 紙面サンプル（PDF）](https://github.com/TechBooster/ReVIEW-Template/tree/master/pdf-sample/TechBooster-Template-B5.pdf)
- [A5 紙面サンプル（PDF）](https://github.com/TechBooster/ReVIEW-Template/tree/master/pdf-sample/TechBooster-Template-A5.pdf)
- [B5 紙面電子書籍サンプル（PDF）](https://github.com/TechBooster/ReVIEW-Template/tree/master/pdf-sample/TechBooster-Template-ebook.pdf)

## このテンプレートのビルドの仕方は？

細かい準備(TeX 入れたり)は[『技術書をかこう！』](https://github.com/TechBooster/C89-FirstStepReVIEW-v2)に準じます。

TeX の導入をしない場合でも HTML や EPUB の出力は可能です。Docker コンテナでビルドすることもできます。

## Re:VIEW の使い方は？

[技術書をかこう！〜はじめての Re:VIEW〜改訂版](https://github.com/TechBooster/C89-FirstStepReVIEW-v2)
のリポジトリで解説しています。Re:VIEW に対応した執筆ノウハウ本です。
Re:VIEW の使い方と制作にあたっての企画〜執筆〜編集〜告知〜会場頒布までのノウハウをギュッと詰めています。

https://techbooster.booth.pm/ で PDF 版の販売予定があります

## 環境の準備

本書は[Atom](https://atom.io/)で[language-review](https://atom.io/packages/language-review)と[linter-redpen](https://atom.io/packages/linter-redpen)を導入している前提です。
内部的に[RedPen](http://redpen.cc/)を利用するため、 `brew install redpen` とかしておいてください。

Atom 以外の環境の場合、[prh](https://github.com/vvakame/prh)または[reviewjs-prh](https://github.com/vvakame/reviewjs-prh)と RedPen を自力でなんとか頑張って適用してください。

警告や lint のエラーを放置して編集に突入してしまうと @mhidaka が過労で死にます。
RedPen は試験的に導入したため、知見やルールについてまだ固まっていません。
意見・感想・修正案などあれば @mhidaka までご相談ください。

## PDF 出力する

rbenv や nodebrew を利用して Ruby や Node.js の準備をしている前提です。
もしそうではない場合、適宜 sudo を補うこと。
Node.js は 4.x 系以上が必須です。

graphviz を使ったので brew install graphviz とかが必要かもしれません。

```
$ gem install bundler
$ git clone git@github.com:TechBooster/ReVIEW-Template.git
$ cd ReVIEW-Template
$ npm install
$ npm run pdf
```

### Re:VIEW コマンドで PDF を出力する

セットアップが完了していれば `npm run pdf` のかわりに

```
$ cd ReVIEW-Template/articles
$ rake pdf
```

または

```
$ cd ReVIEW-Template/articles
$ review-pdfmaker config.yml
```

でも生成できます。

## EPUB・Web ページ・テキストの出力

PDF 以外に、EPUB・Web ページ・テキストを出力することもできます。

### EPUB を出力する

```
$ npm run epub
```

または

```
$ cd ReVIEW-Template/articles
$ rake epub
```

または

```
$ cd ReVIEW-Template/articles
$ review-epubmaker config.yml
```

### Web ページを出力する（webroot フォルダ）

```
$ npm run web
```

または

```
$ cd ReVIEW-Template/articles
$ rake web
```

または

```
$ cd ReVIEW-Template/articles
$ review-webmaker config.yml
```

### テキストファイルを出力する

```
$ npm run text
```

または

```
$ cd ReVIEW-Template/articles
$ rake text
```

または

```
$ cd ReVIEW-Template/articles
$ review-textmaker config.yml
```

## Docker を使う

TeX の環境構築が困難な場合、一式セットアップ済みの Docker イメージを [ghcr.io](https://github.com/vvakame/docker-review/pkgs/container/review) または [DockerHub](https://hub.docker.com/r/vvakame/review) に用意してあるので使ってください。
Docker がうまく動くようになっている場合、以下のコマンドで細かい準備なしにビルドを行うことができます。

```
$ docker pull ghcr.io/vvakame/review:5.8 (ghcrからのダウンロードの場合)
$ docker pull vvakame/review:5.8 (Docker Hubからのダウンロードの場合)
$ ./build-in-docker.sh
```

## 紙面や設定ファイルの切り替え

B5 や A5 といった紙面サイズ、印刷用・電子用といったメディアの切り替えは、articles/config.yml の texdocumentclass パラメータで設定しています。

```
# B5の設定(10pt 40文字×35行) - 紙版
texdocumentclass: ["review-jsbook", "media=print,paper=b5,serial_pagination=true,hiddenfolio=nikko-pc,openany,fontsize=10pt,baselineskip=15.4pt,line_length=40zw,number_of_lines=35,head_space=30mm,headsep=10mm,headheight=5mm,footskip=10mm"]
# B5の設定(10pt 40文字×35行) - 電子版
# texdocumentclass: ["review-jsbook", "media=ebook,paper=b5,serial_pagination=true,openany,fontsize=10pt,baselineskip=15.4pt,line_length=40zw,number_of_lines=35,head_space=30mm,headsep=10mm,headheight=5mm,footskip=10mm"]
# A5の設定(9pt 38文字×37行) - 紙版
# texdocumentclass: ["review-jsbook", "media=print,paper=a5,serial_pagination=true,hiddenfolio=nikko-pc,openany,fontsize=9pt,baselineskip=13pt,line_length=38zw,number_of_lines=37,head_space=15mm,headsep=3mm,headheight=5mm,footskip=10mm"]
# A5の設定(9pt 38文字×37行) - 電子版
# texdocumentclass: ["review-jsbook", "media=ebook,paper=a5,serial_pagination=true,openany,fontsize=9pt,baselineskip=13pt,line_length=38zw,number_of_lines=37,head_space=15mm,headsep=3mm,headheight=5mm,footskip=10mm"]
```

デフォルトは B5・印刷用の設定になっていますが、たとえば A5・印刷用にしたい場合には B5 のパラメータをコメントアウトし、A5 のほうを有効にします。

```
# B5の設定(10pt 40文字×35行) - 紙版 ↓これをコメントアウトし…
# texdocumentclass: ["review-jsbook", "media=print,paper=b5,serial_pagination=true,hiddenfolio=nikko-pc,openany,fontsize=10pt,baselineskip=15.4pt,line_length=40zw,number_of_lines=35,head_space=30mm,headsep=10mm,headheight=5mm,footskip=10mm"]
# B5の設定(10pt 40文字×35行) - 電子版
# texdocumentclass: ["review-jsbook", "media=ebook,paper=b5,serial_pagination=true,openany,fontsize=10pt,baselineskip=15.4pt,line_length=40zw,number_of_lines=35,head_space=30mm,headsep=10mm,headheight=5mm,footskip=10mm"]
# A5の設定(9pt 38文字×37行) - 紙版 ↓こちらを有効にする
texdocumentclass: ["review-jsbook", "media=print,paper=a5,serial_pagination=true,hiddenfolio=nikko-pc,openany,fontsize=9pt,baselineskip=13pt,line_length=38zw,number_of_lines=37,head_space=15mm,headsep=3mm,headheight=5mm,footskip=10mm"]
# A5の設定(9pt 38文字×37行) - 電子版
# texdocumentclass: ["review-jsbook", "media=ebook,paper=a5,serial_pagination=true,openany,fontsize=9pt,baselineskip=13pt,line_length=38zw,number_of_lines=37,head_space=15mm,headsep=3mm,headheight=5mm,footskip=10mm"]
```

印刷用と電子用の両方を作りたいときには、設定ファイルの継承機能を利用できます。たとえば B5 電子版の設定ファイルの例を config-ebook.yml として用意しています。この内容は次のようにシンプルに既存の config.yml の texdocumentclass パラメータを置き換えているだけです。

```
# 継承元設定
inherit: ["config.yml"]

# B5の設定(10pt 40文字×35行) - 電子版
texdocumentclass: ["review-jsbook", "media=ebook,paper=b5,serial_pagination=true,openany,fontsize=10pt,baselineskip=15.4pt,line_length=40zw,number_of_lines=35,head_space=30mm,headsep=10mm,headheight=5mm,footskip=10mm"]
# A5の設定(9pt 38文字×37行) - 電子版
# texdocumentclass: ["review-jsbook", "media=ebook,paper=a5,serial_pagination=true,openany,fontsize=9pt,baselineskip=13pt,line_length=38zw,number_of_lines=37,head_space=15mm,headsep=3mm,headheight=5mm,footskip=10mm"]
```

この config-ebook.yml を使って PDF を生成するには次のようにします。

```
$ REVIEW_CONFIG_FILE=config-ebook.yml npm run pdf
```

または

```
$ cd ReVIEW-Template/articles
$ REVIEW_CONFIG_FILE=config-ebook.yml rake pdf
```

または

```
$ cd ReVIEW-Template/articles
$ review-pdfmaker config-ebook.yml
```

Docker 環境でも以下のように指定できます。

```
$ REVIEW_CONFIG_FILE=config-ebook.yml ./build-in-docker.sh
```

紙版と電子版では以下のような違いがあります。

- 紙版：印刷用に、トンボ、デジタルトンボを設置。いくつかの同人誌印刷所で要求事項となっているノドへの隠しノンブル、大扉からのアラビア数字通し。ハイパーリンクは無効化。表紙（cover）は無視。
- 電子版：電子配布用に、仕上がり紙面サイズ。大扉からのアラビア数字通し。ハイパーリンク有効。表紙（cover）を中央合わせで配置。

### EPUB/Web 出力用 CSS ファイルの編集方法

articles/ディレクトリ以下の各種\*.scss ファイルを編集し、

```
./rebuild-css.sh
```

コマンドで CSS ファイルをビルドしてください。

## 過去の Re:VIEW 3・4・5 依存プロジェクトを最新の Re:VIEW バージョンに移行する

Re:VIEW 3 以降のプロジェクトは、review-update コマンドで簡単に更新できます。

既存のプロジェクトフォルダ内 (本リポジトリを使っている場合は articles フォルダ) で、review-update コマンドを実行してください。

```
$ review-update
** review-update はプロジェクトを 5.8.0 に更新します **
config.yml: 'review_version' を '5.0' に更新しますか? [y]/n
プロジェクト/sty/review-base.sty は Re:VIEW バージョンのもの (/var/lib/gems/2.7.0/gems/review-5.8.0/templates/latex/review-jsbook/review-base.sty) で置き換えられます。本当に進めますか? [y]/n
プロジェクト/sty/review-jsbook.cls は Re:VIEW バージョンのもの (/var/lib/gems/2.7.0/gems/review-5.8.0/templates/latex/review-jsbook/review-jsbook.cls) で置き換えられます。本当に進めますか? [y]/n
完了しました。
```

その後、articles/sty/reviewmacro.sty と articles/sty/techbooster-doujin-base.sty を本リポジトリのファイルで上書きしてください。

- [reviewmacro.sty](https://raw.githubusercontent.com/TechBooster/ReVIEW-Template/master/articles/sty/reviewmacro.sty)
- [techbooster-doujin-base.sty](https://raw.githubusercontent.com/TechBooster/ReVIEW-Template/master/articles/sty/techbooster-doujin-base.sty)

## 過去の Re:VIEW 2 依存プロジェクトを Re:VIEW 5 に移行する

Re:VIEW 2 系向けの過去の TechBooster テンプレートは、Re:VIEW 3 以降とは互換性がありません。Re:VIEW は 2 から 3 以上への移行を支援する「review-update」というコマンドを提供していますが、TechBooster テンプレートを使用しているプロジェクトは対象外となっています。

### Re:VIEW 3 以降の互換モードを使う

config.yml で`review_version: 2.0`としておけば、当面は互換モードにより Re:VIEW 3 以降でも変わりなく動作します。ただし、一部の Re:VIEW 3 以降固有の機能は利用できません。また、将来的に互換は破棄される可能性があります。

### Re:VIEW 5 のテンプレートに置き換える

Re:VIEW 3 以降では TeX 関連のファイルが大きく変わっているため、Re:VIEW 2 系のプロジェクトの既存のファイルをいったん退避し、必要に応じて設定を書き戻すという手順になります。

1. 事前にフォルダごと必ずバックアップを取っておいてください。
2. layouts フォルダをリネーム（たとえば layouts-old など）します。
3. sty フォルダをリネーム（たとえば sty-old など）します。
4. config.yml ファイルをリネーム（たとえば config.yml-old など）します。
5. TechBooster テンプレートの articles/sty フォルダをフォルダごとコピーします。
6. TechBooster テンプレートの articles/config.yml ファイルをコピーします。
7. TechBooster テンプレートの lib フォルダをフォルダごとコピーします。
8. TechBooster テンプレートの Rakefile ファイルをコピーします。
9. config.yml に、カスタマイズしていた書名や著者名などを書き戻します。

書き戻しではなくどうしても古い config.yml の書き換えで対処したいという場合は、以下の点に注意してください。

- review_version パラメータ：値を 5.0 にする必要があります。
- texstyle パラメータ：値を["reviewmacro"]とします。
- texdocumentclass パラメータ：2 つの引数の内容は大きく変わっています。
- texcommand パラメータ：オプションを指定していた場合、texoptions パラメータに移設する必要があります。
- dvicommand パラメータ：オプションを指定していた場合、dvioptions パラメータに移設する必要があります。

layouts/layouts.tex.erb や sty/techbooster-doujin.sty に何らかのカスタマイズを加えていた場合は、sty/review-custom.sty に類似の実装をする必要があります。Re:VIEW 2 系の TechBooster テンプレートはマクロ定義時点から書き換える手法をとっていましたが、Re:VIEW 3 系から`\renewcommand`・`\reenvironment`・`\def`などの命令を使って既存のマクロ定義を再定義するというやり方に変わっています。

### Re:VIEW 3 以降の変更点について

Re:VIEW 3 以降で変わったことの詳細については、以下を参照してください。

- [Re:VIEW 5.8 での変更点](https://review-knowledge-ja.readthedocs.io/ja/latest/releases/review580.html)
- [Re:VIEW 5.7 での変更点](https://review-knowledge-ja.readthedocs.io/ja/latest/releases/review570.html)
- [Re:VIEW 5.6 での変更点](https://review-knowledge-ja.readthedocs.io/ja/latest/releases/review560.html)
- [Re:VIEW 5.5 での変更点](https://review-knowledge-ja.readthedocs.io/ja/latest/releases/review550.html)
- [Re:VIEW 5.4 での変更点](https://review-knowledge-ja.readthedocs.io/ja/latest/releases/review540.html)
- [Re:VIEW 5.3 での変更点](https://review-knowledge-ja.readthedocs.io/ja/latest/releases/review530.html)
- [Re:VIEW 5.2 での変更点](https://review-knowledge-ja.readthedocs.io/ja/latest/releases/review520.html)
- [Re:VIEW 5.1 での変更点](https://review-knowledge-ja.readthedocs.io/ja/latest/releases/review510.html)
- [Re:VIEW 5.0 での変更点](https://review-knowledge-ja.readthedocs.io/ja/latest/releases/review500.html)
- [Re:VIEW 4.2 での変更点](https://review-knowledge-ja.readthedocs.io/ja/latest/releases/review420.html)
- [Re:VIEW 4.1 での変更点](https://review-knowledge-ja.readthedocs.io/ja/latest/releases/review410.html)
- [Re:VIEW 4.0 での変更点](https://review-knowledge-ja.readthedocs.io/ja/latest/releases/review400.html)
- [Re:VIEW 3 からの LaTeX 処理](https://review-knowledge-ja.readthedocs.io/ja/latest/latex/review3-latex.html)

### Re:VIEW 2 用のテンプレートの入手

何らかの理由でどうしても Re:VIEW 2 系の TechBooster テンプレートが必要なときには、以下のリリースページから「review-2.4」リリースアーカイブファイルを利用してください。

- https://github.com/TechBooster/ReVIEW-Template/releases

## 権利

- 設定ファイル、テンプレートなど制作環境（techbooster-doujin-base.sty など）は MIT ライセンスです
  - 再配布など MIT ライセンスで定める範囲で権利者表記をおねがいします
  - 本設定を使って生成した書籍は現段階の Re:VIEW ではソフトウェアたりえません。したがってライセンスは発生しません（あとがきなどへの表記はあると嬉しいものの生成物での表記は不要です）
- articles/sty にあるファイルには以下のライセンスが適用されています。
  - review-jsbook.cls, review-base.sty, review-style.sty, review-custom.sty: MIT License
  - jumoline.sty: The LaTeX Project Public License
  - plistings.sty: MIT License
  - gentombow.sty: BSD License
  - jsbook.cls: BSD License
