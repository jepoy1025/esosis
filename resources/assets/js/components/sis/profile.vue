<template>
    <div class="container-fluid">
        <br><br>
        <div class="row">
          <div class="col-md-3">
            <div class="card card-info">
              <div class="card-header">
              </div>
              <div class="card-body box-profile">

                <h3 class="profile-username text-center">{{student.last_name | upText}}, {{student.first_name | upText}}</h3>

                <p class="text-muted text-center">{{student.title}}</p>

                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>Advicer</b> <a class="float-right">{{lecture.name}}</a>
                  </li>
                  <li class="list-group-item">
                    <b>Section</b> <a class="float-right">{{lecture.section}}</a>
                  </li>
                </ul>
              </div>
              <!-- /.card-body -->
            </div>
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title pink">About</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <strong><i class="fas fa-birthday-cake mr-1"></i> Birth Date</strong>

                <p class="text-muted">
                  {{student.birth_date}}
                </p>

                <hr>

                <strong><i class="fa fa-map-marker mr-1"></i> Address</strong>

                <p class="text-muted">{{student.address}}</p>
              </div>
              <!-- /.card-body -->
            </div>
          </div>
          <div class="col-md-9">
            <div class="card card-info">
              <div class="card-header p-2">
                <ul class="nav nav-pills">
                  <li class="nav-item"><a class="nav-link" href="#performance" data-toggle="tab">School Performance</a></li>
                  <li class="nav-item"><a class="nav-link" href="#payments" data-toggle="tab">School Payments</a></li>
                  <li class="nav-item"><a class="nav-link" href="#transactions" data-toggle="tab">Payment Transactions</a></li>
                  <li class="nav-item"><a class="nav-link" href="#requirements" data-toggle="tab">School Requirements</a></li>
                </ul>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">
                  <div class="tab-pane active show" id="performance">
                    <!-- Post -->
                    <div class="card card-info">
                    <div class="card-header">
                      <h3 class="card-title pink">Grades</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
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
                    <!-- /.card-body -->
                  </div>
                  <div class="card card-info">
                    <div class="card-header">
                      <h3 class="card-title pink">Narrative Report</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                          <table class="table table-hover">
                          <tbody>
                            <tr>
                                <th>Grading</th>
                                <th>Comment</th>
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
                    <!-- /.card-body -->
                  </div>
                    <!-- /.post -->
                  </div>
                  <!-- /.tab-pane -->
                  <div class="tab-pane" id="payments">
                    <!-- The timeline -->
                    <div class="card card-info">
                    <div class="card-header">
                      <h3 class="card-title pink">Remaining Balance</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
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
                    <!-- /.card-body -->
                  </div>
                  </div>
                  <div class="tab-pane" id="transactions">
                    <div class="card card-info">
                    <div class="card-header">
                      <h3 class="card-title pink">Payment Transactions</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                      <table class="table table-hover">
                      <tbody>
                        <tr>
                            <th>Date & Time</th>
                            <th>Type of Transaction</th>
                            <th>Total</th>
                        </tr>
                        <tr v-for="student in transactions" :key="student.id">
                            <td>{{student.created_at}}</td>
                            <td>{{student.type}}</td>
                            <td>{{student.amount}}</td>
                        </tr>
                    </tbody></table>
                    </div>
                    <!-- /.card-body -->
                  </div>
                  </div>
                  <!-- /.tab-pane -->

                  <div class="tab-pane" id="requirements">
                    <h3 class="red">Please settle the lacking requirements. Thank you!</h3>
                    <div class="row">
                    <div class="col-lg-4 col-6" :hidden="form_137 == '1'">
                      <!-- small box -->
                      <div class="small-box bg-danger">
                        <div class="inner">
                          <h3><i class="fas fa-times"></i></h3>

                          <p><b>Form 137</b></p>
                        </div>
                        <div class="icon">
                          <i class="fas fa-table"></i>
                        </div>
                      </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-4 col-6" :hidden="nso == '1'">
                      <!-- small box -->
                      <div class="small-box bg-danger">
                        <div class="inner">
                          <h3><i class="fas fa-times"></i></h3>

                          <p><b>NSO</b></p>
                        </div>
                        <div class="icon">
                          <i class="fas fa-file-alt"></i>
                        </div>
                      </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-4 col-6" :hidden="picture2x2 == '1'">
                      <!-- small box -->
                      <div class="small-box bg-danger">
                        <div class="inner">
                          <h3><i class="fas fa-times"></i></h3>

                          <p><b>Picture (2x2)</b></p>
                        </div>
                        <div class="icon">
                          <i class="fas fa-id-card-alt"></i>
                        </div>
                      </div>
                    </div>


                    <div class="col-lg-4 col-6" :hidden="form_137 == '0'">
                      <!-- small box -->
                      <div class="small-box bg-success">
                        <div class="inner">
                          <h3><i class="fas fa-check"></i></h3>

                          <p><b>Form 137</b></p>
                        </div>
                        <div class="icon">
                          <i class="fas fa-table"></i>
                        </div>
                      </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-4 col-6" :hidden="nso == '0'">
                      <!-- small box -->
                      <div class="small-box bg-success">
                        <div class="inner">
                          <h3><i class="fas fa-check"></i></h3>

                          <p><b>NSO</b></p>
                        </div>
                        <div class="icon">
                          <i class="fas fa-file-alt"></i>
                        </div>
                      </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-4 col-6" :hidden="picture2x2 == '0'">
                      <!-- small box -->
                      <div class="small-box bg-success">
                        <div class="inner">
                          <h3><i class="fas fa-check"></i></h3>

                          <p><b>Picture (2x2)</b></p>
                        </div>
                        <div class="icon">
                          <i class="fas fa-id-card-alt"></i>
                        </div>
                      </div>
                    </div>
                    <!-- ./col -->
                  </div>
                  </div>
                  <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
              </div><!-- /.card-body -->
            </div>
            <!-- /.nav-tabs-custom -->
          </div>
        </div>
    </div>
