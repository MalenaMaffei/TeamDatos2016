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




*hacer un script de R para ahcer cross validation basado en el apunte de la materia.

ENSAMBLES
Por ahora lo que hice es decidir con un ensamble de rbfs mas tontos los casos en que la prob del digito elegido es <0.7 . otra cosa a probar es que en vez d etener un ensamble general haya uno personalizado para cada digito, por ej si un nueve salio con prob 0.69 pasarlo por varios svms que lo unico que hacen es decirnos si es o no 9 y nada mas y si sale que no es, elegir el numero con segunda mejor prob.
