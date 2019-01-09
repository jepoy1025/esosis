<template>
    <div class="container">
        <br>
        <div class="row">
          <div class="col-12">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title"><b class="pink">Subject</b> utilities</h3>

                <div class="card-tools">
                  <button class="btn btn-outline-warning btn-lg" @click="deletedModal" ><i class="fas fa-eye fa-fw"></i> View Deleted Subjects</button>
                    <button class="btn btn-outline-primary btn-lg" @click="newModal" ><i class="fas fa-book fa-fw"></i> Add Subject</button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover">
                  <tbody>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Teacher</th>
                        <th>Grade Level</th>
                        <th>Duration(min)</th>
                    </tr>
                    <tr v-for="subject in subject" :key="subject.id">
                        <td>{{subject.id}}</td>
                        <td>{{subject.title}}</td>
                        <td>{{subject.name}}</td>
                        <td>{{subject.grade_level}}</td>
                        <td>{{subject.duration}}</td>
                        <td>
                            <button href="" @click="editModal(subject)" class="btn btn-default">
                            <i class="fas fa-edit orange"></i>
                            </button>
                            <button href="" @click="subjectDelete(subject.id)" class="btn btn-default">
                            <i class="fas fa-times red"></i>
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
        <div class="modal fade" id="subjectModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 v-show="editMode" class="modal-title" id="exampleModalLabel">Updating Subject</h5>
                <h5 v-show="!editMode" class="modal-title" id="exampleModalLabel">Adding Subject</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form @submit.prevent="editMode ? updateSubject() : createSubject()">
              <div class="modal-body">
                <div class="form-group">
                  <label>Select Grade Level:</label>
                  <select name="level" v-model="form.level" id="level" class="form-control" :class="{ 'is-invalid': form.errors.has('level') }">
                      <option v-for="level in level" v-bind:value="level.id">{{level.title}}</option>
                  </select>
                  <has-error :form="form" field="level"></has-error>
                </div>
                <div class="form-group">
                  <input v-model="form.title" placeholder="title" type="text" name="title" id="title"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('title') }">
                  <has-error :form="form" field="title"></has-error>
                </div>
                <div class="form-group">
                  <input v-model="form.duration" placeholder="duration" type="number" name="duration" id="duration"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('duration') }">
                  <has-error :form="form" field="duration"></has-error>
                </div>
                <div class="form-group">
                  <label>Select Teacher:</label>
                  <select name="teacher_id" v-model="form.teacher_id" id="teacher_id" class="form-control" :class="{ 'is-invalid': form.errors.has('teacher_id') }">
                      <option v-for="teacher in teacher" v-bind:value="teacher.id">{{teacher.name}}</option>
                  </select>
                  <has-error :form="form" field="teacher_id"></has-error>
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
        <!-- deleted modal -->
        <div class="modal fade" id="deletedModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete Subjects</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="card-body table-responsive p-0">
                <table class="table table-hover">
                  <tbody>
                    <tr>
                        <th>Subject</th>
                        <th>Grade</th>
                        <th>Teacher</th>
                        <th>Re-store</th>
                    </tr>
                    <tr v-for="deleted_Subject in deleted_Subject" :key="deleted_Subject.id">
                        <td>{{deleted_Subject.title}}</td>
                        <td>{{deleted_Subject.grade_level}}</td>
                        <td>{{deleted_Subject.name}}</td>
                        <td>
                            <button href="" @click="subjectActivate(deleted_Subject.id)" class="btn btn-default">
                            <i class="fas fa-check green"></i>
                            </button>
                        </td>
                    </tr>
                </tbody></table>
              </div>
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
  export default{
    data() {
            return{
                editMode : false,
                teacher : {},
                level:{},
                subject:{},
                deleted_Subject:{},
                form: new Form({
                    id: '',
                    title : '',
                    teacher_id:'',
                    level: '',
                    duration: '',
                    status:''
                })
            }
        },
    methods: {
      deletedModal(){
              $('#deletedModal').modal('show');
            },
      newModal(){
                this.editMode = false;
                this.form.reset();
                $('#subjectModal').modal('show');
            },
      editModal(teacher){
                this.editMode = true;
                this.form.reset();
                $('#subjectModal').modal('show');
                this.form.fill(teacher);
            },
      loadSubject(){
                axios.get("api/subject").then(({data})=>(this.subject = data.data));
            },
      deletedSubject(){
                axios.get("api/deleted-subject").then(({data})=>(this.deleted_Subject = data.data));
            },
      loadTeacher(){
                axios.get("api/teacher").then(({data})=>(this.teacher = data.data));
            },
      loadLevel(){
                
                axios.get("api/level").then(({data})=>(this.level = data.data));
            },
      createSubject(){
                this.$Progress.start();
                this.form.post('api/subject')
                .then(()=>{

                    Fire.$emit('afterCreate');
                    $('#subjectModal').modal('hide');
                    toast({
                      type: 'success',
                      title: 'Subject Created Succesfully'
                    });
                    this.$Progress.finish();

                })
                .catch(()=>{
                  this.$Progress.fail();
                })
            },
      updateSubject(){
                this.$Progress.start();
                this.form.put('/api/subject/'+this.form.id)
                .then(()=>{
                  Fire.$emit('afterCreate');
                            swal(
                              'Success!',
                              'Subject Updated.',
                              'success'
                            )
                  this.$Progress.finish();
                  $('#subjectModal').modal('hide');
                })
                .catch(() => {
                  this.$Progress.fail();
                })
            },
      subjectDelete(id){
                swal({
                  title: 'Teacher will be deactivated?',
                  type: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes, deactivate it!'
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
      subjectActivate(id){
                swal({
                  title: 'Teacher will be activated?',
                  type: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes, Activate it!'
                }).then((result) => {
                    if (result.value) {
                    this.form.put('/api/subject-active/'+id).then(()=>{
                        Fire.$emit('afterCreate');
                            swal(
                              'Restored!',
                              'Subject Restored.',
                              'success'
                            )
                    }).catch(()=>{
                        swal("fails","There was something wrong.","warning");
                    })
                    }
                })
            },
    },
    
    created(){
            this.loadTeacher();
            this.loadLevel();
            this.loadSubject();
            this.deletedSubject();
            Fire.$on('afterCreate',()=>{
                this.loadSubject();
                this.deletedSubject();
            });
            // setInterval(() => this.loadUser(),3000);
    }
  }
</script>
