<template>
    <div class="container">
        <br>
        <div class="row">
          <div class="col-12">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title"><b class="pink">Sponsor</b> List</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover">
                  <tbody>
                    <tr>
                        <th>ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Sponsored Students</th>
                    </tr>
                    <tr v-for="user in users" :key="user.id">
                        <td>{{user.id}}</td>
                        <td>{{user.first_name}}</td>
                        <td>{{user.last_name}}</td>                        <td>
                            <button href="" @click="studentsList(user.id)" class="btn btn-default">
                            <i class="fas fa-user-cog green"></i>
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
        <div class="modal fade" id="studentsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Students List</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                  <table class="table table-hover">
                  <tbody>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Grade Level</th>
                    </tr>
                    <tr v-for="user in students" :key="user.id">
                        <td>{{user.first_name}}</td>
                        <td>{{user.last_name}}</td>  
                        <td>{{user.title}}</td>                      
                    </tr>
                </tbody></table>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              </div>
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
                students: {},
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
            studentsList(id){
                axios.get("/api/sponsorStudents/" + id).then(({data})=>(this.students = data.data));
                $('#studentsModal').modal('show');
            },
            loadUser(){
                axios.get("api/sponsor").then(({data})=>(this.users = data.data));
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
