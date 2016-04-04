
Pod::Spec.new do |s|
  s.name         = "LTSwiftDate"
  s.version      = "0.1.0"
  s.summary      = "Easy-to-use NSDate operation"
  s.homepage     = "https://github.com/ltebean/LTSwiftDate"
  s.license      = "MIT"
  s.author       = { "ltebean" => "yucong1118@gmail.com" }
  s.source       = { :git => "https://github.com/ltebean/LTSwiftDate.git", :tag => 'v0.1.0'}
  s.source_files = "LTSwiftDate/LTSwiftDate.swift"
  s.requires_arc = true
  s.platform     = :ios, '8.0'

end
