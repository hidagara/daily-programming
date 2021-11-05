//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import Darwin

PlaygroundPage.current.needsIndefiniteExecution = true

let printerQueue = OperationQueue()


printerQueue.addOperation({
    print("Hello ")
    sleep(2)
})

printerQueue.addOperation({
    print("Hello 2")
    sleep(1)
})

//: [Next](@next)
