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
    var cleanedPhoneNumber = [String]()
    var formattedPhoneNumberArray = [String]()

    for char in S {
        guard char != " " && char != "-" else { continue }

        cleanedPhoneNumber.append("\(char)")
    }

    let cleanedCount = cleanedPhoneNumber.count
    var idx = cleanedCount - 1

    if cleanedCount <= 3 {
        return cleanedPhoneNumber.joined()
    }

    var separatorCount = cleanedCount % 3 == 0 ? 0 : 4
    var test = cleanedCount - separatorCount

    for idx in 0..<test {
        if idx % 3 == 0 && idx != 0 {
            formattedPhoneNumberArray.append("-")
        }

        formattedPhoneNumberArray.append(cleanedPhoneNumber[idx])
    }
    
    if separatorCount == 0 {
        return formattedPhoneNumberArray.joined()
    }

    for idx in test...cleanedCount - 1 {
        if idx % 2 == 0 && idx != 0 {
            formattedPhoneNumberArray.append("-")
        }
        
        formattedPhoneNumberArray.append(cleanedPhoneNumber[idx])
    }

    return formattedPhoneNumberArray.joined()
}

//print(solution("123456789"))  // 123-456-789
//print(solution("555372654"))  // 555-372-654
print(solution("0 - 22 1985--324")) // 022-198-53-24

// Edge cases
//print(solution("01"))  // 01
//print(solution("012"))  // 012
print(solution("0123"))                        // 01-23
print(solution("0123       444"))              // 012-34-44
print(solution("------0123       444"))        // 012-34-44
