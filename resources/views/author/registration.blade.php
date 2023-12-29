@extends('layouts.frontend.app')

@section('title','Blog')

@push('css')

<link rel="stylesheet" href="{{asset('assets/frontend/css/style/style.css')}}">
<link href="{{asset('assets/frontend/css/auth')}}/styles.css" rel="stylesheet">

<link href="{{asset('assets/frontend/css/auth')}}/responsive.css" rel="stylesheet">
@endpush

@section('content')





<div class="slider display-table center-text">
        <h1 class="title display-table-cell"><b>
        {{-- @if(Session::has('msg'))

        <p class=" btn btn-warning text-center"> {{ Session::get('msg') }}</p>

        @endif --}}
                <div class="">
                <button type="button" class="btn btn-primary btn-lg " data-toggle="modal" data-target="#staticBackdrop">
                Registration
                </button>

                </div> </b></h1>


	</div><!-- slider -->

	<section class="blog-area section">
		<div class="container">


			<div class="row">
				<div class="col-lg-2 col-md-0"></div>
				<div class="col-lg-8 col-md-12">
					<div class="post-wrapper">

                    <div id="login">
        <h3 class="text-center text-white ">Login form</h3>

        <div class="container">

            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="{{route('author.login')}}" method="post">
                            @csrf

                            <h3 class="text-center text-info">Login</h3>
                            {{-- @if ($errors->any())
                               @foreach ($errors->all() as $error)
                                   <p class="btn btn-danger">{{ $error }}</p>
                               @endforeach
                          @endif --}}



                            <div class="form-group">
                                <label for="email" class="text-info">Email:</label><br>
                                <input type="email" name="email" id="email" class="form-control">

                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <input type="password" name="password" id="password" class="form-control">
                            </div>

                          <button type="submit"class="btn btn-primary">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

					</div><!-- post-wrapper -->
				</div><!-- col-sm-8 col-sm-offset-2 -->
			</div><!-- row -->

		</div><!-- container -->
	</section><!-- section -->

@endsection

@push('js')
<script src="{{asset('assets/frontend/js')}}/swiper.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

@endpush
