Pod::Spec.new do |s|
  s.name         = "BRPageControl"
  s.version      = "0.1"
  s.summary      = "Custom UIPageControl"
  s.description  = <<-DESC
    Bordered Custom UIPageControl
  DESC
  s.homepage     = "https://github.com/kjoneandrei/BRPageControl"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "anho" => "hogeaandrei@icloud.com" }
  s.social_media_url   = ""
  s.ios.deployment_target = "9.0"
 # s.osx.deployment_target = "10.9"
#  s.watchos.deployment_target = "2.0"
#  s.tvos.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/kjoneandrei/BRPageControl.git", :tag => s.version }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "UIKit", "Foundation"
  s.swift_version = '4'
end
