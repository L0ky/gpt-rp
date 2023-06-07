<?php

namespace App\Business\Univers;

use App\Models\Univers;

/**
 * UniversBusiness
 */
class UniversBusiness
{
    /**
     * Create a new univers
     *
     * @param array $data
     * @return Univers
     */
    public static function createUnivers(array $data): Univers
    {
        $univers = new Univers();
        $univers->name = $data['name'];
        $univers->save();

        return $univers;
    }

    /**
     * Update a univers
     *
     * @param array $data
     * @param integer $universId
     * @return Univers
     */
    public static function updateUnivers(array $data, int $universId): Univers
    {
        $univers = Univers::findOrFail($universId);
        $univers->name = $data['name'];
        $univers->save();

        return $univers;
    }
}