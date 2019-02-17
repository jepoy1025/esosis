<template>
    <div class="container">
        <br>
        <div class="row">
          <div class="col-12">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title"><b class="pink">Teachers</b> utilities</h3>

                <div class="card-tools">
                    <button class="btn btn-block btn-outline-primary btn-lg" @click="newModal" ><i class="fas fa-user-plus fa-fw"></i> Add Teacher</button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover">
                  <tbody>
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Educational Attainment</th>
                        <th>Civil Service</th>
                        <th>Marital</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    <tr v-for="teacher in teacher" :key="teacher.id">
                        <td>{{teacher.id}}</td>
                        <td>{{teacher.name}}</td>
                        <td>{{teacher.educational_attainment}}</td>
                        <td>{{teacher.civil_service}}</td>
                        <td>{{teacher.marital_status}}</td>
                        <td>{{teacher.status}}</td>
                        <td>
                            <button href="" @click="editModal(teacher)" class="btn btn-default">
                            <i class="fas fa-user-cog orange"></i>
                            </button>
                            <button href="" @click="teacherActivate(teacher.id)" class="btn btn-default" :disabled="teacher.status == 'active'">
                            <i class="fas fa-user-check green"></i>
                            </button>
                            <button href="" @click="teacherDeactivate(teacher.id)" class="btn btn-default" :disabled="teacher.status == 'inactive'">
                            <i class="fas fa-user-times red"></i>
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
        <div class="modal fade" id="teacherModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 v-show="editMode" class="modal-title" id="exampleModalLabel">Updating Teacher</h5>
                <h5 v-show="!editMode" class="modal-title" id="exampleModalLabel">Adding Teacher</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form @submit.prevent="editMode ? updateTeacher() : createTeacher()">
              <div class="modal-body">
                <div class="form-group">
                  <input v-model="form.name" placeholder="Full Name" type="text" name="name" id="name"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('name') }">
                  <has-error :form="form" field="name"></has-error>
                </div>
                <div class="form-group">
                  <textarea v-model="form.educational_attainment" placeholder="Educational Attainment" type="text" name="educational_attainment" id="educational_attainment"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('educational_attainment') }">
                  </textarea>
                  <has-error :form="form" field="educational_attainment"></has-error>
                </div>
                <div class="form-group">
                  <input v-model="form.civil_service" placeholder="Civil Service" type="text" name="civil_servicee" id="civil_service"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('civil_service') }">
                  <has-error :form="form" field="civil_service"></has-error>
                </div>
                      <!-- <option v-for="level in level" v-bind:value="level.id">{{level.title}}</option> -->
                <div class="form-group">
                  <select name="marital_status" v-model="form.marital_status" id="marital_status" class="form-control" :class="{ 'is-invalid': form.errors.has('marital_status') }">
                      <option value="">Select Marital Status</option>
                      <option value="married">married</option>
                      <option value="single">single</option>
                  </select>
                  <has-error :form="form" field="marital_status"></has-error>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button v-show="editMode" type="submit" class="btn btn-success">Update Teacher</button>
                <button v-show="!editMode" type="submit" class="btn btn-primary">Create Teacher</button>
              </div>
            </form>
            </div>
          </div>
        </div>
    </div>


</template>

<script>
  export default{
    data() {
            return{
                editMode : false,
                teacher : {},
                level:{},
                form: new Form({
                    id: '',
                    name : '',
                    educational_attainment : '',
                    civil_service : '',
                    marital_status: '',
                    status: ''
                })
            }
        },
    methods: {
    
      newModal(){
                this.editMode = false;
                this.form.reset();
                $('#teacherModal').modal('show');
            },
      editModal(teacher){
                this.editMode = true;
                this.form.reset();
                $('#teacherModal').modal('show');
                this.form.fill(teacher);
            },
      loadTeacher(){
                axios.get("api/teacherList").then(({data})=>(this.teacher = data.data));
            },
      loadLevel(){
                
                axios.get("api/level").then(({data})=>(this.level = data.data));
            },
      createTeacher(){
                this.$Progress.start();
                this.form.post('api/teacher')
                .then(()=>{

                    Fire.$emit('afterCreate');
                    $('#teacherModal').modal('hide');
                    toast({
                      type: 'success',
                      title: 'Teacher Added Succesfully'
                    });
                    this.$Progress.finish();

                })
                .catch(()=>{
                  this.$Progress.fail();
                })
            },
      updateTeacher(){
                this.$Progress.start();
                this.form.put('/api/teacher/'+this.form.id)
                .then(()=>{
                  Fire.$emit('afterCreate');
                            swal(
                              'Success!',
                              'Teacher Updated.',
                              'success'
                            )
                  this.$Progress.finish();
                  $('#teacherModal').modal('hide');
                })
                .catch(() => {
                  this.$Progress.fail();
                })
            },
      teacherDeactivate(id){
                swal({
                  title: 'Teacher will be deactivated?',
                  type: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes, deactivate it!'
                }).then((result) => {
                    if (result.value) {
                    this.form.delete('/api/teacher/'+id).then(()=>{
                        Fire.$emit('afterCreate');
                            swal(
                              'Deleted!',
                              'Teacher has been Diactivated.',
                              'success'
                            )
                    }).catch(()=>{
                        swal("failes","There was something wrong.","warning");
                    })
                    }
                })
            },
      teacherActivate(id){
                swal({
                  title: 'Teacher will be activated?',
                  type: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes, Activate it!'
                }).then((result) => {
                    if (result.value) {
                    this.form.put('/api/teacher-active/'+id).then(()=>{
                        Fire.$emit('afterCreate');
                            swal(
                              'Deleted!',
                              'Teacher has been Activated.',
                              'success'
                            )
                    }).catch(()=>{
                        swal("failes","There was something wrong.","warning");
                    })
                    }
                })
            },
    },
    
    created(){
            this.loadTeacher();
            this.loadLevel();
            Fire.$on('afterCreate',()=>{
                this.loadTeacher();
            });
            // setInterval(() => this.loadUser(),3000);
    }
  }
</script>
