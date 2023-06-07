<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    use HasFactory;

    // User myUser;

    protected $fillable = [
        'character_id',
        'user_id',
        'content',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function character()
    {
        return $this->belongsTo(Character::class);
    }

    public function conversation()
    {
        return $this->belongsTo(Conversation::class);
    }
}
