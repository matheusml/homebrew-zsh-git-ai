class ZshGitAi < Formula
  desc "AI-powered commit messages that actually make sense"
  homepage "https://github.com/matheusml/zsh-git-ai"
  url "https://github.com/matheusml/zsh-git-ai/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "9f374d057858d65dcf72044dd58feea5be3836cb789d17e47cc7eab69ee4d35a"
  license "MIT"

  depends_on "jq" => :recommended

  def install
    (share/"zsh-git-ai").install "zsh-git-ai.zsh"
  end

  def caveats
    <<~EOS
      To use zsh-git-ai, add the following to your ~/.zshrc:

        source #{HOMEBREW_PREFIX}/share/zsh-git-ai/zsh-git-ai.zsh

      You'll also need to set your Anthropic API key:

        export ANTHROPIC_API_KEY="your-api-key-here"

      Get your API key at: https://console.anthropic.com/account/keys
    EOS
  end

  test do
    assert_match "ANTHROPIC_API_KEY", shell_output("grep ANTHROPIC_API_KEY #{share}/zsh-git-ai/zsh-git-ai.zsh")
  end
end

