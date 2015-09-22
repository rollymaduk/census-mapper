getCensus =(query)->
  query = query or {
  'properties.year': census.findOne({}, sort:
    'properties.year': -1).properties['year']
  }
  check(query, Match.Any)
  census.find(query)
Meteor.publish 'censusList',(query)->
  getCensus(query)

Meteor.publish 'itemCensusList',(query)->
  console.log query
  getCensus(query)
