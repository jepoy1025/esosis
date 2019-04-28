<template>
    <div class="container col-12">
        
        <br>
        <div class="container col-12">
            <form @submit.prevent="insertStudent()">
          <div class="col-12">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title"><b class="pink">Please Fill The Form</b></h3>
                <!-- <form @submit.prevent="editMode ? updateLevel() : createLevel()"> -->
                  <div class="row">
                  <div class="col-lg-6 col-md-3">
                  <label class="pink">Applying for:</label>
                    <select name="payment" v-model="payment" id="grade_level" class="form-control"  @change="feeForm(payment)">
                      <option v-for="level in level" v-bind:value="level" :hidden="level.id == '0' || infos.grade_level_id > level.id" >{{level.title}}</option>
                    </select>
                  </div>
                  <div class="col-lg-6 col-md-3">
                  <label class="pink">Section:</label>
                    <select name="room" v-model="room" id="room" class="form-control" @change="checkRoom(room)"> 
                    <option v-for="section in section" v-bind:value="section" :hidden="section.grade_level != form.grade_level" >{{section.section}}</option>
                    </select>
                  </div>
                  <!-- <div class="col-lg-3 col-md-3">
                    <label class="pink">Section:</label>
                    <select name="payment" v-model="payment" id="grade_level" class="form-control"  @change="feeForm(payment)">
                      <option v-for="level in level" v-bind:value="level" :hidden="level.id == '0'" >{{level.title}}</option>
                    </select>
                  </div> -->
                 </div> 
                <div class="card-tools">
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="card card-info">
                  <div class="card-header">
                    <h3 class="card-title"></h3>
                  </div>
                  <div class="card-body" style="background-color: #A9A9A9;">
                    <div class="row">
                    <label>&nbsp&nbsp&nbsp Last School Attended</label>
                        <div class="row col-md-12 col-sm-12 col-xs-12">
                            <div class="form-group col-md-4 col-sm-12 col-xs-12">
                              <input v-model="form.schoolAttended" placeholder="School Name" type="text" name="schoolAttended" id="schoolAttended"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('schoolAttended') }">
                              <has-error :form="form" field="schoolAttended"></has-error>
                            </div>
                            <div class="form-group col-md-4 col-sm-12 col-xs-12">
                              <input v-model="form.schoolAttendedAddress" placeholder="School Address" type="text" name="schoolAttendedAddress" id="schoolAttendedAddress"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('schoolAttendedAddress') }">
                              <has-error :form="form" field="schoolAttendedAddress"></has-error>
                            </div>
                            <div class="form-group col-md-1 col-sm-12 col-xs-12">
                                <label>Year:</label>
                            </div>
                            <div class="form-group col-md-3 col-sm-12 col-xs-12">
                              <select name="schoolAttendedDate" v-model="form.schoolAttendedDate" id="schoolAttendedDate" class="form-control" :class="{ 'is-invalid': form.errors.has('schoolAttendedDate') }">
                                <option v-for="syList in syList" v-bind:value="syList.id" >{{syList.school_year}}</option>
                              </select>
                              <has-error :form="form" field="schoolAttendedDate"></has-error>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="padding-top: 20px">
                  <div class="col-md-12">
                      <button type="button" class="btn btn-block btn-secondary btn-lg" @click="processPayment()"><h3 class="pink">Next Step</h3></button>
                  </div>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
            <div class="modal fade" id="paymentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header" style="background-color: #A9A9A9;">
                <h4 class="modal-title"><b>{{form.last_name}}, {{form.first_name}} {{form.middle_name}}</b> <p> {{gradetitle}}</p></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body" id>
               <!--  <label>Student Requirements:</label>
                <div class="row">&nbsp&nbsp
                <div :hidden="form.grade_level < 5"><input type="checkbox" id="form.form137" v-model="form.form137">Form 137  </div>
                <input type="checkbox" id="form.nso" v-model="form.nso">NSO 
                <input type="checkbox" id="form.picture1x1" v-model="form.picture1x1">Picture 1x1 
                </div> -->
                <div class="form-group">
                    <label>Whole Year Fee:</label>
                  <input v-model="form.whole_year" placeholder="Whole Year Fee" type="number" name="whole_year" id="whole_year"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('whole_year') }" readonly>
                  <has-error :form="form" field="whole_year"></has-error>
                </div>
                <div class="form-group">
                    <label>miscellaneous:</label>
                  <input v-model="form.misc" placeholder="Whole Year Fee" type="number" name="misc" id="misc"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('misc') }" readonly>
                  <has-error :form="form" field="misc"></has-error>
                </div>
                <div class="form-group">
                    <label>Books Fee</label>
                  <input v-model="form.books" placeholder="Books Fee" type="number" name="books" id="books"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('books') }" readonly>
                  <has-error :form="form" field="books"></has-error>
                </div>
                <div class="form-group">
                    <label>Uniform Fee</label>
                  <input type="checkbox" id="checkbox" v-model="form.uniformCheck">
                  <input v-model="form.uniform" placeholder="Uniform Fee" type="number" name="uniform" id="uniform"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('uniform') }" readonly>
                  <has-error :form="form" field="uniform"></has-error>
                </div>
                <div class="form-group">
                    <label>Enrollment Fee</label>
                  <input v-model="form.min_downpayment" placeholder="Minimum Downpayment" type="number" name="min_downpayment" id="min_downpayment"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('min_downpayment') }" readonly>
                  <has-error :form="form" field="min_downpayment"></has-error>
                </div>
                <div class="form-group">
                    <label>Amount</label>
                  <input v-model="form.paidAmount" placeholder="Amount" type="number" name="paidAmount" id="paidAmount"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('paidAmount') }">
                  <has-error :form="form" field="paidAmount"></has-error>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Enroll Student</button>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>

