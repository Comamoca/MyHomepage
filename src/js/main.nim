include karax / prelude

import ../components/navibar/navibar


proc heading(): VNode =
  result = buildHtml():
    tdiv(class="uk-grid", data-uk-grid-margin=""):
      tdiv(class="uk-width-medium-1-1 uk-row-first"):
        tdiv(class="uk-vertical-align-middle uk-width-1-1 uk-text-center"):
          h1(class="uk-heading-middle"):
            text "為せば成る、為さなくてもなんとかなる"

proc headContent(): VNode =
  result = buildHtml():
    tdiv(class="uk-grid"):
      tdiv(class="uk-width-1-1"):
        tdiv(class="uk-h3 uk-text-center", id="about"):
          text "ようこそこまもかの壺へ！"
        p(class="uk-text-center uk-margin-bottom"):
          text "Pythonとかやってる高校生です。最近はNimにハマっています。このサイトもNimで作成されています。"

proc works(): VNode =
  type Work = object
    title: kstring
    content: kstring
    time: kstring
    link: kstring

  var markdrip = new Work

  markdrip.title = kstring"MarkDrip"
  markdrip.content = kstring"MarkDripはPythonで書かれたMarkDown変換ツールです。"
  markdrip.time = kstring"2022-4-16"
  markdrip.link = kstring"./works/markdrip.html"

  var cappuccino = new Work

  cappuccino.title = kstring"cappuccino(開発中)"
  cappuccino.content = kstring"cappuccinoは静的サイトジェネレーターやCMSなどのサイト開発環境です。"
  cappuccino.time = "2022-4-16"
  cappuccino.link = kstring"#"

  var someproj = new Work

  someproj.title = kstring"Some Project"
  someproj.content = kstring"只今設計段階です...お知らせがあるまでしばらくお待ちください..."
  someproj.time = "Not yet..."
  someproj.link = kstring"#"

  var workList = @[markdrip, cappuccino, someproj]

  result = buildHtml():
    tdiv():
      h2(class="uk-h2 uk-margin uk-text-center", id="works"):
        text "Works"
      tdiv(class="uk-grid-match uk-column-1-3@l"):
        for work in workList:
          tdiv(class="uk-margin-bottom"):
            tdiv(class="uk-card uk-card-default uk-card-hover uk-card-body"):
              tdiv(class="uk-card-header"):
                h3(class="uk-card-title uk-margin-remove-bottom"):
                  text work.title
                p(class="uk-text-meta uk-margin-remove-top"):
                  time(datatime=work.time):
                    text work.time

              tdiv(class="uk-card-body"):
                p():
                  text work.content

              tdiv(class="uk-card-footer"):
                a(class="uk-button uk-button-text", href=work.link):
                  text "Read more"

proc createDom(): VNode =
  result =  buildHtml():
    tdiv():
      tdiv(class="uk-container uk-container-center  uk-margin-large-bottom"):
        navi()
        tdiv():
          heading()
          headContent()
          works()

setRenderer createDom
