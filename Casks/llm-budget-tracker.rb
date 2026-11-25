cask "llm-budget-tracker" do
  version "0.0.10"
  sha256 "fb3eb1cb69b44a2346449b3ccf58f5871813b48acd29d77e5c51d606ed3d4191"

  url "https://github.com/ilja82/llm-budget-tracker/releases/download/v#{version}/LLMBudgetTracker.dmg"
  name "LLM Budget Tracker"
  desc "Menu Bar app that tracks LiteLLM budget usage"
  homepage "https://github.com/ilja82/llm-budget-tracker"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch:  :arm64,
             macos: :golden_gate

  app "LLMBudgetTracker.app"

  zap trash: [
    "~/Library/Application Support/com.ilja82.llm-budget-tracker",
    "~/Library/Caches/com.ilja82.llm-budget-tracker",
    "~/Library/Preferences/com.ilja82.llm-budget-tracker.plist",
  ]
end
