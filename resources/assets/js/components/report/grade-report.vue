<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card card-info">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-6">
                            <h3 class="card-title"><b>Grade Report</b></h3>
                            </div>
                            <div class="col-2">
                               Integrated Report Per School Year 
                            </div>
                            <div class="col-3">
                                <select name="sy_id" v-model="sy_id" id="sy_id" class="form-control" :class="{ 'is-invalid': form.errors.has('schoolAttendedDate') }">
                                <option v-for="syList in syList" v-bind:value="syList.id" >{{syList.school_year}}</option>
                                </select>
                            </div>
                            <div class="col-1">
                                <button href="#" @click.prevent="print()" class="btn btn-default">
                                        <i class="fas fa-print orange">Print</i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover">
                            <tbody>
                            <tr>
                                <th>Grade Level</th>
                                <th></th>
                            </tr>
                            <tr v-for="level in levels" :key="level.id" :hidden="level.id == 0">
                                <td>{{level.title}}</td>
                                <td>
                                    <button href="#" @click.prevent="view(level)" class="btn btn-default">
                                        <i class="fas fa-print orange">Print</i>
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                levels: [],
                syList:{},
                sy_id:'',
                form: new Form({
                    id: '',
                    name : '',
                    educational_attainment : '',
                    civil_service : '',
                    marital_status: '',
                    status: ''
                })
            }
        },
        methods: {
            loadLevel() {
                axios.get("api/level").then(({data}) => (this.levels = data.data));
            },
            view(level) {
                window.open('/api/gradeReport/' + level.id);
            },
            schoolYear(){
                axios.get("api/syList").then(({data})=>(this.syList = data.data));
            },
            print(){
                window.open('/api/gradeReports/' + this.sy_id);
            }
        },
        created() {
            this.loadLevel();
            this.schoolYear();
            console.log('Component mounted.')
        }
    }
</script>
