# Be sure to run `pod lib lint MyPodTestPro.podspec' to ensure this is a
# valid spec before submitting.
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
# https://www.jianshu.com/p/8c6941778f0e
# pod lib create GlobalButton 创建组件
# pod lib lint --allow-warnings --verbose 验证组件# --allow-warnings 屏蔽警告,--verbose 以获取更多错误信息 --use-libraries
#验证podspec文件是否可正常使用
#命令行：pod lib lint
#pod spec lint --verbose --allow-warnings --use-librarie
#既有私有库依赖，还有CommonCrypto这种的依赖：
#验证
#pod spec lint --verbose --allow-warnings --use-libraries --sources='[https://github.com/CocoaPods/Specs.git,git@gitlab.317hu.com:HuModularizationLibrary/HuModularizationSpecs.git](https://github.com/CocoaPods/Specs.git,git@gitlab.317hu.com:HuModularizationLibrary/HuModularizationSpecs.git)’
#提交：
#pod repo push HuModularizationSpecs HuThirdKit.podspec --verbose --allow-warnings --use-libraries --sources='[https://github.com/CocoaPods/Specs.git,git@gitlab.317hu.com:HuModularizationLibrary/HuModularizationSpecs.git](https://github.com/CocoaPods/Specs.git,git@gitlab.317hu.com:HuModularizationLibrary/HuModularizationSpecs.git)'

#上传podspec到trunk服务器中
#将这个仓库clone到本地的.cocoapod/repos/xxxPodSpecs,当然这里使用pod命令行工具来执行，pod repo add xxxPodSpecs https://github/xxx/xxxPodSpecs.git，执行完成后再执行pod repo list就可以看到我们私有的spec仓库在列了。
#将我们的HomeModule.podspecs托管到我们才创建的私有spec仓库,具体操作为cd 到HomeModule.podspec目录下，执行pod repo push xxxPodSpecs HomeModule.podspec,这里pod会执行一次校验，一般会报一些warn,你可以去解决一下，如果不想解决直接忽略的话，执行pod repo push xxxPodSpecs HomeModule.podspec --verbose --allow-warnings --use-libraries,不过如果是error错误，是无法忽略的。这里顺便提一下，在我使用1.5.3版本pod执行的时候，会报一个error是bug引起的，无法解决，通过升级到最新版pod就好了，升级pod只需要执行sudo gem install cocoapods就行了
#命令行：
#git tag -m"first tag WXWCategory" "0.1.0"#打tag 上传podspec
#git push --tags
#pod trunk push WXWCategory.podspec #把podspec文件推送到CocoaPod官方库
#上传需要一定时间，成功后更新本地pod依赖库
#命令行：pod setup
#查看代码有没有通过审核版本是否更新
#命令行：pod search HycProject
#下载线上git仓库（Podfile文件不在此讨论）
#命令行：pod install
#将podspec文件push到cocoapods服务器上
#pod trunk register 邮箱全称 '用户名' --verbose
#deterministic_uuids 在创建Pods项目时是否生成确定性uuid该选项默认为true
#integrate_targets 是否将安装的pods集成到用户项目中
#如果设置为false, Pods将被下载并安装到Pods/目录中，但是它们不会集成到你的项目中。该选项默认为true。
#disable_input_output_paths是否禁用CocoaPods脚本阶段的输入和输出路径(复制框架和复制资源)该选项默认为false。
#swift 报错 使用：终端使用echo "2.3" > .swift-version

#cloned = Marshal.load(Marshal.dump(Pod::Sandbox::FileAccessor::GLOB_PATTERNS))
#Pod::Sandbox::FileAccessor::HEADER_EXTENSIONS = (%w(.inl .msg) + Pod::Sandbox::FileAccessor::HEADER_EXTENSIONS)
#puts Pod::Sandbox::FileAccessor::HEADER_EXTENSIONS
#s = Pod::Sandbox::FileAccessor::GLOB_PATTERNS[:public_header_files]
#s = s[0...s.length-1]+',.inl,.msg'+s[s.length-1]
#cloned[:public_header_files] = s
#puts Pod::Sandbox::FileAccessor::GLOB_PATTERNS = cloned

Pod::Spec.new do |s|
  s.name             = 'MyPodTestPro'
  s.version          = '0.1.0'
  s.summary          = 'A short description of MyPodTestPro.'#用于pod search 库的时候可以看到该类库的一个简述
  # spec.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  #使用HTTP下载代码的压缩文件。它支持zip、tgz、bz2、txz和tar。
