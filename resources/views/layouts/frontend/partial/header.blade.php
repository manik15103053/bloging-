<header>
		<div class="container-fluid position-relative no-side-padding">
		@if ($errors->any())
    <div class="alert alert-danger float-right">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
		@if(Session::has('msg'))
			<div class="alert alert-info float-right">
				{{ Session::get('msg') }}
			</div>
		@endif


			<a href="#" class="logo">Blog</a>

			<div class="menu-nav-icon" data-nav-menu="#main-menu"><i class="ion-navicon"></i></div>

			<ul class="main-menu visible-on-click" id="main-menu">
				<li><a href="{{route('home')}}">Home</a></li>
				<li><a href="#">Categories</a></li>
				<li><a href="#">Features</a></li>
				<li><a href="{{route('registration.form')}}">Registration</a></li>
				
			</ul><!-- main-menu -->

			<div class="src-area">
			
				
					


			</div>
			
			

		</div><!-- conatiner -->


		<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
	
        <h5 class="modal-title" id="staticBackdropLabel">Regitration</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Registration</a>
			</li>
			
		
			</ul>
			<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">

			<form action="{{route('registration')}}"method="POST">
				

				@csrf
					<div class="form-group">
						<label for="name">Name</label>
						<input type="text"name="name"class="form-control"id="name"placeholder="Enter Name"required>

					</div>
					<div class="form-group">
						<label for="username">Username</label>
						<input type="text"name="username"class="form-control"id="username"placeholder="Enter Username"required>

					</div>
					<div class="form-group">
						<label for="email">Email</label>
						<input type="email"name="email"class="form-control"id="email"placeholder="Enter Email"required>

					</div>
					<div class="form-group">
						<label for="password">Password</label>
						<input type="password"name="password"class="form-control"id="password"placeholder=" password"required>

					</div>
					<div class="form-group">
						<label for="image">Image</label>
						<input type="file"name="image"class="form-control"id="image">

					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-info waves-effect">Register</button>

					</div>



					</form>


			</div>
			
			
			</div>
      </div>
      
    </div>
  </div>
</div>
	
	</header>

	