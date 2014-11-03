// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require twitter/typeahead
//= require turbolinks
//= require_tree .

//$(function() {
//  $( ".btnClearSearch" ).click(function() {
//    $("#" + this.dataset.searchbox).val('');
//  });
//  

// constructs the suggestion engine
var engine = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: {
    "url":'/speakers/autocomplete?query=%QUERY',
    filter: function (speakers) {
    // $.map converts the JSON array into a JavaScript array
    return $.map(speakers, function (speaker) {
      return {
        value: speaker
      };
    });
    }
  }
}); 
engine.initialize();
 
$(function() {
  //Configure typeahead on the Speakers search field
  $('#search').typeahead({
    hint: true,
    highlight: true,
    minLength: 1
  },
  {
    source: engine.ttAdapter()
  });
});

