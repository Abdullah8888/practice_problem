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

/**
 209. Minimum Size Subarray Sum
 Solved
 Medium
 Topics
 Companies
 Given an array of positive integers nums and a positive integer target, return the minimal length of a
 subarray
  whose sum is greater than or equal to target. If there is no such subarray, return 0 instead.

  

 Example 1:

 Input: target = 7, nums = [2,3,1,2,4,3]
 Output: 2
 Explanation: The subarray [4,3] has the minimal length under the problem constraint.
 Example 2:

 Input: target = 4, nums = [1,4,4]
 Output: 1
 Example 3:

 Input: target = 11, nums = [1,1,1,1,1,1,1,1]
 Output: 0
 */
 
func slidingWindow() {
    print(lengthOfLongestSubstring("abcabcbb"))
}

slidingWindow()