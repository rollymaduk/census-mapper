Template['locationDetail'].helpers(
  detail:()->
    census.findOne(Template.currentData())
)

Template['locationDetail'].events(
)
