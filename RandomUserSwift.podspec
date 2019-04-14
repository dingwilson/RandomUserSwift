Pod::Spec.new do |s|
  s.name         = "RandomUserSwift"
  s.version      = "1.1.0"
  s.summary      = "Swift Framework to Generate Random Users - An Unofficial SDK for randomuser.me"
  s.description  = "Swift Framework to Generate Random Users - An Unofficial SDK for randomuser.me."
  s.homepage     = "https://github.com/dingwilson/RandomUserSwift"
  s.license      = "MIT"
  s.author       = { "Wilson Ding" => "hello@wilsonding.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/dingwilson/RandomUserSwift.git", :tag => s.version }
  s.source_files  = "RandomUserSwift", "RandomUserSwift/**/*.{h,m,swift}"
  s.exclude_files = "Classes/Exclude"
end
