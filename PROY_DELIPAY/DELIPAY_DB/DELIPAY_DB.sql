CREATE TABLE USUARIO (
    ID_USUARIO INT PRIMARY KEY,
    NOMBRES VARCHAR(100) NOT NULL,
    APELLIDOS VARCHAR(100) NOT NULL,
    DNI VARCHAR(20) NOT NULL,
    EMAIL VARCHAR(100) NOT NULL,
    PASSWORD VARCHAR(100) NOT NULL,
    FECHA_REG DATE NOT NULL,
    FECHA_ACT DATE
);

CREATE TABLE ROL (
    ID_ROL INT PRIMARY KEY,
    NOMBRE VARCHAR(50) NOT NULL
);

CREATE TABLE USUARIO_ROL (
    USUARIO_ID INT,
    ROL_ID INT,
    PRIMARY KEY (USUARIO_ID, ROL_ID),
    FOREIGN KEY (USUARIO_ID) REFERENCES USUARIO(ID_USUARIO),
    FOREIGN KEY (ROL_ID) REFERENCES ROL(ID_ROL)
);

CREATE TABLE CATEGORIA (
    ID_CATEGORIA INT PRIMARY KEY,
    NOMBRE VARCHAR(100) NOT NULL,
    DESCRIPCION VARCHAR(255) NOT NULL,
    FECHA_REG DATE NOT NULL,
    FECHA_ACT DATE
);

CREATE TABLE PRODUCTO (
    ID_PRODUCTO INT PRIMARY KEY,
    CATEGORIA_ID INT NOT NULL,
    NOMBRE VARCHAR(100) NOT NULL,
    DESCRIPCION VARCHAR(255) NOT NULL,
    IMAGEN VARCHAR(255) NOT NULL,
    PRECIO DECIMAL(10, 2) NOT NULL,
    STOCK INT NOT NULL,
    FECHA_REG DATE NOT NULL,
    FECHA_ACT DATE,
    FOREIGN KEY (CATEGORIA_ID) REFERENCES CATEGORIA(ID_CATEGORIA)
);

CREATE TABLE PROFORMA (
    ID_PROFORMA INT PRIMARY KEY,
    USUARIO_ID INT NOT NULL,
    PRODUCTO_ID INT NOT NULL,
    CANTIDAD INT NOT NULL,
    PRECIO DECIMAL(10, 2) NOT NULL,
    STATUS VARCHAR(50) NOT NULL,
    FOREIGN KEY (USUARIO_ID) REFERENCES USUARIO(ID_USUARIO),
    FOREIGN KEY (PRODUCTO_ID) REFERENCES PRODUCTO(ID_PRODUCTO)
);

CREATE TABLE PAGO (
    ID_PAGO INT PRIMARY KEY,
    USUARIO_ID INT NOT NULL,
    NOMBRE_TARJETA VARCHAR(100) NOT NULL,
    NUMERO_TARJETA VARCHAR(50) NOT NULL,
    MONTO_TOTAL DECIMAL(10, 2) NOT NULL,
    FECHA_PAGO DATE NOT NULL,
    FOREIGN KEY (USUARIO_ID) REFERENCES USUARIO(ID_USUARIO)
);

CREATE TABLE PEDIDO (
    ID_PEDIDO INT PRIMARY KEY,
    USUARIO_ID INT NOT NULL,
    PAGO_ID INT NOT NULL,
    STATUS VARCHAR(50) NOT NULL,
    FOREIGN KEY (USUARIO_ID) REFERENCES USUARIO(ID_USUARIO),
    FOREIGN KEY (PAGO_ID) REFERENCES PAGO(ID_PAGO)
);

CREATE TABLE DETALLE_PEDIDO (
    ID_DETALLE_PEDIDO INT PRIMARY KEY,
    PEDIDO_ID INT NOT NULL,
    PRODUCTO_ID INT NOT NULL,
    CANTIDAD INT NOT NULL,
    PRECIO DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (PEDIDO_ID) REFERENCES PEDIDO(ID_PEDIDO),
    FOREIGN KEY (PRODUCTO_ID) REFERENCES PRODUCTO(ID_PRODUCTO)
);

CREATE TABLE RESTAURANTE (
    ID_RESTAURANTE INT PRIMARY KEY,
    NOMBRE VARCHAR(100) NOT NULL,
    DIRECCION VARCHAR(255) NOT NULL,
    CIUDAD VARCHAR(100),
    TELEFONO VARCHAR(20),
    HORARIO_APERTURA TIME,
    HORARIO_CIERRE TIME
);

CREATE TABLE MESA (
    ID_MESA INT PRIMARY KEY,
    ID_RESTAURANTE INT NOT NULL,
    NUMERO_MESA VARCHAR(20) NOT NULL,
    CAPACIDAD INT NOT NULL,
    ESTADO VARCHAR(20),
    FOREIGN KEY (ID_RESTAURANTE) REFERENCES RESTAURANTE(ID_RESTAURANTE)
);

CREATE TABLE RESERVA (
    ID_RESERVA INT PRIMARY KEY,
    ID_CLIENTE INT NOT NULL,
    ID_MESA INT NOT NULL,
    FECHA_RESERVA DATE NOT NULL,
    HORA_RESERVA TIME NOT NULL,
    NUMERO_PERSONAS INT NOT NULL,
    FOREIGN KEY (ID_CLIENTE) REFERENCES USUARIO(ID_USUARIO),
    FOREIGN KEY (ID_MESA) REFERENCES MESA(ID_MESA)
);

CREATE TABLE COMENTARIO_PEDIDO (
    ID_COMENTARIO_PEDIDO INT PRIMARY KEY,
    USUARIO_ID INT NOT NULL,
    PEDIDO_ID INT NOT NULL,
    CONTENIDO TEXT NOT NULL,
    FECHA_COMENTARIO DATE NOT NULL,
    CLASIFICACION INT, -- Campo para indicar si el comentario es positivo (1) o negativo (0)
    FOREIGN KEY (USUARIO_ID) REFERENCES USUARIO(ID_USUARIO),
    FOREIGN KEY (PEDIDO_ID) REFERENCES PEDIDO(ID_PEDIDO)
);

CREATE TABLE PRODUCTO_FAVORITO (
    ID_FAVORITO INT PRIMARY KEY,
    USUARIO_ID INT NOT NULL,
    PRODUCTO_ID INT NOT NULL,
    FECHA_MARCADO DATE NOT NULL,
    FOREIGN KEY (USUARIO_ID) REFERENCES USUARIO(ID_USUARIO),
    FOREIGN KEY (PRODUCTO_ID) REFERENCES PRODUCTO(ID_PRODUCTO)
);
