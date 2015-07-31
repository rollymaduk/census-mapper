root = exports ? this
root.geometry=new SimpleSchema
  geometry:
    type:Object
    optional:true
    index:'2dsphere'
  'geometry.type':
    type:String
  'geometry.coordinates':
    type:[Number]
    decimal:true