<?php

namespace App\Policies;

use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class UserPolicy
{
    use HandlesAuthorization;

    /**
     * Authorization to delete a user 
     *
     * @param User $user
     * @return bool
     */
    public function deleteUser(User $user): bool
    {
        if ($user->email === 'admin@admin.com') return true;
        return false;
    }

    /**
     * Authorization to update a user
     *
     * @param User $user
     * @param integer $targetUserId
     * @return bool
     */
    public function updateUser(User $user, $targetUserId): bool
    {
        if ($user->email === 'admin@admin.com') return true;
        if ($user->id === $targetUserId) return true;
        return false;
    }
}
