function shortestPath(graph, start, goal)
    -- Очередь для обхода графа
    local queue = {{start}}
    
    -- Множество посещенных вершин
    local visited = {[start] = true}
    
    -- Пока очередь не пуста
    while #queue > 0 do
        -- Извлекаем путь из очереди
        local path = table.remove(queue, 1)
        -- Получаем последнюю вершину пути
        local node = path[#path]
        
        -- Если мы достигли целевой вершины
        if node == goal then
            return path  -- Возвращаем найденный путь
        end
        
        -- Перебираем соседей текущей вершины
        for _, neighbor in ipairs(graph[node] or {}) do
            -- Если сосед еще не посещен
            if not visited[neighbor] then
                -- Помечаем его как посещенного
                visited[neighbor] = true
                -- Создаем новый путь, добавляя соседа в конец
                local new_path = {table.unpack(path)}
                table.insert(new_path, neighbor)
                -- Добавляем новый путь в очередь
                table.insert(queue, new_path)
            end
        end
    end
    
    --Если вершина не достигнута
    return nil
end

local graph = {
    A = {"B", "C"},
    B = {"A", "D", "E"},
    C = {"A", "F", "G"},
    D = {"B"},
    E = {"B", "H"},
    F = {"C"},
    G = {"C"},
    H = {"E"}
}

local startNode = "A"
local goalNode = "H"

local path = shortestPath(graph, startNode, goalNode)

if path then
    print("Кратчайший путь:", table.concat(path, " -> "))
else
    print("Путь не найден.")
end