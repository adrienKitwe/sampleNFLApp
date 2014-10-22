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
//= require turbolinks
//= require_tree .

//$(document).ready(function() {
var ready;
  ready = function() {
  $('.conferenceButton').on('click', function(){
    event.preventDefault();
    $('body').toggleClass($(this).text());
    //$('body').removeClass('NFC AFC').addClass($(this).text());
    //$(this).toggleClass($(this).text());
  });
  
  $('.backlink').hide()
  
  
  $('.searchselect').on('change', function(){
    var found = false;
    var searchTeam = $('.searchselect option:selected').text();
      $('table tbody tr').css('display', 'table-row');
      $('table tbody tr').each(function(){
        //alert($(this).text());
        if ($(this).text().indexOf(searchTeam) ==-1) {
          
            $(this).fadeOut();
          } 
          else { found = true; }   
      });
      if (!(found) && (searchTeam != 'Select Team')) {
        alert('The ' + searchTeam + ' have not been in any superbowls');
      }
      $('.backlink').show()
    // alert($('.searchselect option:selected').text());
  })

};

//added along with var ready so that jquery would work after the turbolinks refresh
//$(document).ready() does not work
$(document).ready(ready);
$(document).on('page:load', ready);