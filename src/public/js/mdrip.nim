include karax / prelude
import ../components/navibar/navibar


type Heading = object
  title:  kstring
  link: string


var inst = new Heading

inst.title = kstring"インストール"
inst.link = "install"

var useage = new Heading

useage.title = kstring"使い方"
useage.link = "useage"

var custom = new Heading

custom.title = kstring"カスタムCSS"
custom.link = "custom"

var head = new Heading

head.title = kstring"MarkDrip"
head.link = "head"

var headings = @[head, inst, useage, custom]


proc makeArticle(): VNode =
  result = buildHtml():
    tdiv(class="uk-margin-middle-top uk-margin-large-right uk-margin-large-left uk-margin-large-bottom"):
      tdiv(class="uk-card uk-card-default uk-card-body"):
        tdiv(class="uk-article uk-margin-top"):
          h1(class="uk-card-title uk-article-title", id=head.link):
            text head.title
          tdiv(class=""):
            p(class="uk-text-default"):
              text "MarkDripはPythonで書かれたMarkDown変換ツールです。シンプルな使い方でMarkDownファイルをHTMlファイルに変換できます。"
            h2(class="uk-text-large uk-margin-bottom", id=inst.link):
              text inst.title
            tdiv():
              p(class="uk-text-default"):
                text "pipでインストール"
              code():
                text "$ pip install markdrip"
            h2(class="uk-text-large uk-margin-bottom", id=useage.link):
              text useage.title
            p():
              text "コマンドのヘルプ"
              tdiv(class="uk-margin-left uk-margin-right uk-card-small uk-card uk-card-body"):
                ul():
                  li():
                    text " --output PATH  出力先のパス"
                  li():
                    text "--theme TEXT  適用するスチーム名。拡張子は含みません。"
                  li():
                    text " --help  ヘルプメッセージを出力します。"
            h2(class="uk-text-large uk-margin-bottom", id=custom.link):
              text custom.title
            p():
              text """
~/.markdripディレクトリにCSSファイルを配置する事で出力されるHTMLファイルを装飾出来ます。

例)
              """
            pre():
              code():
                text """
h1, h2, h3, h4, h5 {
	color: black
}"""

proc verticalNav(): VNode =
  result = buildHtml():
    tdiv():
      tdiv(class="uk-nav uk-nav-default uk-margin-large-top"):
        h2(class="uk-text-large"):
          text "目次"
        ul():
          for head in headings:
            li():
              a(class="uk-button uk-button-link uk-text", href="#" & head.link):
                text head.title

proc createDom(): VNode =
  result =  buildHtml():
      tdiv(class="uk-container"):
        navi()
        tdiv(class="uk-container", uk-grid=""):
          tdiv(class=" uk-width-4-5"):
            makeArticle()
          tdiv(class="uk-width-1-5"):
            verticalNav()

setRenderer createDom
