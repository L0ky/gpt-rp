<?php

namespace App\Business\OpenAi;

use App\Models\Character;
use OpenAI;

/**
 * OpenAiBusiness
 */
class OpenAiBusiness
{
    /**
     * getOpenAiInstance
     *
     * @return OpenAI\Client
     */
    private static function getOpenAiInstance(): OpenAI\Client
    {
        $apiKey = getenv('OPENAI_API_KEY');
        $client = OpenAI::client($apiKey);
        return $client;
    }

    /**
     * Generate a character description
     *
     * @param string $name
     * @param string $univers_name
     * @return string
     */
    public static function generateCharacterDescription(string $name, string $univers_name): string
    {
        $client = self::getOpenAiInstance();

        $prompt = 'Génère une description pour ce personnage: ' . $name 
                  . ', il vient de l\'univers: ' . $univers_name 
                  . '.';

        $result = $client->completions()->create([
            'model'             => 'text-davinci-003',
            // 'model' => 'ada',
            'max_tokens'        => 100,
            'temperature'       => 0.9,
            'top_p'             => 1,
            'frequency_penalty' => 0.0,
            'presence_penalty'  => 0.6,
            'prompt'            => $prompt
        ]);

        return self::truncateText($result);
    }

    /**
     * generateMessage
     *
     * @param  string $humanMessage
     * @param  Character $character
     * @return string
     */
    public static function generateMessage(string $humanMessage, Character $character): string
    {
        $client = self::getOpenAiInstance();

        $characterDescription = $character->description;

        $prompt = $characterDescription . '\n' . 'Dans le cadre d\'un jeu de rôle, l\'IA devient 
                  le personnage de' . $character->name . 'et répond à l\'humain.' 
                  . '\n' . 'Human: ' . $humanMessage . '\n' . 'AI: ';

        $result = $client->completions()->create([
            'model' => 'text-davinci-003',
            // 'model'             => 'ada',
            'max_tokens'        => 100,
            'temperature'       => 0.9,
            'top_p'             => 1,
            'frequency_penalty' => 0.0,
            'presence_penalty'  => 0.6,
            'stop'              => [" Human:", " AI:"],
            'prompt'            => $prompt            
        ]);

        return self::truncateText($result);
    }

    /**
     * Truncate to do not consider the content after the last period.
     *
     * @param  mixed $result
     * @return string
     */
    private static function truncateText(mixed $result): string
    {
        $choice = $result->choices[0];

        $description = $choice->text; 

        preg_match('/(.*?\.)[^.]*$/', $description, $matches);

        return $matches[1];
    }
}
