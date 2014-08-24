Backbone = require('./backbone_custom.coffee')
template = require('./data_entry_template.hbs')
$ = require('jquery')
_ = require('underscore')

class DataEntryView extends Backbone.View
  events: ->
    'click a': 'harvestData'

  render: (data) ->
    @$el.append template(data)

  harvestData: ->
    a = $('form').serializeArray()
    console.log a
    _.reduce a, ((acc, el) ->
      splits = el.name.split('.')
      if not acc[splits[0]]
        acc[splits[0]] = {}
      if not acc[splits[0]][splits[1]]
        acc[splits[0]][splits[1]] = {}
      acc[splits[0]][splits[1]][splits[2]] = el.value
      acc
    ), {}

module.exports = DataEntryView