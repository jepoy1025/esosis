<template>
    <div class="container">
        <br><br>
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card card-info">
                    <div class="card-header"><h1>Student Information</h1>
                        <div class="card-tools">
                            <button class="btn btn-block btn-outline-danger btn-lg" @click="back()" ><i class="fas fa-undo-alt fa-fw"></i> Back</button>
                        </div>
                    </div>
                    
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                            <div class="card card-default">
                              <div class="card-header">
                                <h3 class="card-title">Basic Information</h3>

                                <div class="card-tools">
                                  <button type="button" class="btn btn-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                  </button>
                                </div>
                                <!-- /.card-tools -->
                              </div>
                              <!-- /.card-header -->
                              <div class="card-body" style="display: block;">
                                <div class="row">
                                <div class="col-md-6">
                                    <div class="callout callout-default">
                                        <p>Name: <b>{{infos.last_name | upText}}, {{infos.first_name | upText}}</b></p>
                                        <p>Grade Level: <b>{{infos.title}}</b></p>
                                    </div>
                                    <div class="callout callout-default">
                                        <p>Birth Date: <b>{{infos.birth_date}}</b></p>
                                        <p>Age: <b>{{age}}</b></p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="callout callout-default">
                                        <p v-show="infos.status == 1">Status: <b>Enrolled</b></p>
                                        <p v-show="infos.status == 2">Status: <b>Not Enrolled</b></p>
                                        <p v-show="infos.status == 3">Status: <b>Transfered</b></p>
                                        <p v-show="infos.status == 4">Status: <b>Dropped</b></p>
                                        <p>Student ID: <b>{{infos.student_id}}</b></p>
                                    </div>
                                    <div class="callout callout-default">
                                        <p>Home Address: <b>{{infos.address}}</b></p>
                                        <p>Gender: <b>{{infos.gender}}</b></p>
                                    </div>
                                </div>
                                </div>
                              </div>
                              <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                          </div>
                        </div>
                        <div class="row" v-show="lastAttended.pastSchool != null">
                            <div class="col-md-12">
                            <div class="card card-info collapsed-card">
                              <div class="card-header">
                                <h3 class="card-title">Last School Attended</h3>

                                <div class="card-tools">
                                  <button type="button" class="btn btn-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                  </button>
                                </div>
                                <!-- /.card-tools -->
                              </div>
                              <!-- /.card-header -->
                              <div class="card-body" style="display: none;">
                                <div class="row">
                                <div class="col-md-6">
                                    <div class="callout callout-default">
                                        <p>School: <b>{{lastAttended.pastSchool}}</b></p>
                                        <p>Address: <b>{{lastAttended.schoolAddress}}</b></p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="callout callout-default">
                                        <H4>School Year:</H4>
                                        <h4>{{lastAttended.school_year}}</h4>
                                    </div>
                                </div>
                                </div>
                              </div>
                              <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                          </div>
                        </div>
                        <div class="row" v-show="siblings.length > 0">
                            <div class="col-md-12">
                            <div class="card card-info collapsed-card">
                              <div class="card-header">
                                <h3 class="card-title">Siblings</h3>

                                <div class="card-tools">
                                  <button type="button" class="btn btn-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                  </button>
                                </div>
                                <!-- /.card-tools -->
                              </div>
                              <!-- /.card-header -->
                              <div class="card-body" style="display: none;">
                                <div class="card-body table-responsive p-0">
                                    <table class="table table-hover">
                                      <tbody><tr>
                                        <th>Name</th>
                                        <th>Relationship</th>
                                        <th>Age</th>
                                      </tr>
                                      <tr v-for="sibling in siblings" :key="sibling.id">
                                        <td>{{sibling.name}}</td>
                                        <td>{{sibling.type}}</td>
                                        <td>{{sibling.birth_date}}</td>
                                      </tr>
                                    </tbody></table>
                                  </div>
                              </div>
                              <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                          </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                            <div class="card card-info collapsed-card">
                              <div class="card-header">
                                <h3 class="card-title">Parent/Guardian Background</h3>

                                <div class="card-tools">
                                  <button type="button" class="btn btn-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                  </button>
                                </div>
                                <!-- /.card-tools -->
                              </div>
                              <!-- /.card-header -->
                              <div class="card-body" style="display: none;">
                                <div class="card-body table-responsive p-0">
                                <table class="table table-hover">
                                  <tbody><tr>
                                    <th>Name</th>
                                    <th>Relationship</th>
                                    <th>Occupation</th>
                                    <th>Company</th>
                                    <th>Monthly Income</th>
                                  </tr>
                                  <tr v-for="parent in parents" :key="parent.id">
                                    <td>{{parent.name}}</td>
                                    <td>{{parent.type}}</td>
                                    <td>{{parent.occupation}}</td>
                                    <td>{{parent.company}}</td>
                                    <td>{{parent.monthly_income}}</td>
                                  </tr>
                                </tbody></table>
                              </div>
                              </div>
                              <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                          </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                            <div class="card card-info collapsed-card">
                              <div class="card-header">
                                <h3 class="card-title">Emergency Contact</h3>

                                <div class="card-tools">
                                  <button type="button" class="btn btn-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                  </button>
                                </div>
                                <!-- /.card-tools -->
                              </div>
                              <!-- /.card-header -->
                              <div class="card-body" style="display: none;">
                                <div class="row">
                                <div class="col-md-6">
                                    <div class="callout callout-default">
                                        <p>Name: <b>{{emergency.name}}</b></p>
                                        <p>Relationship: <b>{{emergency.relationship}}</b></p>
                                        <p>Address: <b>{{emergency.address}}</b></p>
                                    </div>
                                </div>
                                <div class="col-md-6">\
                                    <div class="callout callout-default">
                                        <p>Contact Number: <b>{{emergency.contact}}</b></p>
                                        <p>Alternative: <b>{{emergency.alt_contact}}</b></p>
                                    </div>
                                </div>
                                </div>
                              </div>
                              <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                          </div>
                        </div>
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
                infos:[],
                age:'',
                parents:{},
                emergency:[],
                siblings:{},
                lastAttended:[],
                form: new Form({
                })
            }
        },
        methods: { 
            getInformation(){
                axios.get('/api/infos/' + this.$route.params.id).then(({data})=>(this.infos = data.data));
            },
            getAge(){
                axios.get('/api/age/' + this.$route.params.id).then(({data})=>(this.age = data.data));  
            },
            getParents(){
                axios.get('/api/parents/' + this.$route.params.id).then(({data})=>(this.parents = data.data)); 
            },
            getEmergency(){
                axios.get('/api/emergency/' + this.$route.params.id).then(({data})=>(this.emergency = data.data)); 
            },
            getSiblings(){
                axios.get('/api/siblings/' + this.$route.params.id).then(({data})=>(this.siblings = data.data));  
            },
            getLastAttended(){
                axios.get('/api/lastAttended/' + this.$route.params.id).then(({data})=>(this.lastAttended = data.data)); 
            },
            back(){
              this.$router.push("/grade");
            }
        },
        created() {
            this.getInformation();
            this.getAge();
            this.getParents();
            this.getEmergency();
            this.getSiblings();
            this.getLastAttended();
            Fire.$on('afterCreate',()=>{
                this.loadUser();
            });
            // setInterval(() => this.loadUser(),3000);
        }
    }
</script>
