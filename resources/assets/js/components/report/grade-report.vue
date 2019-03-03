<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card card-info">
                    <div class="card-header"><h3 class="card-title">Grade Report</h3></div>
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover">
                            <tbody>
                            <tr>
                                <th>Grade Level</th>
                                <th></th>
                            </tr>
                            <tr v-for="level in levels" :key="level.id" :hidden="level.id == 0">
                                <td>{{level.title}}</td>
                                <td>
                                    <button href="#" @click.prevent="view(level)" class="btn btn-default">
                                        <i class="fas fa-eye orange">View</i>
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
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
                levels: [],
                form: new Form({
                    id: '',
                    name : '',
                    educational_attainment : '',
                    civil_service : '',
                    marital_status: '',
                    status: ''
                })
            }
        },
        methods: {
            loadLevel() {
                axios.get("api/level").then(({data}) => (this.levels = data.data));
            },
            view(level) {
                window.open('/api/gradeReport/' + level.id);
            },
        },
        created() {
            this.loadLevel();
            console.log('Component mounted.')
        }
    }
</script>
