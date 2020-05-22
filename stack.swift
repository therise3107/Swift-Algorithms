public struct Stack<Element>: ExpressibleByArrayLiteral {
    private var storage: [Element] = []
    
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        storage.removeLast()
    }
    
    public func peek() -> Element? {
        storage.last
    }
    
    public var isEmpty: Bool {
        peek() == nil
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        """
        ---Top---
        \(storage.map {"\($0)"}.reversed().joined(separator: "\n"))
        ---------
        """
    }
}

var stack: Stack = [1, 2, 3, 4]
stack.push(5)
print(stack.description)
stack.pop()
print(stack.description)
stack.peek()
stack.isEmpty

