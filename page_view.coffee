Backbone = require('./backbone_custom.coffee')
CategoryEntryView = require('./category_entry_view.coffee')

class PageView extends Backbone.View
  el: 'body'

  render: ->
    categoryEntryView = new CategoryEntryView
    @$('.category-entry-wrapper').append(categoryEntryView.render())

module.exports = PageView