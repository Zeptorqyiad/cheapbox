<?php

use Simflex\Admin\Migration\Struct;
use \Simflex\Core\DB\Schema;

return new class implements \Simflex\Core\DB\Migration {
    public function up(Schema $s)
    {
        $s->table('addresses', function (Schema\Table $c) {
            $c->id('addresses_id');
        });
    }

    public function down(Schema $s)
    {
        $s->table('addresses', function (Schema\Table $c) {
            $c->dropColumns('addresses_id');
        });
    }
};