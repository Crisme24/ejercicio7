<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210222171705 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE presupuesto (id INT AUTO_INCREMENT NOT NULL, numero VARCHAR(255) NOT NULL, fecha DATE NOT NULL, concepto VARCHAR(255) NOT NULL, cantidad INT NOT NULL, price DOUBLE PRECISION NOT NULL, total DOUBLE PRECISION NOT NULL, valido_hasta DATE NOT NULL, informacion VARCHAR(255) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE alumnos_asignaturas DROP FOREIGN KEY FK_D57EE88C5C70C5B');
        $this->addSql('ALTER TABLE alumnos_asignaturas DROP FOREIGN KEY FK_D57EE88FC28E5EE');
        $this->addSql('ALTER TABLE alumnos_asignaturas ADD CONSTRAINT FK_D57EE88C5C70C5B FOREIGN KEY (asignatura_id) REFERENCES asignatura (id)');
        $this->addSql('ALTER TABLE alumnos_asignaturas ADD CONSTRAINT FK_D57EE88FC28E5EE FOREIGN KEY (alumno_id) REFERENCES alumno (id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE presupuesto');
        $this->addSql('ALTER TABLE alumnos_asignaturas DROP FOREIGN KEY FK_D57EE88C5C70C5B');
        $this->addSql('ALTER TABLE alumnos_asignaturas DROP FOREIGN KEY FK_D57EE88FC28E5EE');
        $this->addSql('ALTER TABLE alumnos_asignaturas ADD CONSTRAINT FK_D57EE88C5C70C5B FOREIGN KEY (asignatura_id) REFERENCES asignatura (id) ON UPDATE NO ACTION ON DELETE CASCADE');
        $this->addSql('ALTER TABLE alumnos_asignaturas ADD CONSTRAINT FK_D57EE88FC28E5EE FOREIGN KEY (alumno_id) REFERENCES alumno (id) ON UPDATE NO ACTION ON DELETE CASCADE');
    }
}
