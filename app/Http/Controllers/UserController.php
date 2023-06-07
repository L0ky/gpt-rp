<?php

namespace App\Http\Controllers;

use App\Business\UserBusiness;
use App\Models\User;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;

/**
 * User Controller
 */
class UserController extends Controller
{
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->middleware('auth:sanctum');
    }

    /**
     * Get all users
     *
     * @return Collection
     */
    public function index(): Collection
    {
        $users = User::all();
        return $users;
    }

    /**
     * Get a user
     *
     * @param int $id
     * @return User
     */
    public function show(int $id): User 
    {
        $user = User::findOrFail($id);
        return $user;
    }

    /**
     * Delete a user
     *
     * @param int $id
     * @return User
     */
    public function delete(int $id): User
    {
        $user = User::findOrFail($id);
        $user->delete();
        return $user;
    }

    /**
     * Update a user
     *
     * @bodyParam name string required The name of the user
     * 
     * @param Request $request
     * @param int $id
     * @return User
     */
    public function update(Request $request, int $id) 
    {
        try {
            $data = $request->validate([
                'name' => 'required|unique:users',
            ]);
        } catch (ValidationException $e) {
            return response()->json(
                $e->errors(), 422
            );
        }

        $user = UserBusiness::updateUser($data, $id);

        return $user;
    }
}
