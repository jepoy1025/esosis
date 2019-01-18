<template>
    <div class="container">
        <br>
        <div class="row">
          <div class="col-12">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title"><b class="pink">School </b>Announcements</h3>

                <div class="card-tools">
                    <div class="row">
                        <button class="btn btn-outline-warning btn-lg" @click="newModal" ><i class="fas fa-dumpster fa-fw"></i> Archived Announcements</button>
                        <button class="btn btn-outline-primary btn-lg" @click="newModal" ><i class="fas fa-bullhorn fa-fw"></i> Compose Announcements</button>
                    </div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                  <div class="card card-widget">
              <div class="card-header">
                <div class="user-block">
                  <img class="img-circle" src="" alt="User Image">
                  <span class="username"><a href="#">Jonathan Burke Jr.</a></span>
                  <span class="description">Shared publicly - 7:30 PM Today</span>
                </div>
                <!-- /.user-block -->
                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-toggle="tooltip" title="Mark as read">
                    <i class="fa fa-circle-o"></i></button>
                  <button type="button" class="btn btn-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-widget="remove"><i class="fa fa-times"></i>
                  </button>
                </div>
                <!-- /.card-tools -->
              </div>
              <!-- /.card-header -->
              <div class="card-body" style="display: none;">
                <!-- post text -->
                <p>Far far away, behind the word mountains, far from the
                  countries Vokalia and Consonantia, there live the blind
                  texts. Separated they live in Bookmarksgrove right at</p>

                <p>the coast of the Semantics, a large language ocean.
                  A small river named Duden flows by their place and supplies
                  it with the necessary regelialia. It is a paradisematic
                  country, in which roasted parts of sentences fly into
                  your mouth.</p>
                <!-- /.attachment-block -->

                <!-- Social sharing buttons -->
              </div>
              <!-- /.card-body -->
              <!-- /.card-footer -->
              <!-- /.card-footer -->
            </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
        <div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 v-show="editMode" class="modal-title" id="exampleModalLabel">Updating Form</h5>
                <h5 v-show="!editMode" class="modal-title" id="exampleModalLabel">Adding Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form @submit.prevent="editMode ? updateUser() : createUser()">
              <div class="modal-body">
                <div class="form-group">
                  <input v-model="form.first_name" placeholder="First Name" type="text" name="first_name" id="first_name"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('first_name') }">
                  <has-error :form="form" field="first_name"></has-error>
                </div>
                <div class="form-group">
                  <input v-model="form.middle_name" placeholder="Middle Name" type="text" name="middle_name" id="middle_name"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('middle_name') }">
                  <has-error :form="form" field="middle_name"></has-error>
                </div>
                <div class="form-group">
                  <input v-model="form.last_name" placeholder="Last Name" type="text" name="last_name" id="last_name"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('last_name') }">
                  <has-error :form="form" field="last_name"></has-error>
                </div>
                <div class="form-group">
                  <input v-model="form.username" placeholder="Username" type="text" name="username" id="username"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('username') }">
                  <has-error :form="form" field="username"></has-error>
                </div>
                <div class="form-group">
                  <input v-model="form.email" placeholder="E-Mail" type="email" name="email" id="email"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('email') }">
                  <has-error :form="form" field="email"></has-error>
                </div>
                <div class="form-group">
                  <select name="user_type" v-model="form.user_type" id="user_type" class="form-control" :class="{ 'is-invalid': form.errors.has('user_type') }">
                      <option value="">Select User Role</option>
                      <option value="2">Staff</option>
                      <option value="3">Admin</option>
                  </select>
                  <has-error :form="form" field="user_type"></has-error>
                </div>
                <div v-show="!editMode" class="form-group">
                  <input v-model="form.password" placeholder="Password" type="password" name="password" id="password"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('password') }">
                  <has-error :form="form" field="password"></has-error>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button v-show="editMode" type="submit" class="btn btn-success">Update User</button>
                <button v-show="!editMode" type="submit" class="btn btn-primary">Create User</button>
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
                users : {},
                form: new Form({
                    id: '',
                    first_name : '',
                    middle_name : '',
                    last_name : '',
                    username: '',
                    email: '',
                    user_type: '',
                    photo: '',
                    password:''
                })
            }
        },
        methods: {
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
            loadUser(){
                axios.get("api/user").then(({data})=>(this.users = data.data));
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
            this.loadUser();
            Fire.$on('afterCreate',()=>{
                this.loadUser();
            });
            // setInterval(() => this.loadUser(),3000);
        }
    }
</script>
