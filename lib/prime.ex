defmodule Prime do
  use Bitwise, only_operators: true
  def is_prime?(n, t\\10)
  def is_prime?(n, _t) when n < 2 do
    false
  end
  def is_prime?(2, _t) do
    true
  end
  def is_prime?(n, _t) when n != 2 and rem(n, 2)== 0 do
    false
  end
  def is_prime?(n, t) do
    {d, s} = decompose(n - 1)
    is_prime?(n, d, s, t)
  end
  def is_prime?(_n, _s, _d, 0), do: true
  def is_prime?(n, d, s, t) do
    if check_each_time(n, d, s) do
      is_prime?(n, d, s, t - 1)
    else
      false
    end
  end

  defp decompose (n) do
    decompose(n, 0)
  end
  defp decompose(n, k) do
    case n&&&1 do
      0 -> decompose(n>>>1, k+1)
      1 -> {n, k}
    end
  end

  defp check_each_time(n, d, s) do
    random_factor = Enum.random(2..n-1)
    x = Pow.pow_mod(random_factor, d, n)
    case x do
      1 -> true
      _ -> check_random_factor(n, s, x, 1)
    end
  end

  defp check_random_factor(n, s, x, r) when r == s, do: n-1 == x
  defp check_random_factor(n, s, x, r) do
    if x == n - 1 do
      true
    else
      check_random_factor(n, s, Pow.pow_mod(x, 2, n), r+1)
    end
  end
end

