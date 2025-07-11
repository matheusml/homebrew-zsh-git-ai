class ZshGitAi < Formula
  desc "AI-powered commit messages that actually make sense"
  homepage "https://github.com/matheusml/zsh-git-ai"
  url "https://github.com/matheusml/zsh-git-ai/archive/refs/tags/v0.0.6.tar.gz"
  sha256 "514f7fae9e52e147022139e85cf7abcb6fe161d8897a95bf63a92858e717ab20"
  license "MIT"

  depends_on "jq" => :recommended

  def install
    (share/"zsh-git-ai").install "zsh-git-ai.plugin.zsh"
  end

  def caveats
    <<~EOS
      To use zsh-git-ai, add the following to your ~/.zshrc:

        source #{HOMEBREW_PREFIX}/share/zsh-git-ai/zsh-git-ai.plugin.zsh

      You'll also need to set your Anthropic API key:

        export ANTHROPIC_API_KEY="your-api-key-here"

      Get your API key at: https://console.anthropic.com/account/keys
    EOS
  end

  test do
    assert_match "ANTHROPIC_API_KEY", shell_output("grep ANTHROPIC_API_KEY #{share}/zsh-git-ai/zsh-git-ai.plugin.zsh")
  end
end

