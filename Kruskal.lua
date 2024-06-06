local grafo = {}
local contador = 0


function Inserir_vertice(vertice_origem,vertice_destino, peso)
    if (contador == 0) then
        grafo[vertice_origem] = {}
        local aux1 = grafo[vertice_origem]
        aux1[vertice_destino] = peso
    
        grafo[vertice_destino] = {}
        local aux2 = grafo[vertice_destino]
        aux2[vertice_origem] = peso
    
        contador = contador + 2

    else
        for chave in pairs(grafo) do

            if (chave == vertice_origem) then
                local aux3 = grafo[vertice_origem]
                aux3[vertice_destino] = peso
                

                for k in pairs(grafo) do

                    if (k == vertice_destino) then
                        local aux4 = grafo[vertice_destino]
                        aux4[vertice_origem] = peso
                        return
                
                    end
                end
                
                grafo[vertice_destino] = {}
                local aux5 = grafo[vertice_destino]
                aux5[vertice_origem] = peso
                contador = contador + 1
                return
            
            end
        end
    

        grafo[vertice_origem] = {}
        local aux6 = grafo[vertice_origem]
        aux6[vertice_destino] = peso
        contador = contador + 1

        for k1 in pairs(grafo) do
                    

            if (k1 == vertice_destino) then
                local aux7 = grafo[vertice_destino]
                aux7[vertice_origem] = peso
            end
                    
        end
        
        grafo[vertice_destino] = {}
        local aux8 = grafo[vertice_destino]
        aux8[vertice_origem] = peso
        contador = contador + 1

        

    end
   
end

-------------------------------------------------- Função para imprimir o grafo --------------------------------------------------
function Imprimir(grafo)
    for chave_exterior in pairs(grafo) do 
        local aux_print = grafo[chave_exterior]

        for chave_interior,peso in pairs (aux_print) do
            print(chave_exterior,chave_interior,peso)

        end

    end

end
-------------------------------------------------- Função para imprimir o grafo --------------------------------------------------

function Foi_visitado(vertices_visitados,chave_interior)
    local iter = 1

    while iter <= #vertices_visitados do
        if (vertices_visitados[iter] == chave_interior) then
            return false
        end
        iter = iter + 1
        
    end

    return true
end


-------------------------------------------------- Função para aplicar o algoritmo de Kruskal  --------------------------------------------------
function Kruskal(grafo)
    local vertices_visitados = {}
    local rota = {}
    local custo = 0
    local aux_custo = 0
    local aux_verticeE, aux_verticeI, removedor
    local iter = 0
    print("conatdor",contador)

    while (iter < (contador - 1)) do
        local comparador = 999999
        
        for chave_exterior in pairs(grafo) do
            local aux = grafo[chave_exterior]
        
            for chave_interior in pairs(aux) do
                if (aux[chave_interior] < comparador and Foi_visitado(vertices_visitados,chave_interior)) then
                    aux_custo = aux[chave_interior]
                    aux_verticeE = chave_exterior
                    aux_verticeI = chave_interior
                    comparador = aux[chave_interior]
                end

            end

        end

        custo = custo + aux_custo
        table.insert(rota, aux_verticeE .. aux_verticeI)
        table.insert(vertices_visitados,aux_verticeE)
        table.insert(vertices_visitados,aux_verticeI)

        removedor = grafo[aux_verticeE]
        removedor[aux_verticeI] = nil

        removedor = grafo[aux_verticeI]
        removedor[aux_verticeE] = nil
        iter = iter + 1

    end
    return custo

end
-------------------------------------------------- Função para aplicar o algoritmo de Kruskal --------------------------------------------------

Inserir_vertice("A","B",5)
Inserir_vertice("A","D",9)
Inserir_vertice("A","E",10)
Inserir_vertice("A","C",6)
Inserir_vertice("B","D",3)
Inserir_vertice("C","E",1)
Inserir_vertice("C","D",8)
Inserir_vertice("D","E",2)




local teste = Kruskal(grafo)
print(teste)


