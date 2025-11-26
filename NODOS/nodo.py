# Clase Nodo: representa cada unidad de la lista enlazada
class Nodo:
    def __init__(self, dato):
        self.dato = dato        # El valor que almacena el nodo
        self.siguiente = None   # Enlace al siguiente nodo

# Clase ListaEnlazada: administra los nodos
class ListaEnlazada:
    def __init__(self):
        self.cabeza = None  # Primer nodo de la lista

    # --------- Agregar un nodo al final ---------
    def agregar(self, dato):
        nuevo_nodo = Nodo(dato)

        # Si la lista está vacía, el nuevo nodo será la cabeza
        if not self.cabeza:
            self.cabeza = nuevo_nodo
            return

        # Si no está vacía, recorremos hasta el último nodo
        actual = self.cabeza
        while actual.siguiente:
            actual = actual.siguiente

        # Insertamos el nuevo nodo al final
        actual.siguiente = nuevo_nodo

    # --------- Buscar un valor en la lista ---------
    def buscar(self, valor):
        actual = self.cabeza

        # Recorremos nodo por nodo
        while actual:
            if actual.dato == valor:
                return True
            actual = actual.siguiente

        return False

    # --------- Eliminar un nodo ---------
    def eliminar(self, valor):
        actual = self.cabeza
        previo = None

        # Caso: la lista está vacía
        if not actual:
            return False

        # Caso especial: el valor está en la cabeza
        if actual.dato == valor:
            self.cabeza = actual.siguiente
            return True

        # Recorremos buscando el nodo a eliminar
        while actual:
            if actual.dato == valor:
                # Saltamos el nodo actual
                previo.siguiente = actual.siguiente
                return True

            previo = actual
            actual = actual.siguiente

        return False

    # --------- Mostrar la lista completa ---------
    def mostrar(self):
        elementos = []
        actual = self.cabeza

        # Recorremos todos los nodos para imprimir sus valores
        while actual:
            elementos.append(str(actual.dato))
            actual = actual.siguiente

        print(" -> ".join(elementos))


# ------------------------------------------
# Ejemplo de uso
# ------------------------------------------

lista = ListaEnlazada()

# Agregar elementos
lista.agregar(10)
lista.agregar(15)
lista.agregar(20)
lista.agregar(25)
lista.agregar(30)
lista.agregar(35)

print("Lista actual:")
lista.mostrar()

# Buscar un elemento
print("\n¿Está el 20 o 30 en la lista?", lista.buscar(20), lista.buscar(30))

# Eliminar un elemento
print("\nEliminando 20... y 30...")
lista.eliminar(20)
lista.eliminar(30)

print("Lista después de eliminar:")
lista.mostrar()
