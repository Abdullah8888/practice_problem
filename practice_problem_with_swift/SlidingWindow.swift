/*
3. Longest Substring Without Repeating Characters [Medium]
Given a string s, find the length of the longest substring without repeating characters.

Example 1:
Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.

Example 2:
Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.

Example 3:
Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
 
Constraints:

0 <= s.length <= 5 * 104
s consists of English letters, digits, symbols and spaces.
*/
func lengthOfLongestSubstring(_ s: String) -> Int {
    let sArray = Array(s)
    var left = 0, right = 0, maxLegnth = 0;
    var lastSeen: [Character: Int] = [:]
    
    for (index, el) in sArray.enumerated() {
        right = index
        if( lastSeen[el] != nil && lastSeen[el]! >= left) {
            left = lastSeen[el]! + 1
            lastSeen[el] = right
        }
        else {
            lastSeen[el] = index
        }
        maxLegnth  = max(maxLegnth, right-left + 1)
    }
    return maxLegnth
}

func slidingWindow() {
    print(lengthOfLongestSubstring("abcabcbb"))
}

slidingWindow()