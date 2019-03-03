<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <br><br>
          <div class="card card-info">
            <div class="card-header">
              <h3 class="card-title">Notifications</h3>

              <div class="card-tools">
              </div>
              <!-- /.card-tools -->
            </div>
            <!-- /.card-header -->
            <div class="card-body p-0">
              <div class="mailbox-controls">
                <!-- /.float-right -->
              </div>
              <div class="table-responsive mailbox-messages">
                <table class="table table-hover table-striped">
                  <tbody>
                  <tr>
                    <td class="mailbox-name"><a href="read-mail.html">Admin</a></td>
                    <td class="mailbox-subject"><b>Header</b> - Header
                    </td>
                    <td class="mailbox-attachment"></td>
                    <td class="pull-right">
                        <button href="" class="btn btn-default">
                            <i class="fas fa-eye green"> View</i>
                        </button>
                        <button href="" class="btn btn-default">
                            <i class="fas fa-trash red"> Delete</i>
                        </button>
                    </td>
                    <td>
                        <span class="right badge badge-danger pull-right">New</span>
                    </td>
                  </tr>
                  </tbody>
                </table>
                <!-- /.table -->
              </div>
              <!-- /.mail-box-messages -->
            </div>
            <!-- /.card-body -->
            <div class="card-footer p-0">
            </div>
          </div>
          <!-- /. box -->
        </div>
        </div>
    </div>
</template>

<script>
    export default {
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
