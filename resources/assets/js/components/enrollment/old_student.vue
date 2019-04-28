<template>
    <div class="container">
        <br>
        <div class="row">
          <div class="col-12">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title"><b class="pink">Enrollment </b>(Old Students)</h3>

                <div class="card-tools">
                  <div class="input-group input-group-sm">
                    <input class="form-control" v-model="search" @keyup="searchit" type="search" placeholder="Search Last Name" aria-label="Search">
                  </div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0" v-show="!searchFilter">
                <table class="table table-hover table-dark">
                  <tbody style="height: 800px; overflow: scroll; display: block; swidth:100%;">
                    <tr>
                        <th>Last Name</th>
                        <th>First Name</th>
                        <th>Past Grade Level</th>
                        <th></th>
                        <th>status</th>
                    </tr>
                    <tr v-for="student in students" :key="student.id">
                        <td class="red">{{student.last_name | upText}}</td>
                        <td class="red">{{student.first_name | upText}}</td>
                        <td class="indigo">{{student.title}}</td>
                        <td class="pull-left">
                            <button href="" @click="enrollModal(student)" class="btn btn-default">
                            <i class="fas fa-user-plus green">Enroll</i>
                            </button>
                            <button href="" @click="studentBalance(student)" class="btn btn-default">
                            <i class="fas fa-list-alt orange">Check Balance</i>
                            </button>
                        </td>
                        <td>
                          <span class="right badge badge-danger pull-right" v-show="student.status == 4">Dropped</span>
                          <span class="right badge badge-info pull-right" v-show="student.status == 2">Unenrolled</span>
                          <span class="right badge badge-info pull-right" v-show="student.status == 1">Unenrolled</span>
                          <span class="right badge badge-warning pull-right" v-show="student.status == 3">Transferred</span>
                        </td>
                    </tr>
                </tbody></table>
              </div>
              <div class="card-body table-responsive p-0" v-show="searchFilter">
                <table class="table table-hover table-dark">
                  <tbody style="height: 800px; overflow: scroll; display: block; swidth:100%;">
                    <tr>
                        <th>Last Name</th>
                        <th>First Name</th>
                        <th>Past Grade Level</th>
                        <th></th>
                        <th>status</th>
                    </tr>
                    <tr v-for="student in students" :key="student.id" :hidden="student.last_name != stud_name">
                        <td class="red">{{student.last_name | upText}}</td>
                        <td class="red">{{student.first_name | upText}}</td>
                        <td>{{student.title}} <span class="right badge badge-danger pull-right" :hidden="student.status == '2'">Dropped Student</span></td>
                        <td>
                            <button href="" @click="enrollModal(student)" class="btn btn-default">
                            <i class="fas fa-user-plus green">Enroll</i>
                            </button>
                            <button href="" @click="studentBalance(student)" class="btn btn-default">
                            <i class="fas fa-list-alt orange">Check Balance</i>
                            </button>
                            <td>
                              <span class="right badge badge-danger pull-right" v-show="student.status == 4">Dropped</span>
                              <span class="right badge badge-info pull-right" v-show="student.status == 2">Unenrolled</span>
                              <span class="right badge badge-info pull-right" v-show="student.status == 1">Unenrolled</span>
                              <span class="right badge badge-warning pull-right" v-show="student.status == 3">Transferred</span>
                            </td>
                        </td>
                    </tr>
                </tbody></table>
              </div>
              <!-- /.card-body -->
             <!--  <div class="card-footer">
                <pagination :data="students" @pagination-change-page="getResults"></pagination>
              </div> -->
            </div>
            <!-- /.card -->
          </div>
        </div>
        <div class="modal fade" id="balanceModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"><b>{{student.last_name}}, {{student.first_name}}</b> remaining balance</h5>
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
                        <td>Enrollment Fee</td>
                        <td>P {{accountView.enrollment_fee}}.00</td>
                    </tr>
                    <tr>
                        <td>Whole Year(tuition)</td>
                        <td>P {{accountView.whole_year}}.00</td>
                    </tr>
                    <tr>
                        <td>miscellaneous</td>
                        <td>P {{accountView.misc}}.00</td>
                    </tr>
                    <tr>
                        <td>Uniform</td>
                        <td>P {{accountView.uniform}}.00</td>
                    </tr>
                    <tr>
                        <td>Books</td>
                        <td>P {{accountView.books}}.00</td>
                    </tr>
                    <tr>
                        <td>Past Balance</td>
                        <td>P {{accountView.past_balance}}.00</td>
                    </tr>
                    <tr>
                        <td><b>TOTAL:</b></td>
                        <td><b>P {{accountView.past_balance + accountView.books + accountView.uniform + accountView.misc + accountView.whole_year + accountView.enrollment_fee}}.00</b></td>
                    </tr>
                </tbody></table>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
        <div class="modal fade" id="paymentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header" style="background-color: #A9A9A9;">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form @submit.prevent="enrollStudent()">
              <div class="modal-body" id>
                <h4><b>{{form.last_name}}, {{form.first_name}} {{form.middle_name}}</b> <p> {{form.grade_title}}</p></h4>
                <div class="row">
                <div class="col-6 pull-left">
                  <p>Whole Year Fee:</p><br>
                  <p>Miscellaneous:</p><br>
                  <p>Books:</p><br>
                  <p>Uniform:</p><br>
                  <p>Minimum Downpayment:</p><br>
                </div>
                <div class="col-6 pull-right">
                  <p><b>P {{formatPrice(form.whole_year)}}</b></p><br>
                  <p><b>P {{formatPrice(form.misc)}}</b></p><br>
                  <p><b>P {{formatPrice(form.books)}}</b></p><br>
                  <p><b>P {{formatPrice(form.uniform)}}</b></p><br>
                  <p><b>P {{formatPrice(form.min_downpayment)}}</b></p><br>
                </div>
                </div>
                <div class="form-group">
                    <label>Amount</label>
                  <input v-model="form.paidAmount" placeholder="Amount" type="number" name="paidAmount" id="paidAmount"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('paidAmount') }">
                  <has-error :form="form" field="paidAmount"></has-error>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Enroll Student</button>
              </div>
            </form>
            </div>
          </div>
        </div>
        <div class="modal fade" id="resultModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header" style="background-color: #A9A9A9;">
                Result:
              </div>
              <div v-show="studentGrades" class="modal-body" id>
                Some grades is unsettled.
              </div>
              <div v-show="!studentGrades" class="modal-body" id>
                All Subject Pass you can proceed to enroll the student.
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button v-show="studentGrades" @click="manageGrade()" class="btn btn-success">Manage Grades</button>
                <button v-show="!studentGrades" @click="proceed()" class="btn btn-primary">Proceed</button>
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
                editMode : false,
                students : {},
                student_id:'',
                name: '',
                search:'',
                stud_name:'',
                testPayment:'',
                level:{},
                fees:[],
                status:'',
                accountView: [],
                payment:[],
                student: [],
                studentGrades: '',
                gradesId:'',
                studentInfo:[],
                searchFilter: false,
                form: new Form({
                    id: '',
                    first_name : '',
                    middle_name : '',
                    last_name : '',
                    username: '',
                    email: '',
                    grade_title:'',
                    user_type: '',
                    photo: '',
                    whole_year : '',
                    misc :'',
                    books : '',
                    uniform : '',
                    min_downpayment : '',
                    uniformCheck: false,
                    paidAmount:'',
                })
            }
        },
        methods: {
          formatPrice(value) {
              let val = (value/1).toFixed(2).replace(',', '.')
              return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
          },
            manageGrade(){
              $('#resultModal').modal('hide');
              this.$router.push("/grade/"+this.gradesId);
            },
            enrollModal(student){
              
              console.log(student.status);
              this.status = student.status;
              if(student.status == 2){
                this.fees = this.level[student.grade_level_id];
                this.student_id = student.id;
                this.form.whole_year = this.fees.whole_year;
                this.form.misc = this.fees.misc;
                this.form.books = this.fees.books;
                this.form.uniform = this.fees.uniform;
                this.form.min_downpayment = this.fees.min_downpayment;
                this.form.first_name = student.first_name;
                this.form.last_name = student.last_name;
                this.form.middle_name = student.middle_name;
                this.form.grade_title = student.title;
              }else{
                this.fees = this.level[student.grade_level_id-1];
                this.student_id = student.id;
                this.form.whole_year = this.fees.whole_year;
                this.form.misc = this.fees.misc;
                this.form.books = this.fees.books;
                this.form.uniform = this.fees.uniform;
                this.form.min_downpayment = this.fees.min_downpayment;
                this.form.first_name = student.first_name;
                this.form.last_name = student.last_name;
                this.form.middle_name = student.middle_name;
                this.form.grade_title = student.title;
              }
              axios.get("/api/fee"+ student.grade_level_id).then(({data})=>(this.payment = data.data));

              this.studentInfo = student;
              if(student.status == 1 || student.status == 2){
                this.$Progress.start();
                swal.fire(
                  'Please Wait',
                  'The system is checking the student grades.'
                )
                this.gradesId = student.id;
                axios.get("/api/studentGrades/"+ student.id).then(({data})=>(this.studentGrades = data.data));
                this.$Progress.finish();
                $('#resultModal').modal('show');
              }else if (student.status == 3) {
                this.$router.push("/transfer-enroll/"+student.id);
              }else{
                $('#paymentModal').modal('show');
              }
            },
            proceed(){
              $('#resultModal').modal('hide');
              $('#paymentModal').modal('show');
            },
            enrollStudent(){

              if(this.form.paidAmount > this.form.min_downpayment){
                swal(
                              'Failed To Create Transaction!',
                              'Check the Amount',
                              'error'
                      );
              }else{
                this.$Progress.start();
                if(this.status == 2 || this.status == 1){
                this.form.put('/api/oldStudent/'+this.student_id)
                    .then(()=>{
                      Fire.$emit('afterCreate');
                                swal(
                                  'Success!',
                                  'Student Enrolled',
                                  'success'
                                )
                      this.$Progress.finish();
                      window.open('/api/reEnrollPrint/'+this.student_id);
                      $('#paymentModal').modal('hide');
                    })
                    .catch(() => {
                      swal(
                                  'Failed To Create Transaction!',
                                  'Check the Amount',
                                  'error'
                          )
                      this.$Progress.fail();
                    })
                }else{
                  this.$Progress.start();
                this.form.put('/api/dropEnroll/'+this.student_id)
                .then(()=>{
                  Fire.$emit('afterCreate');
                            swal(
                              'Success!',
                              'Student Enrolled',
                              'success'
                            )
                  this.$Progress.finish();
                  window.open('/api/reEnrollPrint/'+this.student_id);
                  $('#paymentModal').modal('hide');
                })
                .catch(() => {
                  swal(
                              'Failed To Create Transaction!',
                              'Check the Amount',
                              'error'
                      )
                  this.$Progress.fail();
                })
                }
              }
            },
            updateUser(){
                this.$Progress.start();
                this.form.put('/api/user/'+this.form.id)
                .then(()=>{
                  Fire.$emit('afterCreate');
                            swal(
                              'Success!',
                              'User Updated.',
                              'success'
                            )
                  this.$Progress.finish();
                  $('#userModal').modal('hide');
                })
                .catch(() => {
                  this.$Progress.fail();
                })
            },
            editModal(user){
                this.editMode = true;
                this.form.reset();
                $('#userModal').modal('show');
                this.form.fill(user);
            },
            newModal(){
                this.editMode = false;
                this.form.reset();
                $('#userModal').modal('show');
            },
            loadStudent(){
                axios.get("api/fee").then(({data})=>(this.level = data.data));
                axios.get("api/student-waiting").then(({data})=>(this.students = data.data));
            },
            studentBalance(student){
              axios.get("/api/balance/"+ student.id).then(({data})=>(this.accountView = data.data));
              this.student = student;
              $('#balanceModal').modal('show');
            },
            createUser(){
                this.$Progress.start();  
                this.form.post('api/user')
                .then(()=>{

                    Fire.$emit('afterCreate');
                    $('#userModal').modal('hide');
                    toast({
                      type: 'success',
                      title: 'User Created Succesfully'
                    });
                    this.$Progress.finish();

                })
                .catch(()=>{
                  this.$Progress.fail();
                })
            },
            searchit(){
              if(this.search == "" || this.search == null || this.search == "search"){
                this.searchFilter = false;
              }else{
                this.searchFilter = true;
                this.stud_name = this.search.toLowerCase();
              }
            },
            archiveStudent(id){
                swal({
                  title: 'Are you sure?',
                  text: "Student Data Will be Archived!",
                  type: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes, Move to Student Archives!'
                }).then((result) => {
                    if (result.value) {
                    this.form.put('/api/archiveStudent/'+id).then(()=>{
                        Fire.$emit('afterCreate');
                            swal(
                              'Archived!',
                              'Student Data has been moved to Student Archives.',
                              'success'
                            )
                    }).catch(()=>{
                        swal("failes","There was something wrong.","warning");
                    })
                    }
                })
            },

        },
        created() {
            this.loadStudent();
            Fire.$on('searching', ()=>{
              let query = this.search;
              axios.get('api/findStudent?q' + query)
              .then((data)=>{
                this.students = data.data;
              })
              .catch(()=>{

              })
            });
            Fire.$on('afterCreate',()=>{
                this.loadStudent();
            });
            //setInterval(() => this.loadUser(),3000);
        }
      }
</script>
