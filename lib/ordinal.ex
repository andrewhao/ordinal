defmodule Ordinal do
  @moduledoc """
  Documentation for Ordinal.
  """

  @doc """
  Converts positive integers to their ordinalized string equivalents.

  ## Examples

      iex> Ordinal.ordinalize(1)
      "1st"

      iex> Ordinal.ordinalize(11)
      "11th"

      iex> Ordinal.ordinalize(111)
      "111th"

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
  def ordinalize(number) when (is_integer(number) and number >= 0) do
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
