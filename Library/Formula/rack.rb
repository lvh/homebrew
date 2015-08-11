class Rack < Formula
  desc "A CLI for Rackspace"
  homepage "https://github.com/rackspace/rack"
  url "https://github.com/rackspace/rack/archive/1.0.0-beta.1.tar.gz"
  version "1.0.0-beta.1"
  sha256 "2ab9513fee4a23667e89c05548be26b4f15a387a8be1e1896936f6e253e05c51"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    system "go", "get", "-d"
    system "go", "build", "-o", "rack"
    bin.install "rack"
  end

  test do
    system "#{bin}/rack"
  end
end
