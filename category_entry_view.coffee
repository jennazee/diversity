Backbone = require('./backbone_custom.coffee')
_ = require('underscore')
$ = require('jquery')
template = require('./category_entry_template.hbs')
metricsItemTemplate = require('./metrics_item_template.hbs')

class CategoryEntryView extends Backbone.View
  events: ->
    'click .add-metric': 'appendMetricItem'

  render: ->
    @$el.append template()

  appendMetricItem: (e)->
    e.preventDefault()
    @$('.metrics-items-wrapper').append(metricsItemTemplate())

  harvestData: ->
    metrics: _.map $('.category-entry').serializeArray(), ((el) -> el.name)
    teams: if @$('.team-entry').val().length then _.map @$('.team-entry').val().split(','), ((team) -> team.trim())
    otherGroupings: if @$('.other-grouping-entry').val().length then _.map @$('.other-grouping-entry').val().split(','), ((group) -> group.trim())

module.exports = CategoryEntryView