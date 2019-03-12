<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <br><br>
          <div class="card card-info">
            <div class="card-header">
              <h3 class="card-title">Notifications</h3>

              <div class="card-tools">
              </div>
              <!-- /.card-tools -->
            </div>
            <!-- /.card-header -->
            <div class="card-body p-0">
              <div class="mailbox-controls">
                <!-- /.float-right -->
              </div>
              <div class="table-responsive mailbox-messages">
                <table class="table table-hover table-striped">
                  <tbody>
                  <tr v-for="messages in messages">
                    <td class="mailbox-name"><a href="read-mail.html">Admin</a></td>
                    <td class="mailbox-subject"><b>{{messages.subject}}</b>
                    </td>
                    <td class="mailbox-attachment"></td>
                    <td class="pull-right">
                        <button href="" class="btn btn-default"  @click="view(messages)">
                            <i class="fas fa-eye green"> View</i>
                        </button>
                        <button href="" class="btn btn-default"  @click="del(messages.id)">
                            <i class="fas fa-trash red"> Delete</i>
                        </button>
                    </td>
                    <td>
                        <span class="right badge badge-danger pull-right" :hidden="messages.status == '0'">Unread</span>
                    </td>
                  </tr>
                  </tbody>
                </table>
                <!-- /.table -->
              </div>
              <!-- /.mail-box-messages -->
            </div>
            <!-- /.card-body -->
            <div class="card-footer p-0">
            </div>
          </div>
          <!-- /. box -->
        </div>
        </div>
        <div class="modal fade" id="viewMessage" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h3 class="modal-title" id="exampleModalLabel">Admin Notification</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="form-group">
                  <input v-model="form.subject" placeholder="" type="text" name="subject" id="subject"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('subject') }" readonly>
                </div>
                <div class="form-group">
                    <textarea id="compose-textarea" class="form-control" style="height: 300px" placeholder="Message" readonly>{{form.message}}
                    </textarea>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times"></i> Close</button>
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
                messages: {},
                form: new Form({
                    id : '',
                    suject : '',
                    message : '',
                })
            }
        },
        methods: {
          view(message){
            this.form.reset();
            $('#viewMessage').modal('show');
            this.form.fill(message);
            this.form.subject = message.subject;
            this.form.put('/api/notificationStatus/'+this.form.id);
            Fire.$emit('afterCreate');
          },
          del(id){
            swal({
                  title: 'Do you want to delete this notification?',
                  type: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes'
                }).then((result) => {
                    if (result.value) {
                      this.form.delete('/api/notificationDelete/'+id).then(()=>{
                        Fire.$emit('afterCreate');
                            swal(
                              'success',
                              'Your notification has been deleted.',
                              'success'
                            )
                      }).catch(()=>{
                          swal("failes","There was something wrong.","warning");
                      })
                    }
            })
          },
          messageList(){
            axios.get('/api/notificationList/' + this.$route.params.id).then(({data})=>(this.messages = data.data));
          }

        },
        created() {
            this.messageList();
            Fire.$on('afterCreate',()=>{
                this.messageList();
            });
        }
}
</script>   
