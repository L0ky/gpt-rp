<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\CharacterController;
use App\Http\Controllers\ConversationController;
use App\Http\Controllers\DocumentationController;
use App\Http\Controllers\OpenAiController;
use App\Http\Controllers\TestController;
use App\Http\Controllers\UniversController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/documentation', [DocumentationController::class, 'index']);

// Auth
Route::group(['prefix' => 'auth'], function () {
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/login',    [AuthController::class, 'login']);
    Route::post('/logout',   [AuthController::class, 'logout']);
});

Route::group(['prefix' => 'test'], function () {
    Route::post('/',           [TestController::class, 'payload']);
    Route::get('/{endpoint?}', [TestController::class, 'index']);
});

// User
Route::group(['prefix' => 'users'], function () {
    Route::get('/',        [UserController::class, 'index']);
    Route::get('/{id}',    [UserController::class, 'show']);
    Route::delete('/{id}', [UserController::class, 'delete']);
    Route::patch('/{id}',  [UserController::class, 'update']);
});

// Conversation
Route::group(['prefix' => 'conversations'], function () {
    Route::get('/',        [ConversationController::class, 'getAllConversations']);
    Route::post('/',       [ConversationController::class, 'createConversation']);
    Route::get('/{id}',    [ConversationController::class, 'getConversationId']);
    Route::delete('/{id}', [ConversationController::class, 'deleteConversation']);
    Route::patch('/{id}',  [ConversationController::class, 'updateConversation']);

    Route::post('/{conversationId}/messages',     [ConversationController::class, 'createMessage']);
    Route::get('/{conversationId}/messages',      [ConversationController::class, 'getAllMessagesOfConversation']);
    Route::get('/{conversationId}/messages/{id}', [ConversationController::class, 'getMessageId']);
    Route::put('/{conversationId}/messages',      [ConversationController::class, 'updateMessage']);
});

// Universes
Route::group(['prefix' => 'universes'], function () {
    Route::post('/',              [UniversController::class, 'createUnivers']);
    Route::get('/',               [UniversController::class, 'getAllUniverses']);
    Route::get('/{universId}',    [UniversController::class, 'getUnivers']);
    Route::delete('/{universId}', [UniversController::class, 'deleteUnivers']);
    Route::put('/{universId}',    [UniversController::class, 'updateUnivers']);

    Route::post('/{universId}/characters',     [UniversController::class, 'createCharacter']);
    Route::get('/{universId}/characters',      [UniversController::class, 'getAllCharacters']);
    Route::get('/{universId}/characters/{id}', [UniversController::class, 'getCharacter']);
    Route::put('/{universId}/characters/{id}', [UniversController::class, 'updateCharacter']);
});



