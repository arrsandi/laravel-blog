@extends('layouts.app')
@section('title',"Edit Tag: $tag->name")
@section('content')
<div class="container">
     <div class="jumbotron" id="tc_jumbotron">
        <div class="col-md-8 offset-md-2">
          <div class="text-center"><h3 style="color: #fff;">Edit Tag {{$tag->name}}</h3></div><hr style="background: #fff"> 
        </div>
      <div class="row justify-content-center">
        <div class="col-md-9">
            <div class="card"> 
                <div class="card-body">
                   <form action="{{route('tag.update',$tag->id)}}" method="post"  enctype="multipart/form-data">
                      {{csrf_field()}}
                      {{method_field('PUT')}}
                    <div class="form-group">
                      <input type="text" id="tc_input" class="form-control" name="name" value="{{$tag->name}}"> 
                    </div>
           
             <br> 
            
             <button type="submit" class="btn btn-success btn-block">Submit</button>
               </form>
              </div>
              </div>
           <br>

         
    
            </div>
        </div>
    </div>
</div>
@endsection
 
@section('js')

<script type="text/javascript">
$(".tags").select2({
    placeholder: "Select tags",
    maximumSelectionLength: 2
});

 CKEDITOR.replace( 'description', {
  extraPlugins: 'codesnippet',
  codeSnippet_theme: 'monokai_sublime'
} );
</script>

@endsection