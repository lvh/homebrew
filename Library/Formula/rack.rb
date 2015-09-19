class Rack < Formula
  desc "CLI for Rackspace"
  homepage "https://github.com/rackspace/rack"
  version "1.0.0"
  url "https://github.com/rackspace/rack/archive/#{version}.tar.gz"
  sha256 "a348e2c5454bf7df5414226dd7e2cf537a2a8836297408a5db9a40c9b59037aa"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    rackpath = buildpath/"src/github.com/rackspace/rack"
    rackpath.install Dir["{*,.git}"]

    cd rackpath do
      system "go", "build", "-o", "rack"
      bin.install "rack"
    end
  end

  test do
    system "#{bin}/rack"
  end
end
