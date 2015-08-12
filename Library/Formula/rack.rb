class Rack < Formula
  desc "A CLI for Rackspace"
  homepage "https://github.com/rackspace/rack"
  version "1.0.0-beta.1"
  url "https://github.com/rackspace/rack/archive/#{version}.tar.gz"
  sha256 "2ab9513fee4a23667e89c05548be26b4f15a387a8be1e1896936f6e253e05c51"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    pkgpath = "#{buildpath}/src/github.com/rackspace"
    rackpath = "#{pkgpath}/rack"
    system "mkdir", "-p", pkgpath
    system "mv", "#{buildpath}/rack-#{version}", rackpath
    system "go", "build", "-o", "rack"
    bin.install "rack"
  end

  test do
    system "#{bin}/rack"
  end
end
