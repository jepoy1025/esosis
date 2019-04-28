<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <br>
                <div class="card card-default bg-dark">
                    <div class="card-header"><h4>{{student.last_name}}, {{student.first_name}}</h4>
                        <div class="card-tools">
                            
                        </div>
                    </div>
    
                    <div class="card-body">
                        <div class="card-body table-responsive p-0">
                            <table class="table table-hover table-dark">
                              <tbody>
                                <tr>
                                    <th>Subject Name</th>
                                    <th>First</th>
                                    <th>Second</th>
                                    <th>Third</th>
                                    <th>Forth</th>
                                    <th>Action</th>
                                </tr>
                                <tr v-for="user in subjects" :key="user.id">
                                    <td>{{user.title}}</td>
                                    <td>
                                        <p v-if="user.first > '74'">
                                            {{user.first}}
                                        </p>
                                        <p class="red" v-if="user.first < '75'">
                                            {{user.first}}
                                        </p>
                                    </td>
                                    <td>
                                        <p v-if="user.second > '74'">
                                            {{user.second}}
                                        </p>
                                        <p class="red" v-if="user.second < '75'">
                                            {{user.second}}
                                        </p>
                                    </td>
                                    <td>
                                        <p v-if="user.third > '74'">
                                            {{user.third}}
                                        </p>
                                        <p class="red" v-if="user.third < '75'">
                                            {{user.third}}
                                        </p>
                                    </td>
                                    <td>
                                        <p v-if="user.fourth > '74'">
                                            {{user.fourth}}
                                        </p>
                                        <p class="red" v-if="user.fourth < '75'">
                                            {{user.fourth}}
                                        </p>
                                    </td>
                                    <td>
                                        <button href="" @click="updateGrade(user)" class="btn btn-default">
                                        <i class="fas fa-edit green"></i>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-danger" @click="backStudent"><i class="fas fa-undo-alt fa-fw"></i> Back</button>
                            <button type="submit" class="btn btn-success" @click="printGrade"><i class="fas fa-print fa-fw"></i> Print</button>
                            <button type="submit" class="btn btn-success" @click="prevModal"><i class="fas fa-print fa-fw"></i> View Previous Grades</button>
                          </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="modal fade" id="gradeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">{{form.title}}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form @submit.prevent="saveGrade()">
              <div class="modal-body">
                <div class="form-group">
                <label>First Grading:</label>
                  <input v-model="form.first" type="number" name="first" id="first"
                    class="form-control" v-on:keyup="checkGrade(form.first)" :class="{ 'is-invalid': form.errors.has('first') }">
                  <has-error :form="form" field="first"></has-error>
                </div>
                <div class="form-group">
                <label>Second Grading:</label>
                  <input v-model="form.second" type="number" name="second" id="second"
                    class="form-control" v-on:keyup="checkGrade(form.second)" :class="{ 'is-invalid': form.errors.has('second') }">
                  <has-error :form="form" field="second"></has-error>
                </div>
                <div class="form-group">
                <label>Third Grading:</label>
                  <input v-model="form.third" type="number" name="third" id="third"
                    class="form-control" v-on:keyup="checkGrade(form.third)" :class="{ 'is-invalid': form.errors.has('third') }">
                  <has-error :form="form" field="third"></has-error>
                </div>
                <div class="form-group">
                <label>Fourth Grading:</label>
                  <input v-model="form.fourth" type="number" name="fourth" id="fourth"
                    class="form-control" v-on:keyup="checkGrade(form.fourth)" :class="{ 'is-invalid': form.errors.has('fourth') }">
                  <has-error :form="form" field="fourth"></has-error>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success">Update Grade</button>
              </div>
            </form>
            </div>
          </div>
        </div>
        <div class="modal fade" id="prevGrades" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"><b>Previous Grades</b></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <label>Select School Year</label>
                    <select name="sy" v-model="sy" id="sy" class="form-control"  @change="prevGrades()">
                      <option v-for="level in levels" v-bind:value="level.id" :hidden="level.sy_id == student.sy_id" >{{level.title}} S.Y.: {{level.school_year}}</option>
                    </select>

                <div class="card-body table-responsive p-0">
                <table class="table table-hover">
                  <tbody><tr>
                    <th>Subject</th>
                    <th>1st</th>
                    <th>2nd</th>
                    <th>3rd</th>
                    <th>4th</th>
                  </tr>
                  <tr v-for="grade in grades">
                    <td>{{grade.title}}</td>
                    <td>{{grade.first}}</td>
                    <td>{{grade.second}}</td>
                    <td>{{grade.third}}</td>
                    <td>{{grade.fourth}}</td>
                  </tr></tbody></table>
              </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button @click="printPrev" class="btn btn-success">Print</button>
                <button @click="printGradeAll" class="btn btn-success">Print All Grades</button>
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
                student_id:'',
                subjects:{},
                student:[],
                average:'',
                levels:{},
                sy:'',
                grades:{},
                form: new Form({
                    id: '',
                    title:'',
                    first: '',
                    second: '',
                    third: '',
                    fourth: '',
                })
            }

        },
        methods: {
            checkGrade(check){
                if(check > 100 || check < 0){
                    toast({
                          type: 'error',
                          title: 'Must Be Greater than 0 and Less than 101'
                        });
                    if(this.form.first == check){
                    this.form.first = '';
                    }
                    if(this.form.second == check){
                        this.form.second = '';
                    }
                    if(this.form.third == check){
                        this.form.third = '';
                    }
                    if(this.form.fourth == check){
                        this.form.fourth = '';
                    }
                }
            },
            prevGrades(){
                console.log(this.sy);
                axios.get('/api/prev_grades/' + this.sy).then(({data})=>(this.grades = data.data));
            },
            printPrev(){
                window.open('/api/prevGradePrint/'+this.sy);
            },
            prevModal(){
                axios.get('/api/studentLevel/' + this.$route.params.id).then(({data})=>(this.levels = data.data));
                $('#prevGrades').modal('show');
            },
            getID(){
                this.student_id = this.$route.params.id;
                console.log(this.student_id);
            },
            updateGrade(grade){
                this.form.reset();
                $('#gradeModal').modal('show');
                this.form.fill(grade);
            },
            getList(){
                axios.get('/api/grade-list/' + this.$route.params.id).then(({data})=>(this.subjects = data.data));
            },
            getStudent(){
                axios.get('/api/student/' + this.$route.params.id).then(({data})=>(this.student = data.data));
            },
            backStudent(){
                this.$router.push("/grade");
            },
            rankStudent(){
                axios.put('/api/rank-student/' + this.$route.params.id).then(({data})=>(this.average = data.data));
            },
            saveGrade() {
                this.$Progress.start();
                this.form.put('/api/grade/'+this.form.id)
                .then(()=>{
                  Fire.$emit('afterCreate');
                  this.$Progress.finish();
                  $('#gradeModal').modal('hide');
                })
                .catch(() => {
                  this.$Progress.fail();
                })
                this.rankStudent();
            },

            printGrade(){
                window.open('/api/gradePrint/'+this.$route.params.id);
            },
            printGradeAll(){
                window.open('/api/gradePrintAll/'+this.$route.params.id);
            }

        },
        created() {
            //this.getID(),
            this.getList(),
            this.getStudent()
            Fire.$on('afterCreate',()=>{
                this.getList();
            });
        },
        mounted() {
            this.getList()
        }

    }
</script>