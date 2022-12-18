class Valve {
    Integer flow
    List<Integer> destinations
    Valve(Integer flow) {
        this.flow = flow
        this.destinations = []
    }
    def addDestination(destination) {
        this.destinations << destination
    }
}

File f = new File('input.txt')
def lines = f.readLines()

def valveMap = [:]
valveCount = 0
for (line in lines) {
    def (_, name) = (line =~ /Valve ([A-Z][A-Z])/)[0]
    valveMap[name] = valveCount++
}

valves = []
for (line in lines) {
    def (_, flow, destinations) =
        (line =~ /rate=(\d+); .* valves? (.+)/)[0]
    def valve = new Valve(flow.toInteger())
    for (destination in destinations.tokenize(', ')) {
        valve.addDestination(valveMap[destination])
    }
    valves << valve
}

dists = []
for (src in 0..<valveCount) {
    dists << []
    for (dst in 0..<valveCount) {
        dists[src][dst] = Integer.MAX_VALUE.intdiv(2)
    }
    for (dst in valves[src].getDestinations()) {
        dists[src][dst] = 1
    }
}
for (k in 0..<valveCount) {
    for (i in 0..<valveCount) {
        for (j in 0..<valveCount) {
            dists[i][j] = Math.min(dists[i][j], dists[i][k] + dists[k][j])
        }
    }
}

def travel(valve, budget, state, total_flow, result) {
    result[state] = Math.max(result[state] ?: 0, total_flow)
    for (valve_next in 0..<valveCount) {
        def budget_next = budget - dists[valve][valve_next] - 1
        def flow_next = valves[valve_next].getFlow()
        if (valve_next == valve || flow_next == 0 || budget_next <= 0 ||
            (state & (2g << valve_next)) != 0) {
            continue
        }
        travel(valve_next, budget_next, state | (2g << valve_next),
               total_flow + budget_next * flow_next, result)
    }
}

def result = [:]
travel(valveMap["AA"], 26, 0g, 0, result)

def best = 0
for (iter1 in result) {
    for (iter2 in result) {
        if ((iter1.key & iter2.key) == 0) {
            best = Math.max(best, iter1.value + iter2.value)
        }
    }
}

println(best)
