<template>
    <div class="container">
        <br>
        <div class="row">
          <div class="col-12">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title"><b class="pink">School Fees</b> utilities</h3>

                <div class="card-tools">
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover">
                  <tbody>
                    <tr>
                        <th>ID</th>
                        <th>Grade Level</th>
                        <th>Whole Year Fee</th>
                        <th>miscellaneous</th>
                        <th>Books</th>
                        <th>Uniform</th>
                        <th>Downpayment</th>
                        <th>Action</th>
                    </tr>
                    <tr v-for="fee in fee" :key="fee.id">
                        <td>{{fee.id}}</td>
                        <td>{{fee.title}}</td>
                        <td>{{fee.whole_year}}</td>
                        <td>{{fee.misc}}</td>
                        <td>{{fee.books}}</td>
                        <td>{{fee.uniform}}</td>
                        <td>{{fee.min_downpayment}}</td>
                        <td>
                            <button href="" @click="editModal(fee)" class="btn btn-default">
                            <i class="fas fa-user-cog orange"></i>
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
        <div class="modal fade" id="feeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 v-show="editMode" class="modal-title" id="exampleModalLabel">Updating Teacher</h5>
                <h5 v-show="!editMode" class="modal-title" id="exampleModalLabel">Adding Teacher</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form @submit.prevent="updateFee()">
              <div class="modal-body">
                <div class="form-group">
                  <input v-model="form.whole_year" placeholder="Whole Year Fee" type="number" name="whole_year" id="whole_year"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('whole_year') }">
                  <has-error :form="form" field="whole_year"></has-error>
                </div>
                <div class="form-group">
                  <input v-model="form.misc" placeholder="miscellaneous" type="number" name="misc" id="misc"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('misc') }">
                  <has-error :form="form" field="misc"></has-error>
                </div>
                <div class="form-group">
                  <input v-model="form.books" placeholder="Books Fee" type="number" name="books" id="books"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('books') }">
                  <has-error :form="form" field="books"></has-error>
                </div>
                <div class="form-group">
                  <input v-model="form.uniform" placeholder="Uniform Fee" type="number" name="uniform" id="uniform"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('uniform') }">
                  <has-error :form="form" field="uniform"></has-error>
                </div>
                <div class="form-group">
                  <input v-model="form.min_downpayment" placeholder="Minimum Downpayment" type="number" name="min_downpayment" id="min_downpayment"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('min_downpayment') }">
                  <has-error :form="form" field="min_downpayment"></has-error>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success">Update Fee</button>
              </div>
            </form>
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
                fee : {},
                level:{},
                form: new Form({
                    id: '',
                    grade_level : '',
                    whole_year : '',
                    misc: '',
                    books : '',
                    uniform : '',
                    min_downpayment : ''
                })
            }
        },
    methods: {
      editModal(fee){
                this.form.reset();
                $('#feeModal').modal('show');
                this.form.fill(fee);
            },
      loadFee(){
                axios.get("api/fee").then(({data})=>(this.fee = data.data));
            },
      loadLevel(){
                axios.get("api/level").then(({data})=>(this.level = data.data));
            },
      updateFee(){
                this.$Progress.start();
                this.form.put('/api/fee/'+this.form.id)
                .then(()=>{
                  Fire.$emit('afterCreate');
                            swal(
                              'Success!',
                              'Fee Updated.',
                              'success'
                            )
                  this.$Progress.finish();
                  $('#feeModal').modal('hide');
                })
                .catch(() => {
                  this.$Progress.fail();
                })
            },
    },
    
    created(){
            this.loadFee();
            this.loadLevel();
            Fire.$on('afterCreate',()=>{
                this.loadFee();
            });
            // setInterval(() => this.loadUser(),3000);
    }
  }
</script>
