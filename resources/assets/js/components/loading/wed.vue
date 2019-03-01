<template>
    <div class="container">
        <br>
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card card-info">
                    <div class="card-header"><h3 class="pink">Wednesday Class Loading</h3>
                        <div class="card-tool pull-right">
                        <select name="search" v-model="search" id="search">
                      <option value="">Select Marital Status</option>
                      <option value="married">married</option>
                      <option value="single">single</option>
                        </select>
                    </div>
                    </div>
                    
                    <div class="card-body">
                        <div class="row">
                        <div class="col-12">
                            <div class="card card-info">
                                <div class="card-header">Set Schedule</div>
                                <div class="card-body">
                                    Schedule here
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
