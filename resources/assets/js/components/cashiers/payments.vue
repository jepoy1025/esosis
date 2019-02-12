<template>
       <div class="container">
        <br>
        <div class="row">
          <div class="col-8">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">Account Balance</h3>

                <div class="card-tools">
                    
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0"><br>
                <h2>&nbsp {{accountView.last_name | upText}}, {{accountView.first_name | upText}}</h2><h4 class="pull-right">&nbsp {{accountView.title}}</h4>
                <div class="col-12">
                <div class="card card-info">
                  <div class="card-header">
                    <h3 class="card-title">Remaining</h3>

                    <div class="card-tools">
                    </div>
                  </div>
                  <!-- /.card-header -->
                  <div class="card-body table-responsive p-0"><br>
                    <div class="col-xs-6">

                      <div class="table-responsive">
                        <table class="table">
                          <tbody><tr>
                            <th>Registration Fee:</th>
                            <td>P {{ formatPrice(balance.enrollment_fee) }}</td>
                          </tr>
                          <tr>
                            <th>Tuition Fee:</th>
                            <td>P {{ formatPrice(balance.whole_year) }}</td>
                          </tr>
                          <tr>
                            <th>Miscellaneous Fee:</th>
                            <td>P {{ formatPrice(balance.misc) }}</td>
                          </tr>
                          <tr>
                            <th>Books Fee:</th>
                            <td>P {{ formatPrice(balance.books) }}</td>
                          </tr>
                          <tr>
                            <th>Uniform Fee:</th>
                            <td>P {{ formatPrice(balance.uniform) }}</td>
                          </tr>
                          <tr>
                            <th>PTA:</th>
                            <td>P {{ formatPrice(balance.pta) }}</td>
                          </tr>
                          <tr>
                            <th>Last Year Balance:</th>
                            <td>P {{ formatPrice(balance.past_balance) }}</td>
                          </tr>
                          <tr>
                            <th><h3>Total:</h3></th>
                            <td><b>P {{ formatPrice(balance.past_balance+balance.enrollment_fee+balance.whole_year+balance.misc+balance.books+balance.uniform+balance.pta) }}</b></td>
                          </tr>
                        </tbody></table>
                      </div>
                    </div>
                  </div>
                  <!-- /.card-body -->
                </div>
                <!-- /.card -->
              </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <div class="col-4">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title"></h3>

                <div class="card-tools">
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0"><br>
                <div class="form-group">
                    <label>Add Payment Option</label>
                  <select name="addPayment" v-model="addPayment" @change="onChange()" id="addPayment" class="form-control" :class="{ 'is-invalid': form.errors.has('addPayment') }">
                      <option value="0">Enrollment</option>
                      <option value="1">Tuition</option>
                      <option value="2">Miscellaneous</option>
                      <option value="3">Books</option>
                      <option value="4">Uniform</option>
                      <option value="5">PTA</option>
                      <option value="6">Last Year Balance</option>
                  </select>
                  <has-error :form="form" field="user_type"></has-error>
                </div>
                <form @submit.prevent="processPayment()">

                <div v-show="form.checkEnrollment">
                    <label>&nbsp Registration</label>
                    <button type="button" class="btn btn-default" @click="onDelete(0)"><i class="fa fa-times red"></i></button>
                      <div class="input-group input-group-sm">
                        <input v-model="form.enrollment" placeholder="AMOUNT" @keyup="getTotal()" type="number" name="enrollment" id="enrollment"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('enrollment') }">
                              <has-error :form="form" field="enrollment"></has-error>
                      </div>
                  </div>

                <div v-show="form.checkTuition">
                    <label>&nbsp Tuition</label>
                    <button type="button" class="btn btn-default" @click="onDelete(1)"><i class="fa fa-times red"></i></button>
                      <div class="input-group input-group-sm">
                        <input v-model="form.tuition" placeholder="AMOUNT" @keyup="getTotal()" type="number" name="tuition" id="tuition"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('tuition') }">
                              <has-error :form="form" field="tuition"></has-error>
                      </div>
                  </div>

                <div v-show="form.checkMisc">
                    <label>&nbsp Miscellaneous</label>
                    <button type="button" class="btn btn-default" @click="onDelete(2)"><i class="fa fa-times red"></i></button>
                      <div class="input-group input-group-sm">
                        <input v-model="form.misc" placeholder="AMOUNT" @keyup="getTotal()" type="number" name="misc" id="misc"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('misc') }">
                              <has-error :form="form" field="misc"></has-error>
                      </div>
                  </div>

                <div v-show="form.checkBooks">
                    <label>&nbsp Books</label>
                    <button type="button" class="btn btn-default" @click="onDelete(3)"><i class="fa fa-times red"></i></button>
                      <div class="input-group input-group-sm">
                        <input v-model="form.books" placeholder="AMOUNT" @keyup="getTotal()" type="number" name="books" id="books"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('books') }">
                              <has-error :form="form" field="books"></has-error>
                      </div>
                  </div>
                
                <div v-show="form.checkUniform">
                    <label>&nbsp Uniform</label>
                    <button type="button" class="btn btn-default" @click="onDelete(4)"><i class="fa fa-times red"></i></button>
                      <div class="input-group input-group-sm">
                        <input v-model="form.uniform" placeholder="AMOUNT" @keyup="getTotal()" type="number" name="uniform" id="uniform"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('uniform') }">
                              <has-error :form="form" field="uniform"></has-error>
                      </div>
                  </div>
                  

                  <div v-show="form.checkPastBalance">
                    <label>&nbsp Last Year Balance</label>
                    <button type="button" class="btn btn-default" @click="onDelete(6)"><i class="fa fa-times red"></i></button>
                      <div class="input-group input-group-sm">
                        <input v-model="form.pastBalance" placeholder="AMOUNT" @keyup="getTotal()" type="number" name="pastBalance" id="pastBalance"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('pastBalance') }">
                              <has-error :form="form" field="pastBalance"></has-error>
                      </div>
                  </div>

                  <div v-show="form.checkPta">
                    <label>&nbsp PTA</label>
                    <button type="button" class="btn btn-default" @click="onDelete(5)"><i class="fa fa-times red"></i></button>
                      <div class="input-group input-group-sm">
                        <input v-model="form.pta" placeholder="AMOUNT" @keyup="getTotal()" type="number" name="pta" id="pta"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('pta') }">
                              <has-error :form="form" field="pta"></has-error>
                      </div>
                  </div>
                <div class="form-group">
                    <br><br><br>
                    <label>TOTAL:</label>
                          <input v-model="form.total" placeholder="AMOUNT" type="number" name="total" id="total"
                            class="form-control" :class="{ 'is-invalid': form.errors.has('total') }" readonly>
                          <has-error :form="form" field="total"></has-error>
                </div>
                <button type="submit" class="btn btn-success pull-left" :disabled="send == false">Process Payment</button>
                </form>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return{
                trans_id : '',
                editMode : false,
                accounts : {},
                transactions : {},
                accountView: [],
                balance: [],
                studentName: '',
                returnData:'',
                addPayment:'',
                send:false,
                form: new Form({
                  account_id:'',
                  amount: 0,
                  type:'',
                  enrollment:0,
                  checkEnrollment:false,
                  tuition:0,
                  checkTuition:false,
                  misc:0,
                  checkMisc:false,
                  books:0,
                  checkBooks:false,
                  uniform:0,
                  checkUniform:false,
                  pta:0,
                  checkPta:false,
                  pastBalance:0,
                  checkPastBalance:false,
                  total:0,
                })
            }
        },
        methods: {
            processPayment(){
              this.form.put('/api/transactions/'+this.$route.params.id)
                .then(({data})=>{
                  this.returnData = data.data
                  Fire.$emit('afterCreate');
                            swal(
                              'Success!',
                              'Transaction Complete.',
                              'success'
                            )
                  this.$Progress.finish();
                  window.open('/api/payment/'+this.returnData);
                  $('#makeTrans').modal('hide');
                })
                .catch(() => {
                  this.$Progress.fail();
                })
            },
            getTotal(){
                var enrollment = parseInt(this.form.enrollment);
                var tuition = parseInt(this.form.tuition);
                var misc = parseInt(this.form.misc);
                var books = parseInt(this.form.books);
                var uniform = parseInt(this.form.uniform);
                var pta = parseInt(this.form.pta);
                var pastBalance = parseInt(this.form.pastBalance);
                var total = enrollment + tuition + misc + books + uniform + pta + pastBalance;
                this.form.total = parseInt(total);
                if(this.form.total == 0){
                    this.send = false;
                }else{
                    this.send = true;
                }
            },
            onChange(){
                if(this.addPayment == 0){
                    this.form.checkEnrollment = true;
                    this.addPayment = '';
                }
                if(this.addPayment == 1){
                    this.form.checkTuition = true;
                    this.addPayment = '';
                }
                if(this.addPayment == 2){
                    this.form.checkMisc = true;
                    this.addPayment = '';
                }
                if(this.addPayment == 3){
                    this.form.checkBooks = true;
                    this.addPayment = '';
                }
                if(this.addPayment == 4){
                    this.form.checkUniform = true;
                    this.addPayment = '';
                }
                if(this.addPayment == 5){
                    this.form.checkPta = true;
                    this.addPayment = '';
                }
                if(this.addPayment == 6){
                    this.form.checkPastBalance = true;
                    this.addPayment = '';
                }
                //console.log(this.addPayment);
            },
            onDelete(value){
                if(value == 1){
                    this.form.checkTuition = false;
                    this.form.tuition = 0;
                }
                if(value == 0){
                    this.form.checkEnrollment = false;
                    this.form.enrollment = 0;
                }
                if(value == 2){
                    this.form.checkMisc = false;
                    this.form.misc = 0;
                }
                if(value == 3){
                    this.form.checkBooks = false;
                    this.form.books = 0;
                }
                if(value == 4){
                    this.form.checkUniform = false;
                    this.form.uniform = 0;
                }
                if(value == 5){
                    this.form.checkPta = false;
                    this.form.pta = 0;
                }
                if(value == 6){
                    this.form.checkPastBalance = false;
                    this.form.pastBalance = 0;
                }

                var enrollment = parseInt(this.form.enrollment);
                var tuition = parseInt(this.form.tuition);
                var misc = parseInt(this.form.misc);
                var books = parseInt(this.form.books);
                var uniform = parseInt(this.form.uniform);
                var pta = parseInt(this.form.pta);
                var pastBalance = parseInt(this.form.pastBalance);
                var total = enrollment + tuition + misc + books + uniform + pta + pastBalance;
                this.form.total = parseInt(total);
                if(this.form.total == 0){
                    this.send = false;
                }else{
                    this.send = true;
                }
                //console.log(this.addPayment);
            },
            formatPrice(value) {
                let val = (value/1).toFixed(2).replace('.', '.')
                return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
            },
            studentProfile(){
                axios.get("/api/studentProfile/"+ this.$route.params.id).then(({data})=>(this.accountView = data.data));
            },
            studentAccount(){
                axios.get("/api/studentAccount/"+ this.$route.params.id).then(({data})=>(this.balance = data.data));
            }
        },
        created() {
            this.studentProfile();
            this.studentAccount();
            Fire.$on('afterCreate',()=>{
                this.studentProfile();
                this.studentAccount();
            });
            // setInterval(() => this.loadUser(),3000);
        }
    }
</script>
