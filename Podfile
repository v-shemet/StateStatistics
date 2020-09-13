platform :ios, '13.0'
workspace 'StateStatistics.xcworkspace'

use_frameworks!
inhibit_all_warnings!

def shared
  pod 'Swinject'
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
target 'Domain' do
  project 'Domain/Domain.xcodeproj'

  shared
  
end

########
### Data Module
########
target 'Data' do
  project 'Data/Data.xcodeproj'
  
  shared
  
  pod 'Moya/RxSwift', '~> 14.0'
  
end
