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
    teams = _.map @$('.team-entry').val()?.split(','), ((team) -> team.trim())
    metrics = _.map $('.metric-item'), (item) ->
      metric = {}
      metric[$(item).find('.metric-type').val()] = _.map $(item).find('.metric-categories').val()?.split(','), ((cat) -> cat.trim())
      metric
    {teams: teams, metrics: metrics}


module.exports = CategoryEntryView