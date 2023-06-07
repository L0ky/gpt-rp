<?php

namespace App\Business\Conversation;

use App\Business\OpenAi\OpenAiBusiness;
use App\Models\Character;
use App\Models\Conversation;
use App\Models\Message;

/**
 * MessageBusiness
 */
class MessageBusiness
{
    /**
     * Create a new message
     *
     * @param array $data
     * @param Conversation $conversation
     * @return array
     */
    public static function createMessage(array $data, Conversation $conversation): array
    {
        $character_id = $conversation->character_id;
        $user_id      = $conversation->user_id;

        $character = Character::findOrFail($character_id);

        $generatedMessage = OpenAiBusiness::generateMessage($data['content'], $character);

        // Message
        $message = new Message();
        $message->content = $data['content'];
        $message->user_id = $user_id;

        // Answer
        $answer = new Message();
        $answer->content = $generatedMessage;
        $answer->character_id = $character_id;
        $answer->conversation_id = $conversation->id;

        $conversation->messages()->saveMany([$message, $answer]);

        return [
            'message' => $message,
            'answer'  => $answer
        ];
    }
}