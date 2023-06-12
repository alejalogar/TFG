<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230611134050 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE ServiciosCrucero (id INT AUTO_INCREMENT NOT NULL, crucero_id INT DEFAULT NULL, servicio_id INT DEFAULT NULL, INDEX IDX_3809D30C788F23EB (crucero_id), INDEX IDX_3809D30C71CAA3E7 (servicio_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE abordo (id INT AUTO_INCREMENT NOT NULL, camarote_id INT NOT NULL, servicio_id INT NOT NULL, fecha_de_solicitud DATETIME NOT NULL, INDEX IDX_7934D0703606C9DC (camarote_id), INDEX IDX_7934D07071CAA3E7 (servicio_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE camarotes (id INT AUTO_INCREMENT NOT NULL, crucero_id INT DEFAULT NULL, nombre VARCHAR(255) NOT NULL, descripcion LONGTEXT NOT NULL, tipo_de_cama VARCHAR(255) NOT NULL, precio NUMERIC(10, 2) NOT NULL, cantidad_disponible INT NOT NULL, INDEX IDX_D446D322788F23EB (crucero_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE comentarios (id INT AUTO_INCREMENT NOT NULL, usuario_id INT DEFAULT NULL, crucero_id INT DEFAULT NULL, comentario LONGTEXT NOT NULL, fecha_de_comentario DATETIME NOT NULL, INDEX IDX_F54B3FC0DB38439E (usuario_id), INDEX IDX_F54B3FC0788F23EB (crucero_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE crucero (id INT AUTO_INCREMENT NOT NULL, tipo_id INT DEFAULT NULL, nombre VARCHAR(255) NOT NULL, destino VARCHAR(255) NOT NULL, descripcion LONGTEXT NOT NULL, puerto_de_salida VARCHAR(255) NOT NULL, puerto_de_llegada VARCHAR(255) NOT NULL, fecha_de_salida DATE NOT NULL, fecha_de_llegada DATE NOT NULL, imagen VARCHAR(255) DEFAULT NULL, INDEX IDX_F7617CE8A9276E6C (tipo_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE reservas (id INT AUTO_INCREMENT NOT NULL, usuario_id INT DEFAULT NULL, camarote_id INT DEFAULT NULL, fecha_de_reserva DATETIME NOT NULL, INDEX IDX_AA1DAB01DB38439E (usuario_id), INDEX IDX_AA1DAB013606C9DC (camarote_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE servicios (id INT AUTO_INCREMENT NOT NULL, nombre VARCHAR(255) NOT NULL, descripcion LONGTEXT NOT NULL, precio NUMERIC(10, 2) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tipocrucero (id INT AUTO_INCREMENT NOT NULL, nombre VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE user (id INT AUTO_INCREMENT NOT NULL, email VARCHAR(180) NOT NULL, roles VARCHAR(255) NOT NULL, password VARCHAR(255) NOT NULL, UNIQUE INDEX UNIQ_8D93D649E7927C74 (email), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE messenger_messages (id BIGINT AUTO_INCREMENT NOT NULL, body LONGTEXT NOT NULL, headers LONGTEXT NOT NULL, queue_name VARCHAR(190) NOT NULL, created_at DATETIME NOT NULL, available_at DATETIME NOT NULL, delivered_at DATETIME DEFAULT NULL, INDEX IDX_75EA56E0FB7336F0 (queue_name), INDEX IDX_75EA56E0E3BD61CE (available_at), INDEX IDX_75EA56E016BA31DB (delivered_at), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE ServiciosCrucero ADD CONSTRAINT FK_3809D30C788F23EB FOREIGN KEY (crucero_id) REFERENCES crucero (id)');
        $this->addSql('ALTER TABLE ServiciosCrucero ADD CONSTRAINT FK_3809D30C71CAA3E7 FOREIGN KEY (servicio_id) REFERENCES servicios (id)');
        $this->addSql('ALTER TABLE abordo ADD CONSTRAINT FK_7934D0703606C9DC FOREIGN KEY (camarote_id) REFERENCES camarotes (id)');
        $this->addSql('ALTER TABLE abordo ADD CONSTRAINT FK_7934D07071CAA3E7 FOREIGN KEY (servicio_id) REFERENCES servicios (id)');
        $this->addSql('ALTER TABLE camarotes ADD CONSTRAINT FK_D446D322788F23EB FOREIGN KEY (crucero_id) REFERENCES crucero (id)');
        $this->addSql('ALTER TABLE comentarios ADD CONSTRAINT FK_F54B3FC0DB38439E FOREIGN KEY (usuario_id) REFERENCES user (id)');
        $this->addSql('ALTER TABLE comentarios ADD CONSTRAINT FK_F54B3FC0788F23EB FOREIGN KEY (crucero_id) REFERENCES crucero (id)');
        $this->addSql('ALTER TABLE crucero ADD CONSTRAINT FK_F7617CE8A9276E6C FOREIGN KEY (tipo_id) REFERENCES tipocrucero (id)');
        $this->addSql('ALTER TABLE reservas ADD CONSTRAINT FK_AA1DAB01DB38439E FOREIGN KEY (usuario_id) REFERENCES user (id)');
        $this->addSql('ALTER TABLE reservas ADD CONSTRAINT FK_AA1DAB013606C9DC FOREIGN KEY (camarote_id) REFERENCES camarotes (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE ServiciosCrucero DROP FOREIGN KEY FK_3809D30C788F23EB');
        $this->addSql('ALTER TABLE ServiciosCrucero DROP FOREIGN KEY FK_3809D30C71CAA3E7');
        $this->addSql('ALTER TABLE abordo DROP FOREIGN KEY FK_7934D0703606C9DC');
        $this->addSql('ALTER TABLE abordo DROP FOREIGN KEY FK_7934D07071CAA3E7');
        $this->addSql('ALTER TABLE camarotes DROP FOREIGN KEY FK_D446D322788F23EB');
        $this->addSql('ALTER TABLE comentarios DROP FOREIGN KEY FK_F54B3FC0DB38439E');
        $this->addSql('ALTER TABLE comentarios DROP FOREIGN KEY FK_F54B3FC0788F23EB');
        $this->addSql('ALTER TABLE crucero DROP FOREIGN KEY FK_F7617CE8A9276E6C');
        $this->addSql('ALTER TABLE reservas DROP FOREIGN KEY FK_AA1DAB01DB38439E');
        $this->addSql('ALTER TABLE reservas DROP FOREIGN KEY FK_AA1DAB013606C9DC');
        $this->addSql('DROP TABLE ServiciosCrucero');
        $this->addSql('DROP TABLE abordo');
        $this->addSql('DROP TABLE camarotes');
        $this->addSql('DROP TABLE comentarios');
        $this->addSql('DROP TABLE crucero');
        $this->addSql('DROP TABLE reservas');
        $this->addSql('DROP TABLE servicios');
        $this->addSql('DROP TABLE tipocrucero');
        $this->addSql('DROP TABLE user');
        $this->addSql('DROP TABLE messenger_messages');
    }
}
