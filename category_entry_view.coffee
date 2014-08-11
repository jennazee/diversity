Backbone = require('./backbone_custom.coffee')
_ = require('underscore')
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
    console.log 'hi'
    teams = @$('.team-entry').val().split(',').strip()
    metrics = _.map $('.metrics-item'), ($item) ->
      metric = {}
      metric[$item.find('.metric-type')] = $item.find('metric-categories').split(',').strip()


module.exports = CategoryEntryView