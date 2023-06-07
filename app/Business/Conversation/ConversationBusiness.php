<?php

namespace App\Business\Conversation;

use App\Models\Conversation;

/**
 * ConversationBusiness
 */
class ConversationBusiness
{
    /**
     * Create a new conversation
     *
     * @param array $data
     * @return Conversation
     */
    public static function createConversation(array $data): Conversation
    {   
        $conversation = new Conversation();
        $conversation->user_id = $data['user_id'];
        $conversation->character_id = $data['character_id'];
        $conversation->save();

        return $conversation;
    }
}