The Equatable protocol is what allows two objects to be compared using ==, and it’s surprisingly easy to implement because Swift does most of the work for you by default.
The Comparable protocol allows use to use the <, >, <=, and >= operators with conforming data types, which in turn means that Swift knows how to sort arrays of those types. Most of Swift’s built-in types support Comparable out of the box, but if you want your own type to conform to them then you need to implement < – from that Swift can provide default implementations of the other three operators.


In Swift, conforming to the Hashable protocol is often just as easy as adding Hashable to your conformance list. However, if you have custom requirements, or use properties that don’t all conform to Hashable, it takes a little more work.

Here’s an example struct we can work with:

struct iPad: Hashable {
    var serialNumber: String
    var capacity: Int
}
Because that conforms to the Hashable protocol and both its properties also conform to the Hashable protocol, Swift will generate a hash(into:) method automatically.

However, in this case we can see that serialNumber is enough to identify each iPad uniquely so hashing capacity isn’t needed. So, we can write our own implementation of hash(into:) that hashes just that one property:

func hash(into hasher: inout Hasher) {
    hasher.combine(serialNumber)
}
You can add more properties to your hash by calling combine() repeatedly, and the order in which you add properties affects the finished hash value.

Swift uses a random seed every time it hashes an object, which means the hash value for any object is effectively guaranteed to be different between runs of your app.

This in turn means that elements you add to a set or a dictionary are highly likely to have a different order each time you run your app.


The Equatable protocol is what allows two objects to be compared using ==, and it’s surprisingly easy to implement because Swift does most of the work for you by default.

First, here’s a struct we can work with:

struct Person {
    var name: String
    var age: String
}
To make that Equatable you need to add the Equatable conformance like this:
```
struct Person: Equatable {
    var name: String
    var age: String
}
```
If you don’t want to check all properties for equality, or if any of your properties are not also Equatable, then you need to write your own == function like this:

static func ==(lhs: Person, rhs: Person) -> Bool {
    return lhs.name == rhs.name && lhs.age == rhs.age
}
Put that inside the Person struct. Because that’s your own function you can make it do any comparisons you like. Swift’s default Equatable implementation will check all properties for equality, so if you have one property that is guaranteed to be unique adding your own Equatable implementation is a good idea.



https://heartbeat.comet.ml/diving-into-data-structures-in-swift-arrays-4ffd516bde9b
https://heartbeat.comet.ml/diving-into-data-structures-in-swift-sets-e972c5a26b72



Expected Performance and When to Use Arrays
The primary reason to use an array is when the order of variables matters. Think about those times when you sort contacts by first or last name, a to-do list by date, or any other situation when it’s critical to find or display data in a specific order.

Apple’s documentation includes three key expectations for Array performance in the CFArray header:

Accessing any value at a particular index in an array is at worst O(log n), but should usually be O(1).
Searching for an object at an unknown index is at worst O(n (log n)), but will generally be O(n).
Inserting or deleting an object is at worst O(n (log n)) but will often be O(1).
These guarantees subtly deviate from the simple “ideal” array that you might expect from a computer science textbook or the C language, where an array is always a sequence of items laid out contiguously in memory.

In practice, these expectations make sense when you think about them:

If you already know where an item is, then looking it up in the array should be fast.
If you don’t know where a particular item is, you’ll need to look through the array from beginning to end. Your search will be slower.
If you know where you’re adding or removing an object it’s not too difficult. Although, you may need to adjust the rest of the array afterwards, and that’s more time-consuming.



# Dictionary ->

The performance degradation of getting a single value is guaranteed to be at worst O(log n), but will often be O(1).
Insertion and deletion can be as bad as O(n (log n)), but typically be closer to O(1) because of under-the-hood optimizations.




NSIndexSet
NSOrderedSet
NSCountedSet
NSCache
ContiguousArray
The ContiguousArray type is a specialized array that always stores its elements in a contiguous region of memory. If your array’s Element type is a class or @objc protocol and you do not need to bridge the array to NSArray or pass the array to Objective-C APIs, using ContiguousArray may be more efficient and have more predictable performance than Array. If the array’s Element type is a struct or enumeration, Array and ContiguousArray should have similar efficiency.