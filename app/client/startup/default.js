// Basic
Meteor.startup(function(){
    Mapbox.load({plugins:['mapbox@2.2.1','minimap', 'markercluster']});
    String.prototype.capitalize = function() {
        return this.charAt(0).toUpperCase() + this.slice(1);
    }

});




/*
Meteor.startup(function () {
});*/
