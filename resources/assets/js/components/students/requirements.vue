<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card card-default"> 
                    <form @submit.prevent="saveComment()">
                    <div class="card-header"><h4>{{student.last_name}}, {{student.first_name}}</h4></div>
   
                    <div class="card-body">
                        
                            <input type="checkbox" id="form.form_137" v-model="form.form_137"/> <H3>FORM 137</H3>
                            <input type="checkbox" id="form.nso" v-model="form.nso"/> <h3>Birth certificate(PSA)</h3>
                            <input type="checkbox" id="form.picture2x2" v-model="form.picture2x2"/> <h3>Picture size 2x2</h3>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal" @click="backStudent">Back</button>
                            <button type="submit" class="btn btn-success">Update Student REquirements</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                student_id:'',
                comments:[],
                student:[],
                form: new Form({
                    id: '',
                    form_137:'',
                    nso:'',
                    picture2x2:'',
                })
            }

        },
        methods: {
            getID(){
                this.student_id = this.$route.params.id;
                console.log(this.student_id);
            },
            updateGrade(grade){
                this.form.reset();
                $('#gradeModal').modal('show');
                this.form.fill(grade);
            },
            getList(){
                axios.get('/api/requirements-list/' + this.$route.params.id).then(({data})=>(this.form.form_137 = data.data.form_137,this.form.nso = data.data.birth_cert,this.form.picture2x2 = data.data.photo2x2,this.form.id = data.data.id));
            },
            getStudent(){
                axios.get('/api/student/' + this.$route.params.id).then(({data})=>(this.student = data.data));
            },
            backStudent(){
                this.$router.push("/grade");
            },

            saveComment() {
                this.$Progress.start();
                this.form.put('/api/requirement/'+this.form.id)
                .then(()=>{
                  Fire.$emit('afterCreate');
                  this.$Progress.finish();
                })
                .catch(() => {
                  this.$Progress.fail();
                })
            },
            passData(){
                console.log(this.comments.first);
            }
        },
        created() {
            //this.getID(),
            this.getList(),
            this.getStudent(),
            this.passData(),
            Fire.$on('afterCreate',()=>{
                this.getList();
            });
        },
        mounted() {
            this.getList()
        }

    }
</script>