# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def available_pods
  pod 'Alamofire', '~> 4.5'
end


target 'Books' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for Books
  available_pods
  
  target 'BooksTests' do
    inherit! :search_paths
    # Pods for testing
    available_pods
  end

  target 'BooksUITests' do
    # Pods for testing
  end

end
