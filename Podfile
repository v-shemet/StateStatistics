platform :ios, '13.0'
workspace 'StateStatistics.xcworkspace'

use_frameworks!
inhibit_all_warnings!

def shared
  pod 'Swinject'
  pod 'RxSwift', '~> 5.1.1'
end

########
### App
########
target 'StateStatisticsApp' do
  project 'StateStatisticsApp/StateStatisticsApp.xcodeproj'

  shared
  
end

########
### Domain Module
########
target 'DomainKit' do
  project 'Domain/DomainKit.xcodeproj'

  shared
  
end

########
### Data Module
########
target 'DataKit' do
  project 'Data/DataKit.xcodeproj'
  
  shared
  
  pod 'Moya/RxSwift', '~> 14.0'
  
end
