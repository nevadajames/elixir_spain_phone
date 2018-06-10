defmodule ElixirSpainPhone.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_spain_phone,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      description: "Package for validating and generating Spanish phone numbers",
      deps: deps(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
   [
    files: ["lib", "mix.exs", "README.md"],
    maintainers: ["Nevada James Start"],
    licenses: ["MIT"],
    links: %{"GitHub" => "https://github.com/nevadajames/elixir_spain_phone",
             "Docs" => "http://hexdocs.pm/elixir_spain_phone/"}
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.11", only: :dev},
      {:earmark, "~> 0.1", only: :dev}
    ]
  end
end
