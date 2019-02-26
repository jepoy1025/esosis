<template>
    <div class="container">
        <div class="row">
        </div>
        <div class="col-lg-12">
            <div class="card card-info">
                <div class="card-header">
                <h3 class="card-title pink"><b>M. T. TH. F. Schedule Loading</b></h3>
              </div>
            <div id='wrap' style="width: 100%;margin: 0;position: relative;
line-height: 1.4em;">
                
                <div id='external-events' style="    float: left;
                    width: 20%;
                    padding: 0;
                    border: 1px solid #ccc;
                    background: #eee;
                    text-align: left;">
                    <label>Input Grade Level:</label>
                      <input type="text" name="level" v-model="gradeLevel">
                    <h4 style="font-size: 16px;margin-top: 0;padding-top: 1em;">Drag Subject to Table</h4>
                    <div v-for="subject in subjects" :key="subject.id" class='fc-event' :level="subject.level" :subject-id="subject.id"
                         style="margin: 10px 0;cursor: pointer;" :hidden="subject.grade_level != gradeLevel && subject.grade_level != 'Multi-level'">{{ subject.title }} - {{ subject.grade_level }}
                    </div>
                    <p>
                        <input type='checkbox' id='drop-remove'/>
                        <label for='drop-remove'>remove after drop</label>
                    </p>
                </div>

                <div id='calendar' style="float: right;width: 80%; background-color: #ffffff"></div>

                <div style='clear:both'></div>

            </div>
            <button></button>
            </div>
        </div>
    </div>
</template>

