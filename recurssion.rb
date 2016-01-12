
def next_nums(nums, i=0)
  next_num_i = i + 1
  if nums[i + 1] == nil 
    puts "done! #{nums[i]}"
  else
    next_nums(nums, next_num_i)
  end
end

nums = (1..100).to_a
next_nums(nums)