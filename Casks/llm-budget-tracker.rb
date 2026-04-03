cask "llm-budget-tracker" do
  version "0.0.1"
  sha256 "f6aa58761ede23343ac7838f8d660c908e6b0d039b784b5d5a96084ac260781d"

  url "https://github.com/ilja82/llm-budget-tracker/releases/download/v#{version}/LLMBudgetTracker.dmg"
  name "LLM Budget Tracker"
  desc "macOS Menu Bar app that tracks LiteLLM budget usage"
  homepage "https://github.com/ilja82/llm-budget-tracker"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "LLMBudgetTracker.app"

  zap trash: [
    "~/Library/Application Support/com.ilja82.llm-budget-tracker",
    "~/Library/Caches/com.ilja82.llm-budget-tracker",
    "~/Library/Preferences/com.ilja82.llm-budget-tracker.plist",
  ]
end