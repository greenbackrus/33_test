(->
  # controller definition 
  CoursesCtrl = (Restangular, $state) ->
    # посылаем запрос к API  
    restCourses = Restangular.all('courses')
    # получаем объект рестангулар, дальше можем удобно манипулировать полученными данными
    @courses    = restCourses.getList().$object
    # функция добавить курс, отсылаем запрос post, при получении отклика переходим на список и обновляем
    @createCourse = (course) ->
      restCourses.post(course).then($state.go('courses.index', {}, {reload: true}))
    # функция удалить курс, отсылаем запрос, при получении отклика обновляем состояние (т. е. вид)
    @deleteCourse = (course) ->
      course.remove().then($state.reload())
    @showCourse = (course) ->
    # получаем уроки и дисциплины определенного курса, сохраняем в переменных экземпляра 
    # и переходим к состоянию  
      restLessons    = Restangular.all('lessons')
      restDiscipines = Restangular.all('disciplines')
      @lessons       = restLessons.getList({course: course.id}).$object
      @disciplines   = restDiscipines.getList({course: course.id}).$object
      @course        = course
      $state.go('courses.show', {course_id: course.id})
    return
  # dependencies inject
  CoursesCtrl.$inject = ['Restangular', '$state']
 
  angular.module('courses')
  .controller('CoursesCtrl', CoursesCtrl)
)()