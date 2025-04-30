class Shutl < Formula
  desc "CLI tool for organizing, managing, and executing scripts as commands"
  homepage "https://github.com/k15r/shutl"
  url "https://github.com/k15r/shutl/archive/refs/tags/v0.0.6.tar.gz"
  sha256 "2554aa9864ccc557251a953cb8421be8966a992956c040c1d2ce516a705c80fd"
  license "MIT"
  head "https://github.com/k15r/shutl.git", branch: "main"

  bottle do
    root_url "https://github.com/k15r/homebrew-shutl/releases/download/shutl-0.0.6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "474a0d5468546ca4a8c9ba83b26a30c3de7f40416e2731d9a9ab301b4eee5b89"
    sha256 cellar: :any_skip_relocation, ventura:       "9d8e7b2516522c1d40fb9d6d1d695544320e571b0158e71151601489b6f293a6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "499a08911264d3dfb17f192810caa7d61dc2bc0e28797a74cd1b3a8dca220ae7"
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
