<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card card-default">
                    <div class="card-header"><h4>{{student.last_name}}, {{student.first_name}}</h4>
                        <div class="card-tools">
                            <button class="btn btn-block btn-outline-primary btn-lg" @click="backStudent"><i class="fas fa-plus-circle fa-fw"></i> Back</button>
                            <button class="btn btn-block btn-outline-primary btn-lg" @click="printGrade"><i class="fas fa-plus-circle fa-fw"></i> Print</button>
                        </div>
                    </div>
    
                    <div class="card-body">
                        <div class="card-body table-responsive p-0">
                            <table class="table table-hover">
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
                                    <td>{{user.first}}</td>
                                    <td>{{user.second}}</td>
                                    <td>{{user.third}}</td>
                                    <td>{{user.fourth}}</td>
                                    <td>
                                        <button href="" @click="updateGrade(user)" class="btn btn-default">
                                        <i class="fas fa-edit green"></i>
                                        </button>
                                    </td>
                                </tr>
                            </tbody></table>
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
                    class="form-control" :class="{ 'is-invalid': form.errors.has('first') }">
                  <has-error :form="form" field="first"></has-error>
                </div>
                <div class="form-group">
                <label>Second Grading:</label>
                  <input v-model="form.second" type="number" name="second" id="second"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('second') }">
                  <has-error :form="form" field="second"></has-error>
                </div>
                <div class="form-group">
                <label>Third Grading:</label>
                  <input v-model="form.third" type="number" name="third" id="third"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('third') }">
                  <has-error :form="form" field="third"></has-error>
                </div>
                <div class="form-group">
                <label>Fourth Grading:</label>
                  <input v-model="form.fourth" type="number" name="fourth" id="fourth"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('fourth') }">
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
                axios.put('/api/rank-student/' + this.$route.params.id).then(({data})=>(this.average = data.data));
                this.$router.push("/grade");
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
            },

            printGrade(){
                window.open('/api/gradePrint/'+this.$route.params.id);
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