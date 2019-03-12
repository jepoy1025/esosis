<template>
    <div class="container">
        <br>
        <div class="row">
          <div class="col-12">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title"><b class="pink">Rooms</b> utilities</h3>
                <div class="card-tools">
                    <button class="btn btn-outline-warning btn-lg" @click="inactiveModal" ><i class="fas fa-eye fa-fw"></i> View Inactive Rooms</button>
                    <button class="btn btn-outline-primary btn-lg" @click="newModal" ><i class="fas fa-plus-circle fa-fw"></i> Create Room</button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover">
                  <tbody>
                    <tr>
                        <th>ID</th>
                        <th>Grade Level</th>
                        <th>Section</th>
                        <th>Advicer</th>
                        <th>Population</th>
                        <th>Availability</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    <tr v-for="room in room" :key="room.id">
                        <td>{{room.id}}</td>
                        <td>{{room.title}}</td>
                        <td>{{room.section}}</td>
                        <td>{{room.name}}</td>
                        <td>{{room.population}}</td>
                        <td>{{room.availability}}</td>
                        <td>{{room.status}}</td>
                        <td>
                            <button href="" @click="editModal(room)" class="btn btn-default">
                            <i class="fas fa-edit orange"></i>
                            </button>
                            <button href="" @click="roomDeactivate(room.id)" class="btn btn-default" :disabled="teacher.status == 'inactive'">
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
        <!-- addModal -->
        <div class="modal fade" id="roomModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 v-show="editMode" class="modal-title" id="exampleModalLabel">Updating Teacher</h5>
                <h5 v-show="!editMode" class="modal-title" id="exampleModalLabel">Adding Teacher</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form @submit.prevent="editMode ? updateRoom() : createRoom()">
              <div class="modal-body">
                <div class="form-group">
                  <label>Select Grade Level:</label>
                  <select name="grade_level" v-model="form.grade_level" id="grade_level" class="form-control" :class="{ 'is-invalid': form.errors.has('grade_level') }">
                      <option v-for="level in level" v-bind:value="level.id">{{level.title}}</option>
                  </select>
                  <has-error :form="form" field="marital_status"></has-error>
                </div>
                <div class="form-group">
                  <input v-model="form.section" placeholder="Section" type="text" name="section" id="section"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('section') }">
                  <has-error :form="form" field="section"></has-error>
                </div>
                <div class="form-group">
                  <label>Select Advicer:</label>
                  <select name="advicer_id" v-model="form.advicer_id" id="advicer_id" class="form-control" :class="{ 'is-invalid': form.errors.has('advicer_id') }">
                      <option v-for="teacher in teacher" v-bind:value="teacher.id">{{teacher.name}}</option>
                  </select>
                  <has-error :form="form" field="marital_status"></has-error>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button v-show="editMode" type="submit" class="btn btn-success">Update Teacher</button>
                <button v-show="!editMode" type="submit" class="btn btn-primary">Create Room</button>
              </div>
            </form>
            </div>
          </div>
        </div>
        <!-- inactiveModal -->
        <div class="modal fade" id="inactiveModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Inactive Rooms</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="card-body table-responsive p-0">
                <table class="table table-hover">
                  <tbody>
                    <tr>
                        <th>Grade Level</th>
                        <th>Section</th>
                        <th>Advicer</th>
                        <th>Re-activate</th>
                    </tr>
                    <tr v-for="inactive in inactive" :key="inactive.id">
                        <td>{{inactive.title}}</td>
                        <td>{{inactive.section}}</td>
                        <td>{{inactive.name}}</td>
                        <td>
                            <button href="" @click="roomActivate(inactive.id)" class="btn btn-default" :disabled="teacher.status == 'inactive'">
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
                room:{},
                inactive:{},
                form: new Form({
                    id: '',
                    grade_level : '',
                    section : '',
                    advicer_id : ''
                })
            }
        },
    methods: {
      inactiveModal(){
        $('#inactiveModal').modal('show');
      },
      newModal(){
                this.editMode = false;
                this.form.reset();
                $('#roomModal').modal('show');
            },
      editModal(teacher){
                this.editMode = true;
                this.form.reset();
                $('#roomModal').modal('show');
                this.form.fill(teacher);
            },
      loadInactive(){
                axios.get("api/inactive-room").then(({data})=>(this.inactive = data.data));
            },
      loadTeacher(){
                axios.get("api/active-teacher").then(({data})=>(this.teacher = data.data));
            },
      loadLevel(){
                axios.get("api/level").then(({data})=>(this.level = data.data));
            },
      loadRoom(){
                axios.get("api/room").then(({data})=>(this.room = data.data));
            },
      createRoom(){
                this.$Progress.start();
                this.form.post('api/room')
                .then(()=>{

                    Fire.$emit('afterCreate');
                    $('#roomModal').modal('hide');
                    toast({
                      type: 'success',
                      title: 'Room Created Succesfully'
                    });
                    this.$Progress.finish();

                })
                .catch(()=>{
                  this.$Progress.fail();
                })
            },
      updateRoom(){
                this.$Progress.start();
                this.form.put('/api/room/'+this.form.id)
                .then(()=>{
                  Fire.$emit('afterCreate');
                            swal(
                              'Success!',
                              'Room Updated.',
                              'success'
                            )
                  this.$Progress.finish();
                  $('#roomModal').modal('hide');
                })
                .catch(() => {
                  this.$Progress.fail();
                })
            },
      roomDeactivate(id){
                swal({
                  title: 'Room will be inactive?',
                  type: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes, deactivate it!'
                }).then((result) => {
                    if (result.value) {
                    this.form.delete('/api/room/'+id).then(()=>{
                        Fire.$emit('afterCreate');
                            swal(
                              'Deleted!',
                              'Room has tuen inactive.',
                              'success'
                            )
                    }).catch(()=>{
                        swal("fails","There was something wrong.","warning");
                    })
                    }
                })
            },
      roomActivate(id){
                swal({
                  title: 'Room will be activated?',
                  type: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes, Activate it!'
                }).then((result) => {
                    if (result.value) {
                    this.form.put('/api/room-active/'+id).then(()=>{
                        Fire.$emit('afterCreate');
                            swal(
                              'Deleted!',
                              'Room has been Activated.',
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
            this.loadRoom();
            this.loadInactive();
            Fire.$on('afterCreate',()=>{
                this.loadRoom();
                this.loadInactive();
            });
            // setInterval(() => this.loadUser(),3000);
    }
  }
</script>
