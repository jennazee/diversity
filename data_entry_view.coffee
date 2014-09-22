Backbone = require('./backbone_custom.coffee')
template = require('./data_entry_template.hbs')
$ = require('jquery')
_ = require('underscore')

metricsOptions = require('./metrics_dict.coffee').metricsOptions

class DataEntryView extends Backbone.View
  events: ->
    'click a': 'harvestData'

  render: (data) ->
    @metrics = data.metrics
    @teams = data.teams
    @otherGroupings = data.otherGroupings
    if data.metrics and (data.teams or data.otherGroupings)
      data.metricsSkeleton = _.map data.metrics, ((el) -> {name_display: el.replace('_', ' '), name: el, options: metricsOptions[el]})
      @$el.html template(data)
    else
      @$el.html "<p>C'mon, give me something to work with!</p>"

  harvestData: ->
    whole = $('.whole-data-entry').serializeArray()
    aux = $('.aux-data-entry').serializeArray()
    a =
      whole: @processData(whole)
      aux: @processData(aux)
      metrics: @metrics
      teams: @teams
      otherGroupings: @otherGroupings
    console.log a
    a

  processData: (raw) ->
    _.reduce raw, ((acc, el) ->
      splits = el.name.split('.')
      if not acc[splits[1]]
        acc[splits[1]] = {}
      if not acc[splits[1]][splits[0]]
        acc[splits[1]][splits[0]] = {}
      acc[splits[1]][splits[0]][splits[2]] = parseInt el.value
      acc
    ), {}


module.exports = DataEntryView