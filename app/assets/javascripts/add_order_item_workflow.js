// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$("a").bind("click", function () {
    if (this.href) {
// Ensure that loading a new page doesn't open
// a new window
        location.href = this.href;
        return false;
    }
});


var greatestWidth = 0;   // Stores the greatest width
function getMaxWidth() {
    var theWidth = $(this).width();   // Grab the current width

    if( theWidth > greatestWidth) {   // If theWidth > the greatestWidth so far,
        greatestWidth = theWidth;     //    set greatestWidth to theWidth
    }
}