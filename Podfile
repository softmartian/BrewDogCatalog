# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

workspace 'BrewDogCatalog.xcworkspace'

def common_pods
  pod 'RxSwift'
  pod 'EasyDi'
end

def ui_pods
  pod 'RxCocoa'
  pod 'RxDataSources'
  pod 'SnapKit'
end

def manager_pods

end

target 'BrewDogCatalog' do
  use_frameworks!

  common_pods
  ui_pods
  manager_pods

end

target 'BeerListing' do
  use_frameworks!

  project 'BrewDogCatalog/BeerListing/BeerListing'
  ui_pods
  common_pods
end

target 'BeerView' do
  use_frameworks!

  project 'BrewDogCatalog/BeerView/BeerView'
  ui_pods
  common_pods
end

target 'BeerFunHouse' do
  use_frameworks!
  project 'BrewDogCatalog/BeerFunHouse/BeerFunHouse'
  common_pods
  end

