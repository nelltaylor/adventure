// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require_tree .


$(document).ready(function(){
  $('body').on("submit", ".like_post_form", function(){
    event.preventDefault();
      var myUrl = $(this).attr('action')
      $.ajax({type: 'POST', url: myUrl})
        .done(function(response) {
          var points = $(response).find('#post_points').text()
          $('#post_points').text(points)
        })
  })

  $('body').on("submit", ".dislike_post_form", function(){
    event.preventDefault();
      var myUrl = $(this).attr('action')
      $.ajax({type: 'POST', url: myUrl})
        .done(function(response) {
          var points = $(response).find('#post_points').text()
          $('#post_points').text(points)
        })
  })

  $('#comments').on("submit", '.like_comment_form', function(){
    event.preventDefault();
      var myUrl = $(this).attr('action')
      var regex = /\d*$/;
      var id = myUrl.match(regex)[0]
      $.ajax({type: 'POST', url: myUrl})
        .done(function(response) {
          var points = $(response).find('#comment'+id+'_points').text()
          $('#comment'+id+'_points').text(points)
        })
  })
  $('#comments').on("submit", '.dislike_comment_form', function(){
    event.preventDefault();
      var myUrl = $(this).attr('action')
      var regex = /\d*$/;
      var id = myUrl.match(regex)[0]
      $.ajax({type: 'POST', url: myUrl})
        .done(function(response) {
          var points = $(response).find('#comment'+id+'_points').text()
          $('#comment'+id+'_points').text(points)
        })
  })

  $('#replies').on("submit", '.like_reply_form', function(){
    event.preventDefault();
      var myUrl = $(this).attr('action')
      var regex = /\d*$/;
      var id = myUrl.match(regex)[0]
      $.ajax({type: 'POST', url: myUrl})
        .done(function(response) {
          console.log(response)
          var points = $(response).find('#reply'+id+'_points').text()
          $('#reply'+id+'_points').text(points)
        })
  })

  $('#replies').on("submit", '.dislike_reply_form', function(){
    event.preventDefault();
      var myUrl = $(this).attr('action')
      var regex = /\d*$/;
      var id = myUrl.match(regex)[0]
      $.ajax({type: 'POST', url: myUrl})
        .done(function(response) {
          var points = $(response).find('#reply'+id+'_points').text()
          $('#reply'+id+'_points').text(points)
        })
  })

  $('#new_reply').click(function(event){

    $.ajax({
      url: '/replies/show'
    })
    .done(function(response){
      $('#new_reply').hide();
      $('#empty').append(response);
    })
  })

  $('.tile-images').on("submit", '.edit-image', function(event){
  event.preventDefault();
    var myUrl = $(this).attr('action')
    var regex = /\d+/;
    var id = myUrl.match(regex)[0]
    $.ajax({type: "GET", url: myUrl})
      .done(function(response) {
        $('#manage-post').hide();
        $('#post'+id).html("<%= j (render 'edit') %>")
      })
  })
})
