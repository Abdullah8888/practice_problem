class Solution {
    fun lengthOfLongestSubstring(s: String): Int {
        val sArray = s.toCharArray()  // Convert string to character array
        var left = 0
        var right = 0
        var maxLength = 0
        val lastSeen = mutableMapOf<Char, Int>()  // Use a mutable map for storing last seen positions

        for ((index, el) in sArray.withIndex()) {
            right = index
            if (lastSeen[el] != null && lastSeen[el]!! >= left) {
                
                left = lastSeen[el]!! + 1
                lastSeen[el] = right
            } else {
                lastSeen[el] = index
            }
            maxLength = maxOf(maxLength, right - left + 1)
        }
        return maxLength
    }
}

fun main(args: Array<String>) {
    println("Asalm")
    val s = Solution()
    val asdf = s.lengthOfLongestSubstring("abcabcbbb")
    print(asdf)
}