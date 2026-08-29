import Foundation

/*
 Rotate array to right N times.
 https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/

 For example, given

     A = [3, 8, 9, 7, 6]
     K = 3
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:

     [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
     [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
     [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]

 */

func solution(A: [Int], K: Int) -> [Int] {
    var rotated = [Int]()
    let target = A.count - K

    for i in target..<A.count {
        rotated.append(A[i])
    }

    for i in 0..<target {
        rotated.append(A[i])
    }

    return rotated
}

print(solution(A: [1, 2, 3, 4, 5], K: 1))  // 5 1 2 3 4
print(solution(A: [1, 2, 3, 4, 5], K: 2))  // 4 5 1 2 3
print(solution(A: [1, 2, 3, 4, 5], K: 3))  // 3 4 5 1 2
print(solution(A: [3, 8, 9, 7, 6], K: 3))  // 9 7 6 3 8
print(solution(A: [1, 2, 3, 4], K: 4))  // [1, 2, 3, 4]
