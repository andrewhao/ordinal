defmodule Ordinal.MixProject do
  use Mix.Project

  def project do
    [
      app: :ordinal,
      version: "0.1.0",
      elixir: "~> 1.5",
      description: "Convert numbers to their ordinalized form.",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      source_url: "https://www.github.com/andrewhao/ordinal",
      package: package()
    ]
  end

  def package() do
    [
      licenses: ["MIT"],
      maintainers: ["Andrew Hao <andrewhao@gmail.com>"],
      links: %{github: "https://www.github.com/andrewhao/ordinal"}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.14", only: :dev}
    ]
  end
end
