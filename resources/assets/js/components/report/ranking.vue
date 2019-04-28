<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card card-info">
                    <div class="card-header"><h3 class="card-title"><b class="pink">Student</b> Ranking</h3></div>
                    <div class="card-body table-responsive p-0">
                    <form @submit.prevent="viewRank()">
                        <div class="row">
                            <div class="col-5">
                                <label>Select Grade Level:</label>
                                  <select name="level_id" v-model="form.level_id" id="level_id" class="form-control" :class="{ 'is-invalid': form.errors.has('level_id') }">
                                      <option v-for="level in level" v-bind:value="level.id" :hidden="level.id == '0'" >{{level.title}}</option>
                                  </select>
                                  <has-error :form="form" field="level_id"></has-error>
                            </div>
                            <div class="col-5">
                                <label>Select Grading Quarter</label>
                                  <select name="grading_id" v-model="form.grading_id" id="grading_id" class="form-control" :class="{ 'is-invalid': form.errors.has('grading_id') }">
                                      <option value="1">First</option>
                                      <option value="2">Second</option>
                                      <option value="3">Third</option>
                                      <option value="4">Fourth</option>
                                      <option value="5">Overall</option>
                                  </select>
                                  <has-error :form="form" field="grading_id"></has-error>
                            </div>
                            <div class="col-2">
                                <button type="submit" class="btn btn-warning" style="margin-top: 25px">Rank Students</button>
                            </div>
                        </div>
                    </form>
                    <table class="table table-hover">
                      <tbody>
                        <tr>
                            <th>Name</th>
                            <th>Rank</th>
                            <th>Average</th>
                        </tr>
                        <tr v-for="(student, index) in students" :key="index">
                            <td>{{ student.last_name }}, {{ student.first_name }}</td>
                            <td>{{ index+1 }}</td>
                            <td>{{ student.average }}%</td>
                        </tr>
                    </tbody>
                        <div class="col-md-12">
                            <button v-show="hideBtn" type="" @click="print()" class="btn btn-block btn-secondary btn-lg" style="margin-top: 25px;margin-left: 165px">Print</button>
                        </div>
                    </table>
                  </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="studentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Top 10 Students</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                 <table class="table table-hover">
                          <tbody>
                            <tr>
                                <th>First Name</th>
                                <th>last Name</th>
                                <th>Rank</th>
                            </tr>
                            <tr v-for="(user, index) in students" :key="user.id">
                                    <td>{{user.first_name}}</td>
                                    <td>{{user.last_name}}</td>
                                    <td>{{index + 1}}</td>
                            </tr>
                            </tbody>
                        </table>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-submit" data-dismiss="modal" @click="printTop()">Print</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return{
                room_id:'',
                level: {},
                editMode : false,
                users : {},
                students : {},
                hideBtn:false,
                form: new Form({
                    level_id:'',
                    grading_id:'',
                })
            }
        },
        methods : {
            viewRank(){
                this.form.post('api/rankList')
                    .then(({data})=>{
                        this.students = data.data;
                    })
                    .catch(()=>{});
                this.hideBtn = true;
            },
            print(){

                if(this.form.grading_id == 1){
                    window.open('/api/rankPrintFirst/'+this.form.level_id);
                }
                if(this.form.grading_id == 2){
                    window.open('/api/rankPrintSecond/'+this.form.level_id);
                }
                if(this.form.grading_id == 3){
                    window.open('/api/rankPrintThird/'+this.form.level_id)
                }
                if(this.form.grading_id == 4){
                    window.open('/api/rankPrintFourth/'+this.form.level_id);
                }
                if(this.form.grading_id == 5){
                    window.open('/api/rankPrint/'+this.form.level_id);
                }
                //window.open('/api/testPrint/');
            },
            loadLevel(){
                axios.get("api/level").then(({data})=>(this.level = data.data));
            },
            // rankList(id){
            //     axios.get("/api/studentRank/" + id).then(({data})=>(this.students = data.data));
            //     this.room_id = id;
            //     $('#studentModal').modal('show');
            // },
            rankList(id){
                window.open('/api/rankPrint/'+id);
            },
            firstList(id){
                window.open('/api/rankPrintFirst/'+id);
            },
            secondList(id){
                window.open('/api/rankPrintSecond/'+id);
            },
            thirdList(id){
                window.open('/api/rankPrintThird/'+id);
            },
            fourthList(id){
                window.open('/api/rankPrintFourth/'+id);
            },
        },
        created() {
            this.loadLevel();
            console.log('Component mounted.')
        }
    }
</script>
