class Shutl < Formula
  desc "CLI tool for organizing, managing, and executing scripts as commands"
  homepage "https://github.com/k15r/shutl"
  url "https://github.com/k15r/shutl/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "44c63cdba51d9969aa3c14158ae303bee7a9fb6f8128e2f4096c722710bf84a2"
  license "MIT"
  head "https://github.com/k15r/shutl.git", branch: "main"

  bottle do
    root_url "https://github.com/k15r/homebrew-shutl/releases/download/shutl-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c7c5467e73eec33d2208c7a2ee9df6330d0f32dae5ba282c09e4684add356506"
    sha256 cellar: :any_skip_relocation, ventura:       "33f930ac225984dcf55c84ec4fc3527696ca4dd70f0600b08f6d7b854f9d9362"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "58e9ab5c15e6939016f5d022e2a2a75163b4c35261204d8a40a1c0581a253cb6"
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
