<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card card-default">
                    <div class="card-header">
                        <h3 class="card-title"><b class="pink">Students</b> List</h3>
                        <div class="card-tools">
                            <form @submit.prevent="addStudent()">
                                <div class="input-group">
                                  <input v-model="form.studentCode" type="text" placeholder="Student Code" name="studentCode" id="studentCode"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('studentCode') }">
                                  <has-error :form="form" field="studentCode"></has-error>
                                  <span class="input-group-append">
                                    <button type="submit" class="btn btn-info btn-flat">Add Student</button>
                                  </span>
                                </div>                               
                            </form>
                        </div>
                    </div>
                    <div class="card-body">
                       <table class="table table-hover">
                          <tbody>
                            <tr>
                                <th>Name</th>
                                <th>Grade Level</th>
                                <th>Action</th>
                            </tr>
                            <tr v-for="user in students" :key="user.id">
                                <td>{{user.last_name}}, {{user.first_name}}</td>
                                <td>{{user.title}}</td>
                                <td>
                                    <button href="" @click="comment(user.id)" class="btn btn-default">
                                    <i class="fas fa-user-cog green">Comment</i>
                                    </button>
                                    <button href="" @click="grades(user.id)" class="btn btn-default">
                                    <i class="fas fa-user-times red">Grades</i>
                                    </button>
                                    <button href="" @click="balance(user.id)" class="btn btn-default">
                                    <i class="fas fa-user-times blue">Balance</i>
                                    </button>
                                    <button href="" @click="transFunc(user.id)" class="btn btn-default">
                                    <i class="fas fa-user-times blue">Payment Transactions</i>
                                    </button>
                                </td>
                            </tr>
                        </tbody></table>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="commentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Comment Table</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                 <table class="table table-hover">
                          <tbody>
                            <tr>
                                <th>Grading</th>
                                <th>Grade Level</th>
                            </tr>
                            <tr>
                                <td>1st</td>
                                <td>{{first}}</td>
                            </tr>
                            <tr>
                                <td>2nd</td>
                                <td>{{second}}</td>
                            </tr>
                            <tr>
                                <td>3rd</td>
                                <td>{{third}}</td>
                            </tr>
                            <tr>
                                <td>4th</td>
                                <td>{{fourth}}</td>
                            </tr>
                            </tbody>
                        </table>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
        <div class="modal fade" id="gradeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Grading Table</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                 <table class="table table-hover">
                          <tbody>
                            <tr>
                                <th>Subject</th>
                                <th>1st</th>
                                <th>2nd</th>
                                <th>3rd</th>
                                <th>4th</th>
                            </tr>
                            <tr v-for="user in subjects" :key="user.id">
                                    <td>{{user.title}}</td>
                                    <td>{{user.first}}</td>
                                    <td>{{user.second}}</td>
                                    <td>{{user.third}}</td>
                                    <td>{{user.fourth}}</td>
                            </tr>
                            </tbody>
                        </table>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
        <div class="modal fade" id="balanceModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Grading Table</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                 <table class="table table-hover">
                  <tbody>
                    <tr>
                        <th></th>
                        <th>Amount</th>
                    </tr>
                    <tr>
                        <td>Whole Year(tuition)</td>
                        <td>{{accountView.whole_year}}</td>
                    </tr>
                    <tr>
                        <td>miscellaneous</td>
                        <td>{{accountView.misc}}</td>
                    </tr>
                    <tr>
                        <td>Uniform</td>
                        <td>{{accountView.uniform}}</td>
                    </tr>
                    <tr>
                        <td>Books</td>
                        <td>{{accountView.books}}</td>
                    </tr>
                    <tr>
                        <td>Past Balance</td>
                        <td>{{accountView.past_balance}}</td>
                    </tr>
                </tbody></table>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
        <div class="modal fade" id="transReports" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Transactions</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <table class="table table-hover">
                  <tbody>
                    <tr>
                        <th>Transaction ID</th>
                        <th>Type of Transaction</th>
                        <th>Ammount</th>
                    </tr>
                    <tr v-for="student in transactions" :key="student.id">
                        <td>{{student.id}}</td>
                        <td>{{student.type}}</td>
                        <td>{{student.amount}}</td>
                    </tr>
                </tbody></table>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
    </div>
</template>

<script>
    export default {
        data(){
           
            return {  
                users:{},
                accountView: [],
                students:[],
                payments:{},
                subjects:{},
                transactions:{},
                first:'',
                second:'',
                third:'',
                fourth:'',
                user:{id:''},
                // userData: [], 
                 form: new Form({
                    id:'',
                    first_name : '',
                    middle_name : '',
                    last_name : '',
                    username : '',
                    role_id : '',
                    email: '',
                    password: '',
                    photo: '',
                    studentCode:''
                })
            }
            
        },
        methods: {
            addStudent(){
                this.form.post('api/sisAddStudent')
                .then(()=>{

                    Fire.$emit('afterCreate');
                    $('#syModal').modal('hide');
                    toast({
                      type: 'success',
                      title: 'School Year Succesfully added'
                    });
                    this.$Progress.finish();

                })
                .catch(()=>{
                  this.$Progress.fail();
                })
            },
            studentList(){
                    axios.get('/api/sisStudentList').then(({data})=>(this.students = data.data));
            },
            userID(){
                this.user_id = this.form.id;
            },
            getUser(){
                axios.get("api/profile").then(({ data }) => (this.form.fill(data)));
                axios.get("api/profile").then(({ data }) => (this.user.id = data.id));
            },
            comment(id){
                axios.get('/api/comment-list/' + id).then(({data})=>(this.first = data.data.first,this.second = data.data.second,this.third = data.data.third,this.fourth = data.data.fourth));
                $('#commentModal').modal('show');
            },
            grades(id){
                axios.get('/api/grade-list/' + id).then(({data})=>(this.subjects = data.data));
                $('#gradeModal').modal('show');
            },
            balance(id){
                axios.get('/api/account/' + id).then(({data})=>(this.accountView = data.data));
                $('#balanceModal').modal('show');
            },
            transFunc(id){
                axios.get("/api/transactions/"+ id).then(({data})=>(this.transactions = data.data));
                $('#transReports').modal('show');
            }
        },
        created() {
            this.getUser();
            console.log(this.user.id);
            this.userID();
            this.studentList();
            Fire.$on('afterCreate',()=>{
                this.studentList();
            });
        }
    }
</script>
