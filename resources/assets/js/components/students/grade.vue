<template>
    <div class="container">
        <br>
        <div class="row">
          <div class="col-12">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title"><b class="pink">Student</b> Performance</h3>

                <div class="card-tools">
                   <div class="input-group input-group-sm">
                    <input class="form-control" v-model="search" @keyup="searchit" type="search" placeholder="Search Last Name" aria-label="Search">
                  </div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0" v-show="!searchFilter">
                <table class="table table-hover table-dark">
                  <tbody style="height: 500px; overflow: scroll; display: block; swidth:100%;">
                    <tr>
                        <th>Full Name</th>
                        <th>Grade Level</th>
                        <th>Action</th>
                    </tr>
                    <tr v-for="user in users" :key="user.id">
                        <!-- <td><button href="" @click="viewProfile(user.id)" class="btn btn-default pull-right">
                            <i class="fas fa-eye green"> View Info</i>
                        </button></td> -->
                        <td>
                          <a href="" @click="viewProfile(user.id)" class="primary">{{user.last_name | upText}}, {{user.first_name | upText}}</a>
                        </td>
                        <td>{{user.title}}</td>
                        <td>
                            <button href="" @click="editModal(user.id)" class="btn btn-default">
                            <i class="fas fa-edit green">Comment</i>
                            </button>
                            <button href="" @click="deleteUser(user.id)" class="btn btn-default">
                            <i class="fas fa-table orange">Edit Grade</i>
                            </button>
                            <button href="" @click="requirementTab(user.id)" class="btn btn-default">
                            <i class="fas fa-tasks teal">Requirements</i>
                            </button>
                            <button href="" @click="transfer(user)" class="btn btn-default">
                            <i class="fas fa-external-link-alt red">Drop Student</i>
                            </button>
                        </td>
                    </tr>
                </tbody></table>
              </div>
              <div class="card-body table-responsive p-0" v-show="searchFilter">
                <table class="table table-hover table-dark">
                  <tbody style="height: 500px; overflow: scroll; display: block; swidth:100%;">
                    <tr>
                        <th></th>
                        <th>Last Name</th>
                        <th>First Name</th>
                        <th>Grade Level</th>
                        <th>Action</th>
                    </tr>
                    <tr v-for="user in users" :key="user.id" :hidden="user.last_name != stud_name">
                        <td><button href="" @click="viewProfile(user.id)" class="btn btn-default pull-right">
                            <i class="fas fa-eye green"> View Info</i>
                        </button></td>
                        <td>{{user.last_name | upText}}</td>
                        <td>{{user.first_name | upText}}</td>
                        <td>{{user.title}}</td>
                        <td>
                            <button href="" @click="editModal(user.id)" class="btn btn-default">
                            <i class="fas fa-edit green">Comment</i>
                            </button>
                            <button href="" @click="deleteUser(user.id)" class="btn btn-default">
                            <i class="fas fa-table orange">Edit Grade</i>
                            </button>
                            <button href="" @click="requirementTab(user.id)" class="btn btn-default">
                            <i class="fas fa-tasks teal">Requirements</i>
                            </button>
                            <button href="" @click="transfer(user)" class="btn btn-default">
                            <i class="fas fa-external-link-alt red">Drop Student</i>
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
                stud_name:'',
                users : {},
                searchFilter: false,
                search:'',
                fees:[],
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
            viewProfile(id){
              this.$router.push("/student_info/"+id);
            },
            transfer(student){
              swal({
                  title: 'Are you sure?',
                  text: "Student Data Will be move to Student->Drop Tab!",
                  type: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes, This student drop!'
                }).then((result) => {
                    console.log(student.id);
                    if (result.value) {
                    this.form.put('/api/dropStudent/'+ student.id).then(()=>{
                        Fire.$emit('afterCreate');
                            swal(
                              'Archived!',
                              'Student Data has been moved to Student Archives.',
                              'success'
                            )
                    }).catch(()=>{
                        swal("failes","There was something wrong.","warning");
                    })
                    }
                })
            },
            searchit(){   
              if(this.search == "" || this.search == null || this.search == "search"){
                this.searchFilter = false;
              }else{
                this.searchFilter = true;
                this.stud_name = this.search.toLowerCase();
              }
            },
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
