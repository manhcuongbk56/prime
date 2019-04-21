defmodule PrimeTest do
  use ExUnit.Case
  doctest Prime

  test " test n less" do
    assert !Prime.is_prime? (1)
  end
  test "2" do
    assert Prime.is_prime?(2)
  end

  test "Prime" do
    assert Prime.is_prime?(17)
  end

  test "NonPrime" do
    assert !Prime.is_prime?(16)
  end

end
