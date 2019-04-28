<template>
    <div class="container">
        <br>
        <div class="row">
          <div class="col-12">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title"><b class="pink">Student</b> Codes</h3>(for SIS)
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover">
                  <tbody>
                    <tr>
                        <th>Student Name</th>
                        <th>Code</th>
                    </tr>
                    <tr v-for="user in codes" :key="user.id">
                        <td>{{user.last_name}}, {{user.first_name}}</td>
                        <td>{{user.code}}</td>                      
                    </tr>
                </tbody></table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
    </div>


</template>

<script>
    export default {

        data() {
            return{
                editMode : false,
                codes : {},
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
            loadCode(){
                axios.get("api/codes").then(({data})=>(this.codes = data.data));
            },

        },
        created() {
            this.loadCode();
            Fire.$on('afterCreate',()=>{
                this.loadCode();
            });
            // setInterval(() => this.loadUser(),3000);
        }
    }
</script>
