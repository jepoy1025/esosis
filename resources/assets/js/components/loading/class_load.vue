<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card card-default">
                    <div class="card-header">Example Component</div>

                    <div class="card-body">
                                <div class="drag">
                                <h2>Subjects</h2>
                                <draggable class="dragArea" :list="list1" :options="{group:'people'}" @change="log">
                                    <div class="container" v-for="(element, index) in list1"  >
                                        {{element.name}} {{index}}
                                    </div>
                                 </draggable>

                                <h2>Schedule</h2>
                                <draggable class="dragArea" :list="list2" :options="{group:'people'}" @change="log">
                                    <div class="container" v-for="(element, index) in list2" :key="index">{{element.name}}</div>
                                </draggable>
                             </div>

                            <div class="normal">
                                <h2>List 1 v-for</h2>
                                <div>
                                    <div v-for="element in list1" >{{element.name}}</div>
                                 </div>

                                <h2>List 2 v-for</h2>
                                <div>
                                    <div v-for="element in list2" >{{element.name}}</div>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import draggable from 'vuedraggable'

    export default {
        components: {
            draggable
        },
          data() {
    return {
      sortOptions: {
        group: 'sample',
        animation: 150,
      },
      list1:[{name:"John", id:1}, 
                {name:"Joao", id:2}, 
                {name:"Jean", id:3},
                {name:"Gerard", id:4} ],
        list2:[{name:"Juan", id:5}, 
                {name:"Edgard", id:6}, 
                {name:"Johnson", id:7} ]
    };
},
methods : {
                add(){
                this.list.push({name:'Juan'});
            },
            replace(){
                this.list=[{name:'Edgard'}]
            },
            clone(el){
                return {
                    name : el.name + ' cloned'
                }
            },
            log(evt){
                console.log(evt)
            }
        },
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
