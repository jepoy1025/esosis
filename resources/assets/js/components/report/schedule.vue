<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card card-info">
                    <div class="card-header"><h3 class="card-title"><b class="pink">Schedule </b> Report</h3>
                    <div class="card-tools">
                        <button class="btn btn-block btn-outline-primary btn-lg" @click="printAll" ><i class="fas fa-print fa-fw"></i> Print All Schedule</button>
                    </div>
                    </div>
                    <div class="card-body table-responsive p-0">
                    <table class="table table-hover">
                      <tbody>
                    <tr>
                        <th>Grade Level</th>
                        <th>Section</th>
                        <th>Advicer</th>
                        <th>Population</th>
                        <th>Status</th>
                        <th>Print</th>
                    </tr>
                    <tr v-for="room in rooms" :key="room.id">
                        <td>{{room.title}}</td>
                        <td>{{room.section}}</td>
                        <td>{{room.name}}</td>
                        <td>{{room.population}}</td>
                        <td>{{room.status}}</td>
                        <td>
                            <button href="" @click="view(room)" class="btn btn-default">
                            <i class="fas fa-print orange"></i>
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
                rooms: {},
                sched: {},
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
            printAll(){
                window.open('api/printAllSchedule/');
            },
            print(){
                window.open('/api/testPrint/');
            },
            loadRoom(){
                axios.get("api/room").then(({data})=>(this.rooms = data.data));
            },
            studentList(id){
                axios.get("/api/studentRoom/" + id).then(({data})=>(this.students = data.data));
                this.room_id = id;
                $('#studentModal').modal('show');
            },
            printList(){
                window.open('/api/testPrint/'+this.room_id);
            },
            view(room) {
                window.open(`/api/roomSchedule/${room.id}`)
            }
        },
        created() {
            this.loadRoom();
            console.log('Component mounted.')
        }
    }
</script>
