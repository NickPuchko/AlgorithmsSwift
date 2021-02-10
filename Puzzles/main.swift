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















//while let line = readLine() {
//    let input = line.split(separator: " ")
//    let command = Command(rawValue: String(input.first!))!
//
//    switch command {
//    case .push:
//        stack.push(Int(input[1])!)
//    case .pop:
//        stack.pop()
//    default:
//        stack.max()
//    }
//}















// TODO: Fast input reading: Scaner, FileHandle.standardInput
//var printList: [String] = []
//var maximums: [Int] = []


//    let finalTime = Double(DispatchTime.now().uptimeNanoseconds)
//
//
//    timeInput += (end - start) * 1e-6
//    timeSplit += (splitEnd - end) * 1e-6
//    timeMax += (finalTime - splitEnd) * 1e-6
//    totalTime += (finalTime - start) * 1e-6




//let globalEnd : Double = Double(DispatchTime.now().uptimeNanoseconds)

//print(printList.joined(separator: " "))
//print(timeInput, timeSplit, timeMax)
//print("total time: \(totalTime)")
//print("global time: \(globalEnd - globalStart)")
//print(stack.printList.joined(separator: " "))

//while let line = readLine() {
//    let input: [String] = line.components(separatedBy: " ")
////
//
//    let command = Command(rawValue: input.first!)!
//    switch command {
//    case .push:
//        stack.push(Int(input[1])!)
//    case .pop:
//        stack.items.removeLast()
//    case .max:
//        stack.max()
//    }
//}




//for number in stack.printList {
//    print(number)
//}




//var str = ""
//while true {
//    guard let input = readLine() else {
//        break
//    }
//    str += input
//}



//let scanner: Scanner = Scanner.localizedScanner(with: str) as! Scanner
//
//func input() -> String {
//    let keyboard = FileHandle.standardInput
//    let inputData = keyboard.availableData
//    return NSString(data: inputData, encoding: String.Encoding.utf8.rawValue)! as String
//}
//var count = 0
//while true {
//    var num:Int = 0
//    let success = scanner.scan scanS scanInteger(&num)
//    if success {
//        //print("Read \(num)")
//        count = count + 1
//    }
//    else {
//        break
//    }
//}



