<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Character extends Model
{
    use HasFactory;

    protected $table = 'characters';

    protected $fillable = [
        'name',
        'conversation_id',
        'univers_id',
    ];

    public function univers() 
    {
        return $this->belongsTo(Univers::class);
    }

    public function conversations() 
    {
        return $this->hasMany(Conversation::class);
    }
}
