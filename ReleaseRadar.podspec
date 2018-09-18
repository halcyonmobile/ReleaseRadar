Pod::Spec.new do |s|
  s.name         = "ReleaseRadar"
  s.version      = "0.1.0"
  s.homepage     = "https://github.com/halcyonmobile/ReleaseRadar"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = "Botond Magyarosi"

  s.summary      = "Lightweight framework to check release notes after an iOS app update is performed."
  s.description  = <<-DESC
  With iOS 7, automatic app updates were introduced making App Store release notes less relevant for the end user.
  Other frameworks like Siren check for available updates, ReleaseRadar checks for release notes after an update was performed.
                   DESC

  s.swift_version = "4.1"
  s.platform      = :ios, "8.0"
  s.source        = { :git => "https://github.com/halcyonmobile/ReleaseRadar.git", :tag => "v#{s.version}" }
  s.source_files  = "Sources/**/*.swift"
end
