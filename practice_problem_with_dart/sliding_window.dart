import 'dart:math';

int lengthOfLongestSubstring(String s) {
  int right = 0, left = 0, maxLength = 0;
  Map<String, int> lastSeen = {};

  for (int i = 0; i < s.length; i++) {
    final character = s[i];
    right = i;

    if (lastSeen.containsKey(character) && lastSeen[character]! >= left) {
      left = lastSeen[character]! + 1;
      lastSeen[character] = right;
    } else {
      lastSeen[character] = i;
    }

    maxLength = max(maxLength, right - left + 1);
  }

  return maxLength;
}

int minSubArrayLen(int target, List<int> nums) {
  var left = 0;
  var right = 0;
  var minLength = nums.length + 1;
  var subArraySum = 0;
  while (left < nums.length) {
    if (right < nums.length && subArraySum < target) {
      subArraySum = subArraySum + nums[right];
      right = right + 1;
    } else {
      subArraySum = subArraySum - nums[left];
      left = left + 1;
    }
    if (subArraySum >= target) {
      minLength = min(minLength, right - left);
    }
  }
  return minLength == nums.length + 1 ? 0 : minLength;
}

//[1,5,4,2,9,9,9] k=3
int maximumSubarraySum(List<int> nums, int k) {
  var currentSum = 0;
  var maxSum = 0;
  Map<int, int> numFreq =
      nums.sublist(0, k).fold({}, (Map<int, int> map, int el) {
    map[el] = (map[el] ?? 0) + 1;
    return map;
  });
  currentSum = nums.sublist(0, k).reduce((value, element) => value + element);
  maxSum = k == numFreq.length ? currentSum : 0;

  for (int i = k; i < nums.length; i++) {
    numFreq[nums[i]] = numFreq[nums[i]] == null ? 1 : numFreq[nums[i]]! + 1;
    currentSum += nums[i];

    final prevCount = numFreq[nums[i - k]]! - 1;
    numFreq[nums[i - k]] = prevCount;
    currentSum -= nums[i - k];

    if (prevCount == 0) {
      numFreq.remove(nums[i - k]);
    }

    if (k == numFreq.length) {
      maxSum = max(maxSum, currentSum);
    }
  }
  return maxSum;
}

void slidingWindow() {
  //print(lengthOfLongestSubstring('abcabcbb'));
  print(maximumSubarraySum([1, 5, 4, 2, 9, 9, 9], 3));
}
