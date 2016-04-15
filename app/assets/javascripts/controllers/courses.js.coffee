(->
  # controller definition 
  CoursesCtrl = (Restangular, $state) ->
    # посылаем запрос к API  
    restCourses = Restangular.all('courses')
    # получаем объект рестангулар, дальше можем удобно манипулировать полученными данными
    @courses    = restCourses.getList().$object
    # функция добавить курс, отсылаем запрос post, при получении отклика переходим на список и обновляем
    @createCourse = (course) ->
      restCourses.post(course).then($state.go('courses', {}, {reload: true}))
    # функция удалить курс, отсылаем запрос, при получении отклика обновляем состояние (т. е. вид)
    @deleteCourse = (course) ->
      course.remove().then($state.reload())
    return
  # dependencies inject
  CoursesCtrl.$inject = ['Restangular', '$state']
 
  angular.module('courses')
  .controller('CoursesCtrl', CoursesCtrl)
)()