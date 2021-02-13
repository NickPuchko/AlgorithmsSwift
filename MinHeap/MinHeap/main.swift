struct MinHeap {
    var leafs: [Int]
    let size: Int
    var swapCount: Int
    var swaps: [(Int, Int)]
    mutating func popUp(_ child: Int) {
        let parent = getParent(child)
        if parent != -1 && leafs[child] < leafs[parent] {
            swaps.append((parent, child))
            swapCount += 1
            
            leafs.swapAt(child, parent)
            dropDown(child)
            popUp(parent)
        }
    }
    mutating func dropDown(_ parent: Int) {
        let leftChild = parent * 2 + 1
        let rightChild = parent * 2 + 2
        if leftChild < size {
            if rightChild < size {
                if leafs[rightChild] < leafs[leftChild] {
                    if leafs[parent] > leafs[rightChild] {
                        swaps.append((parent, rightChild))
                        swapCount += 1
                        leafs.swapAt(parent, rightChild)
                        dropDown(rightChild)
                    }
                } else {
                    if leafs[parent] > leafs[leftChild] {
                        swaps.append((parent, leftChild))
                        swapCount += 1
                        leafs.swapAt(parent, leftChild)
                        dropDown(leftChild)
                    }
                }
            } else {
                if leafs[parent] > leafs[leftChild] {
                    swaps.append((parent, leftChild))
                    swapCount += 1
                    leafs.swapAt(parent, leftChild)
                    dropDown(leftChild)
                }
            }
        }
    }
    func getParent(_ index: Int) -> Int {
        return (index + 1) / 2 - 1
    }
}
let size: Int = Int(readLine()!)!
let array: [Int] = (readLine()?.split(separator: " ").map { Int($0)! })!
var tree = MinHeap(leafs: array, size: size, swapCount: 0, swaps: [])
for leaf in (0..<size).reversed() { tree.dropDown(leaf) }
print(tree.swapCount)
for swap in tree.swaps { print(swap.0, swap.1) }
