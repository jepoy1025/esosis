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
                                <div class="card card-info">
                                    <div class="card-header">Generate Sort Type</div>
                                    <div class="card-body">
                                    <div class="col-md-12">
                                    <div class="card card-info">
                                      <div class="card-header p-2">
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
                                              <h3 class="card-title pink">Grades</h3>
                                            </div>
                                            <!-- /.card-header -->
                                            <div class="card-body">
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
                                            </div>
                                            <!-- /.card-body -->
                                          </div>
                                          </div>
                                          <!-- /.tab-pane -->

                                          <div class="tab-pane" id="requirements">
                                            <h3 class="red">Please settle the lacking requirements. Thank you!</h3>
                                            <div class="row">
                            
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
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
