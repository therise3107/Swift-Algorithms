/*
What is a Linked List
 Linked list is a data type in which each node stores value and a reference to next node
Functions to implement:
 
 Insertion:
 1. Push :- Insert at the start of the linkedList O(1)
 2. Append:- Insert at the end of linkedList O(1)
 3. Insert(at: index):- Insert at index of the linkedList O(index)
 
 NodeAt:- Find the node at the provided index O(index)
 
 Deletion:
 1. Pop :- Delete at the start of the linkedList O(1)
 2. RemoveLast:- Delete at the end of the linkedList O(1)
 3. RemoveAll:- Delete all O(1)
 4. RemoveAt:- Delete at index of the linkedList O(index)
Node :- A class which implements Node data structure and extends CustomStringConvertible
LinkedList: A struct which implements the LinkedList Logic and extends CustomStringConvertible
*/

import Foundation

class Node<Value> {
    public var value: Value
    public var next: Node?

    init(_ value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {

    public var description: String {
        guard let next = next else {
            return "\(value) -> nil"
        }

        return "\(value) -> \(next)"
    }
}

struct LinkedList<Value> {
    
    public var head: Node<Value>?
    public var tail: Node<Value>?

    init() {}

    public var isEmpty: Bool {
        head == nil
    }

    public func nodeAt(at index: Int) -> Node<Value>? {
        var currentIndex = 0
        var currentNode = head

        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }

        return currentNode
    }
    
    public mutating func copyNodes() {
        guard var oldNode = head else {
            return
        }
        
        head = Node(oldNode.value)
        
        var newNode = head
        
        while let nextOldNode = oldNode.next {
            newNode!.next = Node(nextOldNode.value)
            newNode = newNode!.next
            
            oldNode = nextOldNode
        }
        
        tail = newNode
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty LinkedList"
        }

        return "\(head)"
    }
}

// All the insertions
extension LinkedList {

    public mutating func push(_ value: Value) {
        head = Node(value, next: head)

        if tail == nil {
            tail = head
        }
    }

    public mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)

            return
        }

        tail!.next = Node(value)
        tail = tail!.next
    }

    @discardableResult
    public mutating func insert(_ value: Value, after: Node<Value>? = nil) -> Node<Value>? {
        guard let node = after else {
            return nil
        }

        node.next = Node(value, next: node.next)

        return node.next
    }
}

// All the removals
extension LinkedList {

    @discardableResult
    public mutating func pop() -> Value? {
        defer {
            if !isEmpty {
                head = head?.next
            }
        }

        return head?.value
    }

    @discardableResult
    public mutating func removeLast() -> Value? {
        guard head?.next != nil else {
            return pop()
        }

        defer {
            if !isEmpty {
                var currentNode = head

                while currentNode?.next?.next != nil {
                    currentNode = currentNode?.next
                }

                tail = currentNode
                tail!.next = nil
            }
        }

        return tail?.value
    }

    @discardableResult
    public mutating func removeAll() -> Node<Value>? {
        defer {
            (head, tail) = (nil, nil)
        }

        return head
    }

    @discardableResult
    public mutating func removeAt(index: Int) -> Value? {
        guard !isEmpty else {
            return nil
        }

        guard index != 0 else {
            return pop()
        }

        let node = nodeAt(at: index - 1)

        node?.next = node?.next?.next

        return node?.value
    }
}

var list = LinkedList<Int>()

list.push(1)
list.push(2)
list.push(3)

print(list)

