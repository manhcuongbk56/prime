defmodule Pow do
  use Bitwise, only_operators: true
  require Integer
  def pow_mod(_m, 0, _q), do: 1
  def pow_mod(m, n, q) when rem(n, 2) == 1, do: rem(m*pow_mod(m, n-1, q), q)
  def pow_mod(m, n, q) do
    result = pow_mod(m, n>>>1,q)
    rem(result*result, q)
  end
end