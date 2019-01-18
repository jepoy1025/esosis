<template>
    <div class="container">
        <br>
        <div class="row">
          <div class="col-12">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title"><b class="pink">Enrollment </b>(Old Students)</h3>

                <div class="card-tools">
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover">
                  <tbody>
                    <tr>
                        <th>Student ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Past Grade Level</th>
                        <th></th>
                    </tr>
                    <tr v-for="student in students" :key="student.id">
                        <td>{{student.student_id}}</td>
                        <td>{{student.first_name}}</td>
                        <td>{{student.last_name}}</td>
                        <td>{{student.title}}</td>
                        <td>
                            <button href="" @click="editModal(student)" class="btn btn-default">
                            <i class="fas fa-user-cog green">Enroll</i>
                            </button>
                            <button href="" @click="deleteUser(student.id)" class="btn btn-default">
                            <i class="fas fa-user-times red">Check Payment</i>
                            </button>
                            <button href="" @click="deleteUser(student.id)" class="btn btn-default">
                            <i class="fas fa-user-times red">Move To Archive</i>
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
                students : {},
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
            loadStudent(){
                axios.get("api/student-waiting").then(({data})=>(this.students = data.data));
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
            this.loadStudent();
            Fire.$on('afterCreate',()=>{
                this.loadUser();
            });
            // setInterval(() => this.loadUser(),3000);
        }
    }
</script>
