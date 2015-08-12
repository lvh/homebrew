class Rack < Formula
  desc "CLI for Rackspace"
  homepage "https://github.com/rackspace/rack"
  version "1.0.0-beta.1"
  url "https://github.com/rackspace/rack/archive/#{version}.tar.gz"
  sha256 "2ab9513fee4a23667e89c05548be26b4f15a387a8be1e1896936f6e253e05c51"

  depends_on "go" => :build

  # Fix import paths in the vendored code
  patch do
    url "https://github.com/rackspace/rack/commit/833593b72c6e8ad0577844d480d75aa924744e25.patch"
    sha256 "3c3a79c17b563fbd3082e8d8876b920ab0163deda691778fe5466a37f2196048"
  end

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
