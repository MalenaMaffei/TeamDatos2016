# TeamDatos2016

*cambiar el script de python para r y probar si con esos datos extra mejora

*aca hay otro script del que nos podemos inspirar: https://github.com/vsvinayak/mnist-helper de ultima lo que puede hacer alguien es       cambiar los datos con python, correr con nuestro script de R y ver si mejora y recien ahi empezar a " traducirlo"

*probar con la libreria IM de r calcular el centroide y agregar eso como dato extra a los datos ya reducidos y ver si mejora:
  https://cran.r-project.org/web/packages/IM/IM.pdf tambien puede haber otras cosas para agregar como los momentos de las imagenes

  UPDATE: ya la hice yo la parte de centroides y radio maximo, subi un csv con eso. Quizas haya que ponerlo de otra forma porque varian en decimales los datos, creo que habria que normalizarlos




*hacer un script de R para ahcer cross validation basado en el apunte de la materia.

ENSAMBLES
Por ahora lo que hice es decidir con un ensamble de rbfs mas tontos los casos en que la prob del digito elegido es <0.7 . otra cosa a probar es que en vez d etener un ensamble general haya uno personalizado para cada digito, por ej si un nueve salio con prob 0.69 pasarlo por varios svms que lo unico que hacen es decirnos si es o no 9 y nada mas y si sale que no es, elegir el numero con segunda mejor prob.
