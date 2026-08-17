#
#  Be sure to run `pod spec lint XMSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  # ====================  必填核心字段（必须100%正确） ====================
  # 私有库名称，必须和podspec文件名完全一致，后续pod 'xxx'就是用这个名字
  s.name             = 'XMSDK'
  # 版本号，必须和后续Git tag完全一致，不能加v前缀
  s.version          = '1.7.8'
  # 一句话简短描述，不能超过140个字符
  s.summary          = 'iOS ad SDK'
  # 详细描述，长度必须大于summary，可写SDK功能、适配说明
  s.description      = <<-DESC
    本SDK为广告SDK库，提供自有广告源广告，支持iOS 12.0+，静态库无审核风险
  DESC
  # SDK私有仓库的主页地址（浏览器能打开的地址）
  s.homepage         = 'https://github.com/stgg2018/XM_SDK_IOS'
  # 开源协议，必须和根目录LICENSE文件完全匹配
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  # 作者信息
  s.author           = { 'stgg2018' => 'stgg2018@163.com' }
  # 🔴 核心：SDK私有仓库的SSH地址，tag和version绑定
  s.source           = { :git => 'https://github.com/stgg2018/XM_SDK_IOS.git', :tag => s.version.to_s }

  # ====================  二进制库核心配置（必须和XCFramework一致） ====================
  # 最低支持iOS版本，必须和XCFramework编译时的版本完全一致
  s.platform     = :ios, '12.0'
  # Swift SDK必填，和编译时Swift版本一致；OC SDK直接删除这行
  s.swift_version = '5.0'
  # 🔴 静态XCFramework必须开启，否则会出现Undefined symbol编译报错
  s.static_framework = true
  # 是否开启ARC，和XCFramework编译时配置一致
  s.requires_arc = true
  # 🔴 核心：指定XCFramework的路径，和你的目录结构完全匹配
  s.vendored_frameworks = 'XMSdk.xcframework'
  # 保留XCFramework完整目录结构，避免CocoaPods自动裁剪
  s.preserve_paths = 'XMSdk.xcframework/**/*'

  # ====================  资源文件配置（Bundle+隐私清单） ====================
  # 🔴 必须用resource_bundles，禁止用s.resources，避免和主工程资源重名覆盖
  s.resource_bundles = {
    # 命名规则：SDK名_xxx，必须全局唯一，避免重名
    'XMSDK_Resources' => ['XMSdk.bundle/**/*'],
    'XMSDK_Privacy' => ['PrivacyInfo.xcprivacy']
  }
  # 注意：如果你的Bundle已经嵌入到XCFramework内部，删除上面2行配置，无需额外声明

  # ====================  依赖配置（必须和XCFramework的依赖完全一致） ====================
  # 依赖的系统框架，XCFramework用到了什么就加什么
  s.frameworks = 'UIKit', 'Foundation', 'WebKit', 'SwiftUI'
  # 依赖的系统静态库，用到了什么就加什么
  # s.libraries = 'z', 'c++', 'sqlite3'
  # 依赖的其他私有Pod库（必须确保该库已发布到PrivateSpecs）
  # s.dependency 'AnotherPrivateSDK', '~> 1.0.0'
  # 依赖的公有Pod库
  # s.dependency 'AFNetworking', '~> 4.0'
end