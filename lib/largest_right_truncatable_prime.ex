defmodule LargestRightTruncatePrime do

  def max_satisfy (n) do
    head_nums = [2, 3, 5, 7]
    tail_nums = [1, 3, 7, 9]
    num_number = Kernel.trunc(:math.log10(n))
    collect_all_satisfy(n, num_number, head_nums, tail_nums)
    |> Enum.take(-1)
    |> Enum.at(0)
  end
  defp collect_all_satisfy(_n, 0, satisfies, _tail_nums) do
    satisfies
  end
  defp collect_all_satisfy(n, i, satisfies, tail_nums) do
    new_satisfies = for head <- satisfies,
                   tail <- tail_nums,
                   candidate = head*10 + tail,
                   is_satisfy?(n, candidate),
                   do: candidate
    if length(new_satisfies) == 0 do
      satisfies
    else
      collect_all_satisfy(n, i - 1, new_satisfies, tail_nums)
    end

  end
  defp is_satisfy?(n, candidate) do
    candidate > 0 and candidate < n and Prime.is_prime?(candidate)
  end
end