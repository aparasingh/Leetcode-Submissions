class Solution:
    def mergeAlternately(self, word1,word2):
        len1 = len(word1)
        len2 = len(word2)
        finLen = max(len1,len2)
        merged = []
        for i in range(finLen):
            if (i < len1):
                merged.append(word1[i])
            if (i < len2):
                merged.append(word2[i])
        
        return "".join(merged)
        