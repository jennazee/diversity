Backbone = require('./backbone_custom.coffee')
CategoryEntryView = require('./category_entry_view.coffee')

class PageView extends Backbone.View
  el: 'body'

  initialize: ->
    @categoryEntryView = new CategoryEntryView

  events: ->
    'click .start-data-button': 'initDataEntry'

  render: ->
    @$('.category-entry-wrapper').html(@categoryEntryView.render())

  initDataEntry: =>
    console.log 'initDataEntry'
    console.log @categoryEntryView.harvestData()
    # @dataEntryView = new DataEntryView
    # @$('.data-entry-wrapper').html(@dataEntryView.render())


module.exports = PageView