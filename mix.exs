Code.eval_file "tasks/readme.exs"

defmodule Earmark.Mixfile do
  use Mix.Project

  @version   "1.2.1"

  @deps  [
    { :credo,    "~> 0.6", only: [ :dev, :test ] },
    { :dialyxir, "~> 0.4", only: [ :dev, :test ] },
  ]

  @description """
    Earmark is a pure-Elixir Markdown converter.

    It is intended to be used as a library (just call Earmark.as_html),
    but can also be used as a command-line tool (run mix escript.build
    first).

    Output generation is pluggable.
    """

  ############################################################

  def project do
    [
      app:           :earmark,
      version:       @version,
      elixir:        "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      escript:       escript_config(),
      deps:          @deps,
      description:   @description,
      package:       package(),
    ]
  end

  def application do
    [
      applications: []
    ]
  end



  defp package do
    [
      files: [
        "lib", "src", "tasks", "mix.exs", "README.md"
      ],
      maintainers: [
        "Robert Dober <robert.dober@gmail.com>",
        "Dave Thomas <dave@pragdave.me>"
      ],
      licenses: [
        "Apache 2 (see the file LICENSE for details)"
      ],
      links: %{
        "GitHub" => "https://github.com/pragdave/earmark",
      }
    ]
  end

  defp escript_config do
    [ main_module: Earmark.CLI ]
  end

  defp elixirc_paths(:test), do: [ "lib", "test/support" ]
  defp elixirc_paths(_),     do: [ "lib" ]
end

Code.eval_file "tasks/docs.exs"
