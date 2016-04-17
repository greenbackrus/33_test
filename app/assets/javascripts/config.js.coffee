(->
  # конфигурация 
  restConfig = (RestangularProvider) ->
  # при отправке любого запроса добавлять суффикс .json
    RestangularProvider
    .setRequestSuffix('.json')
  statesConfig = ($stateProvider, $urlRouterProvider, $locationProvider) -> 
    $stateProvider
# определяем возможные состояния приложения, т. е. то, какие макеты будут выводиться
# при переходе по определенному адресу (и наоборот, какой адрес будет в адресной строке, при срабатывании состояния)
# роутинг осуществляется полностью из Ангулар-приложения, см. ui-angular
    .state('courses', { url: '/courses', abstract: true, template: "<ui-view/>", controller: "CoursesCtrl as coursesCtrl"})
    .state('courses.index',           {url: '/list',                                                      templateUrl: 'courses/index.html'})
    .state('courses.create',          {url: '/new',                                                       templateUrl: 'courses/new.html'})
    .state('courses.show',            {url: '/{course_id:int}',                                           templateUrl: 'courses/show.html'})
    .state('courses.edit_lection',    {url: '/{course_id:int}/lections/{lection_id:int}/edit',            templateUrl: 'courses/lections/index.html'})
    .state('courses.edit_homework',   {url: '/{course_id:int}/lections/{lection_id:int}/homework/edit',   templateUrl: 'courses/homework/edit.html'})
    .state('courses.edit_test',       {url: '/{course_id:int}/lections/{lection_id:int}/test',            templateUrl: 'courses/test/edit.html'})
# при переходе по любому непредусмотренному адресу, направляем в корень
    $urlRouterProvider.otherwise('/courses/list')

# инъекция зависимостей в конфиги
  restConfig.$inject    =  ['RestangularProvider']
  statesConfig.$inject  =  ['$stateProvider', '$urlRouterProvider', '$locationProvider']

# добавление конфигов в приложение
  angular.module('courses')
  .config(restConfig)
  .config(statesConfig)
)()

