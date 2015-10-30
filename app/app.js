/* Extending prototypes */
if (!('contains' in String.prototype)) {
    String.prototype.contains = function(str, startIndex) {
        return ''.indexOf.call(this, str, startIndex) !== -1;
    };
}

if (!('contains' in Array.prototype)) {
    Array.prototype.contains = function(arr, startIndex) {
        return ''.indexOf.call(this, arr, startIndex) !== -1;
    };
}
/* end extension */

angular.module('QueViva',
    ['ui.bootstrap','afkl.lazyImage']).controller('HomeController', function ($scope, $http) {

        $scope.getRecipes = function getRecipes(/*$viewValue*/) {
            return $http.get('res/recipes/recipes.json').then(function afterGetRecipes(results) {
                $scope.recipes = results.data;
                return results.data;
            });
        };
        $scope.getRecipes();

        $scope.toggleSearch = function toggleSearch() {
            console.log('click fired');
            $('.search-container').animate({
                opacity: 'toggle',
                height: 'toggle',
                length: 'toggle'
            });
        };

        $scope.isActive = function isActive(idx) {
            return $scope.activeIndex === idx;
        };

        $scope.setActive = function setActive(idx) {
          $scope.activeIndex = idx;
        };

        $scope.filterRecipes = function($viewValue) {
            var combinedRecipes = [];
            var combined = Object.keys($scope.recipes).map(function(category) {
                return Object.keys($scope.recipes[category]).map(function(recipe) {
                    return $scope.recipes[category][recipe];
                });
            });
            combinedRecipes = combinedRecipes.concat.apply(combinedRecipes,
               combined
            );
            return combinedRecipes.filter(function (elem) {
                return elem.name.toLowerCase().contains($viewValue.toLowerCase()) || elem.type.toLowerCase().contains($viewValue.toLowerCase());
            });
        };
        $scope.attachImages = function fuckAngular(imgUrls, $event) {
            var parentElement = $event.target.parentElement.parentElement.parentElement.nextElementSibling.childNodes[1].firstChild;
            imgUrls.forEach(function(url) {
                parentElement.innerHTML += '<img src="' + url + '">';
            });
        };

        $scope.removeImages = function alsoFuckAngular(parentElement) {
            parentElement.innerHTML = "Loading...";
        };

        $scope.prepareImages = function(recipe) {
            if (!recipe.hasOwnProperty("render_urls") || recipe.render_urls == undefined) {
                recipe.render_urls = recipe.image_urls;
            } else {
                recipe.image_urls = undefined;
            }
        }
    });