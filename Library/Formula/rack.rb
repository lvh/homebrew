class Rack < Formula
  desc "CLI for Rackspace"
  homepage "https://github.com/rackspace/rack"
  url "https://github.com/rackspace/rack.git", :tag => "1.0.0",
      :revision => "11fec2be1b7ba3f8faab745dc577e9120200d52a"
  head "https://github.com/rackspace/rack.git"

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
