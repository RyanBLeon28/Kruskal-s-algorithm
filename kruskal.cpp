#include <iostream>
#include <vector>
using namespace std;
#include <string>
#include <cstdio>

// Definição da classe Grafo
class Grafo {
    private:
        string origem;
        string destino;
        int peso;

    public: 
        // Construtor da classe
        Grafo(string o, string d,int w) : origem(o), destino(d), peso(w) {}
        
        // Métodos para obter informações
        string getO() const { return origem; }
        string getD() const { return destino; }
        int getP() const { return peso;}
};

int main() {
    vector<Grafo> grafoKruskal;
    vector<Grafo> grafoResultado;

    // Criando alguns objetos da classe Pessoa e adicionando ao vetor
    grafoKruskal.push_back(Grafo("A","B", 2));
    grafoKruskal.push_back(Grafo("A","C", 3));
    grafoKruskal.push_back(Grafo("A","D", 3));
    grafoKruskal.push_back(Grafo("B","C", 4));
    grafoKruskal.push_back(Grafo("B","E", 3));
    grafoKruskal.push_back(Grafo("C","D", 5));
    grafoKruskal.push_back(Grafo("C","E", 1));
    grafoKruskal.push_back(Grafo("D","F", 7));
    grafoKruskal.push_back(Grafo("E","F", 8));
    grafoKruskal.push_back(Grafo("F","G", 9));

    // Percorrendo o vetor e exibindo as informações de cada pessoa
    for (const Grafo& vertices : grafoKruskal) {
        cout << "Origem: " << vertices.getO() << ", Destino: " << vertices.getD() <<  " Peso: " << vertices.getP() << endl;
    }

    int cont = 0;
    Grafo& primeiroVertice = grafoKruskal[1];
    int minP = primeiroVertice.getP(); 

    while (cont < grafoKruskal.size()){
        string origem;
        string destino;
        printf("Peso: %d \n",minP);

        for (int i = 0; i < grafoKruskal.size();i++) {
            Grafo& vertices = grafoKruskal[i]; 
            Grafo& verticesAux = grafoKruskal[i+1]; 
            
            //printf("valor do vertice %d\n",vertices.getP());

            if (vertices.getP() <  minP){
                printf("recebeu \n");
                minP = vertices.getP();
                origem = vertices.getO();
                destino = vertices.getD();
            }
            else if (vertices.getP() == minP || verticesAux.getP() > 0){
                vertices = grafoKruskal[i+1];
                minP = vertices.getP();
                origem = vertices.getO();
                destino = vertices.getD();
            }
        }
        // for (int j = 0; j < grafoResultado.size();j++) {    
        //     Grafo& verticesRes = grafoResultado[j]; 

        //     if (grafoResultado.size() == 0){
        //         grafoResultado.push_back(Grafo(origem,destino, minP));
        //     }
        //     else{
                
        //     }
        // }
        printf("Minimo peso: %d \n",minP);
        printf("Minimo origem: %s \n",origem.c_str());

        cont++;
    }

    
    printf("\n    Grafo Resultado: \n");
    for (const Grafo& vertices : grafoResultado) {
        cout << "Origem: " << vertices.getO() << ", Destino: " << vertices.getD() <<  " Peso: " << vertices.getP() << endl;
    }

    return 0;
} 


