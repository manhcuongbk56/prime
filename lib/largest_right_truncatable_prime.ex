defmodule LargestRightTruncatePrime do
  def max_satisfy (n) do
    head_nums = [2, 3, 5, 7]
    tail_nums = [1, 3, 7, 9]
    num_number = Kernel.trunc(:math.log10(n))
    calculate_all_satisfy(num_number, head_nums, tail_nums)
    |> Enum.filter(&(&1 <= n))
    |> Enum.take(-1)
    |> Enum.at(0)
  end
  def calculate_all_satisfy(0, head_nums, _tail_nums) do
    a
  end
  def calculate_all_satisfy(i, head_nums, tail_nums) do
    new_head = for head <- head_nums, tail <- tail_nums, do: head*10 + tail
    new_head = Enum.filter(new_head, &(Prime.is_prime?(&1) and &1 > 0))
    calculate(i - 1, a ++ b, ak)
  end
end