class Shutl < Formula
  desc "CLI tool for organizing, managing, and executing scripts as commands"
  homepage "https://github.com/k15r/shutl"
  url "https://github.com/k15r/shutl/archive/refs/tags/v0.0.8.tar.gz"
  sha256 "343eaa2b3d3e32721a4b7e3883a07c3d7972ba3574d69f1e4dc64b74cc49e566"
  license "MIT"
  head "https://github.com/k15r/shutl.git", branch: "main"

  bottle do
    root_url "https://github.com/k15r/homebrew-shutl/releases/download/shutl-0.0.7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8014115e851b6962e82e685d39c8019270649fa12f6b4a5547790ef039d2c214"
    sha256 cellar: :any_skip_relocation, ventura:       "821c1cd9a16c650dc40d85d73fa01572d7ad7865024aedfa781d9ad7a47f83ee"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "aaf7cecbd42ef336a6e4de4894ecc7b9ca9f20d1c64c3b3aca3eee1a411f2905"
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
