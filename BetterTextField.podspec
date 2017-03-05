Pod::Spec.new do |s|
  s.name = "BetterTextField"
  s.version = "0.4.1"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.summary = "A drop-in replacement for UITextField."
  s.description = <<-DESC
    "Handles UITextField's inability to center the placeholder and text, if text alignment is set to centered and clear button is visible."
                   DESC
  s.homepage = "https://github.com/duongel/BetterTextField"
  s.author = { "Hua Duong Nguyen" => "duongel@gmail.com" }
  s.source = { :git => "https://github.com/duongel/BetterTextField.git", :tag => "#{s.version}" }

  s.platform = :ios
  s.ios.deployment_target = "8.0"

  s.source_files = "BetterTextField/*.swift"
  s.requires_arc = true
end
