<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Catalog;

class CatalogController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $records = Catalog::query()->where('status', 1)
            ->select(['id', 'title', 'slug', 'image', 'file'])
            ->orderBy('created_at', 'desc')->orderBy('id', 'desc')
            ->paginate(16);
        $records->map(function ($item) {
            if (empty($item->file)) {
                $item->file_url = 'javascript:;';
            } else {
                $item->file_url = route('catalog.detail', ['catalog' => $item->slug]);
            }
            $item->image_url = asset('storage/'.$item->image);
        });
        $title = 'Catalogs';
        return view('web.catalog.index', compact(['title', 'records']));
    }

    /**
     * @param  Catalog  $catalog
     * @return \Illuminate\Http\Response
     */
    public function show(Catalog $catalog): \Illuminate\Http\Response
    {
        try {
            $hit = $catalog->hit + 1;
            \Illuminate\Support\Facades\DB::table('catalogs')->where('id', $catalog->id)->update(['hit' => $hit]);
        } catch (\Exception $e) {
            //TODO: Hata log düşülebilir.
        }
        $file_decoded = json_decode($catalog->file, true);
        //$file_name = current($file_decoded)['original_name'];
        $file_name = $catalog->slug;
        $file_path = current($file_decoded)['download_link'];
        /*$file_storage_path = storage_path($file_path);
        if (!file_exists($file_storage_path)) {
            return response()->json(['error' => 'File not found.'], \Illuminate\Http\Response::HTTP_NOT_FOUND);
        }*/
        $file = \Illuminate\Support\Facades\File::get('storage/'.$file_path);
        $file_mime_type = \Illuminate\Support\Facades\File::mimeType('storage/'.$file_path);
        $response = \Illuminate\Support\Facades\Response::make($file, 200);
        $response->header('Content-Type', $file_mime_type);
        return $response;
    }
}
