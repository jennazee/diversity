Marionette = require('backbone.marionette')
PageView = require('./page_view')

App = new Marionette.Application()

App.addInitializer ->
  App.Page = new PageView app: App

$(document).ready ->
  App.start()