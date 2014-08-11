$ = require('jquery')
PageView = require('./page_view.coffee')

$(document).ready ->
  page = new PageView
  page.render()
