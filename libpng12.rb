require "formula"

class Libpng12 < Formula
  homepage "http://www.libpng.org/pub/png/libpng.html"
  url "http://sourceforge.net/projects/libpng/files/libpng16/1.6.15/libpng-1.6.15.tar.xz/download"
  sha1 "8d19d762f836bb8900efc79ef8f1c3b64ee9f658"

  keg_only :provided_by_osx

  option :universal

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "test"
    system "make", "install"
  end
end
