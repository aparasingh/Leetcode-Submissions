class Solution(object):
    def twoSum(self, nums, target):
        indices = range(len(nums))
        updated_indices = list(indices)
        for i in indices:
            value = nums[i]
            updated_indices.remove(i)
            for y in updated_indices:
                if value + nums[y] == target:
                    return [i,y]
        
        