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

void slidingWindow() {
  print(lengthOfLongestSubstring('abcabcbb'));
}
