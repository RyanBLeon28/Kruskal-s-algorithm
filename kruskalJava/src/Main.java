import java.util.*;

class Aresta implements Comparable<Aresta> {
    String origem,destino;
    int peso;

    // Estrutura para representar uma aresta:
    public Aresta(String origem, String destino,int peso) {
        this.origem = origem;
        this.destino = destino;
        this.peso = peso;
    }

    @Override
    // Função para comparar arestas com base em seus pesos:
    public int compareTo(Aresta aresta){
        return this.peso - aresta.peso;
    }
}
class Kruskal {
    int V; //número de Vértices do grafo
    ArrayList<Aresta> arestas;

    public Kruskal(int V){
        this.V = V;
        this.arestas = new ArrayList<>();
    }

    // Adiciona uma aresta na lista de Arestas(Grafo)
    public void novaAresta(String origem, String destino,int peso) {
        Aresta aresta = new Aresta(origem, destino, peso);
        arestas.add(aresta);
    }

    // Função para encontrar a raiz de um conjunto usando o algoritmo de busca em árvore:
    public String encontrarRaiz(HashMap<String, String> pai, String vertice){
        if (pai == null || !pai.containsKey(vertice)) {
            return null;
        }
        if (!pai.get(vertice).equals(vertice)) {
            pai.put(vertice, encontrarRaiz(pai, pai.get(vertice)));
        }
        return pai.get(vertice);
    }

    // Função para unir dois subconjuntos em um conjunto maior:
    public void juntarArestas(HashMap<String, String> pai, String origem, String destino){
        String raizOrigem = encontrarRaiz(pai, origem);
        String raizDestino = encontrarRaiz(pai, destino);
        if (raizOrigem != null && raizDestino != null) {
            pai.put(raizOrigem, raizDestino);
        }
    }

    // Algoritmo de Kruskal:
    public ArrayList<Aresta> kruskalA() {
        if (V <= 0 || arestas == null || arestas.isEmpty()) {
            return new ArrayList<>();
        }

        ArrayList<Aresta> resultado = new ArrayList<>();
        Collections.sort(arestas);  // Ordena as arestas em ordem crescente de peso
        HashMap<String, String> pai = new HashMap<>();

        for(int i = 0; i < V; i++) {
            pai.put(Integer.toString(i), Integer.toString(i));
        }

        int e = 0;
        int i = 0;
        while (e < V - 1) {
            Aresta proxima = arestas.get(i);
            i++;

            String raizOrigem = encontrarRaiz(pai, proxima.origem);
            String raizDestino = encontrarRaiz(pai, proxima.destino);
            if (raizOrigem == null || raizDestino == null){
                return null;
            }
            if (!raizOrigem.equals(raizDestino)) {
                resultado.add(proxima);
                juntarArestas(pai, raizOrigem, raizDestino);
                e++;
            }
        }
        return resultado;
    }   
}


public class Main{
    public static void main(String[] args) throws Exception {
        Kruskal g = new Kruskal(10);

        g.novaAresta("A","B", 2);
        g.novaAresta("A","C", 3);
        g.novaAresta("A","D", 3);
        g.novaAresta("B","C", 4);
        g.novaAresta("B","E", 3);
        g.novaAresta("C","D", 5);
        g.novaAresta("C","E", 1);
        g.novaAresta("D","F", 7);
        g.novaAresta("E","F", 8);
        g.novaAresta("F","G", 9);
        
        ArrayList<Aresta> agm = g.kruskalA();
        if (agm != null) {
            for (Aresta aresta : agm) {
                System.out.println("Origem: " + aresta.origem + ", Destino: " + aresta.destino + ", Peso: " + aresta.peso);
            }
        } else {
            System.out.println("O resultado do algoritmo de Kruskal é nulo.");
        }  
    }
}