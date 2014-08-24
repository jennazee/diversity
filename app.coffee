# watchify --debug -t coffeeify -t hbsfy -g uglifyify app.coffee -o bundle.js

$ = require('jquery')
PageView = require('./page_view.coffee')

$(document).ready ->
  page = new PageView
  page.render()