#  spec.source = { :http => 'http://dev.wechatapp.com/download/sdk/WeChat_SDK_iOS_en.zip' }
#使用HTTP下载文件，使用hash来验证下载。它支持sha1和sha256。
#  spec.source = { :http => 'http://dev.wechatapp.com/download/sdk/WeChat_SDK_iOS_en.zip',:sha1 => '7e21857fe11a511f472cfd7cfa2d979bd7ab7d96' }
#支持的key：
#:git => :tag, :branch, :commit, :submodules
#:svn => :folder, :tag, :revision
#:hg => :revision
#:http => :flatten, :type, :sha256, :sha1
#:path
# 单个截图
#spec.screenshot = 'http://dl.dropbox.com/u/378729/MBProgressHUD/1.png'
# 多个截图
#spec.screenshots = [ 'http://dl.dropbox.com/u/378729/MBProgressHUD/1.png', 'http://dl.dropbox.com/u/378729/MBProgressHUD/2.png' ]
#可选的Pod库文档的URL。
#  spec.documentation_url = 'http://www.example.com/docs.html'
# 指定脚本文件，ruby build_files.rb是脚本文件名
#spec.prepare_command = 'ruby build_files.rb'
#s命令是利用script来处理文本文件
#i ：插入
#s ：取代
#sed 's/要被取代的字串/新的字串/g'
#第一个sed 语句表示将当前目录下的所有.h文件中的MyNameSpacedHeader替换成Header
#spec.prepare_command = <<-CMD
#sed -i 's/MyNameSpacedHeader/Header/g' ./**/*.h
#sed -i 's/MyNameOtherSpacedHeader/OtherHeader/g' ./**/*.h
#CMD
#是否弃用
#spec.deprecated = true
#设置弃用的pod库的新名字，告诉使用者可以搜索新的库名。
#spec.deprecated_in_favor_of = 'NewMoreAwesomePod'
#只能在OS系统使用，要求系统版本至少10.8
#spec.platform = :osx, '10.8'
#也可以只指定平台，不指定版本
#spec.platform = :ios
#设置对其他pod或“sub-specification”的依赖。
#依赖关系如果需要指定版本，推荐使用~>
#spec.dependency 'AFNetworking', '~> 1.0'
##依赖RestKit库中的子模块
#spec.dependency 'RestKit/CoreData', '~> 0.20.0'
##指定某个平台的依赖
#spec.ios.dependency 'MBProgressHUD', '~> 0.5'
#requires_arc允许指定哪个source_files使用ARC。不使用ARC的文件将添加- fno-objc- ARC编译器标记。
#此属性的默认值为true。
##不支持ARC
#spec.requires_arc = false
##指定某个文件夹支持ARC的
#spec.requires_arc = 'Classes/Arc'
##指定某些文件支持ARC
#spec.requires_arc = ['Classes/*ARC.m', 'Classes/ARC.mm']
#需要链接的系统frameworks

#spec.ios.framework = 'CFNetwork'
##多个库
#spec.frameworks = 'QuartzCore', 'CoreData'
#libraries 支持多平台
#spec.ios.library = 'xml2'
##多个库，其中xml2对应ibxml2.tbd       z对应libz.tbd
##所以lib库 省略lib与后缀。
#spec.libraries = 'xml2', 'z'
#引用xml2库,但系统会找不到这个库的头文件，需与下方sss.xcconfig配合使用(这里省略lib)
#sss.libraries = "xml2"
#在pod target项的Header Search Path中配置:${SDK_DIR}/usr/include/libxml2
#sss.xcconfig = { 'HEADER_SEARCH_PATHS' => '${SDK_DIR}/usr/include/libxml2' }
#json目录下的文件不做下载
#sss.ios.exclude_files = 'AppInfo/Info/json'
#compiler_flags
#支持多平台
#编译参数 #-D是前缀，-Wno-format这个是gcc编译警告的参数
#spec.compiler_flags = '-DOS_OBJECT_USE_OBJC=0', '-Wno-format'
#pod_target_xcconfig
#支持多平台
#设置的参数都会添加到最终的私有pod的target xcconfig文件中
#【注意】这是设置pod库的target 命令
##OTHER_LDFLAGS  对应buildsetting的other linker flags
#spec.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC' }
#支持多平台，前缀头文件是模块的pch文件
#spec.prefix_header_file = 'iphone/include/prefix.pch'
#prefix_header_contents 注入的内容
#spec.prefix_header_contents = '#import <UIKit/UIKit.h>'
#spec.prefix_header_contents = '#import <UIKit/UIKit.h>', '#import <Foundation/Foundation.h>'
#//可以将多行内容放到两个EOS中间
#s.prefix_header_contents = <<-EOS
##ifdef __OBJC__
##import <UIKit/UIKit.h>
##else
#EOS
#s.prefix_header_contents = <<-EOS
##define HHHH @"测试代码"
#EOS
#模块对外的名称，如果设置了，主工程链接的时候用的是指定的名称。
#spec.module_name = 'Three20'
#pod库的源文件
##包含Classes目录下的所有.h .m文件

