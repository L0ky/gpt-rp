<?php

namespace App\Http\Controllers;

use App\Business\Conversation\ConversationBusiness;
use App\Business\Conversation\MessageBusiness;
use App\Models\Conversation;
use App\Models\Message;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;

/**
 * Conversation Controller
 */
class ConversationController extends Controller
{
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->middleware('auth:sanctum');
    }

    /**
     * Get all conversations
     *
     * @return Collection
     */
    public function getAllConversations(): Collection 
    {
        $conversations = Conversation::all();
        return $conversations;
    }

    /**
     * Get a conversation
     *
     * @param int $id
     * @return Conversation
     */
    public function getConversationId(int $id): Conversation
    {
        $conversation = Conversation::findOrFail($id);
        return $conversation;
    }

    /**
     * Create a conversation
     *
     * @param Request $request
     * @return Conversation
     */
    public function createConversation(Request $request): Conversation 
    {
        try {
            $data = $request->validate([
                'character_id' => 'required',
                'user_id'      => 'required',
            ]);
        } catch (ValidationException $e) {
            return response([
                'message' => $e->errors()
            ], 422);
        }

        $conversation = ConversationBusiness::createConversation($data);

        if (!$conversation) {
            return response([
                'message' => 'Conversation not created'
            ], 500);
        }

        return $conversation;
    }

    /**
     * Delete a conversation
     *
     * @param int $id
     * @return Conversation
     */
    public function deleteConversation(int $id): Conversation
    {
        $conversation = Conversation::findOrFail($id);
        $conversation->delete();
        return $conversation;
    }

    /**
     * Get all messages of a conversation
     *
     * @param int $conversationId
     * @return Collection
     */
    public function getAllMessagesOfConversation(int $conversationId): Collection 
    {
        $messsages = Message::where('conversation_id', $conversationId)->get();
        return $messsages;
    }

    /**
     * Create a message in a conversation
     *
     * @param int $conversationId
     * @param int $messageId
     * @return array
     */
    public function createMessage(Request $request, int $conversationId): array
    {
        try {
            $data = $request->validate([
                'content' => 'required',
            ]);
        } catch (ValidationException $e) {
            return response([
                'message' => $e->errors()
            ], 422);
        }

        $conversation = Conversation::findOrFail($conversationId);
        $message = MessageBusiness::createMessage($data, $conversation);

        if (!$message) {
            return response([
                'message' => 'Message not created'
            ], 500);
        }

        return $message;
    }

    /**
     * Get one message of a conversation
     *
     * @param int $conversationId
     * @param int $messageId
     * @return Message
     */
    public function getMessageId(int $conversationId, int $messageId): Message 
    {
        $conversation = Conversation::findOrFail($conversationId);
        $message = $conversation->messages()->findOrFail($messageId);
        return $message;
    }
}
