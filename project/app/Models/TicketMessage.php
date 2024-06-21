<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;
use TCG\Voyager\Facades\Voyager;

class TicketMessage extends Model
{
    use SoftDeletes;

    protected $guarded = ['id'];

    public function save(array $options = [])
    {
        // If no sender has been assigned, assign the current user's id as the author of the post
        if (!$this->sender_id && Auth::user()) {
            $this->sender_id = Auth::user()->getKey();
        }

        return parent::save();
    }

    public function sender()
    {
        return $this->belongsTo(Voyager::modelClass('User'), 'sender_id', 'id');
    }
}
