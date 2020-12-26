@extends('layouts.backend.app')


@section('title','Category')

@push('css')

@endpush

@section('content')
@if ($errors->any())
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
@endif
<section  class="container-fluid">
         

            <!-- Vertical Layout -->
           
                    </div>
                </div>
            </div>
            <!-- #END# Vertical Layout -->
            <!-- Vertical Layout | With Floating Label -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Add New Category
                                
                            </h2>
                            
                        </div>
                        <div class="body">
                            <form method="POST"action="{{route('category.store')}}"enctype="multipart/form-data">
                                @csrf
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input type="text" id="name" class="form-control"name="name">
                                        <label class="form-label">Add Category</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="file"name="image">
                                </div>

                               

                                <br>
                                <a class="btn btn-danger m-t-15 waves-effect"href="{{route('admin.category')}}">BACK</a>
                                <button type="submit" class="btn btn-primary m-t-15 waves-effect">SUBMIT</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
          
        
    </section>

@endsection

@push('css')

@endpush