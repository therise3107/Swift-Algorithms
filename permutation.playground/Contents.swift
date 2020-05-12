/*
 Implementation of Heap's Algorithm https://en.wikipedia.org/wiki/Heap%27s_algorithm to find all permutations

 The function permutation takes string as an argument and retuns a set(for unique) of permutations.
 It is strongly advised not to use this algo if lenght is more than 8, since the complexity is almost O(n!)
*/

public func permutation(_ str: String) -> Set<String> {
    var str = Array(str)
    var permuttedSet = Set<String>()

    func generate(_ n: Int, _ strArray: inout [Character]) {
        if n == 1 {
            permuttedSet.insert(String(strArray))
        } else {
            generate(n - 1, &strArray)

            for index in 0..<n-1 {
                strArray.swapAt(n - 1, (n % 2 == 0) ? index : 0)
                generate(n - 1, &strArray)
            }
        }
    }
    
    generate(str.count, &str)

    return permuttedSet
}
// example usage
print(permutation("abc"))
