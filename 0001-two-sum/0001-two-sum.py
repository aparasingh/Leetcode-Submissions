class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        for i in range(len(nums)):
            value = target - nums[i]
            if value in nums:
                next_index = nums.index(value)
                if i != next_index:
                    return [i,next_index]