##包含Classes和More_Classes目录下的所有.h .m文件
#spec.source_files = 'Classes/**/*.{h,m}', 'More_Classes/**/*.{h,m}'
#*   匹配所有文件
#c*  匹配名字以c开头的文件。
#*c  匹配名字以c结束的文件。
#c   匹配名字含有c的，包含c在开头和结尾的情况。
#**  目录递归地匹配。也就是包含子目录
#？  匹配任何一个字符，与正则中 /.{1}/ 一致
# [set] 匹配多个字符。匹配在字符集中的任何一个字符，跟正则中的字符集一样，也可以取反 [^a-z]
# {p,q} 匹配文件名包含p或q的，可以写两个或多个字
#pod库暴露给用户工程的头文件。如果不指定那么source_files中的所有header都被认为是公共的。

#设置私有头文件
#spec.private_header_files = 'Headers/Private/*.h'
#vendored_frameworks
#pod库中framework的路径
#spec.ios.vendored_frameworks = 'Frameworks/MyFramework.framework'
#spec.vendored_frameworks = 'MyFramework.framework', 'TheirFramework.framework'
#vendored_libraries
#pod库中的静态库
#spec.ios.vendored_library = 'Libraries/libProj4.a'
#spec.vendored_libraries = 'libProj4.a', 'libJavaScriptCore.a'
#resource_bundles
#pod中的资源会以bundle的形式添加到项目中。键表示bundles的名称，值表示文件格式。
#推荐使用，bundle的名称应该包括Pod的名称，以尽量减少名称冲突的几率。
#为了提供不同的资源，每个平台都必须使用带有名称空间的包。
#spec.ios.resource_bundle = { 'MapBox' => 'MapView/Map/Resources/*.png' }
##多个路径
#spec.resource_bundles = {
#    'MapBox' => ['MapView/Map/Resources/*.png'],
#    'OtherResources' => ['MapView/Map/OtherResources/*.png']
#}
#resources
#使用此属性指定的资源直接复制到客户端目标，因此不会被Xcode优化，推荐使用resource_bundles
#spec.resource = 'Resources/HockeySDK.bundle'
##多个，注意是resources复数形式，也可以不加[ ]
#spec.resources = ['Images/*.png', 'Sounds/*']
#exclude_files
#排除在外的文件，与source_files相对
#spec.ios.exclude_files = 'Classes/osx'
#spec.exclude_files = 'Classes/**/unused.{h,m}'
#preserve_paths
#下载后不会被删除的文件。默认删除不匹配任何file pattern的文件。
#spec.preserve_path = 'IMPORTANT.txt'
#spec.preserve_paths = 'Frameworks/*.framework'
#module_map
#pod被组装成framework的时候module map文件可能用的上，默认的cocoapod会基于public headers 创建一个module map。
#spec.module_map = 'source/module.modulemap'
#5、Subspecs
#可以理解为pod库中的子模块。一个库可以指定对另一个库的依赖，另一个库的子规范，或者是它自身的子规范。
#subspec
#用来表示pod库模块的规范
#一方面，spec自动将subspecs作为依赖项(除非指定了默认的子规范)。
#另一方面，“子规范”继承了父属性的值，因此可以在父类中指定属性的共同值。
##安装ShareKit，会包括ShareKit / Evernote,ShareKit / Facebook等，因为它们被定义为subspecs。
#pod 'ShareKit', '2.0'
##只安装ShareKit中的某个子库，这种情况下subspec需要源文件，依赖和其他在根spec中定义的属性，不过cocoapods能帮我们处理这些问题。
#pod 'ShareKit/Twitter', '2.0'
#pod 'ShareKit/Pinboard', '2.0'
##有不同源文件的
#subspec subspec 'Twitter' do |sp|
#sp.source_files = 'Classes/Twitter'
#end
#subspec 'Pinboard' do |sp|
#sp.source_files = 'Classes/Pinboard'
#end
##子库的spec依赖其他subspec·
#Pod::Spec.new do |s|
#  s.name = 'RestKit'
#  s.subspec 'Core' do |cs|
#    cs.dependency 'RestKit/ObjectMapping'
#    cs.dependency 'RestKit/Network'
#    cs.dependency 'RestKit/CoreData'
#  end
#  s.subspec 'ObjectMapping' do |os|
#  end
#end
##嵌套的Subspec
#Pod::Spec.new do |s|
#  s.name = 'Root'
#  s.subspec 'Level_1' do |sp|
#    sp.subspec 'Level_2' do |ssp|
#    end
#  end
#end
#default_subspecs
#一组用来作为依赖项的subspec名称。如果没有指定则要求其所有的subspec作为依赖项。
#默认情况下pod库应该提供完整的库。用户可以根据需求微调他们的依赖项，排除不需要的子模块(subspec)。
#这个属性很少用。
#spec.default_subspec = 'Core'
#spec.default_subspecs = 'Core', 'UI'
#6、Multi-Platform support
#所有标识支持多平台的，都可以针对平台设置参数
#spec.ios.resources = 'Resources_ios/**/*.png'
#spec.osx.source_files = 'Classes/osx/**/*.{h,m}'
#spec.tvos.source_files = 'Classes/tvos/**/*.{h,m}'
#spec.watchos.source_files = 'Classes/watchos/**/*.{h,m}'

