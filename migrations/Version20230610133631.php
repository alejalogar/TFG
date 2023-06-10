<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230610133631 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE messenger_messages (id BIGINT AUTO_INCREMENT NOT NULL, body LONGTEXT NOT NULL, headers LONGTEXT NOT NULL, queue_name VARCHAR(190) NOT NULL, created_at DATETIME NOT NULL, available_at DATETIME NOT NULL, delivered_at DATETIME DEFAULT NULL, INDEX IDX_75EA56E0FB7336F0 (queue_name), INDEX IDX_75EA56E0E3BD61CE (available_at), INDEX IDX_75EA56E016BA31DB (delivered_at), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE servicioscrucero CHANGE crucero_id crucero_id INT DEFAULT NULL, CHANGE servicio_id servicio_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE servicioscrucero RENAME INDEX crucero_id TO IDX_3809D30C788F23EB');
        $this->addSql('ALTER TABLE servicioscrucero RENAME INDEX servicio_id TO IDX_3809D30C71CAA3E7');
        $this->addSql('ALTER TABLE abordo DROP FOREIGN KEY abordo_ibfk_1');
        $this->addSql('ALTER TABLE abordo DROP FOREIGN KEY abordo_ibfk_2');
        $this->addSql('DROP INDEX camarote_id ON abordo');
        $this->addSql('DROP INDEX servicio_id ON abordo');
        $this->addSql('ALTER TABLE abordo DROP camarote_id, DROP servicio_id, DROP fecha_de_solicitud');
        $this->addSql('ALTER TABLE camarotes CHANGE crucero_id crucero_id INT DEFAULT NULL, CHANGE descripcion descripcion LONGTEXT NOT NULL');
        $this->addSql('ALTER TABLE camarotes RENAME INDEX crucero_id TO IDX_D446D322788F23EB');
        $this->addSql('ALTER TABLE comentarios CHANGE usuario_id usuario_id INT DEFAULT NULL, CHANGE crucero_id crucero_id INT DEFAULT NULL, CHANGE comentario comentario LONGTEXT NOT NULL');
        $this->addSql('ALTER TABLE comentarios RENAME INDEX usuario_id TO IDX_F54B3FC0DB38439E');
        $this->addSql('ALTER TABLE comentarios RENAME INDEX crucero_id TO IDX_F54B3FC0788F23EB');
        $this->addSql('ALTER TABLE crucero CHANGE tipo_id tipo_id INT DEFAULT NULL, CHANGE descripcion descripcion LONGTEXT NOT NULL');
        $this->addSql('ALTER TABLE crucero RENAME INDEX tipo_id TO IDX_F7617CE8A9276E6C');
        $this->addSql('ALTER TABLE reservas CHANGE usuario_id usuario_id INT DEFAULT NULL, CHANGE camarote_id camarote_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE reservas RENAME INDEX usuario_id TO IDX_AA1DAB01DB38439E');
        $this->addSql('ALTER TABLE reservas RENAME INDEX camarote_id TO IDX_AA1DAB013606C9DC');
        $this->addSql('ALTER TABLE servicios CHANGE descripcion descripcion LONGTEXT NOT NULL');
        $this->addSql('ALTER TABLE user DROP nombre, CHANGE email email VARCHAR(180) NOT NULL, CHANGE roles roles JSON NOT NULL');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_8D93D649E7927C74 ON user (email)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE messenger_messages');
        $this->addSql('ALTER TABLE abordo ADD camarote_id INT NOT NULL, ADD servicio_id INT NOT NULL, ADD fecha_de_solicitud DATETIME NOT NULL');
        $this->addSql('ALTER TABLE abordo ADD CONSTRAINT abordo_ibfk_1 FOREIGN KEY (camarote_id) REFERENCES camarotes (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('ALTER TABLE abordo ADD CONSTRAINT abordo_ibfk_2 FOREIGN KEY (servicio_id) REFERENCES servicios (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('CREATE INDEX camarote_id ON abordo (camarote_id)');
        $this->addSql('CREATE INDEX servicio_id ON abordo (servicio_id)');
        $this->addSql('ALTER TABLE crucero CHANGE tipo_id tipo_id INT NOT NULL, CHANGE descripcion descripcion TEXT NOT NULL');
        $this->addSql('ALTER TABLE crucero RENAME INDEX idx_f7617ce8a9276e6c TO tipo_id');
        $this->addSql('ALTER TABLE reservas CHANGE usuario_id usuario_id INT NOT NULL, CHANGE camarote_id camarote_id INT NOT NULL');
        $this->addSql('ALTER TABLE reservas RENAME INDEX idx_aa1dab013606c9dc TO camarote_id');
        $this->addSql('ALTER TABLE reservas RENAME INDEX idx_aa1dab01db38439e TO usuario_id');
        $this->addSql('ALTER TABLE comentarios CHANGE usuario_id usuario_id INT NOT NULL, CHANGE crucero_id crucero_id INT NOT NULL, CHANGE comentario comentario TEXT NOT NULL');
        $this->addSql('ALTER TABLE comentarios RENAME INDEX idx_f54b3fc0788f23eb TO crucero_id');
        $this->addSql('ALTER TABLE comentarios RENAME INDEX idx_f54b3fc0db38439e TO usuario_id');
        $this->addSql('ALTER TABLE camarotes CHANGE crucero_id crucero_id INT NOT NULL, CHANGE descripcion descripcion TEXT NOT NULL');
        $this->addSql('ALTER TABLE camarotes RENAME INDEX idx_d446d322788f23eb TO crucero_id');
        $this->addSql('ALTER TABLE ServiciosCrucero CHANGE crucero_id crucero_id INT NOT NULL, CHANGE servicio_id servicio_id INT NOT NULL');
        $this->addSql('ALTER TABLE ServiciosCrucero RENAME INDEX idx_3809d30c788f23eb TO crucero_id');
        $this->addSql('ALTER TABLE ServiciosCrucero RENAME INDEX idx_3809d30c71caa3e7 TO servicio_id');
        $this->addSql('ALTER TABLE servicios CHANGE descripcion descripcion TEXT NOT NULL');
        $this->addSql('DROP INDEX UNIQ_8D93D649E7927C74 ON user');
        $this->addSql('ALTER TABLE user ADD nombre VARCHAR(255) NOT NULL, CHANGE email email VARCHAR(255) NOT NULL, CHANGE roles roles VARCHAR(20) NOT NULL');
    }
}
