@extends('layouts.frontend.app')

@section('title','Blog')

@push('css')
<link href="{{asset('assets/frontend/css/home')}}/styles.css" rel="stylesheet">

<link href="{{asset('assets/frontend/css/home')}}/responsive.css" rel="stylesheet">

<style>

	.favorite_posts{
		color:blue;
	}
</style>
@endpush

@section('content')

{{-- @if ($errors->any())
	<div class="alert alert-danger">
		<ul>
			@foreach ($errors->all() as $error)
				<li>{{ $error }}</li>
			@endforeach
		</ul>
	</div>
@endif
@if(Session::has('msg'))
	<div class="alert alert-info">
		{{ Session::get('msg') }}
	</div>
@endif --}}
<div class="main-slider">
		<div class="swiper-container position-static" data-slide-effect="slide" data-autoheight="false"
			data-swiper-speed="500" data-swiper-autoplay="10000" data-swiper-margin="0" data-swiper-slides-per-view="4"
			data-swiper-breakpoints="true" data-swiper-loop="true" >
			<div class="swiper-wrapper">


			@foreach($categories as $category)

			<div class="swiper-slide">
					<a class="slider-category" href="{{route('category.post',$category->slug)}}">
						<div class="blog-image"><img  style="height: 180px;" src="{{asset('uploads/category/'.$category->image)}}" alt="{{$category->name}}"></div>

						<div class="category">
							<div class="display-table center-text">
								<div class="display-table-cell">
									<h3><b>{{$category->name}}</b></h3>

								</div>
							</div>
						</div>

					</a>
				</div>


			@endforeach

			<!-- swiper-slide -->



			</div><!-- swiper-wrapper -->

		</div><!-- swiper-container -->

	</div><!-- slider -->

	<section class="blog-area section">
		<div class="container">

			<div class="row">

			@foreach($posts as $post)

				<div class="col-lg-4 col-md-6">
					<div class="card h-100">
						<div class="single-post post-style-1">

							<div class="blog-image"><img src="{{asset('uploads/category/'.$post->image)}}" alt="{{$post->title}}"></div>

							<a class="avatar" href="{{route('author.profile',$post->user->username)}}"><img src="{{asset('uploads/profile/'.$post->user->image)}}" alt="Profile Image"></a>

							<div class="blog-info">



								<h4 class="title"><a href="{{route('post.details',$post->slug)}}"><b>{{$post->title}}</b></a></h4>

								<ul class="post-footer">
									<li>
										@guest

										<a href=""><i class="ion-heart"></i>{{$post->favorite_to_users->count() }}</a>

										@else
										<a href="{{route('post.favorite',$post->id)}}"
											class="{{Auth::user()->favorite_posts->where('pivot.post_id', $post->id)->count()  == 0 ? '': 'favorite_posts' }} "><i class="ion-heart"></i>{{$post->favorite_to_users->count() }}</a>

										@endguest

									</li>
									<li><a href="#"><i class="ion-chatbubble"></i>{{$post->comments->count()}}</a></li>
									<li><a href="#"><i class="ion-eye"></i>{{$post->view_count}}</a></li>
								</ul>

							</div><!-- blog-info -->
						</div><!-- single-post -->
					</div><!-- card -->
				</div><!-- col-lg-4 col-md-6 -->

				@endforeach

			</div><!-- row -->

			{{ $posts->links() }}

		</div><!-- container -->
	</section><!-- section -->

@endsection

@push('js')

@endpush
