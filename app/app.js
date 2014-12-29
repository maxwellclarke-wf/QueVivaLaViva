angular.module('QueViva',
    ['ui.bootstrap']).controller('HomeController', function ($scope, $http) {

        $scope.getRecipes = function getRecipes(/*$viewValue*/) {
            return $http.get('res/recipes/recipes.json').then(function afterGetRecipes(results) {
                $scope.recipes = results.data;
                return results.data;
            });
        };
        $scope.getRecipes();

        $scope.isActive = function isActive(idx) {
            return $scope.activeIndex === idx;
        };

        $scope.setActive = function setActive(idx) {
          $scope.activeIndex = idx;
        }




    });