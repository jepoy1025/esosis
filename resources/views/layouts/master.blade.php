<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="csrf-token" content="{{ csrf_token() }}">

  <title>Lotus | ESOSIS</title>

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="/css/app.css">
  <style>
    a:link {
      text-decoration: none;
    }

    a:visited {
      text-decoration: none;
    }

    a:hover {
      text-decoration: underline;
    }

    a:active {
      text-decoration: underline;
    }
  </style>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper" id="app">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand bg-white navbar-light border-bottom">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fa fa-bars pink"></i></a>
      </li>
    </ul>

    <!-- SEARCH FORM -->
{{--     <form class="form-inline ml-3">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" @keyup="searchit" v-model="search" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-navbar" @click="searchit">
            <i class="fa fa-search pink"></i>
          </button>
        </div>
      </div>
    </form> --}}
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="/img/logo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light pink">Lotus_<b>ESOSIS</b></span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="/img/user_img.png" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">{{ Auth::user()->last_name }}, {{Auth::user()->first_name}}</a>
          @can('isSponsor')
            <p class="pink">Sponsor</p>
          @endcan
          @can('isNormal')
            <p class="pink">Parent</p>
          @endcan
          @can('isAdmin')
            <p class="pink">Admin</p>
          @endcan
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          @can('isNormal')
            <li class="nav-item">
            <router-link to="/studentList" class="nav-link">
              <i class="nav-icon fas fa-clipboard-list pink"></i>
              <p class="pink">
                Students List
              </p>
            </router-link>
            </li>
            <li class="nav-item">
            <router-link to="/sis_announce/{{ Auth::user()->id }}" class="nav-link">
              <i class="nav-icon fas fa-bullhorn pink"></i>
              <p class="pink">
                School Notification 
                @if(Auth::user()->notify == 1)
                <span class="right badge badge-danger pull-right">!</span>
                @else
                @endif
              </p>

            </router-link>
            </li>
          @endcan
          @can('isSponsor')
            <li class="nav-item">
            <router-link to="/studentList" class="nav-link">
              <i class="nav-icon fas fa-clipboard-list pink"></i>
              <p class="pink">
                Students List
              </p>
            </router-link>
            </li>            
            {{-- <li class="nav-item">
            <router-link to="/addStudent" class="nav-link">
              <i class="nav-icon fas fa-user-plus pink"></i>
              <p class="pink">
                Add Students
              </p>
            </router-link>
            </li> --}}
          @endcan
          @can('isAdmin')
          <li class="nav-item">
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-address-book pink"></i>
              <p class="pink">
                Enrollment
                <i class="right fa fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <router-link to="/new_student" class="nav-link">
                  <i class="fas fa-file cyan"></i>
                  <p class="cyan">New Student</p>
                </router-link>
              </li>
              <li class="nav-item">
                <router-link to="/old_student" class="nav-link">
                  <i class="fas fa-folder-open cyan"></i>
                  <p>Old Student</p>
                </router-link>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-users pink"></i>
              <p class="pink">
                Student Menu
                <i class="right fa fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <router-link to="/grade" class="nav-link">
                  <i class="fas fa-file cyan"></i>
                  <p class="cyan">Student Tab</p>
                </router-link>
              </li>
              <li class="nav-item">
                <router-link to="/drop_student" class="nav-link">
                  <i class="fas fa-folder-open cyan"></i>
                  <p>Dropped</p>
                </router-link>
              </li>
              <li class="nav-item">
                <router-link to="/transfered" class="nav-link">
                  <i class="fas fa-folder-open cyan"></i>
                  <p>Transfered</p>
                </router-link>
              </li>
            </ul>
          </li>
          <li class="nav-item">
          <router-link to="/cashier" class="nav-link">
            <i class="nav-icon fas fa-cash-register pink"></i>
            <p class="pink">
              Cashier
            </p>
          </router-link>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-calendar-week pink"></i>
              <p class="pink">
                Class Loading
                <i class="right fa fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <router-link to="/load" class="nav-link">
                  <i class="fas fa-file cyan"></i>
                  <p class="cyan">Schedule</p>
                </router-link>
              </li>
              {{-- <li class="nav-item">
                <router-link to="/wed" class="nav-link">
                  <i class="fas fa-file cyan"></i>
                  <p>Wednesday Schedule</p>
                </router-link>
              </li> --}}
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-users-cog pink"></i>
              <p class="pink">
                Manage Users
                <i class="right fa fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <router-link to="/users" class="nav-link">
                  <i class="fas fa-user-tie cyan"></i>
                  <p class="cyan">Admin/Staff</p>
                </router-link>
              </li>
              <li class="nav-item">
                <router-link to="/parents" class="nav-link">
                  <i class="fas fa-user-friends cyan"></i>
                  <p>Parent</p>
                </router-link>
              </li>
              <li class="nav-item">
                <router-link to="/sponsors" class="nav-link">
                  <i class="fas fa-user-friends cyan"></i>
                  <p>Sponsor</p>
                </router-link>
              </li>
            </ul>
          </li>
          <li class="nav-item">
          <router-link to="/announce" class="nav-link">
            <i class="nav-icon fas fa-bullhorn pink"></i>
            <p class="pink">
              SIS Notification
            </p>
          </router-link>
          </li>
          <li class="nav-item">
          <router-link to="/codes" class="nav-link">
            <i class="nav-icon fas fa-ticket-alt pink"></i>
            <p class="pink">
              Student Codes
            </p>
          </router-link>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-print pink"></i>
              <p class="pink">
                Generate Reports
                <i class="right fa fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <router-link to="/class_list" class="nav-link">
                  <i class="fas fa-money-check cyan"></i>
                  <p>Class List</p>
                </router-link>
              </li>
              <li class="nav-item">
                <router-link to="/ranking" class="nav-link">
                  <i class="fas fa-sort-amount-up cyan"></i>
                  <p>Student Ranking</p>
                </router-link>
              </li>
              <li class="nav-item">
                <router-link to="/transaction" class="nav-link">
                  <i class="fas fa-cash-register cyan"></i>
                  <p>Payment Transactions</p>
                </router-link>
              </li>
              <li class="nav-item">
                <router-link to="/schedule" class="nav-link">
                  <i class="fas fa-calendar-week cyan"></i>
                  <p>Schedules</p>
                </router-link>
              </li>
              <li class="nav-item">
                <router-link to="/grade_report" class="nav-link">
                  <i class="fas fa-marker cyan"></i>
                  <p>Grade Report</p>
                </router-link>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-clipboard-list pink"></i>
              <p class="pink">
                Utilities
                <i class="right fa fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <router-link to="/fees" class="nav-link">
                  <i class="fas fa-money-check cyan"></i>
                  <p class="cyan">School Fee</p>
                </router-link>
              </li>
              <li class="nav-item">
                <router-link to="/teachers" class="nav-link">
                  <i class="fas fa-chalkboard-teacher cyan"></i>
                  <p>Teacher</p>
                </router-link>
              </li>
              <li class="nav-item">
                <router-link to="/rooms" class="nav-link">
                  <i class="fas fa-warehouse cyan"></i>
                  <p>Room</p>
                </router-link>
              </li>
              <li class="nav-item">
                <router-link to="/subjects" class="nav-link">
                  <i class="fas fa-book cyan"></i>
                  <p>Subject</p>
                </router-link>
              </li>
              <li class="nav-item">
                <router-link to="/levels" href="#" class="nav-link">
                  <i class="fas fa-sort-amount-up cyan"></i>
                  <p>Level & S.Y.</p>
                </router-link>
              </li>
            </ul>
          </li>
          @endcan
{{--           <li class="nav-item">
          <router-link to="settings" class="nav-link">
            <i class="nav-icon fas fa-user-cog pink"></i>
            <p class="pink">
              Profile Settings
            </p>
          </router-link>
          </li> --}}
          <li class="nav-item">
{{--           <a href="#" class="text-danger nav-link">
            <i class="nav-icon fas fa-sign-out-alt"></i>
            <p>
              Logout
            </p>
          </a> --}}
          <a class="nav-link" href="{{ route('logout') }}" onclick="event.preventDefault();
                           document.getElementById('logout-form').submit();">
              <i class="nav-icon fas fa-sign-out-alt red"></i>
              <p class="red">
              {{ __('Logout') }}
            </p>
          </a>
          <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        @csrf
          </form>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" style="background-color: #ffb3ff;">
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        
        <router-view></router-view>
        <vue-progress-bar></vue-progress-bar>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <!-- /.control-sidebar -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="float-right d-none d-sm-inline">
      Anything you want
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2014-2018 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
  </footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
{{-- <script src={{ mix('js/app.js') }}></script> --}}
<script src="{{ asset('js/app.js') }}"></script>
</body>
</html>
