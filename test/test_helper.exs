exclude = [
  pandoc:  !ExDoc.Markdown.Pandoc.available?,
  hoedown: !ExDoc.Markdown.Hoedown.available?,
  earmark: !ExDoc.Markdown.Earmark.available?
]

ExUnit.start(exclude: Enum.filter(exclude, &elem(&1, 1)))

if Enum.empty? Path.wildcard("test/tmp/ebin/*.beam") do
  IO.puts "Compiling fixtures..."
  {result, _error_code} =
    System.cmd "elixirc", ["test/fixtures", "-o", "test/tmp/ebin"], stderr_to_stdout: true
  IO.puts result
end

{:ok, _} = File.copy("test/fixtures/README.md", "test/tmp/README.md")
Code.prepend_path "test/tmp/ebin"
