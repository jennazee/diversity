Backbone = require('./backbone_custom.coffee')
CategoryEntryView = require('./category_entry_view.coffee')
DataEntryView = require('./data_entry_view.coffee')
GraphBuilderView = require('./graph_builder_view.coffee')
$ = require('jquery')

class PageView extends Backbone.View
  el: 'body'

  initialize: ->
    @categoryEntryView = new CategoryEntryView
    @metrics = ['gender', 'ethnicity']
    @genders = ['male', 'female', 'other']
    @ethnicities = ['white', 'african-american', 'asian', 'hispanic', 'other']

  events: ->
    'click .start-data-button': 'initDataEntry'

  render: ->
    @$('.category-entry-wrapper').html(@categoryEntryView.render())

  initDataEntry: =>
    @dataEntryView = new DataEntryView
    data = @dataEntryView.render(@categoryEntryView.harvestData())
    @teams = data.teams
    @otherGroupings = data.otherGroupings
    @$('.data-entry-wrapper').html(data)
    $('.select-graph-data-btn').on 'click', @initGraphBuilder

  initGraphBuilder: =>
    @graphBuilderView = new GraphBuilderView
      metrics: @metrics
      genders: @genders
      ethnicities: @ethnicities

    $('.graphs-wrapper').html(@graphBuilderView.render(@dataEntryView.harvestData()))

module.exports = PageView