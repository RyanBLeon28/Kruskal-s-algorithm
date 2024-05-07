#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
#include <map>

// Estrutura para representar uma aresta:
struct Aresta {
    std::string origem,destino;
    int peso;
};

// Função para comparar arestas com base em seus pesos:
bool compararArestas(const Aresta& a, const Aresta& b) {
    return a.peso < b.peso;
}

// Função para encontrar a raiz de um conjunto usando o algoritmo de busca em árvore:
std::string  encontrarRaiz(std::string vertice, std::map<std::string, std::string>& conjunto) {
    while (conjunto[vertice] != vertice) {
        vertice = conjunto[vertice];
    }
    return vertice;
}

// Função para unir dois subconjuntos em um conjunto maior:
void juntarArestas(std::string raizA, std::string raizB, std::map<std::string, std::string>& conjunto) {
    conjunto[raizB] = raizA;
}

// Algoritmo de Kruskal:
void kruskal(std::vector<Aresta>& grafo) {
    // Ordena as arestas em ordem crescente de peso
    sort(grafo.begin(), grafo.end(), compararArestas);

    std::map<std::string, std::string> conjunto;

    // Adiciona ao conjunto os pares de origem e destino
    for (const Aresta& aresta : grafo) {
        conjunto[aresta.origem] = aresta.origem;
        conjunto[aresta.destino] = aresta.destino;
    }

    std::vector<Aresta> arvoreMinima;

    // checa se houve ciclo 
    for (const Aresta& aresta : grafo) {
        std::string raizOrigem = encontrarRaiz(aresta.origem, conjunto);
        std::string raizDestino = encontrarRaiz(aresta.destino, conjunto);

        // Se a raiz de origem e a raiz de destino forem diferentes, a aresta pode ser adicionada à árvore mínima
        if (raizOrigem != raizDestino) {
            arvoreMinima.push_back(aresta);
            juntarArestas(raizOrigem, raizDestino, conjunto); // assim o conjunto "liga as arestas ja visitadas"
        }
    }

    // Imprime árvore mínima
    for (const Aresta& aresta : arvoreMinima) {
        std::cout << aresta.origem << " - " << aresta.destino << " : " << aresta.peso << std::endl;
    }
}




int main() {
    std::vector<Aresta> grafo;

    grafo.push_back({"A","B", 2});
    grafo.push_back({"A","C", 3});
    grafo.push_back({"A","D", 3});
    grafo.push_back({"B","C", 4});
    grafo.push_back({"B","E", 3});
    grafo.push_back({"C","D", 5});
    grafo.push_back({"C","E", 1});
    grafo.push_back({"D","F", 7});
    grafo.push_back({"E","F", 8});
    grafo.push_back({"F","G", 9});

    kruskal(grafo);

    return 0;
}




