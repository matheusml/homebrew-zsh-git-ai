class ZshGitAi < Formula
  desc "AI-powered commit messages that actually make sense"
  homepage "https://github.com/matheusml/zsh-git-ai"
  url "https://github.com/matheusml/zsh-git-ai/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "7305ee4e1ee05a5217298a8303a3cb49c943b19157a6d59647a7d2b2feb05ba8"
  license "MIT"

  depends_on "jq" => :recommended

  def install
    (share/"zsh-git-ai").install "git-commit-ai.zsh"
  end

  def caveats
    <<~EOS
      To use zsh-git-ai, add the following to your ~/.zshrc:

        source #{HOMEBREW_PREFIX}/share/zsh-git-ai/git-commit-ai.zsh

      You'll also need to set your Anthropic API key:

        export ANTHROPIC_API_KEY="your-api-key-here"

      Get your API key at: https://console.anthropic.com/account/keys
    EOS
  end

  test do
    assert_match "ANTHROPIC_API_KEY", shell_output("grep ANTHROPIC_API_KEY #{share}/zsh-git-ai/git-commit-ai.zsh")
  end
end

