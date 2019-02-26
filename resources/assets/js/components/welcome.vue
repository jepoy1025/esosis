<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title"><b class="pink">Successfully </b> Login</h3></div>

                    <div class="card-body">
                        <div class="error-page">
                        <h2 class="headline text-danger">HI!</h2>

                        <div class="error-content">
                          <h3>Mr./Ms. {{form.last_name}}, {{form.first_name}}</h3>

                          <p>
                            You are now using Lotus <b>ESOSIS</b>(Enrollment System w/ Online Student Information System) <b>Web Application</b>.<br>
                          </p>
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
        data(){
           
            return {  
                users:{},
                accountView: [],
                students:[],
                payments:{},
                subjects:{},
                transactions:{},
                first:'',
                second:'',
                third:'',
                fourth:'',
                user:{id:''},
                // userData: [], 
                 form: new Form({
                    id:'',
                    first_name : '',
                    middle_name : '',
                    last_name : '',
                    username : '',
                    role_id : '',
                    email: '',
                    password: '',
                    photo: '',
                    studentCode:''
                })
            }
            
        },
        methods: {
            userID(){
                this.user_id = this.form.id;
            },
            getUser(){
                axios.get("api/profile").then(({ data }) => (this.form.fill(data)));
                axios.get("api/profile").then(({ data }) => (this.user.id = data.id));
            },
        },
        created() {
            this.getUser();
            console.log(this.user.id);
            Fire.$on('afterCreate',()=>{
                //this.studentList();
            });
        }
    }
</script>

