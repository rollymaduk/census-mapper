Router.route '/', ->
  @render 'home'
  SEO.set { title: "Home - #{Meteor.App.NAME}" }
,name:'home'
,waitOn:->Meteor.subscribe('censusList')


