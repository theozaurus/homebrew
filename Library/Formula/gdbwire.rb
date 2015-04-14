require 'formula'

class Gdbwire < Formula
  homepage 'https://github.com/brasko/gdbwire'
  head 'https://github.com/brasko/gdbwire.git'

  depends_on "bison"    => :build
  depends_on "flex"     => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool"  => :build

  patch :DATA

  def install
    system "./autogen.sh"
    system "./configure", "--enable-tests",
                          "--enable-examples",
                          "--prefix=#{prefix}"
    system "make --no-builtin-rules"
    system "make install"
  end

  test do
    system "./test_suite"
  end
end

__END__
diff --git a/autogen.sh b/autogen.sh
index 4636d2a..e84525c 100755
--- a/autogen.sh
+++ b/autogen.sh
@@ -16,7 +16,7 @@ echo "-- Running aclocal"
 aclocal -I build/m4
 
 echo "-- Running libtoolize"
-libtoolize -f -c
+glibtoolize -f -c
 
 echo "-- Running aclocal"
 aclocal -I build/m4
