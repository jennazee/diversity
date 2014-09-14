Backbone = require('./backbone_custom.coffee')
template = require('./data_entry_template.hbs')
$ = require('jquery')
_ = require('underscore')

class DataEntryView extends Backbone.View
  events: ->
    'click a': 'harvestData'

  render: (data) ->

    if data.teams or data.otherGroupings
      @$el.html template(data)
    else
      @$el.html '<p>You need to enter some data for me to graph!</p>'

  harvestData: ->
    a = $('form').serializeArray()
    _.reduce a, ((acc, el) ->
      splits = el.name.split('.')
      if not acc[splits[0]]
        acc[splits[0]] = {}
      if not acc[splits[0]][splits[1]]
        acc[splits[0]][splits[1]] = {}
      acc[splits[0]][splits[1]][splits[2]] = parseInt el.value
      acc
    ), {}

module.exports = DataEntryView