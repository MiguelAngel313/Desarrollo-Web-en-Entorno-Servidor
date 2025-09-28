# README del proyecto HerrojoGMInicial

## Documentos principales

- Index.html
- Entrada.java
    - Formulario.html
    - index2.html

### Código
- El código principal está alojado en el documento index.html y el documento Entrada.java.
El documento index.html contiene la sintaxis básica para contener los enlaces principales al resto de páginas.
- En documento Entrada.java contiene los métodos necesarios para obtener los parámetros del documento principal y poder mostrarlos en pantalla una vez obtenidos.
* En los documentos secundarios se encuentran el index2.html donde podemos encontrar poco más de un par de enlaces y el documento Formulario.html el cual obtiene mediante el siguiente formulario la información necesaria para enviarla al archivo Entrada.java.
```
<form method="get">
                <label for="nb">Nombre</label>
                <input type="text" name="nombre" id="nb" placeholder="Introducir aqu&iacute"><br>
                <label for="ab">Apellido</label>
                <input type="text" id="ap" name="apellido" placeholder="Apellido 1"><br>
                <br>
                <input type="submit"/>
            </form>
```
Utilizando este código podemos obtener parámetros en el documento Entrada.java y utilizarlos posteriormente de la forma en que creamos conveniente.
