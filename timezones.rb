class Timezones < Formula
  desc "Simple terminal application to make working with different timezones easer"
  homepage "https://github.com/LeviiLovie/timezones"
  url "https://github.com/LeviiLovie/timezones/releases/download/v1.0.0/timezones.tar.gz"
  sha256 "9170d0d0ee509edcc820e5f227f3addde759507e0108b0e941eb7b7f9ada52a8"
  license "MIT License"

  def install
    bin.install Dir[libexec/"*"]
  end

  def caveats; <<-EOS.undent
    Please, run timezones to start the application.
  end
end
