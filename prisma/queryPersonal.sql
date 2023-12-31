-- Active: 1684789586570@@10.5.10.7@3306@db_personal

-- creacion de querys

CREATE TABLE
    `personal` (
        `ID_DNI_C` char(8) NOT NULL,
        `CIP_C` char(9) DEFAULT NULL,
        `AP_PATERNO_V` varchar(50) NULL,
        `AP_MATERNO_V` varchar(50) NULL,
        `NOMBRE_V` varchar(100) NULL,
        SECRET_PASS_V varchar(255),
        `FECHA_NAC_D` date DEFAULT NULL,
        `PER_D_RegFecha` date DEFAULT NULL,
        `PER_C_RegUser09` char(9) NULL,
        `FOTO_V` varchar(100) DEFAULT ("user.png"),
        `GRADO_I` int DEFAULT NULL,
        `ARM_I` int DEFAULT NULL,
        `SEC_I` int DEFAULT NULL,
        `SITMIL_I` int DEFAULT NULL,
        `DOMIC_I` int DEFAULT NULL,
        `ANTIGUEDAD_I` int DEFAULT NULL,
        `CELULAR_V` varchar(15),
        PRIMARY KEY (`ID_DNI_C`),
        KEY `FK_grado_id` (`GRADO_I`),
        KEY `FK_situacion_id` (`SITMIL_I`),
        CONSTRAINT `FK_grado_id` FOREIGN KEY (`GRADO_I`) REFERENCES `grado` (`ID_GRADO_I`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `FK_situacion_id` FOREIGN KEY (`SITMIL_I`) REFERENCES `situacion_militar` (`ID_SIMILITAR_I`) ON DELETE CASCADE ON UPDATE CASCADE
    );

ALTER TABLE personal ADD SECRET_PASS_V varchar(255);

CREATE TABLE
    usuario (
        ID_USUARIO_I INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        ID_DNI_C CHAR(8) UNIQUE,
        PASSWORD_V varchar(255),
        SECRET_PASS_V varchar(255),
        ROL_ID_I int,
        ESTADO_B tinyint(1) DEFAULT (true),
        FECHA_CREATE_D DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        FECHA_UPDATE_D TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        ROLE_SISTEMA_I int NULL,
        CONSTRAINT FK_personal_id FOREIGN KEY (ID_DNI_C) REFERENCES personal(ID_DNI_C)
    );

CREATE TABLE
    sistema (
        ID_SISTEMA_I INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        DESC_CORTA_V varchar(100),
        DESC_LARGA_V varchar(200),
        ESTADO_B tinyint(1) DEFAULT (true)
    );

CREATE TABLE
    role (
        ID_ROLE_I int NOT NULL AUTO_INCREMENT,
        DESC_CORTA_V varchar(100) NOT NULL,
        DESC_LARGA_V varchar(200) NOT NULL,
        ESTADO_B tinyint(1) DEFAULT (true),
        PRIMARY KEY (ID_ROLE_I)
    );

CREATE TABLE
    opciones (
        ID_OPCIONES_I int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
        DESC_CORTA_V varchar(100) NOT NULL,
        DESC_LARGA_V varchar(200) NOT NULL,
        ESTADO_B tinyint(1) DEFAULT (true),
        ROLE_ID_I INT NULL,
        CONSTRAINT FK_rolex_id FOREIGN KEY (ROLE_ID_I) REFERENCES role(ID_ROLE_I) 
    );

CREATE TABLE
    personal_opciones (
        ID_PER_OPCIONES INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        PERSONAL_ID_C CHAR(8) NOT NULL,
        OPCIONES_ID_I int NOT NULL,
        ESTADO_B tinyint(1) DEFAULT (true),
        FECHA_CREATE_D DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        FECHA_UPDATE_D TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        CONSTRAINT FK_personal_opciones_id FOREIGN KEY (PERSONAL_ID_C) REFERENCES personal(ID_DNI_C),
        CONSTRAINT FK_opciones_per_id FOREIGN KEY (OPCIONES_ID_I) REFERENCES opciones(ID_OPCIONES_I)
    );


CREATE TABLE
    personal_role (
        ID_PER_ROLE INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        PERSONAL_ID CHAR(8) NOT NULL,
        ROLE_ID int NOT NULL,
        ESTADO_B tinyint(1) DEFAULT (true),
        FECHA_CREATE_D DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        FECHA_UPDATE_D TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        CONSTRAINT FK_personal_role_id FOREIGN KEY (PERSONAL_ID) REFERENCES personal(ID_DNI_C),
        CONSTRAINT FK_role_per_id FOREIGN KEY (ROLE_ID) REFERENCES role(ID_ROLE_I)
    );

CREATE TABLE
    personal_sistema (
        ID_PER_SISTEMA INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        PERSONAL_ID CHAR(8) NOT NULL,
        SISTEMA_ID int NOT NULL,
        ESTADO_B tinyint(1) DEFAULT (true),
        FECHA_CREATE_D DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        FECHA_UPDATE_D TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        CONSTRAINT FK_personal_sis_id FOREIGN KEY (PERSONAL_ID) REFERENCES personal(ID_DNI_C),
        CONSTRAINT FK_sistema_per_id FOREIGN KEY (SISTEMA_ID) REFERENCES sistema(ID_SISTEMA_I)
    );

CREATE TABLE
    nivel_1 (
        ID_NIVEL1_I INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        DESC_CORTA_V varchar(100) NOT NULL,
        DESC_LARGA_V varchar(200) NOT NULL,
        UNIDAD_ID_I int NULL,
        ESTADO_B tinyint(1) DEFAULT (true),
        FECHA_CREATE_D DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        FECHA_UPDATE_D TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        CONSTRAINT FK_unidad_id FOREIGN KEY (UNIDAD_ID_I) REFERENCES unidad(ID_UNIDAD_I)
    );

CREATE TABLE
    nivel_2 (
        ID_NIVEL2_I INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        DESC_CORTA_V varchar(100) NOT NULL,
        DESC_LARGA_V varchar(200) NOT NULL,
        NIVEL1_ID_I int NULL,
        ESTADO_B tinyint(1) DEFAULT (true),
        FECHA_CREATE_D DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        FECHA_UPDATE_D TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        CONSTRAINT FK_nivel1_id FOREIGN KEY (NIVEL1_ID_I) REFERENCES nivel_1(ID_NIVEL1_I)
    );

CREATE TABLE
    nivel_3 (
        ID_NIVEL3_I INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        DESC_CORTA_V varchar(100) NOT NULL,
        DESC_LARGA_V varchar(200) NOT NULL,
        NIVEL2_ID_I int NULL,
        ESTADO_B tinyint(1) DEFAULT (true),
        FECHA_CREATE_D DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        FECHA_UPDATE_D TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        CONSTRAINT FK_nivel2_id FOREIGN KEY (NIVEL2_ID_I) REFERENCES nivel_2(ID_NIVEL2_I)
    );

CREATE TABLE
    nivel_4 (
        ID_NIVEL4_I INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        DESC_CORTA_V varchar(100) NOT NULL,
        DESC_LARGA_V varchar(200) NOT NULL,
        NIVEL3_ID_I int NULL,
        ESTADO_B tinyint(1) DEFAULT (true),
        FECHA_CREATE_D DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        FECHA_UPDATE_D TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        CONSTRAINT FK_nivel3_id FOREIGN KEY (NIVEL3_ID_I) REFERENCES nivel_3(ID_NIVEL3_I)
    );

CREATE TABLE
    nivel_4_personal (
        ID_NIVEL4_PERSONAL_I INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        NIVEL4_ID_I int NULL,
        PERSONAL_ID CHAR(8) NOT NULL,
        ESTADO_B tinyint(1) DEFAULT (true),
        FECHA_CREATE_D DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT FK_nivel4_personal_id FOREIGN KEY (NIVEL4_ID_I) REFERENCES nivel_4(ID_NIVEL4_I),
        CONSTRAINT FK_personal_nivel4_id FOREIGN KEY (PERSONAL_ID) REFERENCES personal(ID_DNI_C)
    );

SELECT * from unidad;

SELECT
    u.ID_DNI_C,
    s.`ID_SISTEMA_I`,
    s.DESC_CORTA_V,
    r.`ID_ROLE_I`,
    r.DESC_CORTA_V
FROM
    usuario_sistema_role AS usr
    INNER JOIN usuario u ON usr.`USUARIO_ID` = u.ID_DNI_C
    INNER JOIN sistema s ON usr.`SISTEMA_ID` = s.ID_SISTEMA_I
    INNER JOIN role r ON usr.`ROLE_ID` = r.ID_ROLE_I
WHERE u.ID_DNI_C = "44974829";

SELECT
    p.ID_DNI_C,
    s.ID_SISTEMA_I,
    s.DESC_CORTA_V,
    r.ID_ROLE_I,
    r.DESC_CORTA_V
FROM
    usuario_sistema_role AS usr
    INNER JOIN personal p ON usr.`PERSONAL_ID` = p.ID_DNI_C
    INNER JOIN sistema s ON usr.`SISTEMA_ID` = s.ID_SISTEMA_I
    INNER JOIN role r ON usr.`ROLE_ID` = r.ID_ROLE_I
WHERE
    usr.PERSONAL_ID = "44974829";

SELECT
    p.ID_DNI_C,
    ps.SISTEMA_ID,
    s.DESC_CORTA_V
FROM personal AS p
    INNER JOIN personal_sistema ps ON ps.PERSONAL_ID = p.ID_DNI_C
    INNER JOIN sistema s ON ps.SISTEMA_ID = s.ID_SISTEMA_I
WHERE
    ps.PERSONAL_ID = "44974829";

SELECT * from personal_sistema;

SELECT * from personal WHERE ID_DNI_C IN("00516104", "44974829");

SELECT * from role;

SELECT * from sistema;

DELETE FROM
    db_personal.producto
WHERE
    personal.producto.ID_PRODUCTO_I = 1;

INSERT INTO
    producto(DESCRIPCION_V, PRECIO_I)
VALUES('LAPTOP MAC', 3000);

SELECT * FROM personal WHERE `ID_DNI_C` = "44974829";

SELECT * FROM personal;

use db_personal;

SHOW TABLES;

use db_personal;

SELECT * from personal WHERE `AP_PATERNO_V` = "CAMACHO";

SELECT * from unidad WHERE `DESC_CORTA_V` = "DIE" ;

SELECT * FROM unidad WHERE `DESC_CORTA_V` = "DIE";

SELECT * FROM nivel_1;

SELECT * FROM nivel_2;

SELECT * FROM nivel_3;

SELECT * FROM nivel_4;

SELECT * FROM nivel_4_personal;

SELECT * FROM role;
SELECT * FROM opciones;

46114234 = MENDEZ 43371358 = HUANCA 09616945 = CAMACHO
ALTER TABLE usuario
ADD
    PASSWORD_V VARCHAR(255) NULL;

DESCRIBE personal;


SELECT * FROM personal_sistema WHERE `PERSONAL_ID` = "44974829" AND `SISTEMA_ID` = 1




43371358 = HUANCA   /// ROLE SERVICIO CRIPTO
46114234 = MENDEZ   /// ROLE SUB DIRECTOR
09616945 = CAMACHO  /// ROLE JEFE DPT;



320505300