#规范支持的CocoaPods版本
#  spec.cocoapods_version = '>= 1.10.1'
#多资源情况下的书写方式，支持数组填充
# spec.resource_bundles = {
#   'GlobalButton' => ['GlobalButton/Assets/*.png']
# }

# spec.public_header_files = 'Pod/Classes/**/*.h'
# spec.frameworks = 'UIKit', 'MapKit'
# spec.dependency 'AFNetworking', '~> 2.3'

  # spec.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
#  Podfile是描述一个或多个Xcode项目的target的依赖性的规范描述文件。
#  一个更复杂的Podfile的例子是
#  platform :ios, '10.0'
#  inhibit_all_warnings!
#  target 'MyApp' do
#    pod 'ObjectiveSugar', '~> 0.5'
#    target 'MyAppTests' do
#      inherit! :search_paths
#      pod 'OCMock', '~> 2.0.1'
#    end
#  end
#  post_install do |installer|
#    installer.pods_project.targets.each do |target|
#      puts "#{target.name}"
#    end
#  end
#  根选项
#  应用于整个Podfile的配置。
#  install!声明安装过程中使用的安装方法和选项。
#  install!
#  指定CocoaPods安装这个Podfile时使用的安装方法和选项。
#  第一个参数表示使用的安装方法；接下来的参数指示安装选项。
#  目前唯一被接受的安装方法是“cocoapods”，因此你将始终对第一个参数使用此值；但是在未来的版本中可能会有更多的安装方法。
#  例子:
#  指定自定义CocoaPods安装选项
#  install! 'cocoapods',
#           :deterministic_uuids => false,
#           :integrate_targets => false
#  支持的Key
#  :clean
#  安装过程中是否清理pod的来源
#  清理将删除pod没有使用的所有文件，这些文件由podspec和项目支持的平台指定
#  该选项默认为true。
#  :deduplicate_targets
#  是否去复制pod的target
#  当一个pod包含在多个具有不同需求的target中时，target重复数据删除会向pod target添加后缀。例如，一个名为“MyPod”的pod有一个subspec“SubA”，包含在两个target中，如下所示:
#  target 'MyTargetA' do
#    pod 'MyPod/SubA'
#  end
#  target 'MyTargetB' do
#    pod 'MyPod'
#  end
#  会产生两个Pod目标：MyPod和MyPod- suba
#  该选项默认为true。
#  :deterministic_uuids
#  在创建Pods项目时是否生成确定性uuid
#  该选项默认为true。
#  :integrate_targets
#  是否将安装的pods集成到用户项目中
#  如果设置为false, Pods将被下载并安装到Pods/目录中，但是它们不会集成到你的项目中。
#  该选项默认为true。
#  :lock_pod_sources
#  是否锁定pods的源文件。当试图修改文件内容时，Xcode将提示解锁文件
#  在安装期间锁定吊舱会导致性能损失。如果这对项目的pod安装持续时间有显著影响，可以尝试将其设置为false
#  该选项默认为true。
#  :warn_for_multiple_pod_sources
#  当多个源包含具有相同名称和版本的Pod时，是否发出警告
#  该选项默认为true。
#  :share_schemes_for_development_pods
#  是否共享开发pod的Xcode方案。
#  开发pod的方案是自动创建的，但默认情况下不共享。
#  该选项默认为false。
#  :disable_input_output_paths
#  是否禁用CocoaPods脚本阶段的输入和输出路径(复制框架和复制资源)
#  该选项默认为false。
#  :preserve_pod_file_structure
#  是否保留所有pod的文件结构，包括外部pod源。
#  默认情况下，Pod源的文件结构仅为开发Pod保留。设置:preserve_pod_file_structure为true将始终保存文件结构。
#  该选项默认为false。
#  :generate_multiple_pod_projects
#  是否为每个pod目标生成一个项目，而不是创建一个Pods.xcodeproj，此选项将为嵌套在Pods.xcodeproj下的每个pod目标生成一个项目。
#  该选项默认为false。
#  :incremental_installation
#  是否仅启用自上次安装以来已更改的重新生成目标及其关联项目。
#  该选项默认为false。
#  :skip_pods_project_generation
#  是否跳过生成Pods.xcodeproj，只执行依赖项解析和下载。
#  该选项默认为false。
#  Podfile依赖
#  Podfile指定每个用户target的依赖项。
#  pod是声明特定依赖项的方法。
#  podspec为创建podspec提供了一个简单的API。
#  target是你在Xcode项目中如何将依赖项限定为特定target的范围。
#  pod
#  指定项目的依赖项。
#  依赖项需求由Pod的名称和版本需求列表(可选)定义。
#  在开始一个项目时，你可能希望使用最新版本的Pod。如果是这种情况，只需忽略版本需求，如下是一个例子。
#  pod 'SSZipArchive'
#  在项目的后期，你可能希望使用Pod的特定版本，在这种情况下，你可以指定版本号。
#  pod 'Objection', '0.9'
#  除了没有版本，或者一个特定的版本，也可以使用操作符:
#  = 0.1，版本0.1。
#  > 0.1，任何高于0.1的版本。
#  >= 0.1，版本0.1和任何更高版本。
#  < 0.1，任何低于0.1的版本。
#  <= 0.1，版本0.1和任何较低版本。
#  ~> 0.1.2，版本0.1.2及以上到版本0.2，不含0.2。该操作符基于你在版本需求中指定的最后一个组件工作。这个例子等于>= 0.1.2与< 0.2.0相结合，并且总是匹配与你的需求相匹配的最新已知版本。
#  ~ > 0.1.3-beta.0，Beta版和release发行版本为0.1.3，发行版本为0.2(不包括0.2)。用破折号(-)分隔的组件将不考虑版本要求。
#  可以为更细粒度的控制指定版本需求列表。
#  有关版本控制策略的更多信息，请参见:
#  语义版本控制
#  RubyGems版本管理策略
#  构建配置
#  默认情况下，依赖项安装在target的所有构建配置中。出于调试目的或其他原因，只能在构建配置列表中启用它们。
#  pod 'PonyDebugger', :configurations => ['Debug', 'Beta']
#  或者，你可以指定将其包含在单个构建配置中。
#  pod 'PonyDebugger', :configuration => 'Debug'
#  请注意，所有配置中都包含传递依赖项，如果不希望这样，还必须手动为它们指定生成配置。
#  模块头
#  如果你想使用模块化的头，每个Pod你可以使用以下语法:
#  pod 'SSZipArchive', :modular_headers => true
#  另外，当你使用use_modular_headers!属性时，你可以使用以下命令从模块头中排除特定的Pod:
#  pod 'SSZipArchive', :modular_headers => false
#  源
#  默认情况下，在全局级别指定的源按照指定依赖项匹配的顺序进行搜索。这种行为可以通过指定依赖项的来源来改变特定的依赖项:
#  pod 'PonyDebugger', :source => 'https://github.com/CocoaPods/Specs.git'
#  在这种情况下，将只搜索指定的源，以查找依赖项和任何被忽略的全局源。
#  Subspecs
#  当通过它的名字安装Pod时，它将安装podspec中定义的所有默认的子规范。
#  你可以安装一个特定的子规格使用以下:
#  pod 'QueryKit/Attribute'
#  你可以指定一个要安装的子规格集合如下:
#  pod 'QueryKit', :subspecs => ['Attribute', 'QuerySet']
#  测试规格
#  可以通过:testspecs选项选择性地包括测试规格。默认情况下，不包括Pod的测试规范。
#  你可以指定一个测试规范名称列表来安装，使用如下方法:
#  pod 'AFNetworking', :testspecs => ['UnitTests', 'SomeOtherTests']
#  提供给:testspecs的值对应于提供给Podspec中的test_spec DSL属性的名称。
#  依赖关系也可以从外部来源获得。
#  使用本地路径中的文件
#  如果你想使用与它的客户端项目一起开发一个Pod，你可以使用path选项。
#  pod 'AFNetworking', :path => '~/Documents/AFNetworking'
#  使用此选项CocoaPods将假定给定文件夹是Pod的根文件夹，并将从那里直接链接到Pods项目中的文件。这意味着你的编辑将持续到CocoaPods安装。
#  被引用的文件夹可以是你最喜欢的SCM的签出，甚至是当前存储库的git子模块。
#  注意，Pod文件的podspec应该在文件夹中。
#  来自库存储库根中的podspec。
#  有时你可能会想要使用边缘版本的pod，或者一个特定的修改。如果是这种情况，你可以使用pod声明来指定。
#  要使用储存库的主分支:
#  pod 'AFNetworking', :git => 'https://github.com/gowalla/AFNetworking.git'
#  要使用存储库的不同分支:
#  pod 'AFNetworking', :git => 'https://github.com/gowalla/AFNetworking.git', :branch => 'dev'
#  使用存储库的标记
#  pod 'AFNetworking', :git => 'https://github.com/gowalla/AFNetworking.git', :tag => '0.7.0'
#  或者指定一个提交
#  pod 'AFNetworking', :git => 'https://github.com/gowalla/AFNetworking.git', :commit => '082f8319af'
#  但是，需要注意的是，这意味着该版本必须满足其他Pod对Pod的任何其他依赖关系。
#  podspec文件应该在存储库的根目录中，如果这个库的存储库中还没有podspec文件，那么你必须使用下面小节中列出的方法之一。
#  来自spec库之外的podspec，用于没有podspec的库
#  如果podspec可以从库库外的其他来源获得。例如，考虑一个可以通过HTTP访问的podspec:
#  pod 'JSONKit', :podspec => 'https://example.com/JSONKit.podspec'
#  podspec
#  只使用给定的podspec文件中定义的Pod的依赖项。如果没有传递任何参数，则使用Podfile根目录中的第一个podspec。它将用于库的项目。注意:这并不包括来自podspec的源代码，只包括CocoaPods基础结构。
#  参数
#  选项 Hash{符号= >字符串}
#  加载{Specification}的路径。如果没有提供，将使用Podfile目录中的第一个podspec。
#  例子:
#  podspec
#  podspec :name => 'QuickDialog'
#  podspec :path => '/Documents/PrettyKit/PrettyKit.podspec'
#  target
#  定义给定块中定义的CocoaPods target和范围依赖项。target应该与Xcode target相对应。默认情况下，target包含定义在块外部的依赖项，除非指示不要继承inherit!他们。
#  参数
#  名称 Symbol, String
#  目标的名称。
#  例子:
#  定义一个target
#  target 'ZipApp' do
#    pod 'SSZipArchive'
#  end
#  定义从其父target访问SSZipArchive pod的测试target
#  target 'ZipApp' do
#    pod 'SSZipArchive'
#    target 'ZipAppTests' do
#      inherit! :search_paths
#      pod 'Nimble'
#    end
#  end
#  定义一个target可以通过它的父target将Pods应用到多个target
#  target 'ShowsApp' do
#    pod 'ShowsKit'
#    # Has its own copy of ShowsKit + ShowTVAuth
#    target 'ShowsTV' do
#      pod 'ShowTVAuth'
#    end
#    # Has its own copy of Specta + Expecta
#    # and has access to ShowsKit via the app
#    # that the test target is bundled into
#    target ‘A’ do
#      这个target 继承 父级所有行为
#      inherit! :complete
#    end
#    target ‘B’ do
#      这个target 不继承 父级所有行为
#      inherit! :none
#    end
#    target 'ShowsTests' do
#      target 仅继承 父级的搜索路劲
#      inherit! :search_paths
#      pod 'Specta'
#      pod 'Expecta'
#    end
#  end
#  script_phase
#  添加与此目标集成的脚本阶段。脚本阶段可用于执行任意脚本，该脚本可在执行期间使用所有Xcode环境变量。目标可以包括多个脚本阶段，它们将按照声明的顺序被添加。如果之前已经添加了脚本阶段，那么删除脚本阶段将有效地将其从目标中删除。
#  参数
#  选项 Hash
#  此脚本阶段的选项。
#  例子:
#  script_phase :name => 'HelloWorldScript', :script => 'echo "Hello World"'
#  script_phase :name => 'HelloWorldScript', :script => 'puts "Hello World"', :shell_path => '/usr/bin/ruby'
#  abstract_target
#  定义一个新的抽象目标，可用于方便的目标依赖项继承。
#  参数
#  name Symbol,字符串
#  目标的名称。
#  例子:
#  定义抽象目标
#  abstract_target 'Networking' do
#    pod 'AlamoFire'
#    target 'Networking App 1'
#    target 'Networking App 2'
#  end
#  定义一个abstract_target包装pod到多个目标
#  # Note: There are no targets called "Shows" in any of this workspace's Xcode projects
#  abstract_target 'Shows' do
#    pod 'ShowsKit'
#    # The target ShowsiOS has its own copy of ShowsKit (inherited) + ShowWebAuth (added here)
#    target 'ShowsiOS' do
#      pod 'ShowWebAuth'
#    end
#    # The target ShowsTV has its own copy of ShowsKit (inherited) + ShowTVAuth (added here)
#    target 'ShowsTV' do
#      pod 'ShowTVAuth'
#    end
#    # Our tests target has its own copy of
#    # our testing frameworks, and has access
#    # to ShowsKit as well because it is
#    # a child of the abstract target 'Shows'
#    target 'ShowsTests' do
#      inherit! :search_paths
#      pod 'Specta'
#      pod 'Expecta'
#    end
#  end
#  abstract!
#  表示当前目标是抽象的，因此不会直接链接到Xcode目标。
#  inherit!
#  设置当前目标的继承模式。
#  参数
#  继承Symbol
#  要设置的继承模式。
#  可用模式:+:complete 目标继承父模式的所有行为。目标不会从父类继承任何行为。目标只继承父类的搜索路径。
#  例子:
#  只继承搜索路径
#  target 'App' do
#    target 'AppTests' do
#      inherit! :search_paths
#    end
#  end
#  target配置
#  这些设置用于控制CocoaPods生成的项目。
#  首先简单地说明你在哪个platform平台上工作。xcodeproj允许你明确声明要链接到哪个项目。
#  platform
#  指定应为其构建静态库的平台。
#  如果未指定CocoaPods，则提供默认部署目标。 当前的默认值对于iOS是4.3，对于OS X是10.6，对于tvOS是9.0，对于watchOS是2.0。
#  如果部署目标需要它（iOS <4.3），则将armv6体系结构添加到ARCHS。
#  参数
#  名称 Symbol
#  平台的名称，对于OS X可以是:osx，对于iOS可以是:ios，对于tvOS是:tvos，或者对于watchOS是:watchos。
#  target String，版本
#  可选部署。 如果未提供，则将根据平台名称分配默认值。
#  例子：
#  指定平台
#  platform :ios, '4.0'
#  platform :ios
#  project
#  指定包含Pods库应该链接的目标的Xcode项目。
#  如果没有目标定义指定一个显式项目，并且与Podfile在同一目录中只有一个项目，那么将使用该项目。
#  还可以指定你的自定义构建配置的构建设置是在版本发布之后建模还是在调试预置之后建模。为此，你需要指定一个散列，其中每个构建配置的名称关联到:release或:debug。
#  参数
#  path String
#  要链接的项目的路径
#  build_configurationsHash{字符串= >符号}
#  一个散列，其中键是Xcode项目中构建配置的名称，值是一些符号，这些符号指定配置应该基于:debug还是:release配置。如果在您的项目中没有为配置指定显式的映射，它将默认为:release。
#  例子:
#  指定用户项目
#  # This Target can be found in a Xcode project called `FastGPS`
#  target 'MyGPSApp' do
#    project 'FastGPS'
#    ...
#  end
#  # Same Podfile, multiple Xcodeprojects
#  target 'MyNotesApp' do
#    project 'FastNotes'
#    ...
#  end
#  使用自定义构建配置
#  project 'TestProject', 'Mac App Store' => :release, 'Test' => :debug
#  xcodeproj
#  xcodeproj在1.0中被弃用，并被重命名为project。对于1.0之前的版本使用xcodeproj。
#  link_with
#  link_with在1.0中被弃用，取而代之的是abstract_target和目标继承。
#  inhibit_all_warnings!
#  禁止来自CocoaPods库的所有警告。
#  此属性由子目标定义继承。
#  如果你想禁止每个Pod的警告，你可以使用以下语法:
#  pod 'SSZipArchive', :inhibit_warnings => true
#  另外，当你使用inhibit_all_warnings!属性，你可以使用以下方法来排除特定的Pod:
#  pod 'SSZipArchive', :inhibit_warnings => false
#  use_modular_headers!
#  对所有CocoaPods静态库使用模块化头文件。
#  此属性由子目标定义继承。
#  如果你想使用模块化的头每个Pod你可以使用以下语法:
#  pod 'SSZipArchive', :modular_headers => true
#  另外，当你使用use_modular_headers!属性，可以使用以下命令从模块头中排除特定的Pod
#  pod 'SSZipArchive', :modular_headers => false
#  use_frameworks!
#  为Pods使用框架而不是静态库。
#  此属性由子目标定义继承。
#  supports_swift_versions
#  指定目标定义支持的Swift版本要求。
#  注意，这些需求是从父级继承的，如果指定了这些需求，并且在根级没有指定任何需求，那么所有版本都被认为是受支持的。
#  参数
#  需求 String，版本，数组，数组
#  此目标支持的需求集。
#  例子:
#  target 'MyApp' do
#    supports_swift_versions '>= 3.0', '< 4.0'
#    pod 'AFNetworking', '~> 1.0'
#  end
#  supports_swift_versions '>= 3.0', '< 4.0'
#  target 'MyApp' do
#    pod 'AFNetworking', '~> 1.0'
#  end
#  target 'ZipApp' do
#    pod 'SSZipArchive'
#  end
#  工作空间
#  该组列出配置工作区和设置全局设置的选项。
#  workspace
#  指定应该包含所有项目的Xcode工作区。
#  如果没有指定显式的Xcode工作空间，并且只有一个项目存在于与Podfile相同的目录中，那么该项目的名称将用作工作空间的名称。
#  参数
#  path String
#  工作区的路径。
#  例子:
#  指定一个工作区
#  workspace 'MyWorkspace'
#  generate_bridge_support!
#  指定一个BridgeSupport元数据文档应该从所有安装的pod的标题生成。
#  这适用于脚本语言，如MacRuby、Nu和JSCocoa，它们使用它来桥接类型、函数等。
#  set_arc_compatibility_flag!
#  指定-fobjc-arc标志应该添加到OTHER_LD_FLAGS。
#  对于非arc项目的编译器缺陷，这是一种变通方法(参见#142)。这最初是自动完成的，但从Xcode 4.3.2开始的libtool似乎不再支持-fobjc-arc标志。因此，现在必须使用此方法显式地启用它。
#  CocoaPods 1.0中可能会取消对该方法的支持。
#  源
#  Podfile从给定的源(存储库)列表中检索规范。
#  源是全局的，它们不是按目标定义存储的。
#  source
#  指定规格的位置
#  使用此方法指定源。资料来源的顺序是相关的。CocoaPods将使用第一个来源的最高版本的Pod，其中包括Pod(不管其他来源是否有更高的版本)。
#  官方的CocoaPods来源是含蓄的。一旦指定了另一个源，就需要包含它。
#  参数
#  source String
#  规范存储库的URL。
#  例子:
#  指定首先使用Artsy存储库，然后使用CocoaPods主存储库
#  source 'https://github.com/artsy/Specs.git'
#  source 'https://github.com/CocoaPods/Specs.git'
#  Hook钩子
#  Podfile提供了将在安装过程中调用的钩子。
#  钩子是全局的，不是按目标定义存储的。
#  plugin
#  指定安装期间应该使用的插件。
#  使用此方法指定应在安装期间使用的插件，以及在调用插件时应传递给插件的选项。
#  参数
#  名称 String
#  插件的名称。
#  options Hash
#  在调用插件的钩子时应该传递给插件的可选选项。
#  例子:
#  指定使用“slather”和“cocoapods-keys”插件。
#  plugin 'cocoapods-keys', :keyring => 'Eidolon'
#  plugin 'slather'
#  pre_install
#  这个钩子允许你在下载了pod并安装它们之前对它们做任何修改。
#  它接收Pod::Installer作为惟一的参数。
#  例子:
#  在Podfile中定义预安装钩子。
#  pre_install do |installer|
#    # Do something fancy!
#  end
#  post_install
#  这个钩子允许你在将生成的Xcode项目写入磁盘之前对其进行最后的更改，或者执行你可能希望执行的任何其他任务。
#  它接收Pod::Installer作为惟一的参数。
#  例子:
#  自定义所有目标的构建设置
#  post_install do |installer|
#    installer.pods_project.targets.each do |target|
#      target.build_configurations.each do |config|
#        config.build_settings['GCC_ENABLE_OBJC_GC'] = 'supported'
#      end
#    end
#  end
  
  
  

  s.description      = <<-DESC
  TODO: Add long description of the pod here.
  DESC
  
  s.homepage         = 'https://github.com/localhost3585@gmail.com/MyPodTestPro'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'localhost3585@gmail.com' => 'localhost3585@gmail.com' }
  s.source           = { :git => 'https://github.com/localhost3585@gmail.com/MyPodTestPro.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  #  s.subspec 'Debug' do |debug|
  #    debug.source_files = 'Class/TestEvn.h','Class/TestEvn.m'
  #    debug.public_header_files = 'Class/TestEvn.h'
  #  end
    #  s.subspec 'Release' do |release|
  #    release.source_files = 'Class/TestEvn.h','Class/TestEvn.m'
  #    release.public_header_files = 'Class/TestEvn.h'
  #  end
  #  s.pod_target_xcconfig = {'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'}
  
  s.subspec 'Public' do |u|
    u.source_files = 'Class/**/*.{h,m}'
    u.public_header_files = 'Class/TestEvn.h','Class/TViewController.h'
    u.platform = :ios, "10.0"
  end
  
  s.subspec 'Pro' do |p|
    p.dependency 'MyPodTestPro/Public'
    p.resources = 'Class/Releasebasedata.txt'
    p.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'PRO=1'}
    
  end
  
  s.subspec 'Uat' do |t|
    t.dependency 'MyPodTestPro/Public'
    t.resources = 'Class/Debugbasedata.txt'
    t.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'UAT=1'}
    
  end
  s.subspec 'Sit' do |t|
    t.dependency 'MyPodTestPro/Public'
    t.resources = 'Class/Debugbasedata.txt'
    t.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'SIT=1'}
    # 配置宏定义 podfile 文件顶部定义 ENV["SMART_AS_ENABLE"] = "true"
