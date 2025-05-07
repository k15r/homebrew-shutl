class Shutl < Formula
  desc "CLI tool for organizing, managing, and executing scripts as commands"
  homepage "https://github.com/k15r/shutl"
  url "https://github.com/k15r/shutl/archive/refs/tags/v0.0.9.tar.gz"
  sha256 "4e3829b3a64cebe5970b05e44d8ddc35b495e464d7fc77b486e99f59384ccb54"
  license "MIT"
  head "https://github.com/k15r/shutl.git", branch: "main"

  bottle do
    root_url "https://github.com/k15r/homebrew-shutl/releases/download/shutl-0.0.8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d5c95a3037566773e7cfc00a762559ce7e69cece3cae3aa742a18a0d53c9e9b0"
    sha256 cellar: :any_skip_relocation, ventura:       "76cb36f658d8823941dc7dcbe4394a684992400f6009b8a3163bc48d230c24d7"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ddc0a3f4c82046b0ea194ba4d36e836e3ef3399b8520a1897955766c2ad87a3c"
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
