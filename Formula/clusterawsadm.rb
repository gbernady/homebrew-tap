class Clusterawsadm < Formula
  desc "Kubernetes Cluster API Provider AWS"
  homepage "https://github.com/kubernetes-sigs/cluster-api-provider-aws"

  checksums = {
    "darwin-amd64" => "1a21bfe7a05d2706add5ad216622b1426670eacdbf1a6416af64550036bf8b59",
    "darwin-arm64" => "882c2dc37c968d4bd703420abcf4af62e78622433609438d320d9551d8fc47f8",
    "linux-amd64"  => "e2728c50ae811896478a004fb565693dc8432b6cb82b223ddd1a708192f029fb",
    "linux-arm64"  => "fcec59a1fe2e968ced406b360011d113a0a9c9a0cf58403208fe83e270cad409",
  }

  os = OS.kernel_name.downcase
  arch = Hardware::CPU.intel? ? "amd64" : Hardware::CPU.arch.to_s

  url "https://github.com/kubernetes-sigs/cluster-api-provider-aws/releases/download/v1.5.0/clusterawsadm-#{os}-#{arch}", using: :nounzip
  version "1.5.0"
  sha256 checksums["#{os}-#{arch}"]

  license "Apache-2.0"

  def install
    arch = Hardware::CPU.intel? ? "amd64" : Hardware::CPU.arch.to_s
    bin.install "clusterawsadm-#{OS.kernel_name.downcase}-#{arch}" => "clusterawsadm"
  end

  test do
    assert_match(/^clusterawsadm provides helpers.*/, shell_output("#{bin}/clusterawsadm help"))
  end
end