<script>
    import {FullCalendar} from 'fullcalendar-scheduler'
    import 'fullcalendar-scheduler/dist/scheduler.css'
    import 'jquery-ui-dist/jquery-ui'

    export default {
        components: {
            FullCalendar
        },

        data() {
            //Fire.$emit('afterCreate');
            return {
                gradeLevel: 'Grade 3',
                teacher: {},
                subjects: [],
                resources: [],
                calendar: null,
                eventScheduleIds: {},
                teachers: [],
                schedules: [],
            }
        },

        computed: {
            computedRooms() {
                return this.resources.map(item => {
                    return {
                        ...item,
                        ...{
                            title: item.title + ' - ' + item.section
                        }
                    }
                })
            }
        },


        mounted() {
            //axios.get("api/teacher").then(({result})=>(this.resultRooms = result.data));
            //axios.get("api/teacher").then(result => { console.log(result); return result; },
            //axios.get("api/room-column").then(({json})=>(this.resources = json.data));
            Fire.$emit('afterCreate');
            Promise.all([this.loadLevel(), this.loadRoom(), this.loadSubject(), this.getSchedules(), this.getTeachers()])
                .then(repsonses => {
                    this.initCalendar()
                })
        },

        methods: {

            initCalendar() {
                let self = this;
                this.calendar = $('#calendar').fullCalendar({
                    // now: '2018-04-07',
                    editable: true, // enable draggable events
                    droppable: true, // this allows things to be dropped onto the calendar
                    aspectRatio: 1,
                    scrollTime: '7:00',
                    slotDuration: '00:05:00', // undo default 6am scrollTime
                    defaultTimedEventDuration: '01:00:00',
                    forceEventDuration: true,
                    contentHeight: 500,
                    schedulerLicenseKey: 'GPL-My-Project-Is-Open-Source',
                    header: {
                        left: '',
                        center: 'Header',
                        right: ''
                    },
                    defaultView: 'timelineDay',
                    views: {
                        timelineThreeDays: {
                            type: 'timeline',
                            duration: {days: 3}
                        }
                    },
                    resourceLabelText: 'Rooms',
                    resources: this.computedRooms,

                    events: function(start, end, timezone, callback) {
                        console.log({
                            start, end, timezone, callback
                        });
                        callback(self.schedules.map(item => {
                            return {
                                title: item.subject.title,
                                start: moment(start.format('YYYY-MM-DD') + ' ' + item.start_time),
                                end: moment(start.format('YYYY-MM-DD') + ' ' + item.end_time),
                                subjectId: item.subject_id,
                                resourceId: item.room_id,
                                scheduleId: item.id,
                                level: item.subject.level,
                            }
                        }));
                    },

                    //console.log(level),
                    drop: function (date, jsEvent, ui, resourceId,) {
                        //console.log('drop', date.format(), resourceId);
                        // is the "remove after drop" checkbox checked?
                        if ($('#drop-remove').is(':checked')) {
                            // if so, remove the element from the "Draggable Events" list
                            $(this).remove();
                        }
                    },
                    eventClick: function (event, element) {
                        var new_ev = event;
                        console.log(new_ev.start);
                        bootbox.dialog({
                            message: `Confirm delete schedule?`,
                            title: 'Confirmation',
                            buttons: {
                                cancel: {
                                    label: 'Cancel',
                                    className: 'btn-default'
                                },
                                confirm: {
                                    label: 'Yes, Delete',
                                    className: 'btn-danger',
                                    callback() {
                                        self.deleteEvent(event)
                                    }
                                },
                            },
                        });
                        // event.title = "CLICKED!";
                        // $('#calendar').fullCalendar('updateEvent', event);
                    },
                    eventDrop: function (event, duration, revertFn,) { // called when an event (already on the calendar) is moved
                        //revertFunc();
                        console.log('eventDrop', event);

                        if (!self.isValidDropForRoom(event)) {
                            revertFn();
                            window.swal.fire(
                                'Oops!',
                                'Schedule is not vacant for room.',
                                'error'
                            )
                        } else if (!self.isValidRoomLevel(event)) {
                            revertFn();
                            window.swal.fire(
                                'Oops!',
                                'Grade level of subject is not the same with room grade level.',
                                'error'
                            )
                        } else if (!self.isValidDrop(event)) {
                            revertFn();
                            window.swal.fire(
                                'Oops!',
                                'Teacher is not available for this time schedule.',
                                'error'
                            )
                        } else {
                            self.saveEvent(event);
                        }
                    },
                    eventReceive: function (event) { // called when a proper external event is dropped
                        console.log('eventReceive', {
                            event
                        });
                        if (!self.isValidDropForRoom(event)) {
                            self.calendar.fullCalendar('removeEvents', event._id);
                            window.swal.fire(
                                'Oops!',
                                'Schedule is not vacant for room.',
                                'error'
                            )
                        } else if (!self.isValidRoomLevel(event)) {
                            self.calendar.fullCalendar('removeEvents', event._id);
                            window.swal.fire(
                                'Oops!',
                                'Grade level of subject is not the same with room grade level.',
                                'error'
                            )
                        } else if (!self.isValidDrop(event)) {
                            self.calendar.fullCalendar('removeEvents', event._id);
                            window.swal.fire(
                                'Oops!',
                                'Teacher is not available for this time schedule.',
                                'error'
                            )
                        } else {
                            self.saveEvent(event);
                        }
                    },
                    eventResize(event, delta, revertFn) {
                        console.log({
                            event, delta, revertFn,
                        });
                        if (!self.isValidDropForRoom(event)) {
                            revertFn();
                            window.swal.fire(
                                'Oops!',
                                'Schedule is not vacant for room.',
                                'error'
                            )
                        } else if (self.isValidDrop(event)) {
                            self.saveEvent(event);
                        } else {
                            revertFn();
                            window.swal.fire(
                                'Oops!',
                                'Teacher is not available for this time schedule.',
                                'error'
                            )
                        }
                    },
                });
            },

            initDraggables() {
                $('#external-events .fc-event').each(function () {
                    // axios.get("api/room-column").then(({data}) => (this.resources = data.data));
                    // store data so the calendar knows to render an event upon drop
                    $(this).data('event', {
                        title: $.trim($(this).text()), // use the element's text as the event title
                        stick: true, // maintain when user navigates (see docs on the renderEvent method)
                        subjectId: $(this).attr('subject-id'),
                        level: $(this).attr('level'),
                    });
                    // make the event draggable using jQuery UI
                    $(this).draggable({
                        zIndex: 999,
                        revert: true,      // will cause the event to go back to its
                        revertDuration: 0  //  original position after the drag
                    });

                });
            },

            // roomColumn(){
            //   var resources = axios.get("api/room-column").then(({data})=>(this.resources = data.data));
            //   return resources;
            // },
            loadRoom() {
                return axios.get("api/room").then(({data}) => {
                    this.resources = data.data
                });
            },
            loadSubject() {
                return axios.get("api/subject").then(({data}) => {
                    this.subjects = data.data;
                    Vue.nextTick(() => {
                        this.initDraggables()
                    })
                });
            },
            loadLevel(){
                return axios.get("api/level").then(({data})=>{
                        this.level = data.data
                    });
            },
            saveEvent(event) {
                let data = {
                    id: event.scheduleId ? event.scheduleId : _.get(this.eventScheduleIds, event._id),
                    subject_id: event.subjectId,
                    room_id: event.resourceId,
                    start_time: event.start.local().format('HH:mm:ss'),
                    end_time: event.end.local().format('HH:mm:ss'),
                    day: 1,
                };
                let subject = this.subjects.find(item => {
                    return item.id == data.subject_id
                });
                let teacher = this.teachers.find(item => {
                    return item.id == subject.teacher_id
                });
                if (data.id) {
                    axios.put(`/api/schedule/${data.id}`, data)
                        .then(({data}) => {
                            this.eventScheduleIds[event._id] = data.id
                        })
                        .catch(error => {
                            this.calendar.fullCalendar('removeEvents', event._id)
                            window.alert("textext");
                    });
                } else {
                    axios.post(`/api/schedule`, data)
                        .then(({data}) => {
                            this.eventScheduleIds[event._id] = data.id
                            window.toast(
                                'Success!',
                                `${event.start.local().format('hh:mm a')}-${event.end.local().format('hh:mm a')} ,mr/ms ${teacher.name}`,
                                'success',
                            )
                        })
                        .catch(error => {
                             this.calendar.fullCalendar('removeEvents', event._id);
                             window.toast(
                                'Oops!',
                                'The teacher is not available or the subject is already added.',
                                'error',
                            );
                     });
                }
            },
            deleteEvent(event) {
                let data = {
                    id: event.scheduleId ? event.scheduleId : _.get(this.eventScheduleIds, event._id),
                };
                axios.delete(`/api/schedule/${data.id}`)
                        .then(() => {
                            this.calendar.fullCalendar('removeEvents', event._id)
                            window.toast(
                                'Success!',
                                'Schedule has been deleted.',
                                'success',
                            );
                            let schedule = this.schedules.find(item => {
                                return item.id == event.scheduleId
                            });
                            if (schedule) {
                                this.schedules.splice(this.schedules.indexOf(schedule), 1);
                            }
                        });
            },
            isValidRoomLevel(event) {
                let room = this.resources.find(item => {
                    return item.id == event.resourceId;
                });
                return room.grade_level == event.level
            },
            isValidDropForRoom(event) {
                let room_schedules = this.schedules.filter(item => {
                    return item.room_id == event.resourceId && item.id != event.scheduleId;
                });
                let valid = true;
                _.forEach(room_schedules, schedule => {
                    let start = moment(moment().format('YYYY-MM-DD ') + schedule.start_time);
                    let end = moment(moment().format('YYYY-MM-DD ') + schedule.end_time);
                    if (
                        event.start.local().isAfter(start) && event.start.local().isBefore(end) || event.end.local().isAfter(start) && event.end.local().isBefore(end) || event.start.local().isSame(start) || event.end.local().isSame(end)
                        || start.local().isAfter(event.start.local()) && start.local().isBefore(event.end.local()) || end.local().isAfter(event.start.local()) && end.local().isBefore(event.end.local()) || start.local().isSame(event.start.local()) || end.local().isSame(event.end.local())
                    ) {
                        valid = false;
                        return false;
                    }
                });
                return valid;
            },
            isValidDrop(event) {
                let subject = this.subjects.find(item => {
                    return item.id === parseInt(event.subjectId)
                });
                let events = this.calendar.fullCalendar('clientEvents')
                    .filter(item => {
                        let sub = this.subjects.find(sub => {
                            return item.subjectId === parseInt(sub.id)
                        });
                        if (!sub) {
                            return false;
                        }
                        return item._id !== event._id && sub.teacher_id === subject.teacher_id;
                    });
                let valid = true;
                _.forEach(events, item => {
                    if (
                        event.start.local().isAfter(item.start) && event.start.local().isBefore(item.end) || event.end.local().isAfter(item.start) && event.end.local().isBefore(item.end) || event.start.local().isSame(item.start) || event.end.local().isSame(item.end)
                        || item.start.local().isAfter(event.start.local()) && item.start.local().isBefore(event.end.local()) || item.end.local().isAfter(event.start.local()) && item.end.local().isBefore(event.end.local()) || item.start.local().isSame(event.start.local()) || item.end.local().isSame(event.end.local())
                    ) {
                        valid = false;
                        return false;
                    }
                });
                console.log({
                    valid
                });
                return valid;
            },
            getTeachers() {
                return axios.get(`/api/teacher`)
                    .then(({data}) => {
                        this.teachers = data;
                    })
            },
            getSchedules() {
                return axios.get(`/api/schedule`)
                    .then(response => {
                        this.schedules = response.data;
                    })
            }
        },
        created() {
            //this.loadLevel();
            // Fire.$on('afterCreate', () => {
            //     // this.loadLevel();
            //     // this.loadRoom();
            // });
            // setInterval(() => this.loadUser(),3000);
        }

    }
</script>
