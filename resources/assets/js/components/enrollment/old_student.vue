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
                <table class="table table-hover">
                  <tbody>
                    <tr>
                        <th>Last Name</th>
                        <th>First Name</th>
                        <th>Past Grade Level</th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr v-for="student in students" :key="student.id">
                        <td class="red">{{student.last_name | upText}}</td>
                        <td class="red">{{student.first_name | upText}}</td>
                        <td class="indigo">{{student.title}} <span class="right badge badge-danger pull-right" :hidden="student.status == '2'">Dropped Student</span></td>
                        <th></th>
                        <td class="pull-left">
                            <button href="" @click="enrollModal(student)" class="btn btn-default">
                            <i class="fas fa-user-plus green">Enroll</i>
                            </button>
                            <button href="" @click="studentBalance(student)" class="btn btn-default">
                            <i class="fas fa-list-alt orange">Check Balance</i>
                            </button>
                            <button href="" @click="archiveStudent(student.id)" class="btn btn-default">
                            <i class="fas fa-user-times red">Move To Archive</i>
                            </button>
                        </td>
                    </tr>
                </tbody></table>
              </div>
              <div class="card-body table-responsive p-0" v-show="searchFilter">
                <table class="table table-hover">
                  <tbody>
                    <tr>
                        <th>Last Name</th>
                        <th>First Name</th>
                        <th>Past Grade Level</th>
                        <th></th>
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
                            <button href="" @click="archiveStudent(student.id)" class="btn btn-default">
                            <i class="fas fa-user-times red">Move To Archive</i>
                            </button>
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
                <h4 class="modal-title pink"><b>{{form.last_name}}, {{form.first_name}} {{form.middle_name}}</b> <p> {{form.grade_title}}</p></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form @submit.prevent="enrollStudent()">
              <div class="modal-body" id>
                <div class="form-group">
                    <label>Whole Year Fee:</label>
                  <input v-model="form.whole_year" placeholder="Whole Year Fee" type="number" name="whole_year" id="whole_year"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('whole_year') }" readonly>
                  <has-error :form="form" field="whole_year"></has-error>
                </div>
                <div class="form-group">
                    <label>miscellaneous:</label>
                  <input v-model="form.misc" placeholder="Whole Year Fee" type="number" name="misc" id="misc"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('misc') }" readonly>
                  <has-error :form="form" field="misc"></has-error>
                </div>
                <div class="form-group">
                    <label>Books Fee</label>
                  <input v-model="form.books" placeholder="Books Fee" type="number" name="books" id="books"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('books') }" readonly>
                  <has-error :form="form" field="books"></has-error>
                </div>
                <div class="form-group">
                    <label>Uniform Fee</label>
                  <input type="checkbox" id="checkbox" v-model="form.uniformCheck">
                  <input v-model="form.uniform" placeholder="Uniform Fee" type="number" name="uniform" id="uniform"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('uniform') }" readonly>
                  <has-error :form="form" field="uniform"></has-error>
                </div>
                <div class="form-group">
                    <label>Minimum Downpayment For This Transaction</label>
                  <input v-model="form.min_downpayment" placeholder="Minimum Downpayment" type="number" name="min_downpayment" id="min_downpayment"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('min_downpayment') }" readonly>
                  <has-error :form="form" field="min_downpayment"></has-error>
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
            enrollModal(student){
              console.log(student.status);
              this.status = student.status;
              if(student.status == 2){
              $('#paymentModal').modal('show');
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
                $('#paymentModal').modal('show');
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
              //axios.get("/api/fee"+ student.grade_level_id).then(({data})=>(this.payment = data.data));
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
                if(this.status == 2){
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
