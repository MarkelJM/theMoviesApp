# theMoviesApp
Prueba técnica WembleyStudios sobre películas favoritas API de The Movie DB

IMPORTANTE:
Para usar esta aplicación, necesitarás una API Key de TheMovieDB. Por 
favor, ve a la clase MovieService e inserta tu API Key en el campo apiKey.


RESPUESTAS:
¿Qué hace este proyecto?

Este proyecto es una aplicación iOS que utiliza la API de TheMovieDB para 
mostrar información sobre las películas más populares. El usuario puede 
ver una lista de películas, buscar películas por título y ver los detalles 
de una película específica. Además, el usuario puede marcar una película 
como favorita y la aplicación recordará su elección.

¿Por qué MVVM?

Decidí usar el patrón de diseño Model-View-ViewModel (MVVM) para este 
proyecto porque ofrece una estructura clara que facilita el mantenimiento 
del código y mejora la prueba. La separación entre el modelo, la vista y 
el viewModel hace que las responsabilidades de cada componente sean claras 
y permite que los componentes se puedan desarrollar, probar y cambiar de 
forma independiente.

El patrón MVVM también es ideal para trabajar con SwiftUI y Combine. El 
uso de @Published en el ViewModel permite a la vista suscribirse a los 
cambios de estado de manera reactiva, lo que resulta en una interfaz de 
usuario más fluida y receptiva.

¿Por qué SwiftUI?

SwiftUI es la última tecnología de interfaz de usuario de Apple y ofrece 
varias ventajas sobre los enfoques anteriores. Una de las principales 
ventajas es su naturaleza declarativa, que facilita la lectura y escritura 
del código de la interfaz de usuario. Con SwiftUI, podemos desarrollar 
interfaces de usuario más rápidas con menos código.

SwiftUI también se integra muy bien con Combine para proporcionar una 
arquitectura reactiva. Esto es especialmente útil en este proyecto, ya que 
la lista de películas y los detalles de la película se cargan de forma 
asincrónica desde la API de TheMovieDB.
