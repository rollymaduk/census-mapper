Template.map.rendered=->
  @selectedYear=new ReactiveVar(census.findOne().properties.year)
  @autorun ()=>
    if (Mapbox.loaded())
      data=census.find({'properties.year':@selectedYear.get()}).fetch()
      L.mapbox.accessToken = "pk.eyJ1Ijoicm9sbHlwb2xseSIsImEiOiI2NmI4NGE2Njk4NjAyNTkwZGUzZDgxMjdjODg3N2M1MyJ9.wjeMwid5pElStcuJh9nfBQ";
      map = L.mapbox.map('map','rollypolly.b342ebdf',{zoomControl:false});
      center=null

      featureLayer=L.geoJson(data
      ,pointToLayer:(feature,latlng)->
        radius=CommonHelpers.ratio(feature.properties.total)
        marker=L.marker(latlng,{
          icon:getIcon(feature,radius)
        })
        marker.on('click',()->
          map.setView(latlng,9)
        )
        marker.on('popupclose',()->
          map.setView(center,map.getMinZoom())
        )
        marker.bindPopup(Blaze.toHTMLWithData(Template.summary_popup,feature._id))
      )


      clusterGroup=new L.MarkerClusterGroup()
      clusterGroup.addLayer(featureLayer)
      clusterGroup.addTo(map)

      map.on('load',(e)->

        center=map.getCenter()
      )


      null


  male=census.find().map (doc)->
    doc.properties.male
  male=_.reduce(male,(memo,val)->memo+val)
  female=census.find().map (doc)->
    doc.properties.female
  female=_.reduce(female,(memo,val)->memo+val)
  total=census.find().map (doc)->
    doc.properties.total
  total=_.reduce(total,(memo,val)->memo+val)





  $('.ui.dropdown').dropdown()
  null


getIcon=(feature,radius)->
  L.divIcon({className:"outer_circle",html: "<div class=' #{feature._id} inner_circle'></div>
<div style='margin-top:110%;margin-right:80%;' class='ui pointing label'>#{feature.properties.child}</div>",iconSize:[radius, radius]})


Template.map.events
  'click .locationList':(evt,temp)->
    $(".locationList div:first-child").toggleClass('active',true)
    SemanticModal.generalModal('locationList',null,{modalClass:'large'
      ,postRender:()->
        $(".locationList div:first-child").toggleClass('active',false)
    })

  'click .card-detail':(evt,temp)->
    SemanticModal.generalModal('locationDetail',evt.target.id,{modalClass:'medium'})



Template.map.helpers
  selectedStats:->
    Session.get('selectedStats')

  locationList:->
    census.find().map (doc)->
      doc.properties.child




