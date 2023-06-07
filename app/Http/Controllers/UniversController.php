<?php

namespace App\Http\Controllers;

use App\Business\Univers\CharacterBusiness;
use App\Business\Univers\UniversBusiness;
use App\Models\Character;
use App\Models\Univers;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Response;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;

/**
 * @group Univers
 * 
 * Controller for managing univers
 */
class UniversController extends Controller
{
   /**
    * Constructor
    */
   public function __construct()
   {
     $this->middleware('auth:sanctum');
   }

   /**
    * Get all univers
    * 
    * @return Collection
    */
   public function getAllUniverses(): Collection
   {
      $univers = Univers::all();
      return $univers;
   }

   /**
    * Get a univers
    * 
    * @param int $id
    * @return Univers
    */
   public function getUnivers(int $id): Univers
   {
      $univers = Univers::findOrFail($id);
      return $univers;
   }

   /**
    * Create a univers
    * 
    * @bodyParam name string required The name of the univers
    * 
    * @param Request $request
    * @return Response
    */
   public function createUnivers(Request $request): Response
   {
      try {
         $data = $request->validate([
            'name' => 'required'
         ]);
      } catch (ValidationException $e) {
         return response([
            'error' => $e->errors()
         ], 422);
      }

      $univers = UniversBusiness::createUnivers($data);

      if (!$univers) {
         return response([
            'error' => 'An error occured while creating the univers'
         ], 500);
      }

      return response([
         'univers' => $univers
     ], 200);
   }

   /**
    * Rename a univers
    * 
    * @bodyParam name string required The name of the univers
    * 
    * @param Request $request
    * @param int $id
    * @return Reponse
    */   
   public function updateUnivers(Request $request, int $universId): Response
   {
      try {
         $data = $request->validate([
            'name' => 'required|unique:universes,name'
         ]);
      } catch (ValidationException $e) {
         return response([
            'error' => $e->errors()
         ], 422);
      }

      $univers = UniversBusiness::updateUnivers($data, $universId);

      if (!$univers) {
         return response([
            'error' => 'An error occured while updating the univers'
         ], 500);
      }

      return response([
         'univers' => $univers
       ], 200);
   }

   /**
    * Delete a univers
    * 
    * @param int $id
    * @return Univers
    */
   public function deleteUnivers(int $id): Univers 
   {
      $univers = Univers::findOrFail($id);
      $univers->delete();
      return $univers;
   }

   /**
    * Get all characters from a univers
    * 
    * @param int $universId
    * @return Collection
    */
   public function getAllCharacters(int $universId): Collection
   {
      $univers = Univers::findOrFail($universId);
      $characters = $univers->characters()->get();
      return $characters;
   }

   /**
    * Get a character from a univers
    * 
    * @param int $universId
    * @param int $characterId
    * @return Character
    */
   public function getCharacter(int $universId, int $characterId): Character
   {
      $univers = Univers::findOrFail($universId);
      $character = $univers->characters()->findOrFail($characterId);
      return $character;
   }

   /**
    * Create a character from a univers
    * 
    * @bodyParam name string required The name of the character
    * 
    * @param Request $request
    * @param int $universId
    * @return Response
    */
   public function createCharacter(Request $request, int $universId): Response
   {
      $data = $request->validate([
         'name' => 'required'
      ]);

      $univers = Univers::findOrFail($universId);

      $character = CharacterBusiness::createCharacter($data, $univers);

      return response([
         'character' => $character
       ], 201);
   }

   /**
    * Update a character from a univers
    *
    * @param Request $request
    * @param integer $universId
    * @param integer $characterId
    * @return Character
    */ 
   public function updateCharacter(Request $request, int $universId, int $characterId): Character
   {
      $univers = Univers::findOrFail($universId);

      $data = $request->validate([
         'name' => 'required'
      ]);

      $character = CharacterBusiness::updateCharacter($data, $univers, $characterId);

      return $character;
   }
}
