<template>
    <div class="container">
        <br>
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card card-info">
                    <div class="card-header"><h3 class="pink">Payment Transactions</h3></div>

                    <div class="card-body">
                        <div class="row justify-content-center">
                            <div class="col-md-11">
                                <div class="card card-default">
                                    <div class="card-header"></div>
                                    <div class="card-body">
                                    <div class="col-md-12">
                                    <div class="card">
                                      Select Sort Type:
                                      <div class="card-header card-info p-2">
                                        <ul class="nav nav-pills">
                                          <li class="nav-item"><a class="nav-link" href="#performance" data-toggle="tab">Date Range</a></li>
                                          <li class="nav-item"><a class="nav-link" href="#payments" data-toggle="tab">Monthly</a></li>
                                          <li class="nav-item"><a class="nav-link" href="#transactions" data-toggle="tab">Annual</a></li>
                                          <li class="nav-item"><a class="nav-link" href="#requirements" data-toggle="tab">All</a></li>
                                        </ul>
                                      </div><!-- /.card-header -->
                                      <div class="card-body">
                                        <div class="tab-content">
                                          <div class="tab-pane active show" id="performance">
                                            <!-- Post -->
                                            <div class="card card-info">
                                            <div class="card-header">
                                              <h3 class="card-title pink">Input Range</h3>
                                            </div>
                                            <!-- /.card-header -->
                                            <div class="card-body" style="background-color: #696969">
                                              <div class="row">
                                                <div class="col-5">
                                                  <label>From:</label>
                                                  <input v-model="from" type="date" name="from" id="from"
                                                    class="form-control">
                                                </div>
                                                <div class="col-5">
                                                  <label>To:</label>
                                                  <input v-model="to" type="date" name="to" id="to"
                                                    class="form-control">
                                                </div>
                                                <div class="col-2">
                                                  
                                                </div>
                                              </div>
                                              <br>
                                                  <button href="#" @click.prevent="printRange()" class="btn btn-success">
                                                  <i class="fas fa-print"> Print</i>
                                                  </button>
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
                                              <h3 class="card-title pink">Enter Month And Year</h3>
                                            </div>
                                            <!-- /.card-header -->
                                            <div class="card-body" style="background-color: #696969">
                                              <div class="row">
                                                <div class="col-5">
                                                  <label>Month!</label>
                                                  <select name="month" v-model="month" id="month" class="form-control">
                                                  <option value="1" selected>January</option>
                                                  <option value="2">February</option>
                                                  <option value="3">March</option>
                                                  <option value="4">April</option>
                                                  <option value="5">May</option>
                                                  <option value="6">June</option>
                                                  <option value="7">July</option>
                                                  <option value="8">August</option>
                                                  <option value="9">September</option>
                                                  <option value="10">October</option>
                                                  <option value="11">November</option>
                                                  <option value="12">December</option>
                                                  </select>
                                                </div>
                                                <div class="col-5">
                                                  <label>Year:</label>
                                                  <input v-model="year" type="number" name="year" id="year"
                                                    class="form-control">
                                                </div>
                                                <div class="col-2">
                                                  
                                                </div>
                                              </div>
                                              <br>
                                                  <button href="#" @click.prevent="printMonth()" class="btn btn-success">
                                                  <i class="fas fa-print"> Print</i>
                                                  </button>
                                            </div>
                                            <!-- /.card-body -->
                                          </div>
                                          </div>
                                          <div class="tab-pane" id="transactions">
                                            <div class="card card-info">
                                            <div class="card-header">
                                              <h3 class="card-title pink">Annual Transactions</h3>
                                            </div>
                                            <!-- /.card-header -->
                                            <div class="card-body" style="background-color: #696969">
                                                <label>School Year:</label>
                                                  <input v-model="year" type="number" name="year" id="year"
                                                    class="form-control">
                                                <button @click.prevent="printAnnual()" class="btn btn-success">
                                                  <i class="fas fa-print"> Print</i>
                                                </button>
                                            </div>
                                            <!-- /.card-body -->
                                          </div>
                                          </div>
                                          <!-- /.tab-pane -->

                                          <div class="tab-pane" id="requirements">
                                            <div class="card-body" style="background-color: #696969">
                                                <label>Print All Transactions</label>
                                                <button href="#" @click.prevent="print()" class="btn btn-success">
                                                <i class="fas fa-print">Click me to Print!</i>
                                            </button>
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
                            </div>
                        </div>
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
                year:2018,
                month:1,
                from:'',
                to:'',
                form: new Form({
                    year : '',
                })
            }
        },
        methods: {
            loadLevel() {
                axios.get("api/level").then(({data}) => (this.levels = data.data));
            },
            print() {
                window.open('/api/transactionReport/');
            },
            printAnnual() {
                window.open('/api/transactionReportAnnual/' + this.year);
            },
            printMonth(){
              var month = this.month+"-"+this.year;
              //console.log(month);
              window.open('/api/transactionReportMonth/' + month);
            },
            printRange(){
              var from = new Date(this.from);
              var to = new Date(this.to);
              if(from>to){
                toast({
                      type: 'error',
                      title: 'Something went wrong(Check the date entered)!'
                    });
              }else{
                var range = this.from+"+"+this.to;
                window.open('/api/transactionReportRange/' + range);
              }
            }
        },
        created() {
            this.loadLevel();
            console.log('Component mounted.')
        }
    }
</script>
