### New way to create a Frameowrk in Xcode. 

1.- Creamos un nuevo proyecto. Seleccionamos en el apartado de _iOS_ __Framework & Library__ y luego __Cocoa Touch Framework__ y presionamos _newxt_

![](https://raw.githubusercontent.com/jghg02/newFrameworkiOS/master/img/1.png)

2.- Colocamos los datos que nos solicitan, y presionamos _next_

![](https://raw.githubusercontent.com/jghg02/newFrameworkiOS/master/img/2.png)

3.- Nos crea la siguiente estructura. 

![](https://raw.githubusercontent.com/jghg02/newFrameworkiOS/master/img/3.png)

Luego es necesario crea un _WorkSpace_ para de esta forma poder integrar nuestra app con el _framework_ que creamos anteriormente. 

Para esto es necesario:

1.- _File_ -> _New_ -> _Workspace_ Nos abre una ventana donde nos solicita en que directorio se desea crear.

![](https://raw.githubusercontent.com/jghg02/newFrameworkiOS/master/img/7.png)

__En este caso seleccionamos el mismo directorio donde se creo el Framework__ 

![](https://raw.githubusercontent.com/jghg02/newFrameworkiOS/master/img/4.png)

Luego de realizar esto es necesario crea la _App_ que va a ser uso del _Framework_ que hemos creado. Para esto es necesario crea una _Single Application_ vamos al menu __File__ -> __New__ -> __Project__ 

![](https://raw.githubusercontent.com/jghg02/newFrameworkiOS/master/img/5.png)

LLenamos los datos que nos solicita y le damos _Next_

En el siguiente paso nos pide el directorio donde queremos guardar dicho proyecto. En este punto es importante colocar que este proyecto sea agregado al __WorkSpace__ que creamo anteriormente. 

![](https://raw.githubusercontent.com/jghg02/newFrameworkiOS/master/img/6.png)


This is very importan to added AFNetworking into Framework 
https://github.com/AFNetworking/AFNetworking/issues/2205

