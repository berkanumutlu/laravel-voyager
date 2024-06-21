<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use TCG\Voyager\Traits\Translatable;

class Catalog extends Model
{
    use SoftDeletes, Translatable;

    protected $guarded = ['id'];
    protected $translatable = ['title', 'slug'];
}
