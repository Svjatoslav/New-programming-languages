func longestCycle(_ edges: [Int]) -> Int {
    var answer = -1

    var visited = Array(repeating: false, count: edges.count)

    for i in 0..<edges.count {
        guard !visited[i] else { continue }

        var currentNode = i
        var path = [i]
        while !visited[currentNode] {
            visited[currentNode] = true

            let nextNode = edges[currentNode]
            guard nextNode != -1 else { break }
            path.append(nextNode)

            currentNode = nextNode
        }

        let cyclePath = path.suffix(from: path.firstIndex(of: currentNode)!)
        if cyclePath.count > 1 {
            answer = max(answer, cyclePath.count - 1)
        }
    }

    return answer
}
#3
print(longestCycle([3,3,4,2,3]))

#-1
print(longestCycle([[2,-1,3,1]]))