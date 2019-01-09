<template>
    <div class="container">
            <div id='external-events'>
              <h4>Draggable Events</h4>
              <div class='fc-event'>My Event 1</div>
              <div class='fc-event'>My Event 2</div>
              <div class='fc-event'>My Event 3</div>
              <div class='fc-event'>My Event 4</div>
              <div class='fc-event'>My Event 5</div>
              <p>
                <input type='checkbox' id='drop-remove' />
                <label for='drop-remove'>remove after drop</label>
              </p>
            </div>
        <full-calendar :event-sources="eventSources"></full-calendar>
    </div>
</template>

<script>
   export default {
        props: {
            events: {
                default() {
                    return []
                },
            },
            eventSources: {
                default() {
                    return []
                },
            },
            editable: {
                default() {
                    return true
                },
            },
            selectable: {
                default() {
                    return true
                },
            },
            selectHelper: {
                default() {
                    return true
                },
            },
            header: {
                default() {
                    return {
                        left:   '',
                        center: '',
                        right:  ''
                    }
                },
            },
            defaultView: {
                default() {
                    return 'agendaDay'
                },
            },
            sync: {
                default() {
                    return false
                }
            },
            config: {
                type: Object,
                default() {
                    return {}
                },
            },
        },
        computed: {
            defaultConfig() {
                const self = this
                return {
                    header: this.header,
                    defaultView: this.defaultView,
                    editable: this.editable,
                    droppable: this.droppable,
                    selectable: this.selectable,
                    selectHelper: this.selectHelper,
                    aspectRatio: 2,
                    scrollTime: '07:30',
                    timeFormat: 'HH:mm',
                    events: this.events,
                    eventSources: this.eventSources,
                    eventRender(...args) {
                        if (this.sync) {
                            self.events = cal.fullCalendar('clientEvents')
                        }
                        self.$emit('event-render', ...args)
                    },
                    
                    viewRender(...args) {
                        if (this.sync) {
                            self.events = cal.fullCalendar('clientEvents')
                        }
                        self.$emit('view-render', ...args)
                    },
                    eventDestroy(event) {
                        if (this.sync) {
                            self.events = cal.fullCalendar('clientEvents')
                        }
                    },
                    eventClick(...args) {
                        self.$emit('event-selected', ...args)
                    },
                    eventMouseover(...args) {
                        self.$emit('event-mouseover', ...args)
                    },
                    eventMouseout(...args) {
                        self.$emit('event-mouseout', ...args)
                    },
                    eventDrop(...args) {
                        self.$emit('event-drop', ...args)
                    },
                    eventReceive(...args) {
                        self.$emit('event-receive', ...args)
                    },
                    eventResize(...args) {
                        self.$emit('event-resize', ...args)
                    },
                    dayClick(...args){
                        self.$emit('day-click', ...args)
                    },
                    select(start, end, jsEvent, view, resource) {
                        self.$emit('event-created', {
                            start,
                            end,
                            allDay: !start.hasTime() && !end.hasTime(),
                            view,
                            resource
                        })
                    }
                }
            },
        },
        mounted() {
            const cal = $(this.$el),
                self = this
            this.$on('remove-event', (event) => {
                if(event && event.hasOwnProperty('id')){
                    $(this.$el).fullCalendar('removeEvents', event.id);
                }else{
                    $(this.$el).fullCalendar('removeEvents', event);
                }
            })
            this.$on('rerender-events', () => {
                $(this.$el).fullCalendar('rerenderEvents')
            })
            this.$on('refetch-events', () => {
                $(this.$el).fullCalendar('refetchEvents')
            })
            this.$on('render-event', (event) => {
                $(this.$el).fullCalendar('renderEvent', event)
            })
            this.$on('reload-events', () => {
                $(this.$el).fullCalendar('removeEvents')
                $(this.$el).fullCalendar('addEventSource', this.events)
            })
            this.$on('rebuild-sources', () => {
                $(this.$el).fullCalendar('removeEventSources')
                this.eventSources.map(event => {
                    $(this.$el).fullCalendar('addEventSource', event)
                })
            })
            cal.fullCalendar(defaultsDeep(this.config, this.defaultConfig))
        },
        methods: {
            fireMethod(...options) {
                return $(this.$el).fullCalendar(...options)
            },
        },
        watch: {
            events: {
                deep: true,
                handler(val) {
                    $(this.$el).fullCalendar('removeEvents')
                    $(this.$el).fullCalendar('addEventSource', this.events)
                },
            },
            eventSources: {
                deep: true,
                handler(val) {
                    this.$emit('rebuild-sources')
                },
            },
        },
        beforeDestroy() {
            this.$off('remove-event')
            this.$off('rerender-events')
            this.$off('refetch-events')
            this.$off('render-event')
            this.$off('reload-events')
            this.$off('rebuild-sources')
        },
    }
</script>