cask "llm-budget-tracker" do
  version "0.0.8"
  sha256 "7f3c0624e8548a834b58a50ed83324e844917da148cde2b6857556218ddb6042"

  url "https://github.com/ilja82/llm-budget-tracker/releases/download/v#{version}/LLMBudgetTracker.dmg"
  name "LLM Budget Tracker"
  desc "Menu Bar app that tracks LiteLLM budget usage"
  homepage "https://github.com/ilja82/llm-budget-tracker"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch:  :arm64,
             macos: ">= :tahoe"

  app "LLMBudgetTracker.app"

  zap trash: [
    "~/Library/Application Support/com.ilja82.llm-budget-tracker",
    "~/Library/Caches/com.ilja82.llm-budget-tracker",
    "~/Library/Preferences/com.ilja82.llm-budget-tracker.plist",
  ]
end
