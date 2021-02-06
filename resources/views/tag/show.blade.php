@extends('layouts.app')
@section('title',"$tags->name tag")
@section('content')
<div class="container">
  <div class="jumbotron" id="tc_jumbotron">
    <div class="card-body" id="xx" style="color: #fff;border:1px solid #fff;">
        <div class="text-center">
        <small>Tag:</small>
           <h1 style="font-size: 3.5rem;">{{$tags->name}}</h1> ({{$tags->forums->count()}} posts)
      </div>
    </div>
  </div>
</div>  
<div class="container">
    <div class="row">
        <div class="col-md-12" id="tc_container_wrap">
            <div class="card" id="tc_paneldefault">
         <div class="card-body" id="tc_panelbody"  style="background: #f9f9f9;"> 
             <div class="card">
                       <div class="card-header" style="background-color: #2ab27b;padding: 6px 11px 6px 23px;">
                          <div class="menu_a" style="float: left;">
                          <a href="{{route('forum.create')}}">Buat Pertanyaan Baru</a> 
                          <a href="{{route('tag.index')}}">Tags</a> 
                          </div>
                          <form action="{{route('forum.index')}}" method="get">
                            <div class="search" style="margin: 3px;">
                              <div class="col-md-4 float-right" style="    padding-right: 0;">
                              <div class="input-group">
                              <input type="text" class="form-control" name="search" placeholder="Search for..." style=" margin-right: 3px;background: #f5f8fa;" value="{{request()->query('search')}}">
                              <span class="input-group-btn">
                              <button class="btn btn-warning" type="submit" style="color: #fff;" >Go!</button>
                            </span>
                            </div>
                          </form>
                       </div>
                     </div>
                    </div>
                  </div>  
          <div class="row">
            <div class="col-md-12" style="padding-right: 0;"><br>
           <table class="table table-bordered">
          <thead id="tc_thead">
            <tr class="text-center">
              <th scope="col">Thread</th>
              <th scope="col">Comments</th>
              <th scope="col">Sender</th>
              <th scope="col">View</th>
            </tr>
          </thead>
          <tbody style="background: #f9f9f9;">
          @foreach($tags->forums as $forum)
            <tr>
             <td width="453">
         <div class="forum_title">
                <h4> <a href="{{route('forumslug', $forum->slug)}}">{{ str_limit($forum->title, 45) }}</a></h4>
                <p>{!! strip_tags(str_limit($forum->description, 60) ) !!}</p>
                @foreach($forum->tags as $tag)
                <a href="{{route('tag.show', $tag->name)}}" class="badge badge-success tag_label">#{{$tag->name}}</a>
                @endforeach
                 @if (empty($forum->image)) 
                @else
              <div class="badge badge-success tag_label_image"><i class="fa fa-image"></i></div>
               @endif
               </div>
               </td>
              <td style="text-align: center"><small> {{$forum->comments->count()}}</small></td>
              <td>
                <div class="forum_by text-center">
                <small style="margin-bottom: 0; color: #666">{{$forum->created_at->diffForHumans()}}</small>
                 <small>by <a href="#">{{$forum->user->name}}</a></small>  
                </div>
                <td class="text-center">
                  <a href="{{route('forumslug', $forum->slug)}}"><i class="fa fa-eye"></i></a>
                  </td>
              </tr>
               @endforeach
            </tbody>
            </table> 
              </div>
                <div class="col-md-4">
                  </div>
                     </div>
                      <hr style="margin-top: 0;">
                       <div class="card">
                          <div class="card-header"></div>
                         <div class="card-body" style="background: rgb(90, 90, 90)"></div>
                        <div class="card-header"></div>
                      </div>
                      </div>
                   </div>
                  </div>
              </div>
          </div><br>
@endsection
