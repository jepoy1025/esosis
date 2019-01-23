
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue')
import moment from 'moment';

window.moment = moment;

import {ContainerMixin, ElementMixin} from 'vue-slicksort';

// import vuedraggable from 'vuedraggable';
// Vue.use(vuedraggable)

import Print from 'vue-print-nb'
Vue.use(Print);

import Schedule from 'vue-schedule'
Vue.use(Schedule)

import FullCalendar from 'vue-full-calendar'
Vue.use(FullCalendar)

import VueGridLayout from 'vue-grid-layout';
Vue.use(VueGridLayout)

import { Form, HasError, AlertError } from 'vform';
import swal from 'sweetalert2';
window.swal = swal;
const toast = swal.mixin({
  toast: true,
  position: 'top-end',
  showConfirmButton: false,
  timer: 3000
});
window.toast = toast;

window.Form = Form;
Vue.component(HasError.name, HasError)
Vue.component(AlertError.name, AlertError)

import VueRouter from 'vue-router'
Vue.use(VueRouter)


import VueProgressBar from 'vue-progressbar'
Vue.use(VueProgressBar, {
	color: '#ffb3ff',
	failedcolor: 'red',
	height: '30px'
})


let routes = [
  { path: '/dashboard', component: require('./components/dashboard.vue') },
  { path: '/developer', component: require('./components/developer.vue') },
  { path: '/settings', component: require('./components/profile.vue') },

  //Utilities
  { path: '/teachers', component: require('./components/utilities/teachers.vue') },
  { path: '/levels', component: require('./components/utilities/level.vue') },
  { path: '/fees', component: require('./components/utilities/fee.vue') },
  { path: '/rooms', component: require('./components/utilities/room.vue') },
  { path: '/subjects', component: require('./components/utilities/subject.vue') },
  { path: '/users', component: require('./components/utilities/users.vue') },
  { path: '/parents', component: require('./components/utilities/parents.vue') },
  { path: '/sponsors', component: require('./components/utilities/sponsors.vue') },

  //Class Loading
  { path: '/load', component: require('./components/loading/calendar.vue') },

  //Enrollment
  { path: '/new_student', component: require('./components/enrollment/new_student.vue') },
  { path: '/old_student', component: require('./components/enrollment/old_student.vue') },

  //Announcement
  { path: '/announcement', component: require('./components/announcements/announcement.vue') },

  //cashier
  { path: '/cashier', component: require('./components/cashiers/cashier.vue') },

  //parent users
  { path: 'register_sis/:id', component: require('./components/enrollment/waiting_list.vue')},

  //sis
  { path: '/studentList', component: require('./components/sis/student_list.vue') },
  { path: '/addStudent', component: require('./components/sis/add_student.vue') },

  //student
  { path: '/grade', component: require('./components/students/grade.vue') },
  { path: '/grade/:id', component: require('./components/students/grade_list.vue') },
  { path: '/comment/:id', component: require('./components/students/comments.vue') },
  { path: '/requirement/:id', component: require('./components/students/requirements.vue') },

  //reports
  { path: '/class_list', component: require('./components/report/class_list.vue') },
  { path: '/ranking', component: require('./components/report/ranking.vue') },

  //codes
  { path: '/codes', component: require('./components/codes.vue') },

  
]
/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */
const router = new VueRouter({
  mode:'history',
  routes 
})

Vue.filter('upText',function(text){
	return text.charAt(0).toUpperCase() + text.slice(1);
});
Vue.filter('myDate',function(created){
	return moment(created).format('MMMM Do YYYY, h:mm:ss a');
});

window.Fire = new Vue();

Vue.component(
    'passport-clients',
    require('./components/passport/Clients.vue')
);

Vue.component(
    'passport-authorized-clients',
    require('./components/passport/AuthorizedClients.vue')
);

Vue.component(
    'passport-personal-access-tokens',
    require('./components/passport/PersonalAccessTokens.vue')
);

Vue.component('example-component', require('./components/ExampleComponent.vue'));


const app = new Vue({
    el: '#app',
    router
});
