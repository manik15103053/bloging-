@extends('layouts.backend.app')


@section('title','Comments')

@push('css')
<link href="{{asset('assets/backend')}}/plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">


@endpush

@section('content')

<div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                      
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover dataTable js-exportable">
                                    <div class="header">

                                    <h2>

                                    All Comments
                                    <span class="badge bg-blue">{{$comments->count()}}</span>
                                    </h2>
                                    </div>
                                    <thead>
                                       
                                        <tr>
                                            <th class="text-center">Comments Info</th>
                                            <th class="text-center">Post Info</th>
                                            <th class="text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                     <tr>
                                        <th class="text-center">Comments Info</th>
                                            <th class="text-center">Post Info</th>
                                            <th class="text-center">Action</th>
                                     </tr>
                                    </tfoot>
                                    <tbody>
                                       @foreach($comments as $key=>$comment)
                                        <tr>
                                            <td>
                                                <div class="media">
                                                    <div class="media-left">
                                                        <a href="#">
                                                        <img width="64"height="64"class="media-object"src="{{asset('uploads/profile/'.$comment->user->image)}}" alt="Porfile Image">
                                                        </a>
                                                    </div>
                                                    <div class="media-body">

                                                    <h4 class="media-heading">
                                                        {{$comment->user->name}}
                                                        <small>{{$comment->created_at->diffForHumans()}}</small>
                        
                                                    </h4>
                                                    <p>{{$comment->comment}}</p>
                                                    <a target="_blank"href="{{route('post.details',$comment->post->slug.'#comments')}}">Reply</a>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="media">
                                                    <div class="media-right">
                                                        <a href="#">
                                                        <img width="64"height="64"class="media-object"src="{{asset('uploads/category/'.$comment->post->image)}}" alt="{{$comment->post->title}}">
                                                        </a>
                                                    </div>
                                                    <div class="media-body">

                                                 
                                                    <a target="_blank"href="{{route('post.details',$comment->post->slug ) }}">
                                                        <h4 class="media-heading"> {{ Str::limit($comment->post->title, 20)}}</h4>
                                                    </a>
                                                    <p>by <strong>{{$comment->post->user->name}}</strong></p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>

                                            <a href=""class="btn btn-danger waves-effect">
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