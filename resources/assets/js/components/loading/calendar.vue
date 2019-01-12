<template>
    <div class="container">
        <div class="col-lg-12">
            <div id='wrap' style="width: 100%;margin: 0;">

                <div id='external-events' style="    float: left;
                    width: 20%;
                    padding: 0;
                    border: 1px solid #ccc;
                    background: #eee;
                    text-align: left;">
                    <h4 style="font-size: 16px;margin-top: 0;padding-top: 1em;">Draggable Events</h4>
                    <div v-for="subject in subjects" :key="subject.id" class='fc-event' :subject-id="subject.id"
                         style="margin: 10px 0;cursor: pointer;">{{ subject.title }}
                    </div>
                    <p>
                        <input type='checkbox' id='drop-remove'/>
                        <label for='drop-remove'>remove after drop</label>
                    </p>
                </div>

                <div id='calendar' style="float: right;width: 80%;"></div>

                <div style='clear:both'></div>

            </div>
            <button></button>
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
                level: {},
                teacher: {},
                subjects: [],
                resources: [{id: 10, name: 'yow'}],
                calendar: null,
                eventScheduleIds: {},
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
            Promise.all([this.loadLevel(), this.loadRoom(), this.loadSubject()])
                .then(repsonses => {
                    this.initCalendar()
                })
        },

        methods: {
            loadLevel() {
                return axios.get("api/level").then(({data}) => (this.level = data.data));
            },

            initCalendar() {
                let self = this;
                this.calendar = $('#calendar').fullCalendar({
                    // now: '2018-04-07',
                    editable: true, // enable draggable events
                    droppable: true, // this allows things to be dropped onto the calendar
                    aspectRatio: 1,
                    scrollTime: '7:00', // undo default 6am scrollTime
                    defaultTimedEventDuration: '01:00:00',
                    forceEventDuration: true,
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
                        event.title = "CLICKED!";
                        $('#calendar').fullCalendar('updateEvent', event);
                    },
                    eventDrop: function (event, revertFn,) { // called when an event (already on the calendar) is moved
                        //revertFunc();
                        console.log('eventDrop', event);
                        self.saveEvent(event);
                    },
                    eventReceive: function (event,) { // called when a proper external event is dropped
                        console.log('eventReceive', {
                            event
                        });
                        self.saveEvent(event);
                    },
                    eventResize(event, delta, revertFn) {
                        console.log({
                            event, delta, revertFn,
                        });
                        self.saveEvent(event);
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
                        subjectId: $(this).attr('subject-id')
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
            saveEvent(event) {
                let data = {
                    id: _.get(this.eventScheduleIds, event._id),
                    subject_id: event.subjectId,
                    room_id: event.resourceId,
                    start_time: event.start.local().format('HH:mm:ss'),
                    end_time: event.end.local().format('HH:mm:ss'),
                };
                if (data.id) {
                    axios.put(`/api/schedule/${data.id}`, data)
                        .then(({data}) => {
                            this.eventScheduleIds[event._id] = data.id
                        });
                } else {
                    axios.post(`/api/schedule`, data)
                        .then(({data}) => {
                            this.eventScheduleIds[event._id] = data.id
                        });
                }
            },
        },
        created() {
            //this.roomColumn();
            Fire.$on('afterCreate', () => {
                // this.loadLevel();
                // this.loadRoom();
            });
            // setInterval(() => this.loadUser(),3000);
        }

    }
</script>
