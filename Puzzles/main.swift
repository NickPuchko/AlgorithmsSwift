import Foundation

enum Command: String {
    case pop, push, max
}

func power10(power: Int) -> Int {
    var value = 1
    for _ in 0..<power {
        value *= 10
    }
    return value
}

struct MaxStack {
    var maximums: [Int] = []
    var count: Int = 0
    
    init(size: Int) {
        maximums.reserveCapacity(size)
    }
    
    mutating func push(_ value: Int) {
        if count != 0 {
            let max = maximums.last!
            maximums.append(value > max ? value : max)
        } else {
            maximums.append(value)
        }
        count += 1
    }
    
    mutating func pop() {
        maximums.removeLast()
        count -= 1
    }
    
    mutating func max() {
        print(maximums.last!)
    }
}

private let count = Int((readLine()!.split(separator: " ").map { word in String(word) }).first!)!

private var stack = MaxStack(size: count)

for _ in 0..<count {

    var data: [Int32] = []
    var char = getchar()
    while char != EOF && char != 10 {
        data.append(char)
        char = getchar()
    }
    
    switch data[1] {
    case 117:
        var number: Int = 0
        var degree: Int = data.count - 6
        for index in 5..<data.count {
            number += (Int(data[index]) - 48) * power10(power: degree)
            degree -= 1
        }
        stack.push(number)
    case 111:
        stack.pop()
    default:
        stack.max()
    }
}
