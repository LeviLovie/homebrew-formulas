class Pinniped < Formula
  desc "Pinniped - A stack-based programming language"
  homepage "https://github.com/LeviLovie/pinniped"
  url "https://github.com/LeviLovie/pinniped/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "519c80223857130da764566ec4d4a76fad15492c7fc91402f98da8c37e3e6e50"
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
