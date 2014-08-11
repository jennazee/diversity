Marionette = require('backbone.marionette')

CategoryEntryView = require('./category_entry_view')

class Page extends Marionette.LayoutView
  template: template

  regions:
    'categoryEntryRegion': '.category-entry-wrapper'
    'dataEntryRegion': '.data-entry-wrapper'
    'graphsRegion': '.graphs-wrapper'

  onShow: ->
    @categoryEntryRegion.show(new CategoryEntryView)