<?php

namespace App\Http\Controllers;

use App\forum;
use App\Tag;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;


class ForumController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth')->except('index', 'show');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $search = request()->query('search');
        if ($search) {
            $forums = Forum::where('title', 'LIKE', "%{$search}%")->paginate(6);
            $tags = Tag::all();
        } else {
            $forums = Forum::paginate(6);
            $tags = Tag::all();
        }
        return view('forum.index', compact('forums', 'tags'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $forums = Forum::orderBy('id', 'desc')->paginate(1);
        $tags = Tag::all();
        return view('forum.create', compact('tags', 'forums'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'description' => 'required',
            'tags' => 'required',
            'image' => 'image|mimes:jpg,png,jpeg,gif|max:2048',
        ]);

        $forums = new Forum;
        $forums->user_id = Auth::user()->id;
        $forums->title = $request->title;
        $forums->slug = str_slug($request->title);
        $forums->description = $request->description;
        if ($request->file('image')) {
            $file = $request->file('image');
            $filename = time() . '.' . $file->getClientOriginalExtension();
            $location = public_path('/images');
            $file->move($location, $filename);
            $forums->image = $filename;
        }
        $forums->save();

        $forums->tags()->sync($request->tags);
        return back()->withInfo('Pertanyaan berhasil dikirim!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\forum  $forum
     * @return \Illuminate\Http\Response
     */
    public function show($slug)
    {
        $forums = Forum::where('id', $slug)->orWhere('slug', $slug)->firstOrFail();
        return view('forum.show', compact('forums'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\forum  $forum
     * @return \Illuminate\Http\Response
     */
    public function edit($slug)
    {
        $tags = Tag::all();
        $forum = Forum::where('id', $slug)->orWhere('slug', $slug)->firstOrFail();
        return view('forum.edit', compact('forum', 'tags'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\forum  $forum
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'title' => 'required',
            'description' => 'required',
            'tags' => 'required',
            'image' => 'image|mimes:jpg,png,jpeg,gif|max:2048',
        ]);

        $forums = Forum::find($id);
        $forums->user_id = Auth::user()->id;
        $forums->title = $request->title;
        $forums->slug = str_slug($request->title);
        $forums->description = $request->description;
        if ($request->file('image')) {
            $file = $request->file('image');
            $filename = time() . '.' . $file->getClientOriginalExtension();
            $location = public_path('/images');
            $file->move($location, $filename);

            $oldImage = $forums->image;
            Storage::delete($oldImage);
            $forums->image = $filename;
        }
        $forums->save();
        $forums->tags()->sync($request->tags);
        return back()->withInfo('Pertanyaan berhasil diubah!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\forum  $forum
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $forum = Forum::find($id);
        Storage::delete($forum->image);
        $forum->tags()->detach();
        $forum->delete();
        return back()->withInfo('Pertanyaan Berhasil Dihapus!');
    }
}
