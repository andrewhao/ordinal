defmodule Ordinal do
  @moduledoc """
  Documentation for Ordinal.
  """

  @type suffix :: <<_::2>>

  @doc """
  Converts positive integers to their ordinalized string equivalents.

  ## Examples

      iex> Ordinal.ordinalize(1)
      "1st"

      iex> Ordinal.ordinalize(11)
      "11th"

      iex> Ordinal.ordinalize(111)
      "111th"

      iex> Ordinal.ordinalize(111)
      "111th"

      iex> Ordinal.ordinalize(2)
      "2nd"

      iex> Ordinal.ordinalize(3)
      "3rd"

      iex> Ordinal.ordinalize(103)
      "103rd"

      iex> Ordinal.ordinalize(10_000_000_003)
      "10000000003rd"

      iex> Ordinal.ordinalize(0)
      "0th"

   ## Invalid Examples

      iex> Ordinal.ordinalize(1.1)
      1.1

      iex> Ordinal.ordinalize(-1)
      -1

      iex> Ordinal.ordinalize("apple")
      "apple"
  """
  @spec ordinalize(integer()) :: String.t()
  def ordinalize(number) when is_integer(number) and number >= 0 do
    [to_string(number), suffix(number)]
    |> IO.iodata_to_binary()
  end

  def ordinalize(number), do: number

  @spec suffix(integer()) :: suffix()
  def suffix(num) when is_integer(num) and num > 100,
    do: rem(num, 100) |> suffix()

  def suffix(num) when num in 11..13, do: "th"
  def suffix(num) when num > 10, do: rem(num, 10) |> suffix()
  def suffix(1), do: "st"
  def suffix(2), do: "nd"
  def suffix(3), do: "rd"
  def suffix(_), do: "th"
end
