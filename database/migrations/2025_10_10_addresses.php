<?php

use Simflex\Admin\Migration\Struct;
use \Simflex\Core\DB\Schema;

return new class implements \Simflex\Core\DB\Migration {
    public function up(Schema $s)
    {
        $s->createTable('addresses', function (Schema\Table $c) {
            $c->integer('addresses_id');
            $c->integer('npp');
            $c->string('title');
            $c->string('address');
            $c->string('type');
            $c->boolean('is_active');
        });
    }

    public function down(Schema $s)
    {
        $s->dropTable(['addresses_id','npp','title','address','type','is_active']);
    }
};