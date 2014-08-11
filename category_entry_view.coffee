Backbone = require('./backbone_custom.coffee')
template = require('./category_entry_template.hbs')
metricsItemTemplate = require('./metrics_item_template.hbs')

class CategoryEntryView extends Backbone.View
  events: ->
    'click .add-metric': 'appendMetricItem'

  render: ->
    @$el.append template()

  appendMetricItem: (e)->
    e.preventDefault()
    console.log metricsItemTemplate()
    @$('.metrics-items-wrapper').append(metricsItemTemplate())


module.exports = CategoryEntryView