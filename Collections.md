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