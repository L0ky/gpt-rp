<?php

namespace App\Http\Controllers;

use App\Business\UserBusiness;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

/**
 * Controller for managing auth
 */
class AuthController extends Controller
{
    /**
     * Login a user
     *
     * @return Response
     */
    public function login(): Response
    {
        try {
            $data = request()->validate([
                'email'    => 'required|string',
                'password' => 'required|string'
            ]);
        } catch (ValidationException $e) {
            return response([
                'message' => $e->errors()
            ], 422);
        }

        $user = User::where('email', $data['email'])->first();

        if(!$user || !Hash::check($data['password'], $user->password)){
            return response([
                'message' => 'Bad credentials'
            ], 401);
        }

        $token = $user->createToken('apiToken')->plainTextToken;

        $user->tokens()->where('tokenable_id', $user->id)->where('name', 'apiToken')->update([
            'expires_at' => now()->addHour(1),
        ]);

        return response([
            'user'  => $user,
            'token' => $token
        ], 200);
    }

    /**
     * Register a user
     *
     * @param Request $request
     * 
     * @return Response
     */
    public function register(Request $request): Response
    {
        try {
            $data = $request->validate([
                'username'  => 'required|string|unique:users,username',
                'password'  => 'required',
                'email'     => 'required|string|unique:users,email',
                'firstname' => 'required|string',
                'lastname'  => 'required|string',
            ]);
        } catch (ValidationException $e) {
            return response([
                'message' => $e->errors()
            ], 422);
        }
    
        $user = UserBusiness::createUser($data);

        if (!$user) {
            return response(['message' => 'Failed to create user'], 500);
        }

        return response([
            'user' => $user,
        ], 201);
    }

    /**
     * Logout a user
     *
     * @return Response
     */
    public function logout(Request $request): Response
    {
        try {
            $data = $request->validate([
                'user_id' => 'required|integer',
            ]);
        } catch (ValidationException $e) {
            return response([
                'message' => $e->errors()
            ], 422);
        }

        $user = User::where('id', $data['user_id'])->first();

        if (!$user) {
            return response(['message' => 'User not found'], 404);
        }

        $user->tokens()->delete();
        
        return response([
            'message' => 'Logged out'
        ], 200);
    }

}
