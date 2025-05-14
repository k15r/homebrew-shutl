class Shutl < Formula
  desc "CLI tool for organizing, managing, and executing scripts as commands"
  homepage "https://github.com/k15r/shutl"
  url "https://github.com/k15r/shutl/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "22198a2a9d972f91697524d3ebece9be071aa13c13c65df424590db586a7682c"
  license "MIT"
  head "https://github.com/k15r/shutl.git", branch: "main"

  bottle do
    root_url "https://github.com/k15r/homebrew-shutl/releases/download/shutl-0.0.9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "86eba4782862cebf8c4fc5c103930351344ca35bd0eb14d282f9a3f40dac2b55"
    sha256 cellar: :any_skip_relocation, ventura:       "ef470ed9a9415ccae5e5880f8f03f4ef5c0a122a36f4a6dc91e27228395a65ff"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8bd4ef683ae1a6f4d9b20f49db7a4a4137912ec09774ebedb484e07f702a4a9e"
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
