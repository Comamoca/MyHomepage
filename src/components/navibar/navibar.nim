include karax / prelude

let siteTitle* = kstring"こまもかの壺"


type Menu = object
  link: kstring
  text: kstring

proc navi*(): VNode =
  var
    about = new Menu
    prof = new Menu
    works = new Menu

  about.link = kstring"../index/html#about"
  about.text = kstring"About"

  prof.link = kstring"../index.html#prof"
  prof.text = kstring"Prof"

  works.link = kstring"../index.html#works"
  works.text = kstring"Works"

  var menus = @[about, works, prof]

  result = buildHtml(tdiv):
    nav(class="uk-navbar uk-margin-medium-bottom navbar"):
      tdiv(class="uk-navbar-left"):
        ul(class="uk-navbar-nav"):
          li(class="uk-active"):
            a(href="index.html"):
              text siteTitle
          for menu in menus:
            li(class="uk-parent"):
              a(href=menu.link):
                text menu.text

