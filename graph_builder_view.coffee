Backbone = require('./backbone_custom.coffee')
template = require('./graph_builder_template.hbs')
$ = require('jquery')
_ = require('underscore')

class GraphBuilderView extends Backbone.View

  render: (data) ->
    @$el.append template(data)

  sum: (arrNums) ->
    _.reduce arrNums, ((acc, num) -> acc + num ), 0

  massageData: (data) ->
    _.map data, (team) ->
      team = team.keys()
      totalPeople = @sum(team.gender.values())
      genders = team.gender.keys()




module.exports = GraphBuilderView