Backbone = require('./backbone_custom.coffee')
CategoryEntryView = require('./category_entry_view.coffee')
DataEntryView = require('./data_entry_view.coffee')
GraphBuilderView = require('./graph_builder_view.coffee')
$ = require('jquery')

class PageView extends Backbone.View
  el: 'body'

  initialize: ->
    @categoryEntryView = new CategoryEntryView

  events: ->
    'click .start-data-button': 'initDataEntry'

  render: ->
    @$('.category-entry-wrapper').html(@categoryEntryView.render())

  initDataEntry: =>
    @dataEntryView = new DataEntryView
    @$('.data-entry-wrapper').html(@dataEntryView.render(@categoryEntryView.harvestData()))
    $('.select-graph-data-btn').on 'click', @initGraphBuilder

  initGraphBuilder: =>
    @graphBuilderView = new GraphBuilderView
    $('.graphs-wrapper').html(@graphBuilderView.render(@dataEntryView.harvestData()))

module.exports = PageView