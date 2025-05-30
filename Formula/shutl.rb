class Shutl < Formula
  desc "CLI tool for organizing, managing, and executing scripts as commands"
  homepage "https://github.com/k15r/shutl"
  url "https://github.com/k15r/shutl/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "44c63cdba51d9969aa3c14158ae303bee7a9fb6f8128e2f4096c722710bf84a2"
  license "MIT"
  head "https://github.com/k15r/shutl.git", branch: "main"

  bottle do
    root_url "https://github.com/k15r/homebrew-shutl/releases/download/shutl-0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "82540405d91db179366a6ceff378cc8bb164e0d8ad073c6c4dbc9cd4cfe81433"
    sha256 cellar: :any_skip_relocation, ventura:       "e83d13389517c5428db856eb70008b4893c1b6dd04b7f90c57dd611f66829bfd"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "052d8975483c5e90767b89b081429ff0d4ca79213e505f4794dc6864f12dc3e4"
  end

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
