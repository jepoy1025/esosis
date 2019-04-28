<template>
    <div class="container">
        <br>
        <div class="row">
          <div class="col-12">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title"><b class="pink">Grade Level and School Year</b> utilities</h3>
              </div>
              <!-- /.card-header -->
              <br>
              <div class="row col-12">
              <div class="card col-6">
              <div class="card-header">
                <h3 class="card-title">Level</h3>
                <div class="card-tools">
                    <button class="btn btn-block btn-outline-primary btn-lg" @click="newLevel" ><i class="fas fa-plus-circle fa-fw"></i> Add Grade Level</button>
                </div>
                </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table">
                  <tbody><tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Action</th>
                  </tr>
                  <tr v-for="level in level" :key="level.id">
                    <td>{{level.id}}</td>
                    <td>{{level.title}}</td>
                    <td>
                        <button href="" @click="editLevel(level)" class="btn btn-default">
                            <i class="fas fa-tools orange"></i>
                        </button>
                    </td>
                  </tr>
                </tbody></table>
              </div>
              <!-- /.card-body -->
            </div>
            <div class="card col-6">
              <div class="card-header">
                <h3 class="card-title">School Year</h3>
                <div class="card-tools">
                    <button class="btn btn-block btn-outline-primary btn-lg" @click="newSY" ><i class="fas fa-plus-circle fa-fw"></i> Update School Year</button>
                </div>
                </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <br>
                <div class="callout callout-default">
                  <h5>Current School Year</h5>

                  <p>{{sy.school_year}}</p>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
      </div>
          <!-- level Modal -->
          <div class="modal fade" id="levelModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 v-show="editMode" class="modal-title" id="exampleModalLabel">Updating level</h5>
                <h5 v-show="!editMode" class="modal-title" id="exampleModalLabel">Adding level</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form @submit.prevent="editMode ? updateLevel() : createLevel()">
              <div class="modal-body">
                <div class="form-group">
                <label>Grade Level Title:</label>
                  <input v-model="form.title" type="text" name="title" id="title"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('title') }">
                  <has-error :form="form" field="title"></has-error>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button v-show="editMode" type="submit" class="btn btn-success">Update Grade Level</button>
                <button v-show="!editMode" type="submit" class="btn btn-primary">Create Grade Level</button>
              </div>
            </form>
            </div>
          </div>
        </div>
        <div class="modal fade" id="syModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 v-show="editMode" class="modal-title" id="exampleModalLabel">Updating School Year</h5>
                <h5 v-show="!editMode" class="modal-title" id="exampleModalLabel">Adding School Year</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form @submit.prevent="editMode ? updateSY() : createSY()">
              <div class="modal-body">
                <div class="form-group">
                <label>School Year:</label>
                  <input v-model="form.school_year" type="text" name="school_year" id="school_year"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('school_year') }">
                  <has-error :form="form" field="school_year"></has-error>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button v-show="editMode" type="submit" class="btn btn-success">Update School Year</button>
                <button v-show="!editMode" type="submit" class="btn btn-primary">Create School Year</button>
              </div>
            </form>
            </div>
          </div>
        </div>
        <div class="modal fade" id="checkStudents" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Note: The following student/s has unsettled grades</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <table class="table">
                  <tbody><tr>
                    <th>Name</th>
                    <th>Grade Level</th>
                  </tr>
                  <tr v-for="student in student" :key="student.id">
                    <td>{{student.last_name | upText}}, {{student.first_name | upText}}</td>
                    <td>{{student.title}}</td>
                  </tr>
                </tbody></table>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button @click="incrementSY" class="btn btn-success">Update School Year</button>
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
                level:{},
                sy:[],
                student:{},
                form: new Form({
                    id: '',
                    title : '',
                    school_year : '102'
                })
            }
        },
        methods:{
        // level methods
          incrementSY(){
            this.$Progress.start();
                this.form.post('api/sy')
                .then(()=>{

                    Fire.$emit('afterCreate');
                    $('#checkStudents').modal('hide');
                    toast({
                      type: 'success',
                      title: 'School Year Succesfully added'
                    });
                    this.$Progress.finish();

                })
                .catch(()=>{
                  this.$Progress.fail();
                })
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
                      //console.log(student.id);
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
            loadLevel(){
                axios.get("api/level").then(({data})=>(this.level = data.data));
            },
            newLevel(){
                this.editMode = false;
                this.form.reset();
                $('#levelModal').modal('show');
            },
            editLevel(level){
                this.editMode = true;
                this.form.reset();
                $('#levelModal').modal('show');
                this.form.fill(level);
            },
            createLevel(){
                this.$Progress.start();
                this.form.post('api/level')
                .then(()=>{

                    Fire.$emit('afterCreate');
                    $('#levelModal').modal('hide');
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
            updateLevel(){
                this.$Progress.start();
                this.form.put('/api/level/'+this.form.id)
                .then(()=>{
                  Fire.$emit('afterCreate');
                            swal(
                              'Success!',
                              'Teacher Updated.',
                              'success'
                            )
                  this.$Progress.finish();
                  $('#levelModal').modal('hide');
                })
                .catch(() => {
                  this.$Progress.fail();
                })
            },
        //SY methods
            loadSY(){
                axios.get("api/sy").then(({data})=>(this.sy = data.data));
            },
            newSY(){
               axios.get("api/studentPending/").then(({data})=>(this.student = data.data));
               $('#checkStudents').modal('show');
            },
            createSY(){
                this.$Progress.start();
                this.form.post('api/sy')
                .then(()=>{

                    Fire.$emit('afterCreate');
                    $('#syModal').modal('hide');
                    toast({
                      type: 'success',
                      title: 'School Year Succesfully added'
                    });
                    this.$Progress.finish();

                })
                .catch(()=>{
                  this.$Progress.fail();
                })
            },
            editSY(level){
                this.editMode = true;
                this.form.reset();
                $('#syModal').modal('show');
                this.form.fill(level);
            },
            updateSY(){
                this.$Progress.start();
                this.form.put('/api/sy/'+this.form.id)
                .then(()=>{
                  Fire.$emit('afterCreate');
                            swal(
                              'Success!',
                              'School Updated.',
                              'success'
                            )
                  this.$Progress.finish();
                  $('#syModal').modal('hide');
                })
                .catch(() => {
                  this.$Progress.fail();
                })
            },
        },
        mounted() {
            this.loadLevel();
            this.loadSY();
            Fire.$on('afterCreate',()=>{
                this.loadLevel();
                this.loadSY();
                this.newSY();
            });
        }
    }
</script>
