<template>
        <div id="app" style="width: 100%;">
        <!--<pre>{{ $data | json }}</pre>-->
        <div>
            <div class="layoutJSON">
                Displayed as <code>[x, y, w, h]</code>:
                <div class="columns">
                    <div class="layoutItem" v-for="item in layout" :key="item.id">
                        <b>{{item.i}}</b>: [{{item.x}}, {{item.y}}, {{item.w}}, {{item.h}}]
                    </div>
                </div>
            </div>
        </div>
        <div id="content">
            <!--<button @click="decreaseWidth">Decrease Width</button>
            <button @click="increaseWidth">Increase Width</button>
            <button @click="addItem">Add an item</button>-->
            <input type="checkbox" v-model="draggable"/> Draggable
            <input type="checkbox" v-model="resizable"/> Resizable
            <br/>
            <grid-layout :layout="layout"
                         :col-num="12"
                         :row-height="30"
                         :is-draggable="draggable"
                         :is-resizable="false"
                         :vertical-compact="true"
                         :use-css-transforms="true"

            >
                 <grid-item v-for="item in layout"
                           :key="item.id"
                           :x="item.x"
                           :y="item.y"
                           :w="item.w"
                           :h="item.h"
                           :i="item.i"
                           style="background-color: #f6993f; height: 20px; outline-color: black"
                        >
                    <span class="text">{{item.i}}</span>
                </grid-item>

            </grid-layout>
        </div>

    </div>
</template>

<script>
    export default {
        data() {
            return{
                layout : [{x:1,y:0,w:6,h:1,i:0,id:1,name:'yowyowyow',level:'Grade 1'},
                          {x:0,y:0,w:6,h:1,i:0,id:2,name:'yowyowasdasdyow',level:'Grade 1'}],
                layout2 : [{x:1,y:0,w:6,h:1,i:0,id:3,name:'yowyowyow',level:'Grade 1'},
                          {x:0,y:0,w:6,h:1,i:0,id:4,name:'yowyowasdasdyow',level:'Grade 1'}],
                draggable : true,
                resizable : true,
                index : 0
                }
            },
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
