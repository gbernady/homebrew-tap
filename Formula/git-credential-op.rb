class GitCredentialOp < Formula
  desc "Git credential helper powered by the 1Password CLI"
  homepage "https://github.com/gbernady/git-credential-op"
  url "https://github.com/gbernady/git-credential-op.git",
      tag:      "v0.1.2",
      revision: "1854b60c262bfac3e87d1f5e053fcd49ad39e085"
  license "MIT"
  head "https://github.com/gbernady/git-credential-op.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.buildCommit=#{Utils.git_head}
      -X main.buildVersion=#{version}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    assert_match(/git-credential-op #{version} .*/, shell_output("#{bin}/git-credential-op --version"))
  end
end
