<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TestSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $records = [];

        for ($i = 1; $i <= 10; $i++) {
            $records[] = [
                'name' => "Test User {$i}",
                'created_at' => now(),
                'updated_at' => now(),
            ];
        }

        DB::table('test')->insert($records);
    }
}
