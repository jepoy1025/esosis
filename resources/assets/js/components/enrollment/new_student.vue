<template>
    <div class="container">
        
        <br>
        <div class="row">
            <form @submit.prevent="insertStudent()">
          <div class="col-12">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title"><b class="pink">Registration</b> form</h3>
                <!-- <form @submit.prevent="editMode ? updateLevel() : createLevel()"> -->
                  <div class="row">
                  <div class="col-lg-3 col-md-3">
                  <label class="pink">Applying for:</label>
                    <select name="payment" v-model="payment" id="grade_level" class="form-control"  @change="feeForm(payment)">
                      <option v-for="level in level" v-bind:value="level" :hidden="level.id == '0'" >{{level.title}}</option>
                    </select>
                  </div>
                  <div class="col-lg-3 col-md-3">
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
                    <h3 class="card-title"><b class="pink">Student</b> Information</h3>
                  </div>
                  <div class="card-body" style="background-color: #A9A9A9;">
                    <label>Complete Name:</label>
                    <div class="row">
                        <div class="form-group col-md-4 col-sm-6 col-xs-12">
                          <input v-model="form.first_name" placeholder="First Name" type="text" name="first_name" id="first_name"
                            class="form-control" :class="{ 'is-invalid': form.errors.has('first_name') }">
                          <has-error :form="form" field="first_name"></has-error>
                        </div>
                        <div class="form-group col-md-4 col-sm-6 col-xs-12">
                          <input v-model="form.middle_name" placeholder="Middle Name" type="text" name="middle_name" id="middle_name"
                            class="form-control" :class="{ 'is-invalid': form.errors.has('middle_name') }">
                          <has-error :form="form" field="middle_name"></has-error>
                        </div>
                        <div class="form-group col-md-4 col-sm-6 col-xs-12">
                          <input v-model="form.last_name" placeholder="Last Name" type="text" name="last_name" id="last_name"
                            class="form-control" :class="{ 'is-invalid': form.errors.has('last_name') }">
                          <has-error :form="form" field="last_name"></has-error>
                        </div>
                    </div>
                    <label>Complete Address</label>
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                          <input v-model="form.address" placeholder="" type="text" name="address" id="address"
                            class="form-control" :class="{ 'is-invalid': form.errors.has('address') }">
                          <has-error :form="form" field="address"></has-error>
                        </div>
                    </div>
                    <div class="row" :hidden="form.grade_level < '4'">
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
                                <label>Date:</label>
                            </div>
                            <div class="form-group col-md-3 col-sm-12 col-xs-12">
                              <input v-model="form.schoolAttendedDate" placeholder="" type="date" name="schoolAttendedDate" id="schoolAttendedDate"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('schoolAttendedDate') }">
                              <has-error :form="form" field="schoolAttendedDate"></has-error>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-2 col-sm-6 col-xs-12">
                            <label>Gender</label>
                          <select name="gender" v-model="form.gender" id="gender" class="form-control" :class="{ 'is-invalid': form.errors.has('gender') }">
                              <option value="married">Male</option>
                              <option value="single">Female</option>
                          </select>
                          <has-error :form="form" field="gender"></has-error>
                        </div>
                        <div class="form-group col-md-4 col-sm-6 col-xs-12">
                            <label>Birth Date</label>
                          <input @input="getDate(form.birth_date)" v-model="form.birth_date" placeholder="" type="date" value="" name="birth_date" id="birth_date"
                            class="form-control" :class="{ 'is-invalid': form.errors.has('birth_date') }">
                          <has-error :form="form" field="birth_date"></has-error>
                        </div>
                        <div class="form-group col-md-2 col-sm-12 col-xs-12">
                            <label>Age</label>
                          <input v-bind:value="age" placeholder="" type="text" name="age" id="age"
                            class="form-control" :class="{ 'is-invalid': form.errors.has('age') }">
                          <has-error :form="form" field="age"></has-error>
                        </div>
                        <div class="form-group col-md-2 col-sm-6 col-xs-12">
                            <label>Sisters</label>
                          <input @change="sisterInput()" v-model="form.noOfSisters" placeholder="0" type="text" name="noOfSisters" id="noOfSisters"
                            class="form-control" :class="{ 'is-invalid': form.errors.has('noOfSisters') }">
                          <has-error :form="form" field="noOfSisters"></has-error>
                        </div>
                        <div class="form-group col-md-2 col-sm-6 col-xs-12">
                            <label>Brothers</label>
                          <input @change="brotherInput()" v-model="form.noOfBrothers" placeholder="0" type="text" name="noOfBrothers" id="noOfBrothers"
                            class="form-control" :class="{ 'is-invalid': form.errors.has('noOfBrothers') }">
                          <has-error :form="form" field="noOfBrothers"></has-error>
                        </div>
                    </div>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <div class="card-body" :hidden="form.noOfBrothers < '1' && form.noOfSisters < '1'">
                <div class="card card-info">
                  <div class="card-header">
                    <h3 class="card-title"><b class="pink">Siblings</b> Information</h3>
                  </div>
                  <div class="card-body" style="background-color: #A9A9A9;">

                    <div :hidden="form.noOfSisters < '1'">
                        <label>Sisters Information</label>
                          <div class="row" v-for='n in sisterCount'>
                            <div class="form-group col-md-8 col-sm-6 col-xs-12">
                              <input v-model="form.sistersName[n]" placeholder="Sister Fullname" type="text" name="sistersName[n]" id="sistersName[n]"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('sistersName[n]') }">
                              <has-error :form="form" field="sistersName[n]"></has-error>
                            </div>
                            <div class="form-group col-md-4 col-sm-6 col-xs-12">
                              <input v-model="form.sistersDob[n]" placeholder="" type="date" value="" name="sistersDob[n]" id="sistersDob[n]"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('sistersDob[n]') }">
                              <has-error :form="form" field="sistersDob[n]"></has-error>
                            </div>
                          </div>             
                    </div>
                    <div :hidden="form.noOfBrothers < '1'">
                        <label>Brothers Information</label>
                           <div class="row" v-for='n in brotherCount'>
                            <div class="form-group col-md-8 col-sm-6 col-xs-12">
                              <input v-model="form.brothersName[n]" placeholder="Brother Fullname" type="text" name="brothersName[n]" id="brothersName[n]"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('brothersName[n]') }">
                              <has-error :form="form" field="brothersName[n]"></has-error>
                            </div>
                            <div class="form-group col-md-4 col-sm-6 col-xs-12">
                              <input v-model="form.brothersDob[n]" placeholder="" type="date" value="" name="brothersDob[n]" id="brothersDob[n]"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('brothersDob[n]') }">
                              <has-error :form="form" field="brothersDob[n]"></has-error>
                            </div>
                          </div>   
                    </div>
                  </div>
                </div>
            </div>
            <div class="card-body">
                <div class="card card-info">
                  <div class="card-header">
                    <h3 class="card-title"><b class="pink">Parent</b> Background</h3>
                    <div class="card-tools">
                        <label class="pink">Check If the student have no Parent</label><br>
                        Click here: <input type="checkbox" id="checkbox" v-model="form.guardianCheck" @onClick="guardianSelect()">
                    </div>
                  </div>
                  <div class="card-body" style="background-color: #A9A9A9;" :hidden="form.guardianCheck == true">
                    <label>Father Background</label>
                    <div class="row">
                        <div class="form-group col-md-3 col-sm-6 col-xs-12">
                            <input v-model="form.fathersName" placeholder="Full Name" type="text" name="fathersName" id="fathersName"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('fathersName') }">
                            <has-error :form="form" field="fathersName"></has-error>
                        </div>
                        <div class="form-group col-md-3 col-sm-6 col-xs-12">
                            <input v-model="form.fathersSourceIncome" placeholder="Source of Income" type="text" name="fathersSourceIncome" id="fathersSourceIncome"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('fathersSourceIncome') }">
                            <has-error :form="form" field="fathersSourceIncome"></has-error>
                        </div> 
                        <div class="form-group col-md-3 col-sm-6 col-xs-12">
                            <input v-model="form.fathersCompany" placeholder="Company" type="text" name="fathersCompany" id="fathersCompany"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('fathersCompany') }">
                            <has-error :form="form" field="fathersCompany"></has-error>
                        </div>
                        <div class="form-group col-md-3 col-sm-6 col-xs-12">
                            <input v-model="form.fathersMonthlyIncome" placeholder="Monthly Income" type="number" name="fathersMonthlyIncome" id="fathersMonthlyIncome"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('fathersMonthlyIncome') }">
                            <has-error :form="form" field="fathersMonthlyIncome"></has-error>
                        </div> 
                    </div>
                    <label>Mother Background</label>
                    <div class="row">
                        <div class="form-group col-md-3 col-sm-6 col-xs-12">
                            <input v-model="form.mothersName" placeholder="Full Name" type="text" name="mothersName" id="mothersName"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('mothersName') }">
                            <has-error :form="form" field="mothersName"></has-error>
                        </div>
                        <div class="form-group col-md-3 col-sm-6 col-xs-12">
                            <input v-model="form.mothersSourceIncome" placeholder="Source of Income" type="text" name="mothersSourceIncome" id="mothersSourceIncome"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('mothersSourceIncome') }">
                            <has-error :form="form" field="mothersSourceIncome"></has-error>
                        </div> 
                        <div class="form-group col-md-3 col-sm-6 col-xs-12">
                            <input v-model="form.mothersCompany" placeholder="Company" type="text" name="mothersCompany" id="mothersCompany"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('mothersCompany') }">
                            <has-error :form="form" field="mothersCompany"></has-error>
                        </div>
                        <div class="form-group col-md-3 col-sm-6 col-xs-12">
                            <input v-model="form.mothersMonthlyIncome" placeholder="Monthly Income" type="number" name="mothersMonthlyIncome" id="mothersMonthlyIncome"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('mothersMonthlyIncome') }">
                            <has-error :form="form" field="mothersMonthlyIncome"></has-error>
                        </div> 
                    </div>   
                  </div>
                  <div class="card-body" style="background-color: #A9A9A9;" :hidden="form.guardianCheck == false">
                    <label>Guardian Background</label>
                    <div class="row">
                        <div class="form-group col-md-3 col-sm-6 col-xs-12">
                            <input v-model="form.guardiansName" placeholder="Full Name" type="text" name="guardiansName" id="guardiansName"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('guardiansName') }">
                            <has-error :form="form" field="guardiansName"></has-error>
                        </div>
                        <div class="form-group col-md-3 col-sm-6 col-xs-12">
                            <input v-model="form.guardiansSourceIncome" placeholder="Source of Income" type="text" name="guardiansSourceIncome" id="guardiansSourceIncome"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('guardiansSourceIncome') }">
                            <has-error :form="form" field="guardiansSourceIncome"></has-error>
                        </div> 
                        <div class="form-group col-md-3 col-sm-6 col-xs-12">
                            <input v-model="form.guardiansCompany" placeholder="Company" type="text" name="guardiansCompany" id="guardiansCompany"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('guardiansCompany') }">
                            <has-error :form="form" field="guardiansCompany"></has-error>
                        </div>
                        <div class="form-group col-md-3 col-sm-6 col-xs-12">
                            <input v-model="form.guardiansMonthlyIncome" placeholder="Monthly Income" type="number" name="guardiansMonthlyIncome" id="guardiansMonthlyIncome"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('guardiansMonthlyIncome') }">
                            <has-error :form="form" field="guardiansMonthlyIncome"></has-error>
                        </div> 
                    </div> 
                  </div>
                </div>
            </div>
            <div class="card-body">
                <div class="card card-info">
                  <div class="card-header">
                    <h3 class="card-title"><b class="pink">Emergency Contact</b> information</h3>
                  </div>
                  <div class="card-body" style="background-color: #A9A9A9;">
                    <div class="row">
                        <div class="form-group col-md-4 col-sm-6 col-xs-12">
                            <input v-model="form.emergencyName" placeholder="Full Name" type="text" name="emergencyName" id="emergencyName"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('emergencyName') }">
                            <has-error :form="form" field="emergencyName"></has-error>
                        </div>
                        <div class="form-group col-md-4 col-sm-6 col-xs-12">
                            <input v-model="form.emergencyRelationship" placeholder="Relationship" type="text" name="emergencyRelationship" id="emergencyRelationship"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('emergencyRelationship') }">
                            <has-error :form="form" field="emergencyRelationship"></has-error>
                        </div>
                        <div class="form-group col-md-4 col-sm-6 col-xs-12">
                            <input v-model="form.emergencyContact" placeholder="Contact Number" type="number" name="emergencyContact" id="emergencyContact"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('emergencyContact') }">
                            <has-error :form="form" field="emergencyContact"></has-error>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-8 col-sm-6 col-xs-12">
                            <input v-model="form.emergencyAddress" placeholder="Complete Address" type="text" name="emergencyAddress" id="emergencyAddress"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('emergencyAddress') }">
                            <has-error :form="form" field="emergencyAddress"></has-error>
                        </div>
                        <div class="form-group col-md-4 col-sm-6 col-xs-12">
                            <input v-model="form.emergencyAltContact" placeholder="Alternative Contact Number" type="number" name="emergencyAltContact" id="emergencyAltContact"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('emergencyAltContact') }">
                            <has-error :form="form" field="emergencyAltContact"></has-error>
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
            <!-- /.card -->
          </div>
        </div>
            <div class="modal fade" id="paymentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content" id="printMe">
              <div class="modal-header" style="background-color: #A9A9A9;">
                <h4 class="modal-title pink"><b>{{form.last_name}}, {{form.first_name}} {{form.middle_name}}</b> <p> {{gradetitle}}</p></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body" id>
                <label>Student Requirements:</label>
                <div class="row">&nbsp&nbsp
                <div :hidden="form.grade_level < 5">Form 137 :  <input type="checkbox" id="form.form137" v-model="form.form137"></div>
                NSO : <input type="checkbox" id="form.nso" v-model="form.nso">
                Picture 1x1 : <input type="checkbox" id="form.picture1x1" v-model="form.picture1x1">
                </div>
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
                    <label>Minimum Downpayment For This Transaction</label>
                  <input v-model="form.min_downpayment" placeholder="Minimum Downpayment" type="number" name="min_downpayment" id="min_downpayment"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('min_downpayment') }" readonly>
                  <has-error :form="form" field="min_downpayment"></has-error>
                </div>
                <h5>Student Code for SIS: {{form.student_code}}</h5>
                <div class="form-group">
                    <label>Amount</label>
                  <input v-model="form.paidAmount" placeholder="Amount" type="number" name="paidAmount" id="paidAmount"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('paidAmount') }">
                  <has-error :form="form" field="paidAmount"></has-error>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary" v-print="'#printMe'">Enroll Student</button>
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
                age:'',
                guardian: false,
                sisterCount:0,
                brotherCount:0,
                studentCount:0,
                room:[],
                payment:[],
                gradetitle:'',
                checked:'',
                //age:'',
                form: new Form({
                    paidAmount:0,
                    student_type:1,
                    room_id:'',
                    student_id: '',
                    grade_level : '',
                    first_name : '',
                    middle_name : '',
                    last_name: '',
                    address: '',
                    schoolAttended: '',
                    schoolAttendedAddress: '',
                    schoolAttendedDate: '',
                    gender: '',
                    birth_date: '',
                    noOfSisters:0,
                    noOfBrothers:0,
                    sistersName: [],
                    sistersDob:[],
                    brothersName: [],
                    brothersDob: [],
                    parent_id: [],
                    uniformCheck:false,
                    guardianCheck:'',
                    fathersName:'',
                    fathersSourceIncome:'',
                    fathersCompany:'',
                    fathersMonthlyIncome:'',
                    mothersName:'',
                    mothersSourceIncome:'',
                    mothersCompany:'',
                    mothersMonthlyIncome:'',
                    guardiansName:'',
                    guardiansSourceIncome:'',
                    guardiansCompany:'',
                    guardiansMonthlyIncome:'',
                    emergencyName:'',
                    emergencyRelationship:'',
                    emergencyContact:'',
                    emergencyAddress:'',
                    emergencyAltContact:'',
                    grade_level : '',
                    whole_year : '',
                    misc :'',
                    books : '',
                    uniform : '',
                    min_downpayment : '',
                    form137: false,
                    nso: false,
                    picture1x1: false,
                    student_code:'',
                })
              }
            },
            methods: {
                rndStr() {
                    let text = " "
                    let chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                  
                    for( let i=0; i < 10; i++ ) {
                      text += chars.charAt(Math.floor(Math.random() * chars.length))
                    }

                    this.form.student_code = text;
                    
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
                sisterInput(){
                  if(this.form.noOfSisters != null){
                    this.sisterCount = parseInt(this.form.noOfSisters);
                  }
                },
                brotherInput(){
                  if(this.form.noOfBrothers != null){
                    this.brotherCount = parseInt(this.form.noOfBrothers);
                  }
                },
                processPayment(){
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
                    this.gradetitle = fee.title;
                    
                },
                insertStudent(){
                    this.$Progress.start();
                    this.form.post('api/student')
                    .then(({data})=>{
                        this.pushId = data.data;
                        $('#paymentModal').modal('hide');
                        toast({
                          type: 'success',
                          title: 'Student Added Succesfully'
                        });
                        this.$Progress.finish();
                        this.form.reset();
                        this.$router.push('/')

                    })
                    .catch(()=>{
                      this.$Progress.fail();
                      $('#paymentModal').modal('hide');
                      toast({
                          type: 'error',
                          title: 'Something Went Wrong!'
                        });
                    })
                },
            },
            created() {
                //this.calculateAge();
                this.loadLevel();
                this.rndStr();
            }
    }
</script>
