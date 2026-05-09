<?php

use Simflex\Admin\Migration\Struct;
use \Simflex\Core\DB\Schema;

return new class implements \Simflex\Core\DB\Migration {
    public function up(Schema $s)
    {
        $s->createTable('reviews', function (Schema\Table $c) {
            $c->integer('reviews_id');
            $c->integer('npp');
            $c->string('title');
            $c->string('image');
            $c->string('group_images');
            $c->boolean('is_active');
        });
    }

    public function down(Schema $s)
    {
        $s->dropTable(['reviews_id', 'npp', 'title', 'image', 'group_images', 'is_active']);
    }
};