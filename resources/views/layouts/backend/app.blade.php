<!DOCTYPE HTML>
<html lang="en">
<head>
	<title>@yield('title')</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">


	<!-- Font -->

	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">


	<!-- Stylesheets -->



	<link rel="icon" href="{{asset('assets/backend')}}/favicon.ico" type="image/x-icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

<!-- Bootstrap Core Css -->
<link href="{{asset('assets/backend')}}/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- Waves Effect Css -->
<link href="{{asset('assets/backend')}}/plugins/node-waves/waves.css" rel="stylesheet" />

<!-- Animation Css -->
<link href="{{asset('assets/backend')}}/plugins/animate-css/animate.css" rel="stylesheet" />

<!-- Morris Chart Css-->
<link href="{{asset('assets/backend')}}/plugins/morrisjs/morris.css" rel="stylesheet" />

<!-- Custom Css -->
<link href="{{asset('assets/backend')}}/css/style.css" rel="stylesheet">

<!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
<link href="{{asset('assets/backend')}}/css/themes/all-themes.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />

     @stack('css')
</head>
<body class="theme-red">


<div class="page-loader-wrapper">
        <div class="loader">
            <div class="preloader">
                <div class="spinner-layer pl-red">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
            </div>
            <p>Please wait...</p>
        </div>
    </div>
    <!-- #END# Page Loader -->
    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->
    <!-- Search Bar -->
    <div class="search-bar">
        <div class="search-icon">
            <i class="material-icons">search</i>
        </div>
        <input type="text" placeholder="START TYPING...">
        <div class="close-search">
            <i class="material-icons">close</i>
        </div>
    </div>
    <!-- #END# Search Bar -->
    <!-- Top Bar -->


	@include('layouts.backend.partial.topbar')
    <!-- #Top Bar -->
    <section>
        <!-- Left Sidebar -->

		@include('layouts.backend.partial.sidebar')

        <!-- #END# Left Sidebar -->
        <!-- Right Sidebar -->

        <!-- #END# Right Sidebar -->
    </section>

    <section class="content">


	@yield('content')
    </section>


	<!-- SCIPTS -->

	<script src="{{asset('assets/backend')}}/plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="{{asset('assets/backend')}}/plugins/bootstrap/js/bootstrap.js"></script>



    <!-- Slimscroll Plugin Js -->
    <script src="{{asset('assets/backend')}}/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="{{asset('assets/backend')}}/plugins/node-waves/waves.js"></script>

    <!-- Jquery CountTo Plugin Js -->

    <!-- Morris Plugin Js -->
    <script src="{{asset('assets/backend')}}/plugins/raphael/raphael.min.js"></script>
    <script src="{{asset('assets/backend')}}/plugins/morrisjs/morris.js"></script>


    <!-- Custom Js -->
    <script src="{{asset('assets/backend')}}/js/admin.js"></script>

    <!-- Demo Js -->
    <script src="{{asset('assets/backend')}}/js/demo.js"></script>

    <script src="{{asset('assets/backend')}}/plugins/jquery-countto/jquery.countTo.js"></script>

   <!-- <script src="{{asset('assets/backend')}}/js/pages/index.js"></script> -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

   @if (Session::has('success'))
    <script>
        toastr.options = {
            'progressBar': true,
            'closeButton': true,
            'timeout': 120000, // Adjust the timeout as needed
        };
        toastr.success("{{ Session::get('success') }}");
    </script>
    @elseif (Session::has('error'))
    <script>
        toastr.options = {
            'progressBar': true,
            'closeButton': true,
            'timeout': 120000, // Adjust the timeout as needed
        };
        toastr.error("{{ Session::get('error') }}", 'Error!');
    </script>
    @endif

    @if ($errors->any())
        <script>
            $(document).ready(function(){
                toastr.options = {
                    'progressBar': true,
                    'closeButton': true,
                    'timeout': 120000, // Adjust the timeout as needed
                };
                @foreach ($errors->all() as $error)
                    toastr.error("{{ $error }}", 'Error!');
                @endforeach
            });
        </script>
    @endif
    @stack('js')

</body>
</html>