</template>

<script>
    export default {
        data(){
           
            return {  
            student: {},
            lecture: {},
            subjects: {},
            transactions: {},
            accountView: {},
            first:'',
            second:'',
            third:'',
            fourth:'',
            form_137:'',
            nso:'',
            picture2x2:'',
            }
            
        },
        methods: {
            requirements(){
                axios.get('/api/requirements-list/' + this.$route.params.id).then(({data})=>(this.form_137 = data.data.form_137,this.nso = data.data.birth_cert,this.picture2x2 = data.data.photo2x2));
            },
            balance(){
                axios.get('/api/account/' + this.$route.params.id).then(({data})=>(this.accountView = data.data));
            },
            comment(){
                axios.get('/api/comment-list/' + this.$route.params.id).then(({data})=>(this.first = data.data.first,this.second = data.data.second,this.third = data.data.third,this.fourth = data.data.fourth));
            },
            transFunc(){
                axios.get("/api/transactions/"+ this.$route.params.id).then(({data})=>(this.transactions = data.data));
                //$('#transReports').modal('show');
            },
            grades(){
                axios.get('/api/grade-list/' + this.$route.params.id).then(({data})=>(this.subjects = data.data));
            },
            getProfile(){
                axios.get('/api/student/' + this.$route.params.id).then(({data})=>(this.student = data.data));
                console.log(this.student.lecture_id);

            },
            getLecture(){
                axios.get('/api/lecture/' + this.$route.params.id).then(({data})=>(this.lecture = data.data));
            }
        },
        created() {
            this.getProfile();
            this.getLecture();
            this.grades();
            this.comment();
            this.balance();
            this.transFunc();
            this.requirements();
            Fire.$on('afterCreate',()=>{

            });
        }
    }
</script>
