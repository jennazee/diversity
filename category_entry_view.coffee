Marionette = require('backbone.marionette')
template = require('./category_entry_template')
metricsItemTemplate = require('./metrics_item_template')

class CategoryEntryView extends Marionette.ItemView
  template: template

  ui: ->
    addMetric: '.add-metric'
    metricsItemsWrapper: '.metrics-items-wrapper'

  events: ->
    'click @ui.addMetric': 'appendMetricItem'

  appendMetricItem: ->
    @ui.metricsItemsWrapper.append(metricsItemTemplate())


module.exports = CategoryEntryView