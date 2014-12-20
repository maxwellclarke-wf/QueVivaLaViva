angular.module('QueViva',
    ['ui.bootstrap']).controller('HomeController', function ($scope) {
        $scope.recipes = [
            {
                name: "Birthday Surprise",
                category: "breakfast",
                image_url: [
                    'http://www.newportcreamery.com/menu_breakfast_6_4244579205.jpg',
                    'http://www.ihop.com/menus/main-menu/egg-combos/-/media/ihop/MenuItems/Breakfast%20Combos/Split%20Decision%20Breakfast/Split_Decision_Breakfast.png?mh=367'
                ]
            },
            {
                name: 'baby casserole spears',
                category: 'madeup',
                image_url: [
                    'http://lionandmaven.com/wp-content/uploads/2011/03/img_3704.jpg',
                    'http://origincache-frc.fbcdn.net/10299865_1446970245542244_1622991729_n.jpg'
                ]
            }
        ];





    });