defmodule OriginalOrdinal do
  @moduledoc """
  Documentation for Ordinal.
  """

  @spec ordinalize(integer()) :: String.t()
  def ordinalize(number) when is_integer(number) and number >= 0 do
    "#{number}#{suffix(number)}"
  end

  def ordinalize(number) do
    number
  end

  @spec suffix(integer()) :: String.t()
  defp suffix(num) do
    cond do
      Enum.any?([11, 12, 13], &(&1 == Integer.mod(num, 100))) ->
        "th"

      Integer.mod(num, 10) == 1 ->
        "st"

      Integer.mod(num, 10) == 2 ->
        "nd"

      Integer.mod(num, 10) == 3 ->
        "rd"

      true ->
        "th"
    end
  end
end

benches = [
  1,
  2,
  3,
  4,
  11,
  12,
  13,
  50,
  99,
  1000,
  10000,
  1_000_000
]

Enum.each(benches, fn number ->
  IO.write(IO.ANSI.green())
  IO.write("\n=== benchmarking with #{number}\n")
  IO.write(IO.ANSI.reset())

  Benchee.run(%{
    "new_#{number}" => fn -> Ordinal.ordinalize(number) end,
    "original_#{number}": fn -> OriginalOrdinal.ordinalize(number) end
  })
end)
