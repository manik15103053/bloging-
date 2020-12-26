<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Foundation\Auth\User;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create([

            'role_id' =>  '1',
            'name' =>  'Md.Admin',
            'username' =>  'admin',
            'email' =>  'admin@gmail.com',
            'password' =>  bcrypt('12345'),
            'about' => ''

        ]);
    }
}
