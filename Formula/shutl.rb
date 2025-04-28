class Shutl < Formula
  desc "command-line tool for organizing, managing, and executing scripts as commands"
  homepage "https://github.com/k15r/shutl"
  url "https://github.com/k15r/shutl/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "52c45aaa7f16e1cb72123bb937c89f2b66616c897cecd727f114eadf47ffd57e"
  license "MIT"
  head "https://github.com/k15r/shutl.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(bin/"shutl", shell_parameter_format: :clap)
  end

  test do
    assert_match "A command-line tool for organizing, managing, and executing scripts as commands", 
      shell_output("#{bin}/shutl --help | head -n 1")
  end
end
