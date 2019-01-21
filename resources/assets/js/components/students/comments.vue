<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card card-default">
                    <div class="card-header"><h4>{{student.last_name}}, {{student.first_name}}</h4>
                    </div>
    
                    <div class="card-body">
                        <form @submit.prevent="saveComment()">
                          <div class="modal-body">
                            <div class="form-group">
                            <label>First Grading:</label>
                              <textarea v-model="form.first" type="text" name="first" id="first"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('first') }"></textarea>
                              <has-error :form="form" field="first"></has-error>
                            </div>
                            <div class="form-group">
                            <label>Second Grading:</label>
                              <textarea v-model="form.second" type="text" name="second" id="second"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('second') }"></textarea>
                              <has-error :form="form" field="second"></has-error>
                            </div>
                            <div class="form-group">
                            <label>Third Grading:</label>
                              <textarea v-model="form.third" type="text" name="third" id="third"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('third') }"></textarea>
                              <has-error :form="form" field="third"></has-error>
                            </div>
                            <div class="form-group">
                            <label>Fourth Grading:</label>
                              <textarea v-model="form.fourth" type="text" name="fourth" id="fourth"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('fourth') }"></textarea>
                              <has-error :form="form" field="fourth"></has-error>
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal" @click="backStudent">Back</button>
                            <button type="submit" class="btn btn-success">Update Narrative Report</button>
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
                    first: '',
                    second: '',
                    third: '',
                    fourth: '',
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
                axios.get('/api/comment-list/' + this.$route.params.id).then(({data})=>(this.form.first = data.data.first,this.form.second = data.data.second,this.form.third = data.data.third,this.form.fourth = data.data.fourth,this.form.id = data.data.id));
            },
            getStudent(){
                axios.get('/api/student/' + this.$route.params.id).then(({data})=>(this.student = data.data));
            },
            backStudent(){
                this.$router.push("/grade");
            },

            saveComment() {
                this.$Progress.start();
                this.form.put('/api/comment/'+this.form.id)
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