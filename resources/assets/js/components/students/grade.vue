<template>
    <div class="container">
        <br>
        <div class="row">
          <div class="col-12">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title"><b class="pink">Student</b> Performance</h3>

                <div class="card-tools">
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover">
                  <tbody>
                    <tr>
                        <th>ID</th>
                        <th>Last Name</th>
                        <th>First Name</th>
                        <th>Action</th>
                    </tr>
                    <tr v-for="user in users" :key="user.id">
                        <td>{{user.id}}</td>
                        <td>{{user.last_name | upText}}</td>
                        <td>{{user.first_name | upText}}</td>
                        <td>
                            <button href="" @click="editModal(user.id)" class="btn btn-default">
                            <i class="fas fa-user-cog green">Comment</i>
                            </button>
                            <button href="" @click="deleteUser(user.id)" class="btn btn-default">
                            <i class="fas fa-user-times red">Edit Grade</i>
                            </button>
                            <button href="" @click="requirementTab(user.id)" class="btn btn-default">
                            <i class="fas fa-user-times blue">Requirements</i>
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
        <div class="modal fade" id="commentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Grading Table</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form @submit.prevent="updateGrade()">
              <div class="modal-body">a
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success">Update Comment</button>
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
                    first: '',
                    second: '',
                    third: '',
                    fourth: '',
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
            editModal(id){
              this.$router.push("/comment/"+id);
            },
            newModal(){
                this.editMode = false;
                this.form.reset();
                $('#userModal').modal('show');
            },
            loadUser(){
                axios.get("api/grades").then(({data})=>(this.users = data.data));
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
              //console.log(id);
                this.$router.push("/grade/"+id);
            },
            requirementTab(id){
              this.$router.push("/requirement/"+id);
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
