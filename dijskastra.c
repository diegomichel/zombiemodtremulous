#include <cmath>
#include <cstring>
#include <iostream>
using namespace std;
 
int destino, origen, vertices = 0;
int *costos = NULL;
 
void dijkstra(int vertices, int origen, int destino, int *costos) {
    int i, v, cont = 0;
    int *ant, *tmp;
    int *z;                 /* vertices para los cuales se conoce el camino minimo */
    double min;
    double *dist = new double[vertices];  /* vector con los costos de dos caminos */
 
    /* aloca las lineas de la matriz */
    ant = new int[vertices];
    tmp = new int[vertices];
    z = new int[vertices];
 
    for (i = 0; i < vertices; i++) {
        if (costos[(origen - 1) * vertices + i] !=- 1) {
            ant[i] = origen - 1;
            dist[i] = costos[(origen-1)*vertices+i];
        }
        else {
            ant[i]= -1;
            dist[i] = HUGE_VAL;
        }
        z[i]=0;
    }
    z[origen-1] = 1;
    dist[origen-1] = 0;
 
    /* Bucle principal */
    do {
 
        /* Encontrando el vertice que debe entrar en z */
        min = HUGE_VAL;
        for (i=0;i<vertices;i++)
            if (!z[i])
                if (dist[i]>=0 && dist[i]<min) {
                    min=dist[i];v=i;
                }
 
        /* Calculando las distancias de los nodos vecinos de z */
        if (min != HUGE_VAL && v != destino - 1) {
            z[v] = 1;
            for (i = 0; i < vertices; i++)
                if (!z[i]) {
                    if (costos[v*vertices+i] != -1 && dist[v] + costos[v*vertices+i] < dist[i]) {
                        dist[i] = dist[v] + costos[v*vertices+i];
                        ant[i] =v;
                    }
                }
        }
 
    } while (v != destino - 1 && min != HUGE_VAL);
 
    /* Muestra el resultado de la búsqueda */
    cout << "\tDe " << origen << " para "<<destino<<" \t";
    if (min == HUGE_VAL) {
        cout <<"No Existe\n";
        cout <<"\tCoste: \t- \n";
    }
    else {
        i = destino;
        i = ant[i-1];
        while (i != -1) {
            //   printf("<-%d",i+1);
            tmp[cont] = i+1;
            cont++;
            i = ant[i];
        }
 
        for (i = cont; i > 0; i--) {
            cout<< tmp[i-1]<<" -> ";
        }
        cout << destino;
 
        cout <<"\n\tCoste: " << dist[destino-1] <<"\n";
    }
 
    delete (dist);
    delete (ant);
    delete (tmp);
    delete (z);
}
 
int menu(void) {
  int opcion;
    cout <<"         Implementacion del Algoritmo de Dijkstra\n";
    cout <<" Menu:\n";
    cout <<" >> 1. Crear el grafo\n >> 2. Determinar el menor camino del grafo\n >> 0. Salir del programa\n";
    cout <<endl;
  cout << " Opcion: ";
  cin>>opcion;
  while(opcion<0 || opcion>2){
    cout<<" Opcion Invalida. Digitela nuevamente: ";
    cin>>opcion;
  }
  return opcion;
}
 
void add(void) {
 
 
    do {
      cout <<"\nIngrese el numero de vertices ( no minimo de 2 ): ";
        cin>>vertices;
    } while (vertices < 2 );
 
    if (!costos)
      delete(costos);
 
    costos = new int[vertices * vertices];
 
 
    for (int i = 0; i <= vertices * vertices; i++)
        costos[i] = -1;
 
    cout <<" Nº Vertices = "<< vertices<<endl;
    cout <<"Ahora unamos los vertices:\n" ;
 
    bool sigo=true;
 
    int origen;
    int destino;
 
    while (sigo){
      cout << " Escoja el primer vertice de la arista: " <<endl;
      do{
        cin >> origen;
 
        if (origen>vertices){
          cout << "  El numero del vertice debe ser menor de " << vertices<<endl;
        }
      }while(origen > vertices);
 
 
      cout << " Escoja el segundo vertice de la arista: " <<endl;
      do{
        cin >> destino;
 
    if (destino>vertices){
      cout << " El numero de vertice debe ser menor de " << vertices<<endl;
    }
   }while(destino> vertices);
 
   int peso=0;
    cout <<" Peso: " <<endl;
   cin>>peso;
 
   costos[(origen-1) * vertices + destino - 1] = peso;
        costos[(destino-1) * vertices + origen - 1] = peso;
 
 
   int seguir=1;
   cout << "Desea anadir otra arista? (0 - NO, 1 - SI, por defecto 1): " ;
   cin >>seguir;
   sigo = (seguir==1);
    }
 
}
 
void buscar(void) {
    int i, j;
 
    cout <<" Lista de los Menores Caminos en Grafo Dado: \n";
 
    for (i = 1; i <= vertices; i++) {
        for (j = 1; j <= vertices; j++)
            dijkstra(vertices, i,j, costos);
        cout<<endl;
    }
 
    cout <<"<Presione ENTER para volver al menu principal. \n";
 
}
 
int main(int argc, char **argv) {
    int opcion;
 
    do { 
  opcion = menu();
  switch(opcion) {
    case 1:
      add();
      break;
    case 2:
      buscar();
      break;
  }
 
    } while (opcion!= 0);
  delete(costos);
 
    cout<<"\nHasta la proxima...\n\n";
    //system("pause");
 
    return 0;
}
