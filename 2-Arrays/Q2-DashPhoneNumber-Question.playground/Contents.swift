import UIKit

/*
 We are given a string S representing a phone number, which we would like to reformat. String S consists of N characters: digits, spaces, and/or dashes. It contains at least two digits.

 Spaces and dashes in string S can be ignored. We want to reformat the given phone number is such a way that the digits are grouped in blocks of length three, separated by single dashes. If necessary, the final block or the last two blocks can be of length two.

 For example:

 S = "00-44   48 5555 8361" should become
     "004-448-555-583-61"

 Assume:
 - S consists only of digits (0-9), spaces, and/or dashses (-)
 - S containts at least two digits

 Translate:

 Would like to reformat a phone number string so that:
 - every third char is a "-"
 - spaces and dashes don't matter
 - if the block ends in anything other than -xxx or -xx reformat to a block of two like xx-xx (not obvious)

 */
func solution(_ S: String) -> String {
    var noSpaceNoDashArray = [String]()

    for char in S where char != " " && char != "-" {
        noSpaceNoDashArray.append("\(char)")
    }

    var result = [String]()
    var count = -2

    for char in noSpaceNoDashArray {
        result.append(char)

        if count % 3 == 0 {
            result.append("-")
        }

        count += 1
    }

    if result.last == "-" {
        result = result.dropLast()
    }

    let secondLast = result.count - 2

    if result[secondLast] == "-" {
        result[secondLast] = result[secondLast - 1]
        result[secondLast - 1] = "-"
    }

    return result.joined()
}

print(solution("123456789"))  // 123-456-789
print(solution("555372654"))  // 555-372-654
print(solution("0 - 22 1985--324"))  // 022-198-53-24

// Edge cases
print(solution("01"))  // 01
print(solution("012"))  // 012
print(solution("0123"))  // 01-23
print(solution("0123       444"))  // 012-34-44
print(solution("------0123       444"))  // 012-34-44
