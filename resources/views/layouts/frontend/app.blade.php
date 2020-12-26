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

	<link href="{{asset('assets/frontend/css')}}/bootstrap.css" rel="stylesheet">

	<link href="{{asset('assets/frontend/css')}}/swiper.css" rel="stylesheet">

	<link href="{{asset('assets/frontend/css')}}/ionicons.css" rel="stylesheet">
	<link href="{{asset('assets/frontend/css/home/element.css')}}" rel="stylesheet">



     @stack('css')
</head>
<body >

    
    @include('layouts.frontend.partial.header')

	@yield('content')


	@include('layouts.frontend.partial.footer')


	<!-- SCIPTS -->

	<script src="{{asset('assets/frontend/js')}}/jquery-3.1.1.min.js"></script>

	<script src="{{asset('assets/frontend/js')}}/tether.min.js"></script>

	<script src="{{asset('assets/frontend/js')}}/bootstrap.js"></script>


    <script src="{{asset('assets/frontend/js')}}/scripts.js"></script>
    
    @stack('js')

</body>
</html>