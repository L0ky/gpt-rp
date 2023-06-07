<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('characters', function (Blueprint $table) {
            $table->foreignId('conversation_id')
                  ->nullable()
                  ->constrained('conversations');
            $table->foreignId('univers_id')
                  ->nullable()
                  ->constrained('universes')
                  ->onDelete('cascade');
        });
        
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('characters', function (Blueprint $table) {
            $table->dropForeign(['conversation_id']);
            $table->dropForeign(['univers_id']);
        });
    }
};
