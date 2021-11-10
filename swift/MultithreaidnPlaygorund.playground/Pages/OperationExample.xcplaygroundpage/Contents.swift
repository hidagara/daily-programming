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

print("IT STARTED")

DispatchQueue.global().async {
    print("async")
    
    
    DispatchQueue(label: "s").async {
        print("main async")
    }
    DispatchQueue(label: "s").async {
        print("main async")
    }
    DispatchQueue(label: "s").async {
        print("main async")
    }
    
    
    DispatchQueue.global().sync {
        print("sync")
        DispatchQueue.global().async {
            print("async2")
        }
    }
    
    print("done")
}

func theTest(  completion: @escaping () -> ()) {
   
    
    var clr = {
        
    }
    
    
    for ind in 0..<1000 {
        DispatchQueue.global().asyncAfter(deadline: .now() + 10, execute: {
            
            completion()
        })
    }
    print("THE TEST IS DONE")
}

theTest {
    
}


//: [Next](@next)
class Obj {
    deinit {
        print("DEINITED OBJED")
    }
}
