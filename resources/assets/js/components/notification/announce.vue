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
              <form @submit.prevent="createTeacher()">
              <div class="modal-body">
                <div class="form-group">
                  <input class="form-control" placeholder="Subject:">
                </div>
                <div class="form-group">
                    <textarea id="compose-textarea" class="form-control" style="height: 300px" placeholder="Message">
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
                    this.form.delete('/api/subject/'+id).then(()=>{
                        Fire.$emit('afterCreate');
                            swal(
                              'Deleted!',
                              'Subject has been move to archived.',
                              'success'
                            )
                    }).catch(()=>{
                        swal("failes","There was something wrong.","warning");
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
                    this.form.delete('/api/subject/'+id).then(()=>{
                        Fire.$emit('afterCreate');
                            swal(
                              'Deleted!',
                              'Subject has been move to archived.',
                              'success'
                            )
                    }).catch(()=>{
                        swal("failes","There was something wrong.","warning");
                    })
                    }
                })
            },
            createMessage() {
                $('#costum').modal('show');
            }
        },
        created() {
            //this.loadLevel();
          
    }
}
</script>
