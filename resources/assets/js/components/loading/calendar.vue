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
                    <div v-for="subject in resources" :key="subject.id" class='fc-event' :subject-id="subject.id"
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
            }
        },


        mounted() {
            //axios.get("api/teacher").then(({result})=>(this.resultRooms = result.data));
            //axios.get("api/teacher").then(result => { console.log(result); return result; },
            //axios.get("api/room-column").then(({json})=>(this.resources = json.data));
            Fire.$emit('afterCreate');
            var subjects = this.resources;
            console.log(subjects);
            $('#calendar').fullCalendar({
                now: '2018-04-07',
                editable: true, // enable draggable events
                droppable: true, // this allows things to be dropped onto the calendar
                aspectRatio: 1,
                scrollTime: '7:00', // undo default 6am scrollTime
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
                resources: subjects,

                //console.log(level),
                drop: function (date, jsEvent, ui, resourceId,) {
                    //console.log('drop', date.format(), resourceId);
                    // is the "remove after drop" checkbox checked?
                    if ($('#drop-remove').is(':checked')) {
                        // if so, remove the element from the "Draggable Events" list
                        $(this).remove();
                    }
                },
                eventReceive: function (event, revertFunc,) { // called when a proper external event is dropped
                    alert(event.title + " was dropped on " + event.start.format());
                    //$('#calendar').fullCalendar('removeEvents',event._id);

                    // if (!confirm("Are you sure about this change?")) {
                    console.log();
                    // }
                    axios.get("api/teacher").then(({data}) => (this.teacher = data.data));
                    console.log('eventReceive', event.subjectId, event);
                    Fire.$emit('afterCreate');
                },
                eventDrop: function (event, revertFunc,) { // called when an event (already on the calendar) is moved
                    //revertFunc();
                    axios.get("api/teacher").then(({data}) => (this.teacher = data.data));
                    console.log('eventReceive', event);
                    console.log('eventDrop', event);

                },
                eventClick: function (event, element) {

                    event.title = "CLICKED!";

                    $('#calendar').fullCalendar('updateEvent', event);

                }
            });
        },

        methods: {
            /**
             * When drag from sidebar list to calendar
             * You can call ajax here to your endpoint
             */
            onEventReceive(event, ui) {
                console.log(event.subjectId, event)
            },
            loadLevel() {
                axios.get("api/level").then(({data}) => (this.level = data.data));
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
                axios.get("api/room").then(response => {
                    this.resources = response.data.data
                    Vue.nextTick(() => {
                        this.initDraggables()
                    })
                });
            },
            loadSubject() {
                axios.get("api/subject").then(({data}) => (this.subjects = data.data));
            },

            /**
             * When drag from calendar to calendar
             * You can call ajax here to your endpoint
             */
            onEventDrop(event, ui, delta, revertFunc) {
                Fire.emit('afterCreate')
                console.log(event.subjectId, event),
                    revertFunc();
            },
        },
        created() {
            this.loadLevel();
            this.loadRoom();
            this.loadSubject();
            //this.roomColumn();
            Fire.$on('afterCreate', () => {
                this.loadLevel();
                this.loadRoom();
            });
            // setInterval(() => this.loadUser(),3000);
        }

    }
</script>
