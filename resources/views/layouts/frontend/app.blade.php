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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />




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
	<script src="{{asset('assets/frontend/js')}}/swiper.js"></script>


    <script src="{{asset('assets/frontend/js')}}/scripts.js"></script>
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
