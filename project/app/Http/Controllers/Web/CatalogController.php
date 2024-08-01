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
        $current_language = \Mcamara\LaravelLocalization\Facades\LaravelLocalization::getCurrentLocale();
        $records = Catalog::query()->where('status', 1)
            ->select(['id', 'title', 'slug', 'image', 'file'])
            ->withTranslation($current_language)
            ->orderBy('created_at', 'desc')->orderBy('id', 'desc')
            ->paginate(16);
        $records->each(function ($item) {
            if (empty($item->file)) {
                $item->file_url = 'javascript:;';
            } else {
                $item->file_url = route('catalog.detail', ['slug' => $item->getTranslatedAttribute('slug')]);
            }
            $item->image_url = asset('storage/'.$item->image);
        });
        $title = __('global.catalogs');
        return view('web.catalog.index', compact(['title', 'records']));
    }

    /**
     * @param  string  $slug
     * @return \Illuminate\Http\Response
     */
    public function show(string $slug): \Illuminate\Http\Response
    {
        $record = Catalog::query()->whereTranslation('slug', '=', $slug)->first();
        try {
            $hit = $record->hit + 1;
            \Illuminate\Support\Facades\DB::table('catalogs')->where('id', $record->id)->update(['hit' => $hit]);
        } catch (\Exception $e) {
            //TODO: Hata log düşülebilir.
        }
        $file_decoded = json_decode($record->file, true);
        //$file_name = current($file_decoded)['original_name'];
        $file_name = $record->getTranslatedAttribute('slug');
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
