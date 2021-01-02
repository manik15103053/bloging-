<aside id="leftsidebar" class="sidebar">
            <!-- User Info -->
            <div class="user-info">
                <div class="image">
                    <img src="{{asset('uploads/profile/'.auth()->user()->image)}}" width="48" height="48" alt="User" />
                </div>
                <div class="info-container">
                    <div class="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{auth()->user()->name}}</div>
                    <div class="email">{{auth()->user()->email}}</div>
                    <div class="btn-group user-helper-dropdown">
                        <i class="material-icons" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
                        <ul class="dropdown-menu pull-right">
                            <li><a href="javascript:void(0);"><i class="material-icons">person</i>Profile</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="javascript:void(0);"><i class="material-icons">group</i>Followers</a></li>
                            <li><a href="javascript:void(0);"><i class="material-icons">shopping_cart</i>Sales</a></li>
                            <li><a href="javascript:void(0);"><i class="material-icons">favorite</i>Likes</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="{{route('logout')}}"><i class="material-icons">input</i>Sign Out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- #User Info -->
            <!-- Menu -->
            <div class="menu">
                <ul class="list">
                    <li class="header">Admin dashboard</li>
                    <li class="active">
                        <a href="{{route('admin.dashboard')}}">
                            <i class="material-icons">home</i>
                            <span>Home</span>
                        </a>
                    </li>
                    @if(auth()->user()->role_id == 1)
                    <li class="active">
                        <a href="{{route('admin.tag')}}">
                            <i class="material-icons">label</i>
                            <span>Tag</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="{{route('admin.category')}}">
                            <i class="material-icons">apps</i>
                            <span>Category</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="{{route('post.index')}}">
                            <i class="material-icons">library_books</i>
                            <span>Post</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="{{route('post.pending')}}">
                            <i class="material-icons">library_books</i>
                            <span>Pending Posts</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="{{route('admin.favorate')}}">
                            <i class="material-icons">favorite</i>
                            <span>Favorite Posts</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="{{route('admin.comment')}}">
                            <i class="material-icons">comment</i>
                            <span>Comments</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="{{route('author.list')}}">
                            <i class="material-icons">account_circle</i>
                            <span>Authors</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="{{route('subscribt.list')}}">
                            <i class="material-icons">subscriptions</i>
                            <span>Subscriber</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="{{route('admin.setting')}}">
                            <i class="material-icons">settings</i>
                            <span>Setting</span>
                        </a>
                    </li>
                    @else
                    <li class="active">
                        <a href="{{route('author.post.index')}}">
                            <i class="material-icons">library_books</i>
                            <span>Post</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="{{route('author.favorate')}}">
                            <i class="material-icons">favorite</i>
                            <span>Favorite Posts</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="{{route('author.comment')}}">
                            <i class="material-icons">comment</i>
                            <span>Comments</span>
                        </a>
                    </li>
                  
                    <li class="active">
                        <a href="{{route('author.setting')}}">
                            <i class="material-icons">settings</i>
                            <span>Setting</span>
                        </a>
                    </li>

                    @endif

                    
                    <li class="active">
                        <a href="{{route('logout')}}">
                            <i class="material-icons">lock</i>
                            <span>Sign Out</span>
                        </a>
                    </li>
              
                </ul>
            </div>
            <!-- #Menu -->
            <!-- Footer -->
            
            <!-- #Footer -->
        </aside>