#      if ENV['SMART_AS_ENABLE']
#          t.xcconfig = {
#            "GCC_PREPROCESSOR_DEFINITIONS" => 'SIT=1'
#          }
#      else

#    t.xcconfig = {
#     "GCC_PREPROCESSOR_DEFINITIONS" => 'SIT=1'
#    }
  end
  
  s.subspec 'Debug' do |t|
    t.dependency 'MyPodTestPro/Public'
    t.resources = 'Class/Debugbasedata.txt'
#    t.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'Debug'}
    
  end
  
  s.subspec 'Release' do |t|
    t.dependency 'MyPodTestPro/Public'
    t.resources = 'Class/Debugbasedata.txt'
#    t.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'Release'}
    
  end
  
  
  
  s.requires_arc = true
  s.default_subspec = 'Pro'

  #    if ENV['SMART_AS_ENABLE']
  #           s.xcconfig = {
  #             "GCC_PREPROCESSOR_DEFINITIONS" => 'SMART_AS_ENABLE=1'
  #           }
  #    s.default_subspec = 'Release'
  s.platform     = :ios, "10.0"
  #最低要求的系统版本7.0
  s.ios.deployment_target = "10.0"
  
  s.frameworks  = "CoreServices"
  
  
  
  s.pod_target_xcconfig = {'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'}
  
  # s.resource_bundles = {
  #   'MyPodTestPro' => ['MyPodTestPro/Assets/*.png']
  # }
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3
  

end
