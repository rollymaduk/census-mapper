root = exports ? this

root.census = new Mongo.Collection 'census'

root.census.attachSchema(
  new SimpleSchema([root.geometry
    ,{
      type:
        type: String
        defaultValue: "Feature"
      properties:
        type: root.population
      createdAt:
        type: Date
        autoValue: ->
          if @isInsert
            new Date()
          else if @isUpsert
            $setOnInsert: new Date()
          else
            @unset()
    }]
  )
)

# Collection2 already does schema checking
# Add custom permission rules if needed
root.census.allow(
  insert : -> true

  update : -> true

  remove : -> true
)


