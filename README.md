# MenuPro: Software de Recomendación Personalizada para Restaurantes

MenuPro es un software diseñado para recopilar información sobre los ingredientes y platos que un cliente ha pedido en el pasado, y utilizar esta información para ofrecer recomendaciones personalizadas en el futuro, adaptándose a las necesidades y objetivos nutricionales de cada cliente.

## Tecnologías Utilizadas

- **Node.js**: Entorno de ejecución para construir el backend de la aplicación.
- **EJS (Embedded JavaScript Templates)**: Motor de plantillas utilizado para renderizar vistas en la aplicación.
- **MySQL**: Sistema de gestión de bases de datos relacional utilizado para almacenar la información de los pedidos, clientes y recomendaciones.
- **Bootstrap**: Framework de CSS utilizado para diseñar una interfaz de usuario responsiva y atractiva.

## Requisitos Previos

- Tener instalado **Node.js**.
- Tener instalado **MySQL**.
- Asegurarse de tener un servidor reservado en el **puerto 5000**.

## Ámbito del Software

El software **MenuPro** se enfoca en:

- **Recopilar datos históricos de pedidos**: Analiza los ingredientes de los platos previamente solicitados por los clientes.
- **Recomendar platos personalizados**: Utiliza la información recopilada para sugerir opciones de menú que se alineen con los objetivos de los clientes, como perder o aumentar de peso.
- **Utilizar etiquetas de calorías**: Clasifica los platos como "bajas en calorías" o "altas en calorías" para recomendar comidas más adecuadas según las necesidades específicas del cliente.

Por ejemplo, si un cliente desea perder peso, el sistema recomendará platos etiquetados como "bajas en calorías". Si el objetivo es aumentar de peso, se sugerirán platos etiquetados como "altas en calorías".

## Ventajas Ofrecidas

### Aumento de la lealtad de los clientes
- Recomendaciones personalizadas y ofertas especiales para miembros, lo que fomenta la repetición de pedidos y fidelización del cliente.

### Mejora de la experiencia del cliente
- Sugerencias relevantes basadas en las preferencias individuales de los clientes, generando una experiencia más personalizada y satisfactoria.

### Aumento de las ventas
- Promociones de platillos recomendados y ofertas especiales que impulsan las ventas y, en consecuencia, los ingresos del restaurante.


## Consultas SQL Utilizadas

### Procedure para Recomendaciones de Platos Basadas en Ingredientes y Necesidades del Cliente

Este procedimiento busca los ingredientes con mayor prioridad de un plato y luego recomienda otros platos que contengan ese ingrediente y que se ajusten a la necesidad específica del cliente (bajar de peso, aumentar, mantenerse, etc.).

## Enlace Demostrativo

Aquí un video demostrativo de la funcionalidad: [Ver Video](https://www.youtube.com/watch?v=dO1BjAGNNac).

```sql
BEGIN
    DECLARE id_ingrediente INT DEFAULT 0;
    
    SELECT Ingrediente_ID INTO id_ingrediente 
    FROM `plato_ingrediente` 
    WHERE Plato_ID = id_plato 
    AND Prioridad = (SELECT MIN(Prioridad) 
                     FROM plato_ingrediente 
                     WHERE Plato_ID = id_plato);

    SELECT plato.ID, plato.Nombre, plato.Descripcion, plato.Precio, plato.ID_Categoria_Plato 
    FROM plato 
    INNER JOIN plato_ingrediente ON plato_ingrediente.Plato_ID = plato.ID 
    WHERE plato_ingrediente.Ingrediente_ID = id_ingrediente 
    AND plato.id_necesidad = id_necesidad;
END;




