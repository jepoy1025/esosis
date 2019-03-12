<template>
    <div class="container">
        <br>
        <br>
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card card-info">
                    <div class="card-header"><h3 class="pink">Notify SIS Users</h3></div>

                    <div class="card-body">
                    <div class="row">
                    <div class="col-lg-4 col-6" @click="requirements">
                      <!-- small box -->
                      <div class="small-box bg-success">
                        <div class="inner">
                          <h3><i class="fas fa-bullhorn"></i></h3>

                          <p><b>Requirements</b></p>
                        </div>
                        <div class="icon">
                          <i class="fas fa-check"></i>
                        </div>
                      </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-4 col-6" @click="payments">
                      <!-- small box -->
                      <div class="small-box bg-success">
                        <div class="inner">
                          <h3><i class="fas fa-bullhorn"></i></h3>

                          <p><b>Payments</b></p>
                        </div>
                        <div class="icon">
                          <i class="fas fa-cash-register"></i>
                        </div>
                      </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-4 col-6" @click="createMessage">
                      <!-- small box -->
                      <div class="small-box bg-success">
                        <div class="inner">
                          <h3><i class="fas fa-bullhorn"></i></h3>

                          <p><b>Costum Message</b></p>
                        </div>
                        <div class="icon">
                          <i class="fas fa-edit"></i>
                        </div>
                      </div>
                    </div>
                    </div>
                    <!-- ./col -->
                  </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="costum" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h3 class="modal-title" id="exampleModalLabel">Compose Message</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form @submit.prevent="sendMessage()">
              <div class="modal-body">
                <div class="form-group">
                  <label>Send to:</label>
                  <select name="sendTo" v-model="form.sendTo" id="sendTo" class="form-control" :class="{ 'is-invalid': form.errors.has('sendTo') }">
                      <option value="1">Parents & Sponsor</option>
                      <option value="2">Parents</option>
                      <option value="3">Sponsor</option>
                  </select>
                </div>
                <div class="form-group">
                  <input v-model="form.header" placeholder="Subject" type="text" name="header" id="header"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('header') }">
                  <has-error :form="form" field="header"></has-error>
                </div>
                
                <div class="form-group">
                    <textarea v-model="form.message" placeholder="Message" type="text" name="message" id="message"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('message') }">
                  </textarea>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times"></i> Close</button>
                <button type="submit" class="btn btn-success"><i class="fas fa-share-square"></i> Send</button>
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
                levels: [],
                year:2018,
                month:1,
                from:'',
                to:'',
                form: new Form({
                    header : '',
                    message : '',
                    sendTo: 1,
                })
            }
        },
        methods: {
            requirements() {
                swal({
                  title: 'Notify all SIS User about Student Requirements?',
                  type: 'info',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes, Send this notification!'
                }).then((result) => {
                    if (result.value) {

                    this.$Progress.start();
                    this.form.put('/api/announce/'+1)
                    .then(()=>{
                                swal(
                                  'Success!',
                                  'Notification send to SIS users.',
                                  'success'
                                )
                      this.$Progress.finish();
                    })
                    .catch(() => {
                      this.$Progress.fail();
                      swal("failed","There was something wrong.","warning");
                    })
                    }
                })
            },
            payments(){
                swal({
                  title: 'Notify all SIS User about Student Payments?',
                  type: 'info',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes, Send this notification!'
                }).then((result) => {
                    if (result.value) {
                    this.$Progress.start();
                    this.form.put('/api/announce/'+2)
                    .then(()=>{
                                swal(
                                  'Success!',
                                  'Notification send to SIS users.',
                                  'success'
                                )
                      this.$Progress.finish();
                    })
                    .catch(() => {
                      this.$Progress.fail();
                      swal("failed","There was something wrong.","warning");
                    })
                    }
                })
            },
            createMessage() {
                $('#costum').modal('show');
            },
            sendMessage(){
              this.form.put('/api/announce/'+3)
                .then(()=>{
                  Fire.$emit('afterCreate');
                            swal(
                              'Success!',
                              'Notification Sent',
                              'success'
                            )
                  this.$Progress.finish();
                  $('#costum').modal('hide');
                })
                .catch(() => {
                  this.$Progress.fail();
              })
            }
        },
        created() {

          }
}
</script>   
