@extends('layouts.backend.app')


@section('title','Tag Create')

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
                                Add New Tag
                                
                            </h2>
                            
                        </div>
                        <div class="body">
                            <form method="POST"action="{{route('tag.store')}}">
                                @csrf
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input type="text" id="name" class="form-control"name="name">
                                        <label class="form-label">Add Tag</label>
                                    </div>
                                </div>

                               

                                <br>
                                <a class="btn btn-danger m-t-15 waves-effect"href="{{route('admin.tag')}}">BACK</a>
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