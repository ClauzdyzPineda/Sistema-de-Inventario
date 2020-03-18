-- MySQL dump 10.16  Distrib 10.1.40-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: inventario
-- ------------------------------------------------------
-- Server version	10.1.40-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulo` (
  `id_articulos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_articulo` varchar(50) NOT NULL,
  `tipo_articulo` varchar(50) DEFAULT NULL,
  `id_proveedor` int(11) NOT NULL,
  PRIMARY KEY (`id_articulos`),
  KEY `fk_proveedor` (`id_proveedor`),
  CONSTRAINT `fk_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
INSERT INTO `articulo` VALUES (2,'soda','sin licoR',1),(3,'soda','sin locor',2),(4,'Vodka','con licor',1),(5,'soda','Bebidas sin licor',7),(7,'Agua mineral','Agua',1);
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(50) NOT NULL,
  `apellidos_cliente` varchar(50) NOT NULL,
  `edad_cliente` int(11) NOT NULL,
  `dui_cliente` varchar(11) NOT NULL,
  `telefono_cliente` varchar(15) NOT NULL,
  `correo_cliente` varchar(50) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Javier','Puro Diaz',24,'12456329-3','7894-4567','javier@gmail.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devoluciones`
--

DROP TABLE IF EXISTS `devoluciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devoluciones` (
  `id_devoluciones` int(11) NOT NULL AUTO_INCREMENT,
  `id_articulos` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_devoluciones`),
  KEY `fk_articulo` (`id_articulos`),
  CONSTRAINT `fk_articulo` FOREIGN KEY (`id_articulos`) REFERENCES `articulo` (`id_articulos`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devoluciones`
--

LOCK TABLES `devoluciones` WRITE;
/*!40000 ALTER TABLE `devoluciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `devoluciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_persona` varchar(50) NOT NULL,
  `apellidos_persona` varchar(50) NOT NULL,
  `edad_persona` int(11) NOT NULL,
  `telefono_persona` varchar(15) NOT NULL,
  `direccion_persona` varchar(100) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_persona`),
  KEY `fk_usuario` (`id_usuario`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Marisol','Pineda',25,'22742222','La paz',6),(2,'Ernesto','Martinez',33,'22226654','San miguel',8),(3,'Gerardo','Pineda',20,'22759714','Merliot',9),(5,'Osvaldo','Gonzalez',24,'75559911','Soyapango',13);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(50) NOT NULL,
  `apellidos_proveedor` varchar(50) NOT NULL,
  `direccion_proveedor` varchar(100) NOT NULL,
  `telefono_proveedor` varchar(15) NOT NULL,
  `correo_proveedor` varchar(50) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Jeferson','Beltran','Los Planes Residencial Cumbres de santa Margarita  casa #5','6574-3567','jeferson@gmail.com'),(2,'Matias','Beltran Beltran','Olocuilta Residencial Las Plamas casa #32','6564-3567','Matias@gmail.com'),(3,'Mateo','Sanchez Sanchez','Santa Tecla Residencial el Porvenir casa #32','7564-3563','Mateo@gmail.com'),(4,'Jose','Sanchez Beltran',' Olocuilta Residencial Las Plamas  casa #5','6564-9567','leonardo@gmail.com'),(5,'Martin','Cuellar Amaya','San Salvador Residencial el Porvenir casa #9','7864-3562','Martin@gmail.com'),(6,'kevin',' Villanueva Beltran',' Apopa residencial El Sol pj. 4 casa #3','7964-5567','kevin@gmail.com'),(7,'Armando','Sanchez','Los Planes Residencial Cumbres de santa Margarita casa #4','7564-3969','Armando@gmail.com'),(8,'Andres','Romero Mineros','Santa Tecla Residencial Alturas de Holanda casa #34','7674-6587','Andres@gmail.com'),(9,'Maria','Platero Martinez','San  Marcos Vias de San Marcos casa #50','7564-3587','jose@gmail.com'),(10,'Marcos','Ventura Villanueva',' Santo Tomas Residencial Brisas del Volcan casa #45','7224-9567','Marcos@gmail.com'),(11,'Jose','Sanchez Beltran','Santa tecla Residencial el Porvenir casa #3','7564-3555','jose@gmail.com');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_articulos`
--

DROP TABLE IF EXISTS `registro_articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_articulos` (
  `id_registro_articulos` int(11) NOT NULL AUTO_INCREMENT,
  `precio_compra` double NOT NULL,
  `precio_venta` double NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_articulos` int(11) NOT NULL,
  PRIMARY KEY (`id_registro_articulos`),
  KEY `fkr_persona` (`id_persona`),
  KEY `fkr_articulos` (`id_articulos`),
  CONSTRAINT `fkr_articulos` FOREIGN KEY (`id_articulos`) REFERENCES `articulo` (`id_articulos`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkr_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_articulos`
--

LOCK TABLES `registro_articulos` WRITE;
/*!40000 ALTER TABLE `registro_articulos` DISABLE KEYS */;
INSERT INTO `registro_articulos` VALUES (1,0.5,1,'2020-04-02',44,1,4),(2,0.6,1,'2020-12-31',185,1,5),(4,0.55,1,'2020-12-31',180,1,7);
/*!40000 ALTER TABLE `registro_articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(25) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador'),(2,'Bodeguero'),(3,'Vendedor');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_articulo`
--

DROP TABLE IF EXISTS `stock_articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_articulo` (
  `id_stock_articulo` int(11) NOT NULL AUTO_INCREMENT,
  `id_articulos` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`id_stock_articulo`),
  KEY `fk_articulos` (`id_articulos`),
  CONSTRAINT `fk_articulos` FOREIGN KEY (`id_articulos`) REFERENCES `articulo` (`id_articulos`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_articulo`
--

LOCK TABLES `stock_articulo` WRITE;
/*!40000 ALTER TABLE `stock_articulo` DISABLE KEYS */;
INSERT INTO `stock_articulo` VALUES (1,2,150),(2,5,180),(4,7,180);
/*!40000 ALTER TABLE `stock_articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(25) NOT NULL,
  `contra` varchar(25) NOT NULL,
  `id_rol` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_rol` (`id_rol`),
  CONSTRAINT `fk_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Claudia','123',1),(2,'Ernesto','123',2),(3,'Gerardo','123',3),(4,'Elias','123',3),(5,'Osvaldo','123',3),(6,'Marisol','4321',1),(7,'Neto','4321',3),(8,'Neto','4321',2),(9,'Gerardo1','456',2),(10,'OG','123',3),(11,'Em','123',3),(12,'Gerardo1','212',1),(13,'OG','1213',3);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'inventario'
--
/*!50003 DROP PROCEDURE IF EXISTS `actulizarStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actulizarStock`()
BEGIN
UPDATE `stock_articulo` SET  `stock` = (stock+cantidad) WHERE (`id_articulos` = idArticulo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificarArticulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarArticulo`(
in nombreArticulo varchar(50),
in tipoArticulo varchar(50),
in precioCompra double,
in precioVenta double,
in fechaIngreso date,
in cantidad int,
in idProveedor int,
in registroArticulos int
)
BEGIN
UPDATE `registro_articulos` SET `precio_compra` = precioCompra, `precio_venta` = precioVenta, `fecha_ingreso` = fechaIngreso, `cantidad` = cantidad WHERE (`id_registro_articulos` =registroArticulos);
set @id:=(select id_articulos from registro_articulos where id_registro_articulos=registroArticulos);
UPDATE `articulo` SET `nombre_articulo` = nombreArticulo, `tipo_articulo` = tipoArticulo, `id_proveedor` = idProveedor WHERE (`id_articulos` = @id);
/**UPDATE `stock_articulo` SET `id_articulos` = idArticulo, `stock` = cantidad WHERE (`id_stock_articulo` = @id);*/

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificarPersonaUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarPersonaUsuario`(
in usuario varchar(25),
in pass varchar(25),
in rol int,
in nombre varchar(50),
in apellido varchar(50),
in edad int,
in tel varchar(15),
in direccion varchar(100),
in iduser int)
BEGIN
UPDATE `persona` SET `nombre_persona` = nombre, `apellidos_persona` = apellido,
 `edad_persona` = edad, `telefono_persona` = tel, `direccion_persona` = direccion WHERE 
 (`id_usuario` = iduser);
 UPDATE `usuario` SET `nombre_usuario` = usuario, `contra` = pass, `id_rol` = rol 
 WHERE (`id_usuario` = iduser);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nuevosArticulos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevosArticulos`(
in nombreArticulo varchar(50),
in tipoArticulo varchar(50),
in precioCompra double,
in precioVenta double,
in fechaIngreso date,
in cantidad int,
in idProveedor int
)
BEGIN
insert into articulo(nombre_articulo, tipo_articulo, id_proveedor)values
(nombreArticulo,tipoArticulo, idProveedor);
set @idArticulos:=(select max(id_articulos) from  articulo);

insert into registro_articulos 
(precio_compra, precio_venta, fecha_ingreso, cantidad, id_persona ,id_articulos) values 
(precioCompra, precioVenta,fechaIngreso,cantidad, 1,@idArticulos);

insert into stock_articulo(id_articulos,stock) 
values (@idArticulos,cantidad);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usuarioPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usuarioPersona`(
in usuario varchar(25),
in pass varchar(25),
in rol int,
in nombre varchar(50),
in apellido varchar(50),
in edad int,
in tel varchar(15),
in direccion varchar(100)
)
BEGIN
insert into usuario(nombre_usuario,contra,id_rol) values (usuario,pass,rol);
set @id:=(select max(id_usuario) from usuario);

insert into persona (nombre_persona,apellidos_persona,edad_persona,telefono_persona,direccion_persona,id_usuario)
values(nombre,apellido,edad,tel,direccion,@id);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-06 22:33:36
