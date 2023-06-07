<?php

namespace App\Business\Univers;

use App\Business\OpenAi\OpenAiBusiness;
use App\Models\Character;
use App\Models\Univers;

/**
 * CharacterBusiness
 */
class CharacterBusiness
{
    /**
     * Create a new character
     *
     * @param array $data
     * @param Univers $univers
     * @return Character
     */
    public static function createCharacter(array $data, Univers $univers): Character
    {

        $character_description = OpenAiBusiness::generateCharacterDescription($data['name'], $univers->name);
        
        $character = new Character();
        $character->name = $data['name'];
        $character->description = $character_description;

        $univers->characters()->save($character);

        return $character;
    }

    /**
     * Update a character
     *
     * @param array $data
     * @param Univers $univers
     * @param integer $characterId
     * @return Character
     */
    public static function updateCharacter(array $data, Univers $univers, int $characterId): Character
    {
        $character = $univers->characters()->findOrFail($characterId);
        $character->name = $data['name'];
        $character->save();

        return $character;
    }
}