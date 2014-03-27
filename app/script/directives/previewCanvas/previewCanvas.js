// Generated by CoffeeScript 1.7.1
'use strict';
var loadImage;

loadImage = function(source, callback) {
  var i, loaderImages, numImages;
  loaderImages = 0;
  numImages = 0;
  for (i in source) {
    numImages++;
  }
};

angular.module('mainApp.previewCanvas', []).directive('previewCanvas', function($document) {
  return {
    transclude: true,
    scope: {
      theme: "="
    },
    link: function(scope, element, attrs) {
      scope.$watch('theme', function(theme) {
        if (theme) {
          loadImage(theme.app_icon, null);
        }
      });
    }
  };
});
