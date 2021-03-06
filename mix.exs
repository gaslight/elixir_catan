defmodule Catan.Mixfile do
  use Mix.Project

  def project do
    [app: :catan,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger],
     mod: {Catan, []}]
  end

  defp deps do
    [
      {:white_bread, "~> 2.5", only: [:dev, :test]}
    ]
  end
end
