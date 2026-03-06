class Shutl < Formula
  desc "CLI tool for organizing, managing, and executing scripts as commands"
  homepage "https://github.com/k15r/shutl"
  url "https://github.com/k15r/shutl/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "78e08a6dddf358c0fb0fcbfee27594d3a87d8b549521627c25fb4ad68a12a5df"
  license "MIT"
  head "https://github.com/k15r/shutl.git", branch: "main"

  bottle do
    root_url "https://github.com/k15r/homebrew-shutl/releases/download/shutl-0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "633cc0d99cf706cc07758e8d45df2ed953cb2cd608f349b838ab5639cb8bfd72"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "17900a9fbebad3fdc95e77bc823c74b8bd14615e70fd2a1487785ccd63ab9003"
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