</div>
</template>

<script>
    export default {
            data() {               
              return {
                pushId:'',
                tweenedNumber : 0,
                number : 0,
                count: 0,
                population: 0,
                level:{},
                section:{},
                syList:{},
                age:'',
                guardian: false,
                sisterCount:0,
                brotherCount:0,
                studentCount:0,
                room:[],
                payment:[],
                gradetitle:'',
                checked:'',
                dummy:'',
                infos:[],
                //age:'',
                form: new Form({
                    paidAmount:0,
                    student_type:1,
                    room_id:'',
                    grade_level : '',
                    first_name : '',
                    middle_name : '',
                    last_name: '',
                    address: '',
                    schoolAttended: '',
                    schoolAttendedAddress: '',
                    schoolAttendedDate: '',
                    grade_level : '',
                    whole_year : '',
                    misc :'',
                    books : '',
                    uniform : '',
                    min_downpayment : '',
                    pta: '',
                })
              }
            },
            methods: {
                loadStudent(){
                  axios.get('/api/infos/' + this.$route.params.id).then(({data})=>(this.infos = data.data));
                },
                loadLevel(){
                    axios.get("api/fee").then(({data})=>(this.level = data.data));
                    axios.get("api/room/").then(({data})=>(this.section = data.data));
                },

                loadStudentCount(){
                    axios.get("api/student-count").then(({data})=>(this.studentCount = data.data));
                },

                getDate(value){
                    var birthday = Date.parse(value);
                    var age = ~~((Date.now() - birthday) / (31557600000));
                    //var now = new Date();
                    this.age = age;
                    //this.age = now;
                },

                schoolyear(){
                  axios.get("api/syList").then(({data})=>(this.syList = data.data));
                },

                processPayment(){
                    this.form.first_name = this.infos.first_name;
                    this.form.middle_name = this.infos.middle_name;
                    this.form.last_name = this.infos.last_name;
                    $('#paymentModal').modal('show');      
                },

                onSelectFee(){
                    axios.get("api/fee/"+this.form.grade_level).then(({data})=>(this.payment = data.data));
                    
                },

                checkRoom(data){
                    //console.log(data);
                    this.form.room_id = data.id;
                    this.population = data.population;
                    var pop = data.population;
                    var rem = 30 - pop;
                    //console.log(pop);
                    if (pop > 25 && pop <= 29){
                        swal('Room has '+ pop+' already')
                    };
                    if (pop >= 30){
                      swal({
                        title: 'Population reach the limit',
                        text: "create A new room or Proceed Anyway",
                        type: 'warning',
                        showCancelButton: true,
                        cancelButtonText:'Proceed',
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#85e085',
                        confirmButtonText: 'Create New Room!'
                      }).then((result) => {
                        if (result.value) {
                          swal(
                            'Redirecting!',
                            'To Rooms Tab.',
                            'success',
                            location.href = '/rooms',
                          )
                        }
                      })
                    };
                },

                feeForm(fee){
                    this.room= [];
                    this.form.grade_level = fee.grade_level;
                    this.form.whole_year = fee.whole_year;
                    this.form.misc = fee.misc;
                    this.form.books = fee.books;
                    this.form.uniform = fee.uniform;
                    this.form.min_downpayment = fee.min_downpayment;
                    this.form.pta = fee.pta;
                    this.gradetitle = fee.title;  
                },

                insertStudent(){
                  if(this.form.paidAmount > this.form.min_downpayment){
                    swal.fire('The amount you entered CAP the Enrollment Fee');
                  }else{
                    this.$Progress.start();
                    this.form.put('/api/transferedEnroll/'+this.$route.params.id)
                    .then(({data})=>{
                        this.pushId = data.data;
                        $('#paymentModal').modal('hide');
                        toast({
                          type: 'success',
                          title: 'Student Added Succesfully'
                        });
                        this.$Progress.finish();
                        this.form.reset();
                        window.open('/api/transferEnrollPrint/'+this.$route.params.id);
                        //window.open('/api/enrollmentPrint/'+this.pushId);
                        //this.$router.push('/')

                    })
                    .catch(()=>{
                      this.$Progress.fail();
                      $('#paymentModal').modal('hide');
                      toast({
                          type: 'error',
                          title: 'Something Went Wrong!'
                        });
                    })
                  }
                }
            },
            created() {
                //this.calculateAge();
                this.loadLevel();
                this.schoolyear();
                this.loadStudent();
            }
    }
</script>
