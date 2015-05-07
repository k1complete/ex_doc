defmodule ExDoc.Mixfile do
  use Mix.Project

  def project do
    [app:        :ex_doc,
     version:    "0.5.1",
     elixir:     "~> 1.1.0-dev",
     deps:       deps,
     aliases:    aliases,
     source_url: "https://github.com/elixir-lang/ex_doc/"]
  end

  defp deps do
    [{:earmark, "~> 0.1", only: [:dev, :test]},
     {:markdown, github: "devinus/markdown", only: [:dev, :test]},
     {:exgettext, github: "k1complete/exgettext"},
#     {:exgettext, path: "../../exgettext"},
     {:l10n_iex, github: "k1complete/l10n_iex"},
     {:l10n_elixir, github: "k1complete/l10n_elixir"},
#     {:l10n_ex_unit, path: "../../exgettext/l10n_ex_unit"}
     {:l10n_ex_unit, github: "k1complete/l10n_ex_unit"}
    ]
  end

  defp aliases do
    [clean: [&clean_test_fixtures/1, "clean"]]
  end

  defp clean_test_fixtures(_args) do
    File.rm_rf "test/tmp"
  end
end
