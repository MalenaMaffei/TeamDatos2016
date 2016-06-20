# TeamDatos2016

*cambiar el script de python para r y probar si con esos datos extra mejora

*aca hay otro script del que nos podemos inspirar: https://github.com/vsvinayak/mnist-helper de ultima lo que puede hacer alguien es       cambiar los datos con python, correr con nuestro script de R y ver si mejora y recien ahi empezar a " traducirlo"

*probar con la libreria IM de r calcular el centroide y agregar eso como dato extra a los datos ya reducidos y ver si mejora:
  https://cran.r-project.org/web/packages/IM/IM.pdf tambien puede haber otras cosas para agregar como los momentos de las imagenes

  UPDATE: ya la hice yo la parte de centroides y radio maximo, subi un csv con eso. Quizas haya que ponerlo de otra forma porque varian en decimales los datos, creo que habria que normalizarlos.
  
  UPDATE 2: los centroides no sirvieron de casi nada, use solo el radio maximo y mejoro 0.00014
  
  UPDATE 3: deje calculando los momentos. Calcule 4 momentos para que no tarde tanto, no se si no hubiera sido mejor calcular mas momentos porque no se donde esta la mayor varianza o como se diga.
  No sirvieron para nada PERO habria que calcular mas momentos y seguir probando, deberian servir. Yo solo calcule grado 1, hay que volver a intentar con grado 2 
  
  UPDATE 4: calcule los ejes principales y los puse como feature extra, no cambio en nada la prediccion, los subi por si mas adelante sirven de algo
  
  UPDATE 5: calcule las coordenadas polares de todas las imagenes y las estoy usando para entrenar otro svm "fuerte" a ver si cuando el original no esta seguro, este ayuda.
  Aca dejo el link a mi dropbox con las polares https://www.dropbox.com/s/m1ushpjc9ceq8vj/polares.csv?dl=0 bajenlo asi pueden probar lo que se les ocurra

  UPDATE 6: use las coordenadas polares solas, mucho menor el puntaje dio. Las guarde para poder usar en los ensambles, por ahi ahi suma algo...
  
  UPDATE 7: tambien hice una version de los numeros con solo 3 categorias de intensidad de pixel. Dio con eso solo por abajo pero no por tanto, una idea seria añadir eso al train normal para ver si el svm predice mejor con los dos tipos de sets.https://www.dropbox.com/s/cdf7fayil0cpeld/suavizado.csv?dl=0 aca esta el csv de esa version.

*Dijo luis qe hagamos train extra con los bien predichos pero no funciono, empeoro el puntaje. Habria que usar esos datos ahora pero solo para los rfs a ver si ahi si sirve.

*hacer un script de R para ahcer cross validation basado en el apunte de la materia.
  UPADTE: ya hay uno hecho, lo fui usando para los ensambles, si lo necesitan pidanmelo que lo desempolvo y lo subo aca 

ENSAMBLES
Por ahora lo que hice es decidir con un ensamble de rbfs mas tontos los casos en que la prob del digito elegido es <0.7 . otra cosa a probar es que en vez d etener un ensamble general haya uno personalizado para cada digito, por ej si un nueve salio con prob 0.69 pasarlo por varios svms que lo unico que hacen es decirnos si es o no 9 y nada mas y si sale que no es, elegir el numero con segunda mejor prob.

  UPDATE 1: Por lo hablado con luis, esoty intentando combinar svm con rf, no tengo mucho fundamento a lo que estoy intentando asi que estaria bueno que todos colaboremos con esto porque la clave es que alguno tenga una buena idea.
  Intente reclasificar con rf los numeros con baja prob en svm pero no sirvio. Despues hice rf solo de los digitos problematicos y reclasificar con eso, no mejoro pero esta ahi nomas del puntaje que tenemos
  
  UPDATE 2: hubo una minima mejora con rfs de solo digitos problematicos, dijo luis que lo dejemos asi.
