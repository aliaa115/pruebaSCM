
-- -----------------------------------------------------
-- Schema erp
-- -----------------------------------------------------
DROP DATABASE IF EXISTS erp;
CREATE SCHEMA IF NOT EXISTS erp DEFAULT CHARACTER SET utf8 ;
USE erp ;


-- -----------------------------------------------------
-- Table erp.tipo_cuentas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.tipo_cuentas (
  id_tipo_cuenta INT NOT NULL AUTO_INCREMENT,
  nombre_tipo_cuenta VARCHAR(25) NULL DEFAULT NULL,
  descripcion_tipo_cuenta VARCHAR(45) NULL DEFAULT NULL,
  estado TINYINT NULL DEFAULT '1',
  PRIMARY KEY (id_tipo_cuenta))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.cuentas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.cuentas (
  id_cuenta INT NOT NULL AUTO_INCREMENT,
  id_tipo_cuenta INT NOT NULL,
  nombre VARCHAR(25) NULL DEFAULT NULL,
  descripcion VARCHAR(45) NULL DEFAULT NULL,
  estado TINYINT NULL DEFAULT '1',
  PRIMARY KEY (id_cuenta, id_tipo_cuenta),
  INDEX fk_tbl_cuentas_contables_tbl_tipoCuentaContable1_idx (id_tipo_cuenta ASC),
  CONSTRAINT fk_tbl_cuentas_contables_tbl_tipoCuentaContable1
    FOREIGN KEY (id_tipo_cuenta)
    REFERENCES erp.tipo_cuentas (id_tipo_cuenta))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.contactos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.contactos (
  id_contacto INT NOT NULL AUTO_INCREMENT,
  nombre_contacto VARCHAR(45) NULL DEFAULT NULL,
  descripcion_contacto TEXT NULL DEFAULT NULL,
  telefono_contacto VARCHAR(45) NULL DEFAULT NULL,
  direccion_contacto VARCHAR(45) NULL DEFAULT NULL,
  email_contacto VARCHAR(45) NULL DEFAULT NULL,
  ESTADO TINYINT NULL DEFAULT '1',
  PRIMARY KEY (id_contacto))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.acreedores
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.acreedores (
  id_acreedor INT NOT NULL AUTO_INCREMENT,
  id_contacto INT NOT NULL,
  nombre_acreedor VARCHAR(45) NULL DEFAULT NULL,
  descripcion_acreedor TEXT NULL DEFAULT NULL,
  direccion_acreedor VARCHAR(45) NULL DEFAULT NULL,
  pagina_acreedor VARCHAR(45) NULL DEFAULT NULL,
  ESTADO TINYINT NULL DEFAULT '1',
  PRIMARY KEY (id_acreedor),
  INDEX fk_servicios_contactos1 (id_contacto ASC) ,
  CONSTRAINT fk_servicios_contactos1
    FOREIGN KEY (id_contacto)
    REFERENCES erp.contactos (id_contacto))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.servicios
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.servicios (
  id_servicio INT NOT NULL AUTO_INCREMENT,
  nombre_servicio VARCHAR(45) NULL DEFAULT NULL,
  descripcion_servicio TEXT NULL DEFAULT NULL,
  ESTADO TINYINT NULL DEFAULT '1',
  PRIMARY KEY (id_servicio))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.acreedores_servicios
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.acreedores_servicios (
  id_acreedor INT NOT NULL,
  id_servicio INT NOT NULL,
  PRIMARY KEY (id_acreedor, id_servicio),
  INDEX fk_acreedores_has_servicios_servicios1 (id_servicio ASC) ,
  CONSTRAINT fk_acreedores_has_servicios_acreedores1
    FOREIGN KEY (id_acreedor)
    REFERENCES erp.acreedores (id_acreedor),
  CONSTRAINT fk_acreedores_has_servicios_servicios1
    FOREIGN KEY (id_servicio)
    REFERENCES erp.servicios (id_servicio))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.ayuda
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.ayuda (
  Id_ayuda INT NOT NULL,
  Ruta TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  indice TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table erp.bodegas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.bodegas (
  id_bodega INT NOT NULL AUTO_INCREMENT,
  nombre_bodega VARCHAR(45) NULL DEFAULT NULL,
  descripcion_bodega TEXT NULL DEFAULT NULL,
  ubicacion_bodega VARCHAR(45) NULL DEFAULT NULL,
  stock_maximo INT NULL DEFAULT NULL,
  ESTADO TINYINT NULL DEFAULT '1',
  PRIMARY KEY (id_bodega))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.categorias
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.categorias (
  id_categoria INT NOT NULL AUTO_INCREMENT,
  nombre_categoria VARCHAR(45) NULL DEFAULT NULL,
  descripcion_categoria TEXT NULL DEFAULT NULL,
  ESTADO TINYINT NULL DEFAULT '1',
  PRIMARY KEY (id_categoria))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.proveedores
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.proveedores (
  id_proveedor INT NOT NULL AUTO_INCREMENT,
  id_contacto INT NOT NULL,
  nombre_proveedor VARCHAR(45) NULL DEFAULT NULL,
  descripcion_proveedor TEXT NULL DEFAULT NULL,
  direccion_proveedor VARCHAR(45) NULL DEFAULT NULL,
  pagina_proveedor VARCHAR(45) NULL DEFAULT NULL,
  ESTADO TINYINT NULL DEFAULT '1',
  PRIMARY KEY (id_proveedor),
  INDEX fk_proveedores_contactos1 (id_contacto ASC) ,
  CONSTRAINT fk_proveedores_contactos1
    FOREIGN KEY (id_contacto)
    REFERENCES erp.contactos (id_contacto))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.cotizaciones_encabezado
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.cotizaciones_encabezado (
  id_cotizacion_encabezado INT NOT NULL AUTO_INCREMENT,
  id_proveedor INT NOT NULL,
  nombre_cotizacion VARCHAR(45) NULL DEFAULT NULL,
  descripcion_cotizacion TEXT NULL DEFAULT NULL,
  fecha_cotizacion DATE NULL DEFAULT NULL,
  fecha_caducidad DATE NULL DEFAULT NULL,
  ESTADO TINYINT NULL DEFAULT '1',
  PRIMARY KEY (id_cotizacion_encabezado, id_proveedor),
  INDEX fk_cotizaciones_encabezado_proveedores1 (id_proveedor ASC) ,
  CONSTRAINT fk_cotizaciones_encabezado_proveedores1
    FOREIGN KEY (id_proveedor)
    REFERENCES erp.proveedores (id_proveedor))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.impuestos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.impuestos (
  id_impuesto INT NOT NULL AUTO_INCREMENT,
  nombre_impuesto VARCHAR(45) NULL DEFAULT NULL,
  descripcion_impuesto TEXT NULL DEFAULT NULL,
  tasa_impuesto DOUBLE NULL DEFAULT NULL,
  ESTADO TINYINT NULL DEFAULT '1',
  PRIMARY KEY (id_impuesto))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.tipos_productos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.tipos_productos (
  id_tipo_producto INT NOT NULL AUTO_INCREMENT,
  nombre_tipo_producto VARCHAR(45) NULL DEFAULT NULL,
  descripcion_tipo_producto TEXT NULL DEFAULT NULL,
  ESTADO TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (id_tipo_producto))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.productos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.productos (
  id_producto INT NOT NULL AUTO_INCREMENT,
  id_tipo_producto INT NOT NULL,
  id_impuesto INT NOT NULL,
  id_categoria INT NOT NULL,
  nombre_producto VARCHAR(45) NULL DEFAULT NULL,
  descripcion_producto TEXT NULL DEFAULT NULL,
  costo_producto DOUBLE NULL DEFAULT NULL,
  precio_producto DOUBLE NULL DEFAULT NULL,
  cantidad_maxima_producto INT NULL DEFAULT NULL,
  cantidad_minima_producto INT NULL DEFAULT NULL,
  stock_producto INT NULL DEFAULT NULL,
  ESTADO TINYINT NULL DEFAULT '1',
  PRIMARY KEY (id_producto, id_tipo_producto),
  INDEX fk_productos_tipos_productos1 (id_tipo_producto ASC) ,
  INDEX fk_productos_impuestos1 (id_impuesto ASC) ,
  INDEX fk_productos_categorias1 (id_categoria ASC) ,
  CONSTRAINT fk_productos_categorias1
    FOREIGN KEY (id_categoria)
    REFERENCES erp.categorias (id_categoria),
  CONSTRAINT fk_productos_impuestos1
    FOREIGN KEY (id_impuesto)
    REFERENCES erp.impuestos (id_impuesto),
  CONSTRAINT fk_productos_tipos_productos1
    FOREIGN KEY (id_tipo_producto)
    REFERENCES erp.tipos_productos (id_tipo_producto))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.cotizaciones_detalle
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.cotizaciones_detalle (
  id_cotizacion_detalle INT NOT NULL AUTO_INCREMENT,
  id_cotizacion_encabezado INT NOT NULL,
  id_proveedor INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad_cotizacion INT NULL DEFAULT NULL,
  precio_unitario_cotizacion DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (id_cotizacion_detalle, id_cotizacion_encabezado, id_proveedor, id_producto),
  INDEX fk_cotizaciones_detalle_cotizaciones_encabezado1 (id_cotizacion_encabezado ASC, id_proveedor ASC) ,
  INDEX fk_cotizaciones_detalle_productos1 (id_producto ASC) ,
  CONSTRAINT fk_cotizaciones_detalle_cotizaciones_encabezado1
    FOREIGN KEY (id_cotizacion_encabezado , id_proveedor)
    REFERENCES erp.cotizaciones_encabezado (id_cotizacion_encabezado , id_proveedor),
  CONSTRAINT fk_cotizaciones_detalle_productos1
    FOREIGN KEY (id_producto)
    REFERENCES erp.productos (id_producto))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.ordenes_compras_encabezado
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.ordenes_compras_encabezado (
  id_orden_compra_encabezado INT NOT NULL AUTO_INCREMENT,
  id_cotizacion_encabezado INT NOT NULL,
  id_proveedor INT NOT NULL,
  nombre_orden_compra VARCHAR(45) NULL DEFAULT NULL,
  descripcion_orden_compra TEXT NULL DEFAULT NULL,
  fecha_emision DATE NULL DEFAULT NULL,
  fecha_entrega DATE NULL DEFAULT NULL,
  fecha_estimada_entrega DATE NULL DEFAULT NULL,
  entregado INT NULL DEFAULT NULL,
  ESTADO TINYINT NULL DEFAULT '1',
  PRIMARY KEY (id_orden_compra_encabezado, id_cotizacion_encabezado, id_proveedor),
  INDEX fk_ordenes_compras_encabezado_cotizaciones_encabezado1 (id_cotizacion_encabezado ASC, id_proveedor ASC) ,
  CONSTRAINT fk_ordenes_compras_encabezado_cotizaciones_encabezado1
    FOREIGN KEY (id_cotizacion_encabezado , id_proveedor)
    REFERENCES erp.cotizaciones_encabezado (id_cotizacion_encabezado , id_proveedor))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table erp.devoluciones
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.devoluciones (
  id_devolucion INT NOT NULL AUTO_INCREMENT,
  id_orden_compra_encabezado INT NOT NULL,
  id_cotizacion_encabezado INT NOT NULL,
  id_proveedor INT NOT NULL,
  fecha_devolucion DATE NULL DEFAULT NULL,
  razon_devolucion TEXT NULL DEFAULT NULL,
  ESTADO TINYINT NULL DEFAULT '1',
  PRIMARY KEY (id_devolucion, id_orden_compra_encabezado, id_cotizacion_encabezado, id_proveedor),
  INDEX fk_devoluciones_ordenes_compras_encabezado1 (id_orden_compra_encabezado ASC, id_cotizacion_encabezado ASC, id_proveedor ASC) ,
  CONSTRAINT fk_devoluciones_ordenes_compras_encabezado1
    FOREIGN KEY (id_orden_compra_encabezado , id_cotizacion_encabezado , id_proveedor)
    REFERENCES erp.ordenes_compras_encabezado (id_orden_compra_encabezado , id_cotizacion_encabezado , id_proveedor))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.documentos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.documentos (
  id_documento INT NOT NULL AUTO_INCREMENT,
  codigo_documento INT NULL DEFAULT NULL,
  nombre_documento VARCHAR(45) NULL DEFAULT NULL,
  tipo_documento VARCHAR(45) NULL DEFAULT NULL,
  estado TINYINT NULL DEFAULT '1',
  PRIMARY KEY (id_documento))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.inventarios
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.inventarios (
  nombre_inventario VARCHAR(45) NULL DEFAULT NULL,
  id_producto INT NOT NULL,
  id_bodega INT NOT NULL,
  descripcion_inventario TEXT NULL DEFAULT NULL,
  cantidad_maxima INT NULL DEFAULT NULL,
  cantidad_minima INT NULL DEFAULT NULL,
  numero_estanteria INT NULL DEFAULT NULL,
  existencia_inventario INT NULL DEFAULT NULL,
  ESTADO TINYINT NULL DEFAULT '1',
  PRIMARY KEY (id_producto, id_bodega),
  INDEX fk_inventarios_bodegas1 (id_bodega ASC) ,
  CONSTRAINT fk_inventarios_bodegas1
    FOREIGN KEY (id_bodega)
    REFERENCES erp.bodegas (id_bodega),
  CONSTRAINT fk_inventarios_productos1
    FOREIGN KEY (id_producto)
    REFERENCES erp.productos (id_producto))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.lineas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.lineas (
  id_linea INT NOT NULL AUTO_INCREMENT,
  nombre_linea VARCHAR(45) NULL DEFAULT NULL,
  descripcion_linea TEXT NULL DEFAULT NULL,
  ESTADO TINYINT NULL DEFAULT '1',
  PRIMARY KEY (id_linea))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.marcas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.marcas (
  id_marca INT NOT NULL AUTO_INCREMENT,
  nombre_marca VARCHAR(45) NULL DEFAULT NULL,
  descripcion_marca TEXT NULL DEFAULT NULL,
  ESTADO TINYINT NULL DEFAULT '1',
  PRIMARY KEY (id_marca))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.vehiculos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.vehiculos (
  id_vehiculo INT NOT NULL AUTO_INCREMENT,
  nombre_vehiculo VARCHAR(45) NULL DEFAULT NULL,
  descripcion_vehiculo TEXT NULL DEFAULT NULL,
  placa_vehiculo VARCHAR(45) NULL DEFAULT NULL,
  ESTADO TINYINT NULL DEFAULT '1',
  PRIMARY KEY (id_vehiculo))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.ordenes_transportes
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.ordenes_transportes (
  id_orden_transporte INT NOT NULL AUTO_INCREMENT,
  id_vehiculo INT NOT NULL,
  bodega_origen INT NOT NULL,
  bodega_destino INT NOT NULL,
  documentos_id_documento INT NOT NULL,
  fecha_salida DATE NULL DEFAULT NULL,
  fecha_llegada DATE NULL DEFAULT NULL,
  ESTADO TINYINT NULL DEFAULT '1',
  PRIMARY KEY (id_orden_transporte),
  INDEX fk_ordenes_transportes_encabezado_vehiculos1 (id_vehiculo ASC) ,
  INDEX fk_ordenes_transportes_encabezado_bodegas1 (bodega_origen ASC) ,
  INDEX fk_ordenes_transportes_encabezado_bodegas2 (bodega_destino ASC) ,
  INDEX fk_ordenes_transportes_documentos1 (documentos_id_documento ASC) ,
  CONSTRAINT fk_ordenes_transportes_documentos1
    FOREIGN KEY (documentos_id_documento)
    REFERENCES erp.documentos (id_documento),
  CONSTRAINT fk_ordenes_transportes_encabezado_bodegas1
    FOREIGN KEY (bodega_origen)
    REFERENCES erp.bodegas (id_bodega),
  CONSTRAINT fk_ordenes_transportes_encabezado_bodegas2
    FOREIGN KEY (bodega_destino)
    REFERENCES erp.bodegas (id_bodega),
  CONSTRAINT fk_ordenes_transportes_encabezado_vehiculos1
    FOREIGN KEY (id_vehiculo)
    REFERENCES erp.vehiculos (id_vehiculo))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.tipos_movimientos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.tipos_movimientos (
  id_tipo_movimiento INT NOT NULL AUTO_INCREMENT,
  id_cuenta INT NOT NULL,
  nombre_tipo_movimiento VARCHAR(45) NULL DEFAULT NULL,
  descripcion_tipo_movimiento TEXT NULL DEFAULT NULL,
  signo VARCHAR(1) NULL DEFAULT NULL,
  estado TINYINT NULL DEFAULT '1',
  PRIMARY KEY (id_tipo_movimiento, id_cuenta),
  INDEX fk_tipos_movimientos_cuentas (id_cuenta ASC) ,
  CONSTRAINT fk_tipos_movimientos_cuentas
    FOREIGN KEY (id_cuenta)
    REFERENCES erp.cuentas (id_cuenta)
    ON update CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.movimientos_inventario_encabezado
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.movimientos_inventario_encabezado (
  id_movimiento_inventario_encabezado INT NOT NULL AUTO_INCREMENT,
  id_tipo_movimiento INT NOT NULL,
  nombre_movimiento VARCHAR(45) NULL DEFAULT NULL,
  descripcion_movimiento TEXT NULL DEFAULT NULL,
  fecha_movimiento DATE NULL DEFAULT NULL,
  bodaga_salida INT NULL DEFAULT NULL,
  bodega_entrada INT NULL DEFAULT NULL,
  id_orden_transporte_encabezado INT NULL DEFAULT NULL,
  ESTADO TINYINT NULL DEFAULT '1',
  PRIMARY KEY (id_movimiento_inventario_encabezado),
  INDEX fk_movimientos_inventario_encabezado_bodegas1 (bodaga_salida ASC) ,
  INDEX fk_movimientos_inventario_encabezado_bodegas2 (bodega_entrada ASC) ,
  INDEX fk_movimientos_inventario_encabezado_ordenes_transportes_enca1 (id_orden_transporte_encabezado ASC) ,
  INDEX fk_creditos_pedidos_detalle_cuentas (id_tipo_movimiento ASC) ,
  CONSTRAINT fk_creditos_pedidos_detalle_cuentas
    FOREIGN KEY (id_tipo_movimiento)
    REFERENCES erp.cuentas (id_cuenta),
  CONSTRAINT fk_movimientos_inventario_encabezado_bodegas1
    FOREIGN KEY (bodaga_salida)
    REFERENCES erp.bodegas (id_bodega),
  CONSTRAINT fk_movimientos_inventario_encabezado_bodegas2
    FOREIGN KEY (bodega_entrada)
    REFERENCES erp.bodegas (id_bodega),
  CONSTRAINT fk_movimientos_inventario_encabezado_ordenes_transportes_enca1
    FOREIGN KEY (id_orden_transporte_encabezado)
    REFERENCES erp.ordenes_transportes (id_orden_transporte),
  CONSTRAINT fk_movimientos_inventario_encabezado_tipos_movimientos1
    FOREIGN KEY (id_tipo_movimiento)
    REFERENCES erp.tipos_movimientos (id_tipo_movimiento))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.movimientos_inventario_detalle
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.movimientos_inventario_detalle (
  id_movimiento_inventario_detalle INT NOT NULL AUTO_INCREMENT,
  id_movimiento_inventario_encabezado INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad_movimiento INT NULL DEFAULT NULL,
  costo_producto DOUBLE NULL DEFAULT NULL,
  precio_producto DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (id_movimiento_inventario_detalle, id_movimiento_inventario_encabezado),
  INDEX fk_movimientos_inventario_encabezado_productos1 (id_producto ASC) ,
  INDEX fk_movimientos_inventario_encabezado_movimientos_inventario_e1 (id_movimiento_inventario_encabezado ASC) ,
  CONSTRAINT fk_movimientos_inventario_encabezado_movimientos_inventario_e1
    FOREIGN KEY (id_movimiento_inventario_encabezado)
    REFERENCES erp.movimientos_inventario_encabezado (id_movimiento_inventario_encabezado),
  CONSTRAINT fk_movimientos_inventario_encabezado_productos1
    FOREIGN KEY (id_producto)
    REFERENCES erp.productos (id_producto))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.ordenes_compras_detalle
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.ordenes_compras_detalle (
  id_orden_compra_detalle INT NOT NULL AUTO_INCREMENT,
  id_orden_compra_encabezado INT NOT NULL,
  id_cotizacion_encabezado INT NOT NULL,
  id_proveedor INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad INT NULL DEFAULT NULL,
  precio_unitario DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (id_orden_compra_detalle, id_orden_compra_encabezado, id_cotizacion_encabezado, id_proveedor, id_producto),
  INDEX fk_ordenes_compras_detalle_ordenes_compras_encabezado1 (id_orden_compra_encabezado ASC, id_cotizacion_encabezado ASC, id_proveedor ASC) ,
  INDEX fk_ordenes_compras_detalle_productos1 (id_producto ASC) ,
  CONSTRAINT fk_ordenes_compras_detalle_ordenes_compras_encabezado1
    FOREIGN KEY (id_orden_compra_encabezado , id_cotizacion_encabezado , id_proveedor)
    REFERENCES erp.ordenes_compras_encabezado (id_orden_compra_encabezado , id_cotizacion_encabezado , id_proveedor),
  CONSTRAINT fk_ordenes_compras_detalle_productos1
    FOREIGN KEY (id_producto)
    REFERENCES erp.productos (id_producto))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.presentaciones
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.presentaciones (
  id_presentacion INT NOT NULL AUTO_INCREMENT,
  nombre_presentacion VARCHAR(45) NULL DEFAULT NULL,
  descripcion_presentacion TEXT NULL DEFAULT NULL,
  ESTADO TINYINT NULL DEFAULT '1',
  PRIMARY KEY (id_presentacion))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.presupuestos_encabezado
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.presupuestos_encabezado (
  id_presupuesto_encabezado INT NOT NULL AUTO_INCREMENT,
  nombre_presupuesto VARCHAR(45) NULL DEFAULT NULL,
  descripcion_presupuesto TEXT NULL DEFAULT NULL,
  ESTADO TINYINT NULL DEFAULT '1',
  PRIMARY KEY (id_presupuesto_encabezado))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.presupuestos_detalle
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.presupuestos_detalle (
  id_presupuesto_detalle INT NOT NULL AUTO_INCREMENT,
  id_presupuesto_encabezado INT NOT NULL,
  id_cotizacion_encabezado INT NOT NULL,
  id_proveedor INT NOT NULL,
  fecha_presupuesto DATE NULL DEFAULT NULL,
  PRIMARY KEY (id_presupuesto_detalle, id_presupuesto_encabezado, id_cotizacion_encabezado, id_proveedor),
  INDEX fk_presupuestos_detalle_cotizaciones_encabezado1 (id_cotizacion_encabezado ASC, id_proveedor ASC) ,
  INDEX fk_presupuestos_detalle_presupuestos_encabezado1 (id_presupuesto_encabezado ASC) ,
  CONSTRAINT fk_presupuestos_detalle_cotizaciones_encabezado1
    FOREIGN KEY (id_cotizacion_encabezado , id_proveedor)
    REFERENCES erp.cotizaciones_encabezado (id_cotizacion_encabezado , id_proveedor),
  CONSTRAINT fk_presupuestos_detalle_presupuestos_encabezado1
    FOREIGN KEY (id_presupuesto_encabezado)
    REFERENCES erp.presupuestos_encabezado (id_presupuesto_encabezado))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.productos_lineas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.productos_lineas (
  id_producto INT NOT NULL,
  id_linea INT NOT NULL,
  PRIMARY KEY (id_producto, id_linea),
  INDEX fk_productos_has_lineas_lineas1 (id_linea ASC) ,
  CONSTRAINT fk_productos_has_lineas_lineas1
    FOREIGN KEY (id_linea)
    REFERENCES erp.lineas (id_linea),
  CONSTRAINT fk_productos_has_lineas_productos1
    FOREIGN KEY (id_producto)
    REFERENCES erp.productos (id_producto))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.productos_marcas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.productos_marcas (
  id_producto INT NOT NULL,
  id_marca INT NOT NULL,
  PRIMARY KEY (id_producto, id_marca),
  INDEX fk_productos_has_marcas_marcas1 (id_marca ASC) ,
  CONSTRAINT fk_productos_has_marcas_marcas1
    FOREIGN KEY (id_marca)
    REFERENCES erp.marcas (id_marca),
  CONSTRAINT fk_productos_has_marcas_productos1
    FOREIGN KEY (id_producto)
    REFERENCES erp.productos (id_producto))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.productos_presentaciones
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.productos_presentaciones (
  id_producto INT NOT NULL,
  id_presentacion INT NOT NULL,
  PRIMARY KEY (id_producto, id_presentacion),
  INDEX fk_productos_has_presentaciones_presentaciones1 (id_presentacion ASC) ,
  CONSTRAINT fk_productos_has_presentaciones_presentaciones1
    FOREIGN KEY (id_presentacion)
    REFERENCES erp.presentaciones (id_presentacion),
  CONSTRAINT fk_productos_has_presentaciones_productos1
    FOREIGN KEY (id_producto)
    REFERENCES erp.productos (id_producto))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table erp.productos_proveedores
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.productos_proveedores (
  id_producto INT NOT NULL,
  id_proveedor INT NOT NULL,
  PRIMARY KEY (id_producto, id_proveedor),
  INDEX fk_productos_has_proveedores_proveedores1 (id_proveedor ASC) ,
  CONSTRAINT fk_productos_has_proveedores_productos
    FOREIGN KEY (id_producto)
    REFERENCES erp.productos (id_producto),
  CONSTRAINT fk_productos_has_proveedores_proveedores1
    FOREIGN KEY (id_proveedor)
    REFERENCES erp.proveedores (id_proveedor))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE erp ;

-- -----------------------------------------------------
-- Placeholder table for view erp.poliza_movimiento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS erp.poliza_movimiento (Cuenta INT, debe INT, haber INT);

-- -----------------------------------------------------
-- View erp.poliza_movimiento
-- -----------------------------------------------------
DROP TABLE IF EXISTS erp.poliza_movimiento;
USE erp;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=root@localhost SQL SECURITY DEFINER VIEW erp.poliza_movimiento AS select 'Compras' AS Cuenta,round((select sum(mov_det.precio_producto) AS debe from ((erp.movimientos_inventario_detalle mov_det join erp.movimientos_inventario_encabezado mov_enc on((mov_det.id_movimiento_inventario_encabezado = mov_enc.id_movimiento_inventario_encabezado))) join erp.tipos_movimientos tipo_mov on((mov_enc.id_tipo_movimiento = tipo_mov.id_tipo_movimiento))) where (tipo_mov.nombre_tipo_movimiento = 'Compra')),2) AS debe,'0' AS haber union all select 'Compras' AS Cuenta,'0' AS debe,round((select sum(mov_det.precio_producto) AS debe from ((erp.movimientos_inventario_detalle mov_det join erp.movimientos_inventario_encabezado mov_enc on((mov_det.id_movimiento_inventario_encabezado = mov_enc.id_movimiento_inventario_encabezado))) join erp.tipos_movimientos tipo_mov on((mov_enc.id_tipo_movimiento = tipo_mov.id_tipo_movimiento))) where (tipo_mov.nombre_tipo_movimiento = 'Compra')),2) AS haber union all select 'Venta' AS Cuenta,'0' AS debe,round((select sum(mov_det.precio_producto) AS debe from ((erp.movimientos_inventario_detalle mov_det join erp.movimientos_inventario_encabezado mov_enc on((mov_det.id_movimiento_inventario_encabezado = mov_enc.id_movimiento_inventario_encabezado))) join erp.tipos_movimientos tipo_mov on((mov_enc.id_tipo_movimiento = tipo_mov.id_tipo_movimiento))) where (tipo_mov.nombre_tipo_movimiento = 'Venta')),2) AS haber union all select 'Caja' AS Cuenta,round((select sum(mov_det.precio_producto) AS debe from ((erp.movimientos_inventario_detalle mov_det join erp.movimientos_inventario_encabezado mov_enc on((mov_det.id_movimiento_inventario_encabezado = mov_enc.id_movimiento_inventario_encabezado))) join erp.tipos_movimientos tipo_mov on((mov_enc.id_tipo_movimiento = tipo_mov.id_tipo_movimiento))) where (tipo_mov.nombre_tipo_movimiento = 'Venta')),2) AS debe,'0' AS haber;

-- -----------------------------------------------------
-- INCERT
-- -----------------------------------------------------

INSERT INTO tipo_cuentas VALUES (1,'TipoCuenta','descripcion',1);
INSERT INTO cuentas VALUES (1,1,'cuenta','descripcion',1),(2,1,'cuenta2','descripcion',1);
INSERT INTO contactos VALUES (1,'CONTACTO PRUEBA','Contacto para pruebas de funcionalidad de Software','12345678','direccion','email@123.com',1);
INSERT INTO acreedores VALUES (1,1,'ACREEDOR PRUEBA','Acreedor para pruebas de funcionalidad de Software','direccion','acreedor.com',1);
INSERT INTO servicios VALUES (1,'SERVICIO PRUEBA','Servicio para pruebas de funcionalidad de Software',1);
INSERT INTO ayuda VALUES (1,'Página web ayuda/ayuda.chm','menu.html'),(2,'Página web ayuda/ayuda.chm','Menúboletos.html');
INSERT INTO bodegas VALUES (1,'BODEGA PRUEBA','Bodega para pruebas de funcionalidad de Software','ubicacion',0,1);
INSERT INTO categorias VALUES (1,'CATEGORIA PRUEBA','Categoria para pruebas de funcionalidad de Software',1);
INSERT INTO proveedores VALUES (1,1,'PROVEEDRO PRUEBA','Proveedor para pruebas de funcionalidad de Software','direccion','proveedor.com',1);
INSERT INTO cotizaciones_encabezado VALUES (1,1,'cotizacion prueba','descripcion de cotizacion prueba','2020-01-01','2022-01-10',1),(2,1,'cotizacion prueba 2','descripcion de cotizacion prueba','2020-01-01','2022-01-10',1);
INSERT INTO impuestos VALUES (1,'IMPUESTO PRUEBA','Impuesto para pruebas de funcionalidad de Software',0.5,1);
INSERT INTO tipos_productos VALUES (1,'TIPO PRODUCTO PRUEBA','Tipo Producto para pruebas de funcionalidad de Software',1);
INSERT INTO productos VALUES (1,1,1,1,'Producto prueba','Producto para pruebas de funcionalidad de Software',0.01,1,100,1,50,1),(2,1,1,1,'Producto prueba 2','Producto para pruebas de funcionalidad de Software',0.2,2,100,2,50,1);
INSERT INTO cotizaciones_detalle VALUES (1,1,1,1,20,0.25),(1,2,1,1,2000,0.23),(2,1,1,2,30,0.01);
INSERT INTO ordenes_compras_encabezado VALUES (1,1,1,'Orden Compra Prueba',' ','2020-01-01','2020-02-03','2020-01-01',0,1);
INSERT INTO documentos VALUES (1,0,'Documento Prueba','Orden de Compra',1),(2,0,'Documento Prueba','Orden de Compra',1);
INSERT INTO inventarios VALUES ('INVENTARIO PRUEBA',2,1,'Inventario para pruebas de funcionalidad de Software',800,2,2,90,1);
INSERT INTO lineas VALUES (1,'LINEA PRUEBA','Linea para pruebas de funcionalidad de Software',1);
INSERT INTO marcas VALUES (1,'MARCA PRUEBA','Marca para pruebas de funcionalidad de Software',1);
INSERT INTO vehiculos VALUES (1,'TRANSPORTE PRUEBA','Transporte para pruebas de funcionalidad de Software','placa',1);
INSERT INTO tipos_movimientos VALUES (1,1,'Compra','Descripcion','+',1),(2,1,'Venta','Descripcion','-',1);
INSERT INTO movimientos_inventario_encabezado VALUES (1,1,'movimiento','descripcion','2020-06-01',NULL,NULL,NULL,1),(2,1,'movimiento','descripcion','2010-05-04',NULL,NULL,NULL,1);
INSERT INTO movimientos_inventario_detalle VALUES (1,1,1,10,3.01,1),(1,2,1,10,4.5,1),(2,1,1,10,8.01,1),(2,2,1,10,0.8,1),(3,1,1,10,4.5,1),(3,2,1,10,0.05,1),(4,1,1,10,0.8,1),(5,1,1,10,0.05,1);
INSERT INTO ordenes_compras_detalle VALUES (1,1,1,1,1,32,32.2),(2,1,1,1,2,20,21.02);
INSERT INTO presentaciones VALUES (1,'PRESENTACION PRUEBA','Presentacion para pruebas de funcionalidad de Software',1);
