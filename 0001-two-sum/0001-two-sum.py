class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        match = {}
        for i in range(len(nums)):
            value = target - nums[i]
            if value in match.keys():
                return [match[value],i]
            else:
                match[nums[i]] = i