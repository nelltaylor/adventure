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
  $('body').on("submit", ".like_post_form", function(event){
    event.preventDefault();
      var myUrl = $(this).attr('action')
      $.ajax({type: 'POST', url: myUrl})
        .done(function(response) {
          var points = $(response).find('#post_points').text()
          $('#post_points').text(points)
        })
  })

  $('body').on("submit", ".dislike_post_form", function(event){
    event.preventDefault();
      var myUrl = $(this).attr('action')
      $.ajax({type: 'POST', url: myUrl})
        .done(function(response) {
          var points = $(response).find('#post_points').text()
          $('#post_points').text(points)
        })
  })

  $('#comments').on("submit", '.like_comment_form', function(event){
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
  $('#comments').on("submit", '.dislike_comment_form', function(event){
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

  $('#replies').on("submit", '.like_reply_form', function(event){
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

  $('#replies').on("submit", '.dislike_reply_form', function(event){
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

  // $('#new_reply').click(function(event){

  //   $.ajax({
  //     url: '/replies/show'
  //   })
  //   .done(function(response){
  //     $('#new_reply').hide();
  //     $('#empty').append(response);
  //   })
  // })

  $('.sort-posts').on("click", 'a', function(event){
  event.preventDefault();
    var myUrl = $(this).attr('href')
    $.ajax({type: "GET", url: myUrl})
      .done(function(response) {
        $('.tile-images').hide();
        $('.images-container').html(response)
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
        $('#post'+id).html(response)
      })
  })

  $('#new-comment').on('submit', '#new_comment', function(event) {
    event.preventDefault();
    var myUrl = $(this).attr('action');
    var regex = /\d+/;
    var id = myUrl.match(regex)[0];
    var thing = $('#new_comment').serializeArray()[2];
    // console.log(thing)
    var ajax = $.ajax({type: "POST", url: myUrl, data: $('#new_comment').serialize(), dataType: 'json'})
      ajax.done(function(response) {
        console.log(response)
        $('#new_comment').remove();
        $('#submit-comment').show();
        var $div = $('<div>').attr('id', "comments")
        var $h3 = $('<h3>').text('Comments')
        var $like = $('<input>').attr('type', 'submit').attr('value', 'Like')
        var $likeForm = $('<form>').attr('method', 'post').attr('action', '/comments/'+response['comment']['post_id']+'/voteup?name='+response['comment']['id']+'').addClass('like_comment_form').append($like)

        var $dislike = $('<input>').attr('type', 'submit').attr('value', 'dislike')
        var $dislikeForm = $('<form>').attr('method', 'post').attr('action', '/comments/'+response['comment']['post_id']+'/votedown?name='+response['comment']['id']+'').addClass('like_comment_form').append($dislike)
        // var $ajaxform = $("<%= button_to 'Like', {action: 'voteup', controller: 'comments', name: '+response[:id]+' }, form_class: 'like_comment_form' %>")

        var $points = $('<span>').attr('id', 'comment'+response['comment']['id']+'_points').html('0')

        var $replyLink = $('<a>').attr('data-remote', 'true').attr('href', '/replies/new?comment='+response['comment']['id']+'').text('Reply To Comment')


        var $replyFormDiv = $('<div>').attr('id', 'reply_form'+response['comment']['id']+'')
        // var $h4 = $('<h4>').text('Reply')
        var $replyDiv = $('<div>').attr('id', 'replies-for-comment-'+response['comment']['id']+'')

        $div.append([$h3, $likeForm, $dislikeForm, $points, 'Points', $('<br>'), $('<br>'), ''+response['comment']['text']+''], $('<br>'), ''+response['user']['username']+'', $('<br>'), $('<br>'), $replyLink, $replyFormDiv, $replyDiv)

        $('#opinions').append($div);
        // console.log($form)
      })
  })

})
