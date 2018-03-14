Pod::Spec.new do |s|

  s.name         = "PasswordTextField"
  s.version      = "1.1.0"
  s.summary      = "A custom TextField with a switchable icon which shows or hides the password and enforce good password policies"
  s.description  = <<-DESC
    A custom TextField with a switchable icon which shows or hides the password and enforce good password policies, written in Swift
  DESC

  s.homepage     = "https://github.com/PiXeL16/PasswordTextField"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Chris Jimenez" => "cjimenez16@gmail.com" }
  s.social_media_url   = "http://twitter.com/chrisjimeneznat"

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/PiXeL16/PasswordTextField.git", :tag => s.version }
  s.source_files  = "PasswordTextField/", "PasswordTextField/**/*.{h,m,swift}"
  s.resource_bundle = { "PasswordTextField" =>  "PasswordTextField/**/*.png" }

  s.requires_arc = true

end
