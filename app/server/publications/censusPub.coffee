Meteor.publish 'census',(year)->
  year=year or census.findOne({},sort:'properties.year':-1).properties['year']
  check(year,Number)
  census.find('properties.year':year)
