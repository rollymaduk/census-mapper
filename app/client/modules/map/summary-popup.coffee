Template.summary_popup.helpers
  summary:->
    census.findOne(Template.instance().data).properties
