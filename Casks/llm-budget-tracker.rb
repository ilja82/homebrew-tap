cask "llm-budget-tracker" do
  version "0.0.3"
  sha256 "120095ab56c68a44055456b1d2a949979a984d64fcd412439b4dd30b8c8875f1"

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
