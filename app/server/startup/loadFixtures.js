function loadFixture(fixtures, collection) {
  var i;
    collection.remove({});
  if (collection.find().count()<1)
    for (i = 0; i < fixtures.length; i+= 1) {
            fixtures[i].properties.male=parseInt(fixtures[i].properties.male);
            fixtures[i].properties.female=parseInt(fixtures[i].properties.female);
            fixtures[i].properties.total=parseInt(fixtures[i].properties.total);
            fixtures[i].properties.year=parseInt(fixtures[i].properties.year);
            collection.insert(fixtures[i]);
        }
}

Meteor.startup(function () {
  loadFixture(Fixtures['census'],census);
});
