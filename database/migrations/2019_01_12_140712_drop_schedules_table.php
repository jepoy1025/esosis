<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class DropSchedulesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('schedules', function (Blueprint $table) {
            $table->drop();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::create('schedules', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('subject');
            $table->time('start_time');
            $table->time('end_time');
            $table->integer('duration');
            $table->integer('teacher_id')->nullable();
            $table->integer('room_id');
            $table->string('day', 30);
            $table->timestamps();
        });
    }
}
