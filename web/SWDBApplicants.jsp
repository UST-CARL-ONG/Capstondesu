<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/libs/css/style.css">
    <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <title>Organissembly</title>
</head>

<body>
<!-- ============================================================== -->
<!-- main wrapper -->
<!-- ============================================================== -->
<div class="dashboard-main-wrapper">
    <!-- ============================================================== -->
    <!-- navbar -->
    <!-- ============================================================== -->
    <div class="dashboard-header">
        <nav class="navbar navbar-expand-lg bg-white fixed-top">
            <a class="navbar-brand" href="Announcements.jsp">Organissembly</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse " id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto navbar-right-top">


                    <li class="nav-item dropdown nav-user">
                        <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="assets/images/avatar-1.jpg" alt="" class="user-avatar-md rounded-circle"></a>
                        <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                            <div class="nav-user-info">
                                <h5 class="mb-0 text-white nav-user-name">Carl Ong</h5>
                                <span class="status"></span><span class="ml-2">Available</span>
                            </div>
                            <a class="dropdown-item" href="#"><i class="fas fa-user mr-2"></i>Account</a>
                            <form action="Logout"> <input type="submit" value="Logout"></form>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <!-- ============================================================== -->
    <!-- end navbar -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- left sidebar -->
    <!-- ============================================================== -->
    <div class="nav-left-sidebar sidebar-dark">
        <div class="menu-list">
            <nav class="navbar navbar-expand-lg navbar-light">
                <a class="d-xl-none d-lg-none" href="#">Dashboard</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav flex-column">
                        <li class="nav-divider">
                            Menu
                        </li>
                        <li class="nav-item ">

                            <div id="submenu-1" class="collapse submenu" style="">
                                <ul class="nav flex-column">
                                    <li class="nav-item">

                                        <div id="submenu-1-2" class="collapse submenu" style="">
                                            <ul class="nav flex-column">

                                            </ul>
                                        </div>
                                    </li>


                                </ul>
                            </div>
                        </li>
                        </li>
                        <li class="nav-item">
                            <a href="SWDBAnnouncements.jsp"  ><i class="fa fa-fw fa-rocket"></i>Announcements</a>

                        </li>

                        <li class="nav-item ">
                            <a href="SWDBCalendar.jsp"  ><i class="fa fa-fw fa-rocket"></i>Calendar</a>
                        </li>


                        <li class="nav-item">
                            <a href="SWDBApplicants.jsp"  ><i class="fa fa-fw fa-rocket"></i>Organization Requests</a>
                        </li>
                        <li class="nav-item">
                            <a href="SWDBOrgs.jsp"  ><i class="fa fa-fw fa-rocket"></i>Organizations</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- end left sidebar -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- wrapper  -->
    <!-- ============================================================== -->
    <div class="dashboard-wrapper">
        <div class="influence-finder">
            <div class="container-fluid dashboard-content">
                <!-- ============================================================== -->
                <!-- pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <h3 class="mb-2">Applicants </h3>
                            <p class="pageheader-text">Proin placerat ante duiullam scelerisque a velit ac porta, fusce sit amet vestibulum mi. Morbi lobortis pulvinar quam.</p>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">

                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- content -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- ============================================================== -->
                    <!-- search bar  -->
                    <!-- ============================================================== -->
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <div class="card-body">
                                <form>
                                    <input class="form-control form-control-lg" type="search" placeholder="Search" aria-label="Search">
                                    <button class="btn btn-primary search-btn" type="submit">Search</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end search bar  -->
                    <!-- ============================================================== -->
                    <div class="col-xl-9 col-lg-8 col-md-8 col-sm-12 col-12">
                        <!-- ============================================================== -->
                        <!-- card influencer one -->
                        <!-- ============================================================== -->
                        <div class="card">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="user-avatar float-xl-left pr-4 float-none">
                                            <img src="assets/images/avatar-1.jpg" alt="User Avatar" class="rounded-circle user-avatar-xl">
                                        </div>
                                        <div class="pl-xl-3">
                                            <div class="m-b-0">
                                                <div class="user-avatar-name d-inline-block">
                                                    <h2 class="font-24 m-b-10">Carl Ong</h2>
                                                </div>

                                            </div>
                                            <div class="user-avatar-address">
                                                <p class="mb-2"><i class=" text-primary"></i>Pasig City, <span class="m-l-10">Male<span class="m-l-20">29 Year Old</span></span>
                                                </p>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="float-xl-right float-none mt-xl-0 mt-4">

                                            <a href="#" class="btn btn-secondary">Accept Applicant</a>
                                            <br>
                                            <br>
                                            <a href="#" class="btn btn-secondary">Decline Applicant</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- ============================================================== -->
                        <!-- end card influencer one -->
                        <!-- ============================================================== -->


                        <!-- ============================================================== -->
                        <!-- card influencer one -->
                        <!-- ============================================================== -->
                        <div class="card">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="user-avatar float-xl-left pr-4 float-none">
                                            <img src="assets/images/avatar-2.jpg" alt="User Avatar" class="rounded-circle user-avatar-xl">
                                        </div>
                                        <div class="pl-xl-3">
                                            <div class="m-b-0">
                                                <div class="user-avatar-name d-inline-block">
                                                    <h2 class="font-24 m-b-10">Joshua Dela Cruz</h2>
                                                </div>

                                            </div>
                                            <div class="user-avatar-address">
                                                <p class="mb-2"><i class=" text-primary"></i>Malabon City <span class="m-l-10">Gei<span class="m-l-20">24 Year Old</span></span>
                                                </p>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="float-xl-right float-none mt-xl-0 mt-4">

                                            <a href="#" class="btn btn-secondary">Accept Applicant</a>
                                            <br>
                                            <br>
                                            <a href="#" class="btn btn-secondary">Decline Applicant</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- ============================================================== -->
                        <!-- end card influencer one -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- card influencer one -->
                        <!-- ============================================================== -->
                        <div class="card">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="user-avatar float-xl-left pr-4 float-none">
                                            <img src="assets/images/avatar-3.jpg" alt="User Avatar" class="rounded-circle user-avatar-xl">
                                        </div>
                                        <div class="pl-xl-3">
                                            <div class="m-b-0">
                                                <div class="user-avatar-name d-inline-block">
                                                    <h2 class="font-24 m-b-10">Louis Matutino</h2>
                                                </div>

                                            </div>
                                            <div class="user-avatar-address">
                                                <p class="mb-2"><i class=" text-primary"></i>Cavite City ata<span class="m-l-10">Faggot<span class="m-l-20">34 Year Old</span></span>
                                                </p>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="float-xl-right float-none mt-xl-0 mt-4">

                                            <a href="#" class="btn btn-secondary">Accept Applicant</a>
                                            <br>
                                            <br>
                                            <a href="#" class="btn btn-secondary">Decline Applicant</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- ============================================================== -->
                        <!-- end card influencer one -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- card influencer one -->
                        <!-- ============================================================== -->
                        <div class="card">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="user-avatar float-xl-left pr-4 float-none">
                                            <img src="assets/images/avatar-4.jpg" alt="User Avatar" class="rounded-circle user-avatar-xl">
                                        </div>
                                        <div class="pl-xl-3">
                                            <div class="m-b-0">
                                                <div class="user-avatar-name d-inline-block">
                                                    <h2 class="font-24 m-b-10">Potato Master</h2>
                                                </div>

                                            </div>
                                            <div class="user-avatar-address">
                                                <p class="mb-2"><i class=" text-primary"></i>Potato City <span class="m-l-10">Female<span class="m-l-20">29 Year Old</span></span>
                                                </p>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="float-xl-right float-none mt-xl-0 mt-4">

                                            <a href="#" class="btn btn-secondary">Accept Applicant</a>
                                            <br>
                                            <br>
                                            <a href="#" class="btn btn-secondary">Decline Applicant</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="card">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="user-avatar float-xl-left pr-4 float-none">
                                            <img src="assets/images/avatar-5.jpg" alt="User Avatar" class="rounded-circle user-avatar-xl">
                                        </div>
                                        <div class="pl-xl-3">
                                            <div class="m-b-0">
                                                <div class="user-avatar-name d-inline-block">
                                                    <h2 class="font-24 m-b-10">Mrs Bread</h2>
                                                </div>

                                            </div>
                                            <div class="user-avatar-address">
                                                <p class="mb-2"><i class=" text-primary"></i>Bread Street City <span class="m-l-10">Female<span class="m-l-20">29 Year Old</span></span>
                                                </p>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="float-xl-right float-none mt-xl-0 mt-4">

                                            <a href="#" class="btn btn-secondary">Accept Applicant</a>
                                            <br>
                                            <br>
                                            <a href="#" class="btn btn-secondary">Decline Applicant</a>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                        <!-- ============================================================== -->
                        <!-- end card influencer one -->
                        <!-- ============================================================== -->


                        <!-- ============================================================== -->
                        <!-- end content -->
                        <!-- ============================================================== -->
                    </div>
                    <!-- ============================================================== -->
                    <!-- influencer sidebar  -->
                    <!-- ============================================================== -->

                    <!-- ============================================================== -->
                    <!-- end influencer sidebar  -->
                    <!-- ============================================================== -->
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->

            <!-- ============================================================== -->
            <!-- end footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- end wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <!-- jquery 3.3.1 -->
    <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <!-- bootstap bundle js -->
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <!-- slimscroll js -->
    <script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <!-- main js -->
    <script src="assets/libs/js/main-js.js"></script>
</body>

</html>