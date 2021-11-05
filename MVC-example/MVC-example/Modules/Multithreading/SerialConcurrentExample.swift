//
//  SerialConcurrentExample.swift
//  MVC-example
//
//  Created by Roman Guseynov on 04.11.2021.
//

import Foundation
import os.signpost
class SerialConcurrentExampe {
    
    func asyncTasksOnSerialQueue() {
        let queue = DispatchQueue(label: "async.serial.queue")
        
        pointsOfInterestRange(with: "tasks(on:) the async.serial.queue") {
            os_signpost(.event, log: pointsOfInterest, name: "The First sign post") // first Ⓢ
            queue.async { self.oneSecondProcess(with: "async serial first") }
            os_signpost(.event, log: pointsOfInterest, name: "The second sign post") // second Ⓢ
            queue.async { self.oneSecondProcess(with: "async serial second") }

            os_signpost(.event, log: pointsOfInterest, name: "The third sign post") // third Ⓢ
            queue.async { self.oneSecondProcess(with: "async serial third") }
        }
    }
    
    func asyncTasksOnConcurrentQueue() {
        let queue = DispatchQueue(label: "async.concurrent.queue", attributes: .concurrent)
        pointsOfInterestRange(with: "tasks(on:) the async.concurrent.queue") {
            os_signpost(.event, log: pointsOfInterest, name: "The First sign post") // first Ⓢ
            queue.async { self.oneSecondProcess(with: "async concurrent fist") }

            os_signpost(.event, log: pointsOfInterest, name: "The second sign post") // second Ⓢ
            queue.async { self.oneSecondProcess(with: "async concurrent  second") }

            os_signpost(.event, log: pointsOfInterest, name: "The third sign post") // third Ⓢ
            queue.async { self.oneSecondProcess(with: "async concurrent  third") }
        }
    }
    
    func syncTasksOnConcurrentQueue() {
        let queue = DispatchQueue(label: "sync.concurrent.queue", attributes: .concurrent)
        pointsOfInterestRange(with: "tasks(on:) the sync.concurrent.queue") {
            os_signpost(.event, log: pointsOfInterest, name: "The First sign post") // first Ⓢ
            queue.sync { self.oneSecondProcess(with: "sync concurrent fist") }

            os_signpost(.event, log: pointsOfInterest, name: "The second sign post") // second Ⓢ
            queue.sync { self.oneSecondProcess(with: "sync concurrent  second") }

            os_signpost(.event, log: pointsOfInterest, name: "The third sign post") // third Ⓢ
            queue.sync { self.oneSecondProcess(with: "sync concurrent  third") }
        }
    }
    
    
    func syncTasksOnSerialQueue() {
        let queue = DispatchQueue(label: "sync.serial.queue", attributes: .concurrent)
        pointsOfInterestRange(with: "tasks(on:) the sync.serial.queue") {
            os_signpost(.event, log: pointsOfInterest, name: "The First sign post") // first Ⓢ
            queue.sync { self.oneSecondProcess(with: "sync serial fist", time: 8) } // -> Очереди ниже будут ждать завершения sync блока

            os_signpost(.event, log: pointsOfInterest, name: "The second sign post") // second Ⓢ
            queue.async { self.oneSecondProcess(with: "sync serial  second", time: 3) }

            os_signpost(.event, log: pointsOfInterest, name: "The third sign post") // third Ⓢ
            queue.async { self.oneSecondProcess(with: "sync serial  third", time: 4) }
            
            
            os_signpost(.event, log: pointsOfInterest, name: "The foru sign post") // third Ⓢ
            queue.sync { self.oneSecondProcess(with: "sync serial  four", time: 4) }
        }
    }
    
    

    private let pointsOfInterest = OSLog(subsystem: "GCD Demo", category: .pointsOfInterest)


    func oneSecondProcess(with staticString: StaticString, time: Int = 5) {
        pointsOfInterestRange(with: staticString) {
            Thread.sleep(forTimeInterval: TimeInterval(time))
        }
    }

    func pointsOfInterestRange(with staticString: StaticString, block: () -> Void) {
        let identifier = OSSignpostID(log: pointsOfInterest)
        os_signpost(.begin, log: pointsOfInterest, name: staticString, signpostID: identifier)
        block()
        os_signpost(.end, log: pointsOfInterest, name: staticString, signpostID: identifier)
    }
}
