root = exports ? this
root.population=new SimpleSchema
  mode:
    type:String
    allowedValues:['state','lga','country']
  parent:
    type:String
  child:
    type:String
  male:
    type:Number
  female:
    type:Number
  total:
    type:Number
  year:
    type:Number
  type:
    type:String
