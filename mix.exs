defmodule ExDoc.Mixfile do
  use Mix.Project

  def project do
    [app:        :ex_doc,
     version:    "0.5.1",
     elixir:     "~> 0.15.0-dev",
     deps:       deps,
     aliases:    aliases,
     source_url: "https://github.com/elixir-lang/ex_doc/"]
  end

  defp deps do
    [{:earmark, "~> 0.1", only: [:dev, :test]},
     {:markdown, github: "devinus/markdown", only: [:dev, :test]},
     {:exgettext, path: "../../exgettext"},
     {:l10n_iex, path: "../../exgettext/l10n_iex"},
     {:l10n_elixir, path: "../../exgettext/l10n_elixir"},
     {:l10n_mix, path: "../../exgettext/l10n_mix"}
    ]
  end

  defp aliases do
    [clean: [&clean_test_fixtures/1, "clean"]]
  end

  defp clean_test_fixtures(_args) do
    File.rm_rf "test/tmp"
  end
end
