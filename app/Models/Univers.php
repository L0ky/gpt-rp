<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Univers extends Model
{
    use HasFactory;

    protected $table = 'universes';

    protected $fillable = [
        'name',
    ];

    public function characters() 
    {
        return $this->hasMany(Character::class);
    }
}
