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
                          <h5 class="red" :hidden="not == '0'"><i class="fas fa-exclamation-circle red"></i> Oops! please check your notification tab.</h5>
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
                not:'',
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
                    notify:'',
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
                axios.get("api/profile").then(({ data }) => (this.form.fill(data), this.not = data.notify));
                axios.get("api/profile").then(({ data }) => (this.user.id = data.id, this.not = data.notify));
                console.log(this.form.notify);
             },
            notify(){
                var noti = this.not;
                console.log('yow');
                console.log(noti);
            }
        },
        created() {
            this.getUser();
            this.notify();
            Fire.$on('afterCreate',()=>{
                
            });
        }
    }
</script>

