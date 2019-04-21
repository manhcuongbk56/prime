defmodule PowTest  do
  use ExUnit.Case

  test "n = 0" do
    assert Pow.pow_mod(57, 0 , 12312323) == 1
  end
end