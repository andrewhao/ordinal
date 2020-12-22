# Ordinal

Converts a simple integer (`2`) to an ordinalized string (`"2nd"`)

## Usage

    iex> Ordinal.ordinalize(1)
    "1st"

    iex> Ordinal.ordinalize(11)
    "11th"

    iex> Ordinal.ordinalize(111)
    "111th"

    iex> Ordinal.ordinalize(0)
    "0th"

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ordinal` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ordinal, "~> 0.2.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ordinal](https://hexdocs.pm/ordinal).

