Backbone = require('./backbone_custom.coffee')
template = require('./graph_builder_template.hbs')
$ = require('jquery')

class GraphBuilderView extends Backbone.View

  render: (data) ->
    @$el.append template(data)

module.exports = GraphBuilderView