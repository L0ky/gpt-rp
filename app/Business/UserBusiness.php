<?php

namespace App\Business;

use App\Models\User;

/**
 * UserBusiness
 */
class UserBusiness
{
    /**
     * Create a new user
     *
     * @param array $data
     * @return User
     */
    public static function createUser(array $data): User
    {
        $user = new User();
        $user->username  = $data['username'];
        $user->email     = $data['email'];
        $user->password  = bcrypt($data['password']);
        $user->firstname = $data['firstname'];
        $user->lastname  = $data['lastname'];

        $user->save();

        return $user;
    }

    /**
     * Delete a user
     *
     * @param integer $userId
     * @return User
     */
    public static function deleteUser(int $userId): User
    {
        $user = User::findOrFail($userId);
        $user->delete();
        return $user;
    }

    /**
     * Update a user
     *
     * @param array $data
     * @param integer $userId
     * @return User
     */
    public static function updateUser(array $data, int $userId): User
    {
        $user = User::findOrFail($userId);
        $user->username  = $data['username'];
        $user->save();

        return $user;
    }
}