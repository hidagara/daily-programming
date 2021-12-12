import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
var greeting = "Hello, playground"


var dg = DispatchGroup()
var wi = DispatchWorkItem {
    print("WI NUMBER ONE")
}

dg.enter()


dg.leave()
dg.notify(queue: DispatchQueue.global(), work: wi)




class MyOP: Operation {
    
}
//PlaygroundPage.current.finishExecution()



// CoreData Tutorial

# 