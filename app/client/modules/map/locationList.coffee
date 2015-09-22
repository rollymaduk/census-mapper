getLocationList=(args...)->
  query=args[0] or {}
  res=census.find(query).map (doc)->doc.properties
  res

getDebouncedLocationList=_.debounce((query,rVar)->
  res=getLocationList(query)
  rVar.set(res)
,300
)

Template.locationList.created=->
  @locations=new ReactiveVar(getLocationList())

Template.locationList.helpers
  locations:->
    Template.instance().locations.get()

Template.locationList.events
  'keyup .location-search':(evt,temp)->
    query={'properties.child':{$regex:"^#{evt.target.value}",$options:'i'}}
    getDebouncedLocationList(query,temp.locations)

  'click .close-modal':(evt,temp)->
    $('.ui.modal').modal('hide')

Template.locationItem.events
  'click .card-detail':(evt,temp)->
    SemanticModal.generalModal('locationDetail',temp.data.id(),{modalClass:'medium'})





