# Modelo de Base de Datos para E-commerce
Este modelo de base de datos soporta una aplicación de comercio electrónico donde los usuarios pueden realizar pedidos de productos ofrecidos por diferentes empresas. Cada pedido genera una factura y admite varios métodos de pago. El sistema también gestiona información de direcciones, entregas y detalles sobre las empresas que ofrecen los productos.

# Modelo DER Ontologico de ideas para E-commerce

![image](https://github.com/user-attachments/assets/4f76e05c-9ee8-4aaa-a37f-7f083de70e73)

# Modelo DER Final en Mysql para E-commerce

![image](https://github.com/user-attachments/assets/88434abf-50ed-417d-bc6b-1eda3267b361)

## Tablas y Relaciones

### 1. `users` (usuarios)
   - Almacena los datos de los usuarios, incluyendo identificación, nombre, correo electrónico y dirección de facturación.
   - **Relaciones:** Se vincula con la tabla `address` para almacenar la dirección de cada usuario y con `payment_methods` para indicar el método de pago preferido del usuario.

### 2. `order_purchase` (pedidos de compra)
   - Registra los pedidos de los usuarios, con detalles como el precio total, la fecha de creación y el usuario asociado.
   - **Relaciones:** Está vinculada a `users` para identificar al usuario que hizo el pedido, a `delivery` para el tipo de entrega, y a `invoice` para la generación de una factura.

### 3. `products` (productos)
   - Contiene los datos de cada producto disponible, como nombre, precio y una breve descripción.
   - **Relaciones:** Se asocia con `company`, que identifica la empresa que ofrece el producto.

### 4. `invoice` (facturas)
   - Registra las facturas generadas para cada pedido.
   - **Relaciones:** Se vincula con `order_purchase` para identificar el pedido correspondiente y con `company` para la empresa que emite la factura.

### 5. `delivery` (entrega)
   - Describe las opciones de entrega disponibles para los pedidos.
   - **Relaciones:** Conecta `order_purchase` con la empresa encargada de la entrega (`company`).

### 6. `company` (empresa)
   - Almacena la información de las empresas que venden productos en el sistema, incluyendo su número de identificación fiscal y dirección.
   - **Relaciones:** Está vinculada a `products` y `invoice` para identificar productos y facturas emitidas, y a `company_type` para clasificar el tipo de empresa.

### 7. `address` (dirección)
   - Guarda las direcciones de los usuarios y las empresas, incluyendo calle, número, código postal, y referencias de país, estado y ciudad.
   - **Relaciones:** Está asociada con `users` y `company` para las direcciones y con `country`, `state`, y `city` para los detalles de ubicación geográfica.

### 8. `payment_methods` (métodos de pago)
   - Contiene los tipos de métodos de pago disponibles en el sistema (por ejemplo, tarjeta de crédito, PayPal).
   - **Relaciones:** Se vincula con `users` para definir el método de pago elegido por el usuario.

### 9. `company_type` (tipo de empresa)
   - Define el tipo de empresa (por ejemplo, fabricante, distribuidor).
   - **Relaciones:** Se asocia con `company` para clasificar el tipo de empresa.

### 10. `phone` (teléfono)
   - Guarda los números de teléfono relacionados con `address`.

### 11. `country` (país), `state` (estado), `city` (ciudad)
   - Estas tablas almacenan información geográfica de los países, estados y ciudades, relacionadas con `address`.

## Solución que Proporciona
Este modelo de datos proporciona una estructura completa para gestionar un sistema de comercio electrónico con múltiples funcionalidades, incluyendo la administración de productos, usuarios, pedidos, facturación y logística. También asegura flexibilidad para agregar distintos métodos de pago, tipos de entrega y clasificaciones de empresas. Además, cuenta con una estructura geográfica detallada para las direcciones, facilitando futuras expansiones del sistema a nivel regional o internacional.

Con esta base de datos, un equipo de desarrollo puede crear una aplicación de comercio electrónico que gestione todas las operaciones mencionadas, ofreciendo una experiencia de compra y entrega fluida para los usuarios.
