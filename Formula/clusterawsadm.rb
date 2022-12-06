class Clusterawsadm < Formula
  desc "Kubernetes Cluster API Provider AWS"
  homepage "https://github.com/kubernetes-sigs/cluster-api-provider-aws"

  checksums = {
    "darwin-amd64" => "c8777db1f619d93f8970ddf4103b069c08acefd1952a1829b746aaad782ae997",
    "darwin-arm64" => "d57a1e84f5a142796c02ceb38d24ad78c43468c4eb9d1b7f81ead1071bfb8e16",
    "linux-amd64"  => "38554cfc4ff561b8ca29e57e3122002eee5168650a9feaf2c72233c0021bb80b",
    "linux-arm64"  => "88a7ed74096b926c590f345aa47ecff7868cb05d9f1c0479aa5ea9f233de2b26",
  }

  os = OS.kernel_name.downcase
  arch = Hardware::CPU.intel? ? "amd64" : Hardware::CPU.arch.to_s

  url "https://github.com/kubernetes-sigs/cluster-api-provider-aws/releases/download/v2.0.2/clusterawsadm-#{os}-#{arch}", using: :nounzip
  version "2.0.2"
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
