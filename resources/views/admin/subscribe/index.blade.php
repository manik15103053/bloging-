@extends('layouts.backend.app')


@section('title','SUBSCRIBERS LIST')

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
                       
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover dataTable js-exportable">
                                <div class="header">

                                    <h2>

                                    All SUBSCRIBERS
                                    <span class="badge bg-blue">{{$subscribers->count()}}</span>
                                    </h2>
                              </div>
                                
                                <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Email</th>
                                            <th>Created At</th>
                                            <th>Updated At</th>
                                            <th>Action</th>
                                           
                                        </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                            <th>ID</th>
                                            <th>Email</th>
                                            <th>Created At</th>
                                            <th>Updated At</th>
                                            <th>Action</th>
                                           
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                       @foreach($subscribers as $key=>$subscriber)
                                        <tr>
                                            <td>{{$key +1}}</td>
                                            <td>{{$subscriber->email}}</td>
                                            <td>{{$subscriber->created_at}}</td>
                                            <td>{{$subscriber->updated_at}}</td>
                                            <td >

                                            
                                            <a href="{{route('subscribe.delete',$subscriber->id)}}"class="btn btn-danger waves-effect">
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