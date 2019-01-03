<template>
    <div class="container">
        <br>
        <div class="row">
          <div class="col-12">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title"><b class="pink">Admin/Staff</b> Users</h3>

                <div class="card-tools">
                    <button type="button" class="btn btn-block btn-outline-primary btn-lg" data-toggle="modal" data-target="#addUser"><i class="fas fa-user-plus fa-fw"></i> Add New Staff/Admin</button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover">
                  <tbody>
                    <tr>
                        <th>ID</th>
                        <th>Photo</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Username</th>
                        <th>E-mail</th>
                        <th>User Type</th>
                        <th>Action</th>
                    </tr>
                    <tr v-for="user in users" :key="user.id">
                        <td>{{user.id}}</td>
                        <td>{{user.photo}}</td>
                        <td>{{user.first_name | upText}}</td>
                        <td>{{user.last_name | upText}}</td>
                        <td>{{user.username}}</td>
                        <td>{{user.email}}</td>
                        <td>{{user.role | upText}}</td>
                        <td>
                            <a href="" class="green">
                            <i class="fas fa-user-cog"></i>
                            </a>
                            <a href="" class="red">
                            <i class="fas fa-user-times"></i>
                            </a>
                        </td>
                    </tr>
                </tbody></table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
        <div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Adding Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form @submit.prevent="createUser">
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
                <div class="form-group">
                  <input v-model="form.password" placeholder="Password" type="password" name="password" id="password"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('password') }">
                  <has-error :form="form" field="password"></has-error>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Create User</button>
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
                users : {},
                form: new Form({
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

            loadUser(){
                axios.get("api/user").then(({data})=>(this.users = data.data));
            },

            createUser(){
                this.$Progress.start();
                this.form.post('api/user')
                .then(()=>{

                    Fire.$emit('afterCreate');
                    $('#addUser').modal('hide');
                    toast({
                      type: 'success',
                      title: 'User Created Succesfully'
                    });
                    this.$Progress.finish();

                })
                .catch(()=>{

                })

                
            }

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
