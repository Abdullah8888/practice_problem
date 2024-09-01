/*
let dict = A.reduce(into: [Int:Int]()) {
        curr, next in
        curr[next] = curr[next] != nil ? curr[next]! + 1 : 1
    }*/
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
func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
    var left = 0
    var right = 0
    var minLength = nums.count + 1
    var subArraySum = 0
    while(left < nums.count) {
        if right < nums.count && subArraySum < target {
            subArraySum = subArraySum + nums[right]
            right  = right  + 1
        }
        else {
            subArraySum = subArraySum - nums[left]
            left = left + 1
        }
        if subArraySum >= target {
            minLength = min(minLength, right - left)
        }
    }
    return minLength == nums.count + 1 ? 0 : minLength
}


/*
2461. Maximum Sum of Distinct Subarrays With Length K
Medium
Topics
Companies
Hint
You are given an integer array nums and an integer k. Find the maximum 
subarray sum of all the subarrays of nums that meet the following conditions:

The length of the subarray is k, and
All the elements of the subarray are distinct.
Return the maximum subarray sum of all the subarrays that meet 
the conditions. If no subarray meets the conditions, return 0.

A subarray is a contiguous non-empty sequence of elements within an array.

Example 1:
Input: nums = [1,5,4,2,9,9,9], k = 3
Output: 15
Explanation: The subarrays of nums with length 3 are:
- [1,5,4] which meets the requirements and has a sum of 10.
- [5,4,2] which meets the requirements and has a sum of 11.
- [4,2,9] which meets the requirements and has a sum of 15.
- [2,9,9] which does not meet the requirements because the element 9 is repeated.
- [9,9,9] which does not meet the requirements because the element 9 is repeated.
We return 15 because it is the maximum subarray sum of all the subarrays that meet the conditions
Example 2:

Input: nums = [4,4,4], k = 3
Output: 0
Explanation: The subarrays of nums with length 3 are:
- [4,4,4] which does not meet the requirements because the element 4 is repeated.
We return 0 because no subarrays meet the conditions.
 

Constraints:

1 <= k <= nums.length <= 105
1 <= nums[i] <= 105
*/

func maximumSubarraySum(_ target: Int, _ nums: [Int]) -> Int {
    var maxSum = 0;
    var currentSum = 0;
    var numFreq: [Int: Int] = nums[0..<k].reduce(into:[Int:Int]()){
        curr, next in
        curr[next] = curr[next] != nil ? curr[next]! + 1 : 1
    }
    currentSum = nums[0..<k].reduce(0,+)
    maxSum = k == numFreq.count ? currentSum : 0

    for i in k..<nums.count {
        numFreq[nums[i]] = numFreq[nums[i]] == nil ? 1 : numFreq[nums[i]]! + 1
        currentSum += nums[i]

        let prevCount = numFreq[nums[i-k]]! - 1
        numFreq[nums[i-k]] = prevCount
        currentSum -= nums[i-k]

        if prevCount == 0 {
            numFreq[nums[i-k]] = nil
        }

        if k == numFreq.count {
            maxSum = max(maxSum, currentSum)
        }
    }
    return maxSum
}

func slidingWindow() {
    //print(lengthOfLongestSubstring("abcabcbb"))
    //print(minSubArrayLen(4, [1,4,4]))
    var mmm: [Int:Int] = [1:1]
    let nums: [Int] = [1]
    mmm[nums[0]]! += 1
    mmm.red
    print("mmm is \(mmm)")
}

slidingWindow()