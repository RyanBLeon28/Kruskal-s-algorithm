import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// Classe para representar uma aresta:
class Aresta {
    String origem, destino;
    int peso;

    public Aresta(String origem, String destino, int peso) {
        this.origem = origem;
        this.destino = destino;
        this.peso = peso;
    }
}

public class Kruskal {

    // Função para comparar arestas com base em seus pesos:
    static class ComparadorArestas implements java.util.Comparator<Aresta> {
        @Override
        public int compare(Aresta a, Aresta b) {
            return Integer.compare(a.peso, b.peso);
        }
    }

    // Função para encontrar a raiz de um conjunto usando o algoritmo de busca em árvore:
    static String encontrarRaiz(String vertice, Map<String, String> conjunto) {
        while (!conjunto.get(vertice).equals(vertice)) {
            vertice = conjunto.get(vertice);
        }
        return vertice;
    }

    // Função para unir dois subconjuntos em um conjunto maior:
    static void juntarArestas(String raizA, String raizB, Map<String, String> conjunto) {
        conjunto.put(raizB, raizA);
    }

    // Algoritmo de Kruskal:
    static void kruskal(List<Aresta> grafo) {
        // Ordena as arestas em ordem crescente de peso
        Collections.sort(grafo, new ComparadorArestas());

        Map<String, String> conjunto = new HashMap<>();

        // Adiciona ao conjunto os pares de origem e destino
        for (Aresta aresta : grafo) {
            conjunto.putIfAbsent(aresta.origem, aresta.origem);
            conjunto.putIfAbsent(aresta.destino, aresta.destino);
        }

        List<Aresta> arvoreMinima = new ArrayList<>();

        // checa se houve ciclo
        for (Aresta aresta : grafo) {
            String raizOrigem = encontrarRaiz(aresta.origem, conjunto);
            String raizDestino = encontrarRaiz(aresta.destino, conjunto);

            // Se a raiz de origem e a raiz de destino forem diferentes, a aresta pode ser adicionada à árvore mínima
            if (!raizOrigem.equals(raizDestino)) {
                arvoreMinima.add(aresta);
                juntarArestas(raizOrigem, raizDestino, conjunto); // assim o conjunto "liga as arestas ja visitadas"
            }
        }

        // Imprime árvore mínima
        for (Aresta aresta : arvoreMinima) {
            System.out.println(aresta.origem + " - " + aresta.destino + " : " + aresta.peso);
        }
    }

    public static void main(String[] args) {
        List<Aresta> grafo = new ArrayList<>();

        grafo.add(new Aresta("A", "B", 2));
        grafo.add(new Aresta("A", "C", 3));
        grafo.add(new Aresta("A", "D", 3));
        grafo.add(new Aresta("B", "C", 4));
        grafo.add(new Aresta("B", "E", 3));
        grafo.add(new Aresta("C", "D", 5));
        grafo.add(new Aresta("C", "E", 1));
        grafo.add(new Aresta("D", "F", 7));
        grafo.add(new Aresta("E", "F", 8));
        grafo.add(new Aresta("F", "G", 9));

        kruskal(grafo);
    }
}
