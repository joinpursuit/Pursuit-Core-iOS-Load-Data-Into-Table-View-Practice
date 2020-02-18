import Foundation

struct FibonacciNumber {
    static private var cache = [Int: Double]()
  
    static func fib(n: Int) -> Double {
        if let val = cache[n] { return val }
        if n == 0 || n == 1 { return 1 }
        let val = fib(n: n - 1) + fib(n: n - 2)
        cache[n] = val
        return val
    }
}
