local grafo = {}
local contador = 0

-------------------------------------------------- Função inserir vértice--------------------------------------------------
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
-------------------------------------------------- Função inserir vértice--------------------------------------------------

-------------------------------------------------- Função para vereficar se esta na rota--------------------------------------------------
function Na_Rota(rota,chave_exterior,chave_interior)
    local chave
    

    if (#rota > 0) then
        for iter in pairs(rota) do
            if (string.find(rota[iter],chave_exterior) ~= nil and string.find(rota[iter],chave_interior) ~= nil) then
                chave = false

            elseif ((string.find(rota[iter],chave_exterior) ~= nil and string.find(rota[iter],chave_interior) == nil) or (string.find(rota[iter],chave_exterior) == nil and string.find(rota[iter],chave_interior) ~= nil)) then
                chave = true
            elseif ( (string.find(rota[iter],chave_exterior) == nil and string.find(rota[iter],chave_interior) ~= nil)) then
            else
                chave = true
            
            end
        end

        return chave

    else
        return true     
    end

end
-------------------------------------------------- Função para vereficar se esta na rota--------------------------------------------------

-------------------------------------------------- Função para inserir caminho na rota-------------------------------------------------
function Inserir_Na_Rota(rota,chave_exterior,chave_interior)
    local teste = true
    local iter = 1

    if (#rota == 0) then
        table.insert(rota,chave_exterior..chave_interior)
        
    else
        while iter <= #rota do
            
            if (string.find(rota[iter],chave_exterior) ~= nil or string.find(rota[iter],chave_interior) ~= nil) then
                
                rota[iter] = rota[iter] .. chave_exterior .. chave_interior
                iter = iter + 1
                teste = false
               
                
            
               
            else 
                iter = iter + 1       
            end
        end

        if (teste == true) then
            table.insert(rota,chave_exterior .. chave_interior)
        end
    end
end
-------------------------------------------------- Função para inserir caminho na rota-------------------------------------------------

-------------------------------------------------- Função para juntar os caminhos na rota-------------------------------------------------
function Arrumar_Rota(rota,chave_exterior,chave_interior)
    local i = 1 
    
    --print("chave_exterior:",chave_exterior,"chave_interior",chave_interior)
    while i < #rota do
        local y = i + 1
        
        
        while y <= #rota do
            
            if ((string.find(rota[i],chave_exterior) ~= nil or string.find(rota[i],chave_exterior) ~= nil) and (string.find(rota[y],chave_exterior) ~= nil or string.find(rota[y],chave_interior) ~= nil)) then
                
                    
                rota[i] = rota[i] .. rota[y]
                table.remove(rota,y)
                y = 2
            
            else
                y = y + 1
            end

        end
    
        i = i + 1
    end
    
  

end
-------------------------------------------------- Função para juntar os caminhos na rota-------------------------------------------------

-------------------------------------------------- Função para aplicar o algoritmo de Kruskal  --------------------------------------------------
function Kruskal(grafo)
    
    local rota = {}
    local custo = 0
    local aux_custo = 0
    local aux_verticeE, aux_verticeI, removedor
    local iter = 0
    
    
    while (iter < (contador - 1)) do
        local comparador = 999999
          
        for chave_exterior in pairs(grafo) do
            local aux = grafo[chave_exterior]
        
            for chave_interior in pairs(aux) do
                if (aux[chave_interior] < comparador and Na_Rota(rota,chave_exterior,chave_interior)) then
                    aux_custo = aux[chave_interior]
                    aux_verticeE = chave_exterior
                    aux_verticeI = chave_interior
                    comparador = aux[chave_interior]
                end

            end

        end

        custo = custo + aux_custo
        
        Inserir_Na_Rota(rota,aux_verticeE,aux_verticeI)
        Arrumar_Rota(rota,aux_verticeE,aux_verticeI)
    
        
        removedor = grafo[aux_verticeE]
        removedor[aux_verticeI] = nil

        removedor = grafo[aux_verticeI]
        removedor[aux_verticeE] = nil
        iter = iter + 1

        print(aux_verticeE .. " -> " .. aux_verticeI, ":", aux_custo)
    end
    return print("Custo total:", custo)
    

end
-------------------------------------------------- Função para aplicar o algoritmo de Kruskal --------------------------------------------------

Inserir_vertice("A","B",2)
Inserir_vertice("A","C",3)
Inserir_vertice("A","D",3)
Inserir_vertice("B","C",4)
Inserir_vertice("B","E",3)
Inserir_vertice("C","D",5)
Inserir_vertice("C","E",1)
Inserir_vertice("D","F",7)
Inserir_vertice("E","F",8)
Inserir_vertice("F","G",9)

--[[Inserir_vertice("A","B",5)
Inserir_vertice("A","D",9)
Inserir_vertice("A","E",10)
Inserir_vertice("A","C",6)
Inserir_vertice("B","D",3)
Inserir_vertice("C","E",1)
Inserir_vertice("C","D",8)
Inserir_vertice("D","E",2)]]--


local teste = Kruskal(grafo)








