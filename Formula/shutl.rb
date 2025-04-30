class Shutl < Formula
  desc "CLI tool for organizing, managing, and executing scripts as commands"
  homepage "https://github.com/k15r/shutl"
  url "https://github.com/k15r/shutl/archive/refs/tags/v0.0.6.tar.gz"
  sha256 "2554aa9864ccc557251a953cb8421be8966a992956c040c1d2ce516a705c80fd"
  license "MIT"
  head "https://github.com/k15r/shutl.git", branch: "main"

  bottle do
    root_url "https://github.com/k15r/homebrew-shutl/releases/download/shutl-0.0.5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2c840321854caca953c49d496373e94f3842dcb2cda2fe30ba7085ed53a87c15"
    sha256 cellar: :any_skip_relocation, ventura:       "24eb0fc33b9d3e359c76dfc0f25ad41f6226a45e8143a0480422419d06bb5482"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "dd99a032e3f55e978d8a9186887503317ae4d51e7d7db7c6c48130ee0659e88a"
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
