environments {
  development {
    modules = {
      jquery{ resource url: 'http://code.jquery.com/jquery-1.11.0.js' }
      angular{
        dependsOn 'jquery'
        resource url: 'https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular.js'
      }
    }
  }
}