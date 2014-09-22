Backbone = require('./backbone_custom.coffee')
template = require('./graph_builder_template.hbs')
$ = require('jquery')
_ = require('underscore')

metricsStuff = require('./metrics_dict.coffee')

metricsGraphs = metricsStuff.metricsGraphs
metricsOptions = metricsStuff.metricsOptions

# splitGraph = require('./split_graph.coffee')
wholeGraph = require('./whole_graph.hbs')

class GraphBuilderView extends Backbone.View
  colors: ['#b82a41', '#0f8', '#0DA5AC', '##CF17CF', '#E0840E']
  colorTicker: -1

  render: (data) ->
    base = '<h2>Here are your diversity graphs!</h2>'
    massaged = @massageData data

    for metric in massaged
      if metricsGraphs[metric.metric] is 'whole'
        graph = wholeGraph(metric)
        base = "#{base} #{graph}"
    base


  massageData: (data) ->
    newData = []

    for metric in data.metrics
      if metricsGraphs[metric] is 'split'
        metricData = data.whole[metric]
        for team in data.teams
          total = @sum _.values metricData[team]
          for option in metricsOptions[metric]
            metricData[team][option] = ((metricData[team][option] / total) * 100)

        newData.push {metric: metric, data: metricData}

      else if metricsGraphs[metric] is 'whole'
        metricData = data.whole[metric]

        total = 0
        for team in data.teams
          total += @sum _.values metricData[team]

        summed = {}
        for team in data.teams
          for option in metricsOptions[metric]
            if summed[option]
              summed[option] += metricData[team][option]
            else
              summed[option] = metricData[team][option]


        postSummed = []
        for option in metricsOptions[metric]
          @colorTicker = (@colorTicker+1) % @colors.length
          postSummed.push {option: option.replace('_', ' '), percent: (summed[option] / total) * 100, color: @colors[@colorTicker]}

        newData.push {metric: metric, data: postSummed}

    newData

  sum: (arrNums) ->
    _.reduce arrNums, ((acc, num) -> acc + num ), 0

module.exports = GraphBuilderView
