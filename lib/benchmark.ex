defmodule Benchmark do
  def measure(function, data) do
    :timer.tc(function, data)
    |> elem(0)
    |> Kernel./(1_000_000)
  end
end