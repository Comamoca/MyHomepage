include karax / prelude
import ../components/navibar/navibar


proc createDom(): VNode =
  result =  buildHtml():
    navi()

setRenderer createDom
