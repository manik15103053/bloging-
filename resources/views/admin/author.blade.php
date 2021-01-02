@extends('layouts.backend.app')


@section('title','Authors')

@push('css')
<link href="{{asset('assets/backend')}}/plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">


@endpush

@section('content')
@if(Session::has('msg'))
    <div class="alert alert-info">
        {{ Session::get('msg') }}
    </div>
@endif
<div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                           
                           
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover dataTable js-exportable">
                                <div class="header">

                                    <h2>

                                    All Authors 
                                    <span class="badge bg-blue">{{$authors->count()}}</span>
                                    </h2>
                              </div>
                                <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Posts</th>
                                            <th>Comments</th>
                                            <th>Favorite Posts</th>
                                            <th>Created At</th>
                                            <th>Action</th>
                                           
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        <th>ID</th>
                                            <th>Name</th>
                                            <th>Posts</th>
                                            <th>Comments</th>
                                            <th>Favorite Posts</th>
                                            <th>Created At</th>
                                            <th>Action</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                       @foreach($authors as $key=>$author)
                                        <tr>
                                            <td>{{$key +1}}</td>
                                            <td>{{$author->name}}</td>
                                            <td>{{$author->posts_count }}</td>
                                            <td>{{$author->comments_count }}</td>
                                            <td>{{$author->favorite_posts_count }}</td>
                                            <td>{{$author->created_at->toDateString() }}</td>
                                         
                                            <td >

                                            
                                            <a href="{{route('author.delete',$author->id)}}"class="btn btn-danger waves-effect">
                                                <i class="material-icons">delete</i>
                                            </a>
                                            </td>
                                            
                                        </tr>
                                      
                                   @endforeach
                                       
                                    
                                      
                                    
                                    
                                    
                                   
                                      
                                    
                                       
                                        
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

@endsection

@push('js')
<script src="{{asset('assets/backend')}}/plugins/jquery/jquery.min.js"></script>

<!-- Bootstrap Core Js -->
<script src="{{asset('assets/backend')}}/plugins/bootstrap/js/bootstrap.js"></script>

<!-- Select Plugin Js -->
<script src="{{asset('assets/backend')}}/plugins/bootstrap-select/js/bootstrap-select.js"></script>

<!-- Slimscroll Plugin Js -->
<script src="{{asset('assets/backend')}}/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

<!-- Waves Effect Plugin Js -->
<script src="{{asset('assets/backend')}}/plugins/node-waves/waves.js"></script>

<!-- Jquery DataTable Plugin Js -->
<script src="{{asset('assets/backend')}}/plugins/jquery-datatable/jquery.dataTables.js"></script>
<script src="{{asset('assets/backend')}}/plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script>
<script src="{{asset('assets/backend')}}/plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js"></script>
<script src="{{asset('assets/backend')}}/plugins/jquery-datatable/extensions/export/buttons.flash.min.js"></script>
<script src="{{asset('assets/backend')}}/plugins/jquery-datatable/extensions/export/jszip.min.js"></script>
<script src="{{asset('assets/backend')}}/plugins/jquery-datatable/extensions/export/pdfmake.min.js"></script>
<script src="{{asset('assets/backend')}}/plugins/jquery-datatable/extensions/export/vfs_fonts.js"></script>
<script src="{{asset('assets/backend')}}/plugins/jquery-datatable/extensions/export/buttons.html5.min.js"></script>
<script src="{{asset('assets/backend')}}/plugins/jquery-datatable/extensions/export/buttons.print.min.js"></script>
<script src="{{asset('assets/backend')}}/js/admin.js"></script>
    <script src="{{asset('assets/backend')}}/js/pages/tables/jquery-datatable.js"></script>
@endpush