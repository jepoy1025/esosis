<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card card-default">
                    <div class="card-header"><h3 class="card-title"><b class="pink">Class</b> List</h3></div>
                    <div class="card-body table-responsive p-0">
                    <table class="table table-hover">
                      <tbody>
                        <tr>
                            <th>ID</th>
                            <th>Grade Level</th>
                            <th>Section</th>
                            <th>Advicer</th>
                            <th>Action</th>
                        </tr>
                        <tr v-for="room in room" :key="room.id">
                            <td>{{room.id}}</td>
                            <td>{{room.title}}</td>
                            <td>{{room.section}}</td>
                            <td>{{room.name}}</td>
                            <td>
                                <button href="" @click="studentList(room.id)" class="btn btn-default">
                                <i class="fas fa-edit orange">View Students</i>
                                </button>
                            </td>
                        </tr>
                    </tbody></table>
                  </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="studentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Grading Table</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                 <table class="table table-hover">
                          <tbody>
                            <tr>
                                <th>First Name</th>
                                <th>Middle Name</th>
                                <th>Last Name</th>
                            </tr>
                            <tr v-for="user in students" :key="user.id">
                                    <td>{{user.first_name}}</td>
                                    <td>{{user.middle_name}}</td>
                                    <td>{{user.last_name}}</td>
                            </tr>
                            </tbody>
                        </table>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-submit" data-dismiss="modal" @click="printList()">Close</button>
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
                room_id:'',
                room: {},
                editMode : false,
                users : {},
                students : {},
                form: new Form({
                    id: '',
                    first: '',
                    second: '',
                    third: '',
                    fourth: '',
                })
            }
        },
        methods : {
            print(){
                window.open('/api/testPrint/');
            },
            loadRooms(){
                axios.get("api/room").then(({data})=>(this.room = data.data));
            },
            studentList(id){
                axios.get("/api/studentRoom/" + id).then(({data})=>(this.students = data.data));
                this.room_id = id;
                $('#studentModal').modal('show');
            },
            printList(){
                window.open('/api/testPrint/'+this.room_id);
            }
        },
        created() {
            this.loadRooms();
            console.log('Component mounted.')
        }
    }
</script>
