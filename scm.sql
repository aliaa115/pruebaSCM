CREATE DATABASE  IF NOT EXISTS `erp` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `erp`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: erp
-- ------------------------------------------------------
-- Server version	8.0.19

--
-- Table structure for table `acreedores`
--

DROP TABLE IF EXISTS `acreedores`;
CREATE TABLE `acreedores` (
  `id_acreedor` int NOT NULL AUTO_INCREMENT,
  `id_contacto` int NOT NULL,
  `nombre_acreedor` varchar(45) DEFAULT NULL,
  `descripcion_acreedor` text,
  `direccion_acreedor` varchar(45) DEFAULT NULL,
  `pagina_acreedor` varchar(45) DEFAULT NULL,
  `ESTADO` tinyint DEFAULT '1',
  PRIMARY KEY (`id_acreedor`),
  KEY `fk_servicios_contactos1` (`id_contacto`),
  CONSTRAINT `fk_servicios_contactos1` FOREIGN KEY (`id_contacto`) REFERENCES `contactos` (`id_contacto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acreedores`
--

LOCK TABLES `acreedores` WRITE;
INSERT INTO `acreedores` VALUES (1,1,'ACREEDOR PRUEBA','Acreedor para pruebas de funcionalidad de Software','direccion','acreedor.com',1);
UNLOCK TABLES;

--
-- Table structure for table `acreedores_servicios`
--

DROP TABLE IF EXISTS `acreedores_servicios`;
CREATE TABLE `acreedores_servicios` (
  `id_acreedor` int NOT NULL,
  `id_servicio` int NOT NULL,
  PRIMARY KEY (`id_acreedor`,`id_servicio`),
  KEY `fk_acreedores_has_servicios_servicios1` (`id_servicio`),
  CONSTRAINT `fk_acreedores_has_servicios_acreedores1` FOREIGN KEY (`id_acreedor`) REFERENCES `acreedores` (`id_acreedor`),
  CONSTRAINT `fk_acreedores_has_servicios_servicios1` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acreedores_servicios`
--

LOCK TABLES `acreedores_servicios` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `ayuda`
--

DROP TABLE IF EXISTS `ayuda`;
CREATE TABLE `ayuda` (
  `Id_ayuda` int NOT NULL,
  `Ruta` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `indice` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ayuda`
--

LOCK TABLES `ayuda` WRITE;
INSERT INTO `ayuda` VALUES (1,'Página web ayuda/ayuda.chm','menu.html'),(2,'Página web ayuda/ayuda.chm','Menúboletos.html');
UNLOCK TABLES;

--
-- Table structure for table `bodegas`
--

DROP TABLE IF EXISTS `bodegas`;
CREATE TABLE `bodegas` (
  `id_bodega` int NOT NULL AUTO_INCREMENT,
  `nombre_bodega` varchar(45) DEFAULT NULL,
  `descripcion_bodega` text,
  `ubicacion_bodega` varchar(45) DEFAULT NULL,
  `stock_maximo` int DEFAULT NULL,
  `ESTADO` tinyint DEFAULT '1',
  PRIMARY KEY (`id_bodega`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bodegas`
--

LOCK TABLES `bodegas` WRITE;
INSERT INTO `bodegas` VALUES (1,'BODEGA PRUEBA','Bodega para pruebas de funcionalidad de Software','ubicacion',0,1);
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(45) DEFAULT NULL,
  `descripcion_categoria` text,
  `ESTADO` tinyint DEFAULT '1',
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
INSERT INTO `categorias` VALUES (1,'CATEGORIA PRUEBA','Categoria para pruebas de funcionalidad de Software',1);
UNLOCK TABLES;

--
-- Table structure for table `contactos`
--

DROP TABLE IF EXISTS `contactos`;
CREATE TABLE `contactos` (
  `id_contacto` int NOT NULL AUTO_INCREMENT,
  `nombre_contacto` varchar(45) DEFAULT NULL,
  `descripcion_contacto` text,
  `telefono_contacto` varchar(45) DEFAULT NULL,
  `direccion_contacto` varchar(45) DEFAULT NULL,
  `email_contacto` varchar(45) DEFAULT NULL,
  `ESTADO` tinyint DEFAULT '1',
  PRIMARY KEY (`id_contacto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contactos`
--

LOCK TABLES `contactos` WRITE;
INSERT INTO `contactos` VALUES (1,'CONTACTO PRUEBA','Contacto para pruebas de funcionalidad de Software','12345678','direccion','email@123.com',1);
UNLOCK TABLES;

--
-- Table structure for table `cotizaciones_detalle`
--

DROP TABLE IF EXISTS `cotizaciones_detalle`;
CREATE TABLE `cotizaciones_detalle` (
  `id_cotizacion_detalle` int NOT NULL AUTO_INCREMENT,
  `id_cotizacion_encabezado` int NOT NULL,
  `id_proveedor` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad_cotizacion` int DEFAULT NULL,
  `precio_unitario_cotizacion` double DEFAULT NULL,
  PRIMARY KEY (`id_cotizacion_detalle`,`id_cotizacion_encabezado`,`id_proveedor`,`id_producto`),
  KEY `fk_cotizaciones_detalle_cotizaciones_encabezado1` (`id_cotizacion_encabezado`,`id_proveedor`),
  KEY `fk_cotizaciones_detalle_productos1` (`id_producto`),
  CONSTRAINT `fk_cotizaciones_detalle_cotizaciones_encabezado1` FOREIGN KEY (`id_cotizacion_encabezado`, `id_proveedor`) REFERENCES `cotizaciones_encabezado` (`id_cotizacion_encabezado`, `id_proveedor`),
  CONSTRAINT `fk_cotizaciones_detalle_productos1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cotizaciones_detalle`
--

LOCK TABLES `cotizaciones_detalle` WRITE;
INSERT INTO `cotizaciones_detalle` VALUES (1,1,1,1,20,0.25),(2,1,1,2,30,0.01),(1,2,1,1,2000,0.23);
UNLOCK TABLES;

--
-- Table structure for table `cotizaciones_encabezado`
--

DROP TABLE IF EXISTS `cotizaciones_encabezado`;
CREATE TABLE `cotizaciones_encabezado` (
  `id_cotizacion_encabezado` int NOT NULL AUTO_INCREMENT,
  `id_proveedor` int NOT NULL,
  `nombre_cotizacion` varchar(45) DEFAULT NULL,
  `descripcion_cotizacion` text,
  `fecha_cotizacion` date DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `ESTADO` tinyint DEFAULT '1',
  PRIMARY KEY (`id_cotizacion_encabezado`,`id_proveedor`),
  KEY `fk_cotizaciones_encabezado_proveedores1` (`id_proveedor`),
  CONSTRAINT `fk_cotizaciones_encabezado_proveedores1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cotizaciones_encabezado`
--

LOCK TABLES `cotizaciones_encabezado` WRITE;
INSERT INTO `cotizaciones_encabezado` VALUES (1,1,'cotizacion prueba','descripcion de cotizacion prueba','2020-01-01','2022-01-10',1),(2,1,'cotizacion prueba 2','descripcion de cotizacion prueba','2020-01-01','2022-01-10',1);
UNLOCK TABLES;

--
-- Table structure for table `creditos_pedidos_detalle`
--

DROP TABLE IF EXISTS `creditos_pedidos_detalle`;
CREATE TABLE `creditos_pedidos_detalle` (
  `id_credito_pedido_detalle` int NOT NULL AUTO_INCREMENT,
  `id_credito_pedido_encabezado` int NOT NULL,
  `id_orden_compra_encabezado` int NOT NULL,
  `id_cotizacion_encabezado` int NOT NULL,
  `id_proveedor` int NOT NULL,
  `fehca_inicio` date DEFAULT NULL,
  `fecha_limite` date DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `tipo_movimiento` int DEFAULT NULL,
  PRIMARY KEY (`id_credito_pedido_detalle`,`id_credito_pedido_encabezado`,`id_orden_compra_encabezado`,`id_cotizacion_encabezado`,`id_proveedor`),
  KEY `fk_creditos_pedidos_detalle_creditos_pedidos_encabezado1` (`id_credito_pedido_encabezado`,`id_orden_compra_encabezado`,`id_cotizacion_encabezado`,`id_proveedor`),
  KEY `fk_creditos_pedidos_detalle_cuentas1` (`tipo_movimiento`),
  CONSTRAINT `fk_creditos_pedidos_detalle_creditos_pedidos_encabezado1` FOREIGN KEY (`id_credito_pedido_encabezado`, `id_orden_compra_encabezado`, `id_cotizacion_encabezado`, `id_proveedor`) REFERENCES `creditos_pedidos_encabezado` (`id_credito_pedido_encabezado`, `id_orden_compra_encabezado`, `id_cotizacion_encabezado`, `id_proveedor`),
  CONSTRAINT `fk_creditos_pedidos_detalle_cuentas1` FOREIGN KEY (`tipo_movimiento`) REFERENCES `cuentas` (`id_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `creditos_pedidos_detalle`
--

LOCK TABLES `creditos_pedidos_detalle` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `creditos_pedidos_encabezado`
--

DROP TABLE IF EXISTS `creditos_pedidos_encabezado`;
CREATE TABLE `creditos_pedidos_encabezado` (
  `id_credito_pedido_encabezado` int NOT NULL AUTO_INCREMENT,
  `id_orden_compra_encabezado` int NOT NULL,
  `id_cotizacion_encabezado` int NOT NULL,
  `id_proveedor` int NOT NULL,
  `id_banco` int DEFAULT NULL,
  `monto_total` double DEFAULT NULL,
  `saldo_actual` double DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `numero_cuotas` int DEFAULT NULL,
  `limite_cuotas` int DEFAULT NULL,
  `ESTADO` tinyint DEFAULT '1',
  PRIMARY KEY (`id_credito_pedido_encabezado`,`id_orden_compra_encabezado`,`id_cotizacion_encabezado`,`id_proveedor`),
  KEY `fk_creditos_pedidos_encabezado_ordenes_compras_encabezado1` (`id_orden_compra_encabezado`,`id_cotizacion_encabezado`,`id_proveedor`),
  KEY `fk_creditos_pedidos_encabezado_bancos` (`id_banco`),
  CONSTRAINT `fk_creditos_pedidos_encabezado_bancos` FOREIGN KEY (`id_banco`) REFERENCES `bancos` (`PK_idBanco`),
  CONSTRAINT `fk_creditos_pedidos_encabezado_ordenes_compras_encabezado1` FOREIGN KEY (`id_orden_compra_encabezado`, `id_cotizacion_encabezado`, `id_proveedor`) REFERENCES `ordenes_compras_encabezado` (`id_orden_compra_encabezado`, `id_cotizacion_encabezado`, `id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `creditos_pedidos_encabezado`
--

LOCK TABLES `creditos_pedidos_encabezado` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
CREATE TABLE `cuentas` (
  `id_cuenta` int NOT NULL AUTO_INCREMENT,
  `id_tipo_cuenta` int NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `estado` tinyint DEFAULT '1',
  PRIMARY KEY (`id_cuenta`,`id_tipo_cuenta`),
  KEY `fk_tbl_cuentas_contables_tbl_tipoCuentaContable1_idx` (`id_tipo_cuenta`),
  CONSTRAINT `fk_tbl_cuentas_contables_tbl_tipoCuentaContable1` FOREIGN KEY (`id_tipo_cuenta`) REFERENCES `tipo_cuentas` (`id_tipo_cuenta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cuentas`
--

LOCK TABLES `cuentas` WRITE;
INSERT INTO `cuentas` VALUES (1,1,'cuenta','descripcion',1),(2,1,'cuenta2','descripcion',1);
UNLOCK TABLES;

--
-- Table structure for table `devoluciones`
--

DROP TABLE IF EXISTS `devoluciones`;
CREATE TABLE `devoluciones` (
  `id_devolucion` int NOT NULL AUTO_INCREMENT,
  `id_orden_compra_encabezado` int NOT NULL,
  `id_cotizacion_encabezado` int NOT NULL,
  `id_proveedor` int NOT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  `razon_devolucion` text,
  `ESTADO` tinyint DEFAULT '1',
  PRIMARY KEY (`id_devolucion`,`id_orden_compra_encabezado`,`id_cotizacion_encabezado`,`id_proveedor`),
  KEY `fk_devoluciones_ordenes_compras_encabezado1` (`id_orden_compra_encabezado`,`id_cotizacion_encabezado`,`id_proveedor`),
  CONSTRAINT `fk_devoluciones_ordenes_compras_encabezado1` FOREIGN KEY (`id_orden_compra_encabezado`, `id_cotizacion_encabezado`, `id_proveedor`) REFERENCES `ordenes_compras_encabezado` (`id_orden_compra_encabezado`, `id_cotizacion_encabezado`, `id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `devoluciones`
--

LOCK TABLES `devoluciones` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `documentos`
--

DROP TABLE IF EXISTS `documentos`;
CREATE TABLE `documentos` (
  `id_documento` int NOT NULL AUTO_INCREMENT,
  `codigo_documento` int DEFAULT NULL,
  `nombre_documento` varchar(45) DEFAULT NULL,
  `tipo_documento` varchar(45) DEFAULT NULL,
  `estado` tinyint DEFAULT '1',
  PRIMARY KEY (`id_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `documentos`
--

LOCK TABLES `documentos` WRITE;
INSERT INTO `documentos` VALUES (1,0,'Documento Prueba','Orden de Compra',1),(2,0,'Documento Prueba','Orden de Compra',1);
UNLOCK TABLES;

--
-- Table structure for table `impuestos`
--

DROP TABLE IF EXISTS `impuestos`;
CREATE TABLE `impuestos` (
  `id_impuesto` int NOT NULL AUTO_INCREMENT,
  `nombre_impuesto` varchar(45) DEFAULT NULL,
  `descripcion_impuesto` text,
  `tasa_impuesto` double DEFAULT NULL,
  `ESTADO` tinyint DEFAULT '1',
  PRIMARY KEY (`id_impuesto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `impuestos`
--

LOCK TABLES `impuestos` WRITE;
INSERT INTO `impuestos` VALUES (1,'IMPUESTO PRUEBA','Impuesto para pruebas de funcionalidad de Software',0.5,1);
UNLOCK TABLES;

--
-- Table structure for table `inventarios`
--

DROP TABLE IF EXISTS `inventarios`;
CREATE TABLE `inventarios` (
  `nombre_inventario` varchar(45) DEFAULT NULL,
  `id_producto` int NOT NULL,
  `id_bodega` int NOT NULL,
  `descripcion_inventario` text,
  `cantidad_maxima` int DEFAULT NULL,
  `cantidad_minima` int DEFAULT NULL,
  `numero_estanteria` int DEFAULT NULL,
  `existencia_inventario` int DEFAULT NULL,
  `ESTADO` tinyint DEFAULT '1',
  PRIMARY KEY (`id_producto`,`id_bodega`),
  KEY `fk_inventarios_bodegas1` (`id_bodega`),
  CONSTRAINT `fk_inventarios_bodegas1` FOREIGN KEY (`id_bodega`) REFERENCES `bodegas` (`id_bodega`),
  CONSTRAINT `fk_inventarios_productos1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventarios`
--

LOCK TABLES `inventarios` WRITE;
INSERT INTO `inventarios` VALUES ('INVENTARIO PRUEBA',2,1,'Inventario para pruebas de funcionalidad de Software',800,2,2,90,1);
UNLOCK TABLES;

--
-- Table structure for table `lineas`
--

DROP TABLE IF EXISTS `lineas`;
CREATE TABLE `lineas` (
  `id_linea` int NOT NULL AUTO_INCREMENT,
  `nombre_linea` varchar(45) DEFAULT NULL,
  `descripcion_linea` text,
  `ESTADO` tinyint DEFAULT '1',
  PRIMARY KEY (`id_linea`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lineas`
--

LOCK TABLES `lineas` WRITE;
INSERT INTO `lineas` VALUES (1,'LINEA PRUEBA','Linea para pruebas de funcionalidad de Software',1);
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
CREATE TABLE `marcas` (
  `id_marca` int NOT NULL AUTO_INCREMENT,
  `nombre_marca` varchar(45) DEFAULT NULL,
  `descripcion_marca` text,
  `ESTADO` tinyint DEFAULT '1',
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
INSERT INTO `marcas` VALUES (1,'MARCA PRUEBA','Marca para pruebas de funcionalidad de Software',1);
UNLOCK TABLES;

--
-- Table structure for table `movimientos_inventario_detalle`
--

DROP TABLE IF EXISTS `movimientos_inventario_detalle`;
CREATE TABLE `movimientos_inventario_detalle` (
  `id_movimiento_inventario_detalle` int NOT NULL AUTO_INCREMENT,
  `id_movimiento_inventario_encabezado` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad_movimiento` int DEFAULT NULL,
  `costo_producto` double DEFAULT NULL,
  `precio_producto` double DEFAULT NULL,
  PRIMARY KEY (`id_movimiento_inventario_detalle`,`id_movimiento_inventario_encabezado`),
  KEY `fk_movimientos_inventario_encabezado_productos1` (`id_producto`),
  KEY `fk_movimientos_inventario_encabezado_movimientos_inventario_e1` (`id_movimiento_inventario_encabezado`),
  CONSTRAINT `fk_movimientos_inventario_encabezado_movimientos_inventario_e1` FOREIGN KEY (`id_movimiento_inventario_encabezado`) REFERENCES `movimientos_inventario_encabezado` (`id_movimiento_inventario_encabezado`),
  CONSTRAINT `fk_movimientos_inventario_encabezado_productos1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movimientos_inventario_detalle`
--

LOCK TABLES `movimientos_inventario_detalle` WRITE;
INSERT INTO `movimientos_inventario_detalle` VALUES (1,1,1,10,3.01,1),(1,2,1,10,4.5,1),(2,1,1,10,8.01,1),(2,2,1,10,0.8,1),(3,1,1,10,4.5,1),(3,2,1,10,0.05,1),(4,1,1,10,0.8,1),(5,1,1,10,0.05,1);
UNLOCK TABLES;

--
-- Table structure for table `movimientos_inventario_encabezado`
--

DROP TABLE IF EXISTS `movimientos_inventario_encabezado`;
CREATE TABLE `movimientos_inventario_encabezado` (
  `id_movimiento_inventario_encabezado` int NOT NULL AUTO_INCREMENT,
  `id_tipo_movimiento` int NOT NULL,
  `nombre_movimiento` varchar(45) DEFAULT NULL,
  `descripcion_movimiento` text,
  `fecha_movimiento` date DEFAULT NULL,
  `bodaga_salida` int DEFAULT NULL,
  `bodega_entrada` int DEFAULT NULL,
  `id_orden_transporte_encabezado` int DEFAULT NULL,
  `ESTADO` tinyint DEFAULT '1',
  PRIMARY KEY (`id_movimiento_inventario_encabezado`),
  KEY `fk_movimientos_inventario_encabezado_bodegas1` (`bodaga_salida`),
  KEY `fk_movimientos_inventario_encabezado_bodegas2` (`bodega_entrada`),
  KEY `fk_movimientos_inventario_encabezado_ordenes_transportes_enca1` (`id_orden_transporte_encabezado`),
  KEY `fk_creditos_pedidos_detalle_cuentas` (`id_tipo_movimiento`),
  CONSTRAINT `fk_creditos_pedidos_detalle_cuentas` FOREIGN KEY (`id_tipo_movimiento`) REFERENCES `cuentas` (`id_cuenta`),
  CONSTRAINT `fk_movimientos_inventario_encabezado_bodegas1` FOREIGN KEY (`bodaga_salida`) REFERENCES `bodegas` (`id_bodega`),
  CONSTRAINT `fk_movimientos_inventario_encabezado_bodegas2` FOREIGN KEY (`bodega_entrada`) REFERENCES `bodegas` (`id_bodega`),
  CONSTRAINT `fk_movimientos_inventario_encabezado_ordenes_transportes_enca1` FOREIGN KEY (`id_orden_transporte_encabezado`) REFERENCES `ordenes_transportes` (`id_orden_transporte`),
  CONSTRAINT `fk_movimientos_inventario_encabezado_tipos_movimientos1` FOREIGN KEY (`id_tipo_movimiento`) REFERENCES `tipos_movimientos` (`id_tipo_movimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movimientos_inventario_encabezado`
--

LOCK TABLES `movimientos_inventario_encabezado` WRITE;
INSERT INTO `movimientos_inventario_encabezado` VALUES (1,1,'movimiento','descripcion','2020-04-04',NULL,NULL,NULL,1),(2,1,'movimiento','descripcion','2010-05-04',NULL,NULL,NULL,1);
UNLOCK TABLES;

--
-- Table structure for table `ordenes_compras_detalle`
--

DROP TABLE IF EXISTS `ordenes_compras_detalle`;
CREATE TABLE `ordenes_compras_detalle` (
  `id_orden_compra_detalle` int NOT NULL AUTO_INCREMENT,
  `id_orden_compra_encabezado` int NOT NULL,
  `id_cotizacion_encabezado` int NOT NULL,
  `id_proveedor` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  `precio_unitario` double DEFAULT NULL,
  PRIMARY KEY (`id_orden_compra_detalle`,`id_orden_compra_encabezado`,`id_cotizacion_encabezado`,`id_proveedor`,`id_producto`),
  KEY `fk_ordenes_compras_detalle_ordenes_compras_encabezado1` (`id_orden_compra_encabezado`,`id_cotizacion_encabezado`,`id_proveedor`),
  KEY `fk_ordenes_compras_detalle_productos1` (`id_producto`),
  CONSTRAINT `fk_ordenes_compras_detalle_ordenes_compras_encabezado1` FOREIGN KEY (`id_orden_compra_encabezado`, `id_cotizacion_encabezado`, `id_proveedor`) REFERENCES `ordenes_compras_encabezado` (`id_orden_compra_encabezado`, `id_cotizacion_encabezado`, `id_proveedor`),
  CONSTRAINT `fk_ordenes_compras_detalle_productos1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ordenes_compras_detalle`
--

LOCK TABLES `ordenes_compras_detalle` WRITE;
/*!40000 ALTER TABLE `ordenes_compras_detalle` DISABLE KEYS */;
INSERT INTO `ordenes_compras_detalle` VALUES (1,1,1,1,1,32,32.2),(2,1,1,1,2,20,21.02);
/*!40000 ALTER TABLE `ordenes_compras_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes_compras_encabezado`
--

DROP TABLE IF EXISTS `ordenes_compras_encabezado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes_compras_encabezado` (
  `id_orden_compra_encabezado` int NOT NULL AUTO_INCREMENT,
  `id_proveedor` int NOT NULL,
  `nombre_orden_compra` varchar(45) DEFAULT NULL,
  `descripcion_orden_compra` text,
  `fecha_emision` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `fecha_estimada_entrega` date DEFAULT NULL,
  `entregado` int DEFAULT NULL,
  `ESTADO` tinyint DEFAULT '1',
  PRIMARY KEY (`id_orden_compra_encabezado`,`id_cotizacion_encabezado`,`id_proveedor`),
  KEY `fk_ordenes_compras_encabezado_cotizaciones_encabezado1` (`id_cotizacion_encabezado`,`id_proveedor`),
  CONSTRAINT `fk_ordenes_compras_encabezado_cotizaciones_encabezado1` FOREIGN KEY (`id_cotizacion_encabezado`, `id_proveedor`) REFERENCES `cotizaciones_encabezado` (`id_cotizacion_encabezado`, `id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ordenes_compras_encabezado`
--

LOCK TABLES `ordenes_compras_encabezado` WRITE;
INSERT INTO `ordenes_compras_encabezado` VALUES (1,1,1,'Orden Compra Prueba',' ','2020-01-01','2020-02-03','2020-02-01',0,1);
UNLOCK TABLES;

--
-- Table structure for table `ordenes_transportes`
--

DROP TABLE IF EXISTS `ordenes_transportes`;
CREATE TABLE `ordenes_transportes` (
  `id_orden_transporte` int NOT NULL AUTO_INCREMENT,
  `id_vehiculo` int NOT NULL,
  `bodega_origen` int NOT NULL,
  `bodega_destino` int NOT NULL,
  `documentos_id_documento` int NOT NULL,
  `fecha_salida` date DEFAULT NULL,
  `fecha_llegada` date DEFAULT NULL,
  `ESTADO` tinyint DEFAULT '1',
  PRIMARY KEY (`id_orden_transporte`),
  KEY `fk_ordenes_transportes_encabezado_vehiculos1` (`id_vehiculo`),
  KEY `fk_ordenes_transportes_encabezado_bodegas1` (`bodega_origen`),
  KEY `fk_ordenes_transportes_encabezado_bodegas2` (`bodega_destino`),
  KEY `fk_ordenes_transportes_documentos1` (`documentos_id_documento`),
  CONSTRAINT `fk_ordenes_transportes_documentos1` FOREIGN KEY (`documentos_id_documento`) REFERENCES `documentos` (`id_documento`),
  CONSTRAINT `fk_ordenes_transportes_encabezado_bodegas1` FOREIGN KEY (`bodega_origen`) REFERENCES `bodegas` (`id_bodega`),
  CONSTRAINT `fk_ordenes_transportes_encabezado_bodegas2` FOREIGN KEY (`bodega_destino`) REFERENCES `bodegas` (`id_bodega`),
  CONSTRAINT `fk_ordenes_transportes_encabezado_vehiculos1` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ordenes_transportes`
--

LOCK TABLES `ordenes_transportes` WRITE;
UNLOCK TABLES;

--
-- Temporary view structure for view `poliza_movimiento`
--

DROP TABLE IF EXISTS `poliza_movimiento`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `presentaciones`
--

DROP TABLE IF EXISTS `presentaciones`;
CREATE TABLE `presentaciones` (
  `id_presentacion` int NOT NULL AUTO_INCREMENT,
  `nombre_presentacion` varchar(45) DEFAULT NULL,
  `descripcion_presentacion` text,
  `ESTADO` tinyint DEFAULT '1',
  PRIMARY KEY (`id_presentacion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `presentaciones`
--

LOCK TABLES `presentaciones` WRITE;
INSERT INTO `presentaciones` VALUES (1,'PRESENTACION PRUEBA','Presentacion para pruebas de funcionalidad de Software',1);
UNLOCK TABLES;

--
-- Table structure for table `presupuestos_detalle`
--

DROP TABLE IF EXISTS `presupuestos_detalle`;
CREATE TABLE `presupuestos_detalle` (
  `id_presupuesto_detalle` int NOT NULL AUTO_INCREMENT,
  `id_presupuesto_encabezado` int NOT NULL,
  `id_cotizacion_encabezado` int NOT NULL,
  `id_proveedor` int NOT NULL,
  `fecha_presupuesto` date DEFAULT NULL,
  PRIMARY KEY (`id_presupuesto_detalle`,`id_presupuesto_encabezado`,`id_cotizacion_encabezado`,`id_proveedor`),
  KEY `fk_presupuestos_detalle_cotizaciones_encabezado1` (`id_cotizacion_encabezado`,`id_proveedor`),
  KEY `fk_presupuestos_detalle_presupuestos_encabezado1` (`id_presupuesto_encabezado`),
  CONSTRAINT `fk_presupuestos_detalle_cotizaciones_encabezado1` FOREIGN KEY (`id_cotizacion_encabezado`, `id_proveedor`) REFERENCES `cotizaciones_encabezado` (`id_cotizacion_encabezado`, `id_proveedor`),
  CONSTRAINT `fk_presupuestos_detalle_presupuestos_encabezado1` FOREIGN KEY (`id_presupuesto_encabezado`) REFERENCES `presupuestos_encabezado` (`id_presupuesto_encabezado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `presupuestos_detalle`
--

LOCK TABLES `presupuestos_detalle` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `presupuestos_encabezado`
--

DROP TABLE IF EXISTS `presupuestos_encabezado`;
CREATE TABLE `presupuestos_encabezado` (
  `id_presupuesto_encabezado` int NOT NULL AUTO_INCREMENT,
  `nombre_presupuesto` varchar(45) DEFAULT NULL,
  `descripcion_presupuesto` text,
  `ESTADO` tinyint DEFAULT '1',
  PRIMARY KEY (`id_presupuesto_encabezado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `presupuestos_encabezado`
--

LOCK TABLES `presupuestos_encabezado` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `id_tipo_producto` int NOT NULL,
  `id_impuesto` int NOT NULL,
  `id_categoria` int NOT NULL,
  `nombre_producto` varchar(45) DEFAULT NULL,
  `descripcion_producto` text,
  `costo_producto` double DEFAULT NULL,
  `precio_producto` double DEFAULT NULL,
  `cantidad_maxima_producto` int DEFAULT NULL,
  `cantidad_minima_producto` int DEFAULT NULL,
  `stock_producto` int DEFAULT NULL,
  `ESTADO` tinyint DEFAULT '1',
  PRIMARY KEY (`id_producto`,`id_tipo_producto`),
  KEY `fk_productos_tipos_productos1` (`id_tipo_producto`),
  KEY `fk_productos_impuestos1` (`id_impuesto`),
  KEY `fk_productos_categorias1` (`id_categoria`),
  CONSTRAINT `fk_productos_categorias1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  CONSTRAINT `fk_productos_impuestos1` FOREIGN KEY (`id_impuesto`) REFERENCES `impuestos` (`id_impuesto`),
  CONSTRAINT `fk_productos_tipos_productos1` FOREIGN KEY (`id_tipo_producto`) REFERENCES `tipos_productos` (`id_tipo_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
INSERT INTO `productos` VALUES (1,1,1,1,'Producto prueba','Producto para pruebas de funcionalidad de Software',0.01,1,100,1,50,1),(2,1,1,1,'Producto prueba 2','Producto para pruebas de funcionalidad de Software',0.2,2,100,2,50,1);
UNLOCK TABLES;

--
-- Table structure for table `productos_lineas`
--

DROP TABLE IF EXISTS `productos_lineas`;
CREATE TABLE `productos_lineas` (
  `id_producto` int NOT NULL,
  `id_linea` int NOT NULL,
  PRIMARY KEY (`id_producto`,`id_linea`),
  KEY `fk_productos_has_lineas_lineas1` (`id_linea`),
  CONSTRAINT `fk_productos_has_lineas_lineas1` FOREIGN KEY (`id_linea`) REFERENCES `lineas` (`id_linea`),
  CONSTRAINT `fk_productos_has_lineas_productos1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `productos_lineas`
--

LOCK TABLES `productos_lineas` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `productos_marcas`
--

DROP TABLE IF EXISTS `productos_marcas`;
CREATE TABLE `productos_marcas` (
  `id_producto` int NOT NULL,
  `id_marca` int NOT NULL,
  PRIMARY KEY (`id_producto`,`id_marca`),
  KEY `fk_productos_has_marcas_marcas1` (`id_marca`),
  CONSTRAINT `fk_productos_has_marcas_marcas1` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`),
  CONSTRAINT `fk_productos_has_marcas_productos1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `productos_marcas`
--

LOCK TABLES `productos_marcas` WRITE;
/*!40000 ALTER TABLE `productos_marcas` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_presentaciones`
--

DROP TABLE IF EXISTS `productos_presentaciones`;
CREATE TABLE `productos_presentaciones` (
  `id_producto` int NOT NULL,
  `id_presentacion` int NOT NULL,
  PRIMARY KEY (`id_producto`,`id_presentacion`),
  KEY `fk_productos_has_presentaciones_presentaciones1` (`id_presentacion`),
  CONSTRAINT `fk_productos_has_presentaciones_presentaciones1` FOREIGN KEY (`id_presentacion`) REFERENCES `presentaciones` (`id_presentacion`),
  CONSTRAINT `fk_productos_has_presentaciones_productos1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `productos_presentaciones`
--

LOCK TABLES `productos_presentaciones` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `productos_proveedores`
--

DROP TABLE IF EXISTS `productos_proveedores`;
CREATE TABLE `productos_proveedores` (
  `id_producto` int NOT NULL,
  `id_proveedor` int NOT NULL,
  PRIMARY KEY (`id_producto`,`id_proveedor`),
  KEY `fk_productos_has_proveedores_proveedores1` (`id_proveedor`),
  CONSTRAINT `fk_productos_has_proveedores_productos` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `fk_productos_has_proveedores_proveedores1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `productos_proveedores`
--

LOCK TABLES `productos_proveedores` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `id_contacto` int NOT NULL,
  `nombre_proveedor` varchar(45) DEFAULT NULL,
  `descripcion_proveedor` text,
  `direccion_proveedor` varchar(45) DEFAULT NULL,
  `pagina_proveedor` varchar(45) DEFAULT NULL,
  `ESTADO` tinyint DEFAULT '1',
  PRIMARY KEY (`id_proveedor`),
  KEY `fk_proveedores_contactos1` (`id_contacto`),
  CONSTRAINT `fk_proveedores_contactos1` FOREIGN KEY (`id_contacto`) REFERENCES `contactos` (`id_contacto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
INSERT INTO `proveedores` VALUES (1,1,'PROVEEDRO PRUEBA','Proveedor para pruebas de funcionalidad de Software','direccion','proveedor.com',1);
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
CREATE TABLE `servicios` (
  `id_servicio` int NOT NULL AUTO_INCREMENT,
  `nombre_servicio` varchar(45) DEFAULT NULL,
  `descripcion_servicio` text,
  `ESTADO` tinyint DEFAULT '1',
  PRIMARY KEY (`id_servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
INSERT INTO `servicios` VALUES (1,'SERVICIO PRUEBA','Servicio para pruebas de funcionalidad de Software',1);
UNLOCK TABLES;

--
-- Table structure for table `tipo_cuentas`
--

DROP TABLE IF EXISTS `tipo_cuentas`;
CREATE TABLE `tipo_cuentas` (
  `id_tipo_cuenta` int NOT NULL AUTO_INCREMENT,
  `nombre_tipo_cuenta` varchar(25) DEFAULT NULL,
  `descripcion_tipo_cuenta` varchar(45) DEFAULT NULL,
  `estado` tinyint DEFAULT '1',
  PRIMARY KEY (`id_tipo_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_cuentas`
--

LOCK TABLES `tipo_cuentas` WRITE;
INSERT INTO `tipo_cuentas` VALUES (1,'TipoCuenta','descripcion',1);
UNLOCK TABLES;

--
-- Table structure for table `tipos_movimientos`
--

DROP TABLE IF EXISTS `tipos_movimientos`;
CREATE TABLE `tipos_movimientos` (
  `id_tipo_movimiento` int NOT NULL AUTO_INCREMENT,
  `id_cuenta` int NOT NULL,
  `nombre_tipo_movimiento` varchar(45) DEFAULT NULL,
  `descripcion_tipo_movimiento` text,
  `signo` varchar(1) DEFAULT NULL,
  `estado` tinyint DEFAULT '1',
  PRIMARY KEY (`id_tipo_movimiento`,`id_cuenta`),
  KEY `fk_tipos_movimientos_cuentas` (`id_cuenta`),
  CONSTRAINT `fk_tipos_movimientos_cuentas` FOREIGN KEY (`id_cuenta`) REFERENCES `cuentas` (`id_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipos_movimientos`
--

LOCK TABLES `tipos_movimientos` WRITE;
INSERT INTO `tipos_movimientos` VALUES (1,1,'Compra','Descripcion','+',1),(2,1,'Venta','Descripcion','-',1);
UNLOCK TABLES;

--
-- Table structure for table `tipos_productos`
--

DROP TABLE IF EXISTS `tipos_productos`;
CREATE TABLE `tipos_productos` (
  `id_tipo_producto` int NOT NULL AUTO_INCREMENT,
  `nombre_tipo_producto` varchar(45) DEFAULT NULL,
  `descripcion_tipo_producto` text,
  `ESTADO` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_tipo_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipos_productos`
--

LOCK TABLES `tipos_productos` WRITE;
INSERT INTO `tipos_productos` VALUES (1,'TIPO PRODUCTO PRUEBA','Tipo Producto para pruebas de funcionalidad de Software',1);
UNLOCK TABLES;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
CREATE TABLE `vehiculos` (
  `id_vehiculo` int NOT NULL AUTO_INCREMENT,
  `nombre_vehiculo` varchar(45) DEFAULT NULL,
  `descripcion_vehiculo` text,
  `placa_vehiculo` varchar(45) DEFAULT NULL,
  `ESTADO` tinyint DEFAULT '1',
  PRIMARY KEY (`id_vehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vehiculos`
--

LOCK TABLES `vehiculos` WRITE;
INSERT INTO `vehiculos` VALUES (1,'TRANSPORTE PRUEBA','Transporte para pruebas de funcionalidad de Software','placa',1);
UNLOCK TABLES;