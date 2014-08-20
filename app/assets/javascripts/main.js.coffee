# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require_self
#= require mm-foundation-tpls-0.3.1
#= require_tree ./Controllers/main
#= require_tree ./Services/main

Blog = angular.module('Blog', ['mm.foundation'])

# Sets up routing
Blog.config(['$routeProvider', ($routeProvider) ->
  # Route for '/post/'
  $routeProvider
    .when('/post/new', { templateUrl: '../assets/mainCreatePost.html', controller: 'CreatePostCtrl' } )
    .when('/post/:postId', { templateUrl: '../assets/mainPost.html', controller: 'PostCtrl' } )
    #.when('/post/:postId/edit', { templateUrl: '../assets/mainEditPost.html', controller: 'EditPostCtrl' } )

  # Default
  $routeProvider.otherwise({ templateUrl: '../assets/mainIndex.html', controller: 'IndexCtrl' } )

])

Blog.config(["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])