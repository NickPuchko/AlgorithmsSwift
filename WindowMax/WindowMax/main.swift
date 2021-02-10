import Foundation

struct MaxStack {
    private var items: [(Int, Int)] = []
    fileprivate var count: Int = 0
    fileprivate let size: Int
    init(size: Int) {
        self.size = size
        items.reserveCapacity(size)
    }
    
    fileprivate mutating func push(_ value: Int) {
        if count != 0 {
            let max = items.last!.1
            items.append((value, value > max ? value : max))
        } else {
            items.append((value, value))
        }
        count += 1
    }
    
    @discardableResult
    fileprivate mutating func pop() -> (Int, Int) {
        count -= 1
        return items.popLast()!
    }
    
    fileprivate func max() -> Int {
        return items.last!.1
    }
}

private func flipStacks(input: inout MaxStack, output: inout MaxStack) {
    for _ in 0..<input.size {
        output.push(input.pop().0)
    }
}

private func power10(power: Int) -> Int {
    var value = 1
    for _ in 0..<power {
        value *= 10
    }
    return value
}

private func readInt() -> Int {
    var data: [Int32] = []
    var char = getchar()
    while char != EOF && char != 10 {
        data.append(char)
        char = getchar()
    }
    var number: Int = 0
    var degree: Int = data.count - 1
    for index in 0..<data.count {
        number += (Int(data[index]) - 48) * power10(power: degree)
        degree -= 1
    }
    return number
}

private func getArray() -> [Int] {
    var result: [Int] = []
    var data: [Int32] = []
    var char = getchar()
    repeat {
        if char == 32 {
            var number: Int = 0
            var degree: Int = data.count - 1
            for byte in data {
                number += (Int(byte) - 48) * power10(power: degree)
                degree -= 1
            }
            data = []
            result.append(number)
            char = getchar()
        } else {
            data.append(char)
            char = getchar()
        }
    } while char != 10
    var number: Int = 0
    var degree: Int = data.count - 1
    for byte in data {
        number += (Int(byte) - 48) * power10(power: degree)
        degree -= 1
    }
    result.append(number)
    
    return result
}


private let length = readInt()
private let array = getArray()
private let size = readInt()

private var input  = MaxStack(size: size)
private var output = MaxStack(size: size)

for value in array {
    input.push(value)
    let count = input.count + output.count
    if count == size {
        if input.count == size {
            flipStacks(input: &input, output: &output)
            print(output.pop().1)
        } else {
            print(max(input.max(), output.pop().1))
        }
    }
}
