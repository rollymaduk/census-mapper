Template.locationDetail.created=->
  @areaElement='analysis-chart'
  @query=new ReactiveVar();


  @autorun(()=>
    if @query.get()
      @subscribe('itemCensusList',@query.get())
      res=census.find(@query.get()).map (doc)->doc.properties.year="#{doc.properties.year}";doc.properties
      Rp_mchart.setData(@areaElement,res)
  )
  @detail=census.findOne(@data).properties


Template['locationDetail'].helpers(
  detail:()->
    Template.instance().detail

  pie:->
    {
      data: [ {label: 'Male', value: Template.instance().detail.male},
        {label:'Female', value: Template.instance().detail.female}],
      type:'pie'
    }
  delay:->
    1500
  area:->
    {
      element: Template.instance().areaElement,
      options:{xkey:'year', ykeys: ['male', 'female'],behaveLikeLine:true, labels: ['Male', 'Female']}
    }
)


Template.locationDetail.rendered=->
  @query.set({'properties.child':@detail.child})
  console.log @query.get()
  null


Template['locationDetail'].events(
  'click .close-detail':(evt,temp)->
    SemanticModal.generalModal('locationList',null,{modalClass:'large'})
)
