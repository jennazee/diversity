metricsOptions =
  gender: ['male', 'female', 'other']
  ethnicity: ['white', 'black', 'asian', 'hispanic', 'other']
  sexual_orientation: ['heterosexual', 'homosexual', 'bisexual', 'other']
  education: ['no_degree', 'high_school', 'undergraduate', "master's", 'doctorate']
  age: ['<21', '21-24', '25-29', '30-34', '35-39', '40-44', '45-49', '>50']

metricsGraphs =
  gender: 'split'
  ethnicity: 'whole'
  sexual_orientation: 'whole'
  education: 'whole'
  age: 'whole'

module.exports =
  metricsOptions: metricsOptions
  metricsGraphs: metricsGraphs