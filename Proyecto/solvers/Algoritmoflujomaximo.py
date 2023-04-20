import collections

def ford_fulkerson(graph, source, sink):
    # Create residual graph with initial capacities
    residual_graph = collections.defaultdict(dict)
    for (u, v), capacity in graph.items():
        residual_graph[u][v] = capacity
        residual_graph[v][u] = 0

    max_flow = 0

    while True:
        # Run BFS to find augmenting path
        parent = {}
        queue = collections.deque()
        queue.append(source)
        parent[source] = None
        while queue:
            u = queue.popleft()
            if u == sink:
                break
            for v in residual_graph[u]:
                if v not in parent and residual_graph[u][v] > 0:
                    parent[v] = u
                    queue.append(v)

        # If no augmenting path found, return max flow
        if sink not in parent:
            return max_flow

        # Determine bottleneck capacity of the augmenting path
        path_capacity = float("inf")
        v = sink
        while v != source:
            u = parent[v]
            path_capacity = min(path_capacity, residual_graph[u][v])
            v = u

        # Update residual graph capacities along the augmenting path
        v = sink
        while v != source:
            u = parent[v]
            residual_graph[u][v] -= path_capacity
            residual_graph[v][u] += path_capacity
            v = u

        # Add flow through the augmenting path to max flow
        max_flow += path_capacity

# Proyecto Ford-Fulkenson Redes b)

graph = {
    ('s', 1): 10,
    ('s', 2): 15,
    ('s', 3): 20,
    (1, 4): 5,
    (1, 'n'): 10,
    (2, 4): 12,
    (3, 4): 15,
    (3, 'n'): 5,
    (4, 'n'): 20,
}

max_flow = ford_fulkerson(graph, 's', 'n')
print("Maximum flow:", max_flow)
