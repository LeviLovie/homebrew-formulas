class Pinniped < Formula
  desc "Pinniped - A stack-based programming language"
  homepage "https://github.com/LeviLovie/pinniped"
  url "https://github.com/LeviLovie/pinniped/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "08164ac8f22b2c257f38e697be642b5e18bf9f5a1b52efcc5e4bc13d824aff13"
  license "GPL-3.0"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/pinniped"
  end

  test do
    assert_match "Pinniped", shell_output("#{bin}/pinniped --help", 2)

    (testpath/"hello.pinniped").write("(\"Hello, world!\") .")
    # Run the hello world program
    assert_match "Hello, world!", shell_output("#{bin}/pinniped -f #{testpath}/hello.pinniped", 2)
  end
end
