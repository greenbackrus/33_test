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
    .state('courses', { url: '', abstract: true, template: "<ui-view/>", controller: "CoursesCtrl as coursesCtrl"})
    .state('courses.index',     {url: '/courses',                     templateUrl: 'courses/index.html'})
    .state('courses.show',      {url: '/{id:int}',                    templateUrl: 'courses/show.html'})
    .state('courses.create',    {url: '/new',                         templateUrl: 'courses/new.html'})
    .state('courses.lections',  {url: '/{id:int}/lections',           templateUrl: 'courses/lections/index.html'})
    .state('courses.homework',  {url: '/{id:int}/{id:int}/homework',  templateUrl: 'courses/homework/edit.html'})
    .state('courses.test',      {url: '/{id:int}/{id:int}/test',      templateUrl: 'courses/test/edit.html'})
# при переходе по любому непредусмотренному адресу, направляем в корень
    $urlRouterProvider.otherwise('/courses')

# инъекция зависимостей в конфиги
  restConfig.$inject    =  ['RestangularProvider']
  statesConfig.$inject  =  ['$stateProvider', '$urlRouterProvider', '$locationProvider']

# добавление конфигов в приложение
  angular.module('courses')
  .config(restConfig)
  .config(statesConfig)
)()

