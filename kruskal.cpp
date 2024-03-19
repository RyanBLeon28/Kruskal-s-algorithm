#include <iostream>
#include <vector>
using namespace std;


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

    // Criando alguns objetos da classe Pessoa e adicionando ao vetor
    grafoKruskal.push_back(Grafo("UN","PM", 200));
    grafoKruskal.push_back(Grafo("NQ","MT", 250));
    grafoKruskal.push_back(Grafo("PM","JF", 280));

    // Percorrendo o vetor e exibindo as informações de cada pessoa
    for (const Grafo& vertices : grafoKruskal) {
        cout << "Origem: " << vertices.getO() << ", Destino: " << vertices.getD() <<  " Peso: " << vertices.getP() << endl;
    }
    return 0;
} 




// char orgigem[8] =    {'un', 'nq', 'pm', 'bh', 'mt', 'bh', 'bh', 'bh'};
// char adjacentes[8] = {'pm', 'mt', 'ub', 'jf', 'bh', 'pm', 'nq', 'un'};
// int peso[] =         {200,  250,   280,  300,  350,  400,  600,  650};
// int resultado = 0;

//     def adicionar_aresta(self, u, v, w):
//         self.grafo.append([u, v, w])

//     def encontrar(self, pai, i):
//         if pai[i] == i:
//             return i
//         return self.encontrar(pai, pai[i])

//     def unir(self, pai, rank, x, y):
//         raiz_x = self.encontrar(pai, x)
//         raiz_y = self.encontrar(pai, y)

//         if rank[raiz_x] < rank[raiz_y]:
//             pai[raiz_x] = raiz_y
//         elif rank[raiz_x] > rank[raiz_y]:
//             pai[raiz_y] = raiz_x
//         else:
//             pai[raiz_y] = raiz_x
//             rank[raiz_x] += 1

//     def kruskal(self):
//         resultado = []
//         i, e = 0, 0

//         self.grafo = sorted(self.grafo, key=lambda item: item[2])

//         pai = []
//         rank = []

//         for node in range(self.V):
//             pai.append(node)
//             rank.append(0)

//         while e < self.V - 1:
//             u, v, w = self.grafo[i]
//             i += 1
//             x = self.encontrar(pai, u)
//             y = self.encontrar(pai, v)

//             if x != y:
//                 e += 1
//                 resultado.append([u, v, w])
//                 self.unir(pai, rank, x, y)

