<template>
    <div class="container">
        <br>
        <div class="row">
          <div class="col-12">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title"><b class="pink">Student Payments </b></h3>

                <div class="card-tools">
                  <div class="input-group input-group-sm">
                    <input class="form-control" v-model="search" @keyup="searchit" type="search" placeholder="Search Last Name" aria-label="Search">
                  </div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0" v-show="!searchFilter">
                <table class="table table-hover table-dark">
                  <tbody style="height: 500px; overflow: scroll; display: block; swidth:100%;">
                    <tr>
                        <th>Full Name</th>
                        <th>Actions</th>
                    </tr>
                    <tr v-for="student in accounts" :key="student.id">
                        <td>{{student.last_name | upText}}, {{student.first_name | upText}}</td>
                        <td>
                            <button href="" @click="viewTransactions(student.student_id)" class="btn btn-default">
                            <i class="fas fa-user-cog green">View Transactions</i>
                            </button>
                            <button href="" @click="createTransactions(student)" class="btn btn-default">
                            <i class="fas fa-user-times red">Make Transaction</i>
                            </button>
                        </td>
                    </tr>
                </tbody></table>
              </div>
              <div class="card-body table-responsive p-0" v-show="searchFilter">
                <table class="table table-hover table-dark">
                  <tbody style="height: 500px; overflow: scroll; display: block; swidth:100%;">
                    <tr>
                        <th>Full Name</th>
                        <th>Actions</th>
                    </tr>
                    <tr v-for="student in accounts" :key="student.id" :hidden="student.last_name != stud_name">
                        <td>{{student.last_name | upText}}, {{student.first_name | upText}}</td>
                        <td>
                            <button href="" @click="viewTransactions(student.student_id)" class="btn btn-default">
                            <i class="fas fa-user-cog green">View Transactions</i>
                            </button>
                            <button href="" @click="createTransactions(student)" class="btn btn-default">
                            <i class="fas fa-user-times red">Make Transaction</i>
                            </button>
                        </td>
                    </tr>
                </tbody></table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
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
                <button type="button" class="btn btn-submit" data-dismiss="modal" @click="printList()">Print List</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
        <div class="modal fade" id="makeTrans" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
              <form @submit.prevent="processPayment()">
                <div id="printable">
                <div class="form-group">
                  <label>Select Payment Type:</label>
                  <select name="type" v-model="form.type" id="teacher_id" class="form-control" :class="{ 'is-invalid': form.errors.has('type') }">
                      <option value="1">Tuition</option>
                      <option value="2">miscellaneous</option>
                      <option value="3">Books</option>
                      <option value="4">Uniform</option>
                      <option value="5">Others</option>
                  </select>
                  <has-error :form="form" field="type"></has-error>
                </div>
                <div class="form-group">
                  <input v-model="form.amount" placeholder="AMOUNT" type="number" name="amount" id="amount"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('amount') }">
                  <has-error :form="form" field="amount"></has-error>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success">Process Payment</button>
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
                trans_id : '',
                searchFilter: false,
                editMode : false,
                accounts : {},
                transactions : {},
                accountView: [],
                studentName: '',
                transID:'',
                search:'',
                stud_name:'',
                form: new Form({
                  account_id:'',
                  Amount: '',
                  type:'',
                })
            }
        },
        methods: {
          searchit(){
              if(this.search == "" || this.search == null || this.search == "search"){
                this.searchFilter = false;
              }else{
                this.searchFilter = true;
                this.stud_name = this.search.toLowerCase();
              }
            },
            printList(){
              window.open('/api/transactionsPrint/'+this.trans_id);
            },
            viewTransactions(id){
              axios.get("/api/transactions/"+ id).then(({data})=>(this.transactions = data.data));
              this.trans_id = id;
              $('#transReports').modal('show');
            },
            newModal(){
                this.editMode = false;
                this.form.reset();
                $('#userModal').modal('show');
            },
            loadStudent(){
                axios.get("api/accounts").then(({data})=>(this.accounts = data.data));
            },
            processPayment(){
              this.form.put('/api/transactions/'+this.form.account_id)
                .then(({data})=>{
                  this.transID = data.data
                  Fire.$emit('afterCreate');
                            swal(
                              'Success!',
                              'Transaction Complete.',
                              'success'
                            )
                  this.$Progress.finish();
                  window.open('/api/payment/'+this.transID);
                  $('#makeTrans').modal('hide');
                })
                .catch(() => {
                  this.$Progress.fail();
                })
            },
            createTransactions(account){
              this.$router.push("/payments/"+account.student_id);
            },
            createUser(){
                this.$Progress.start();
                this.form.post('api/user')
                .then(({data})=>{
                    this.transID = data.data;
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
            deleteUser(id){
                swal({
                  title: 'Are you sure?',
                  text: "You won't be able to revert this!",
                  type: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.value) {
                    this.form.delete('/api/user/'+id).then(()=>{
                        Fire.$emit('afterCreate');
                            swal(
                              'Deleted!',
                              'Your file has been deleted.',
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
            Fire.$on('afterCreate',()=>{
                this.loadStudent();
            });
            // setInterval(() => this.loadUser(),3000);
        }
    }
</script>
