//: [Previous](@previous)
import Combine
import Foundation

let myRange = (0...10)


//myRange.publisher.sink(receiveCompletion: { value in
//    print("received completion \(value)")
//}, receiveValue: { element in
//    print("value recived element \(element)")
//})





let timberPub = Timer.publish(every: 1, on: .main, in: .default).autoconnect()

let cancellable = timberPub.sink(receiveValue: {element in
    print(element)
    
    cancellable.cancel()

})


// Publisher: Uses a timer to emit the date once per second.
let timerPub = Timer.publish(every: 1, on: .main, in: .default)
    .autoconnect()

// Subscriber: Waits 5 seconds after subscription, then requests a
// maximum of 3 values.
class MySubscriber: Subscriber {
    typealias Input = Date
    typealias Failure = Never
    var subscription: Subscription?
    
    func receive(subscription: Subscription) {
        print("published                             received")
        self.subscription = subscription
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            subscription.request(.max(3))
        }
    }
    
    func receive(_ input: Date) -> Subscribers.Demand {
        print("\(input)             \(Date())")
        return Subscribers.Demand.none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print ("--done--")
    }
}

// Subscribe to timerPub.
let mySub = MySubscriber()
print ("Subscribing at \(Date())")
timerPub.subscribe(mySub)
