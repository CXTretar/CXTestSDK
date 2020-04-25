
#!/bin/bash
#该脚本仅适用于cocoapods生成的framework静态库
frameworkName='CXTestSDK'
#修改
oldversion='0.1.0'
#修改
version='0.1.1'
message='版本调整'

cd Example
pod install
cd ..
#本地校验
pod lib lint ${frameworkName}.podspec --verbose --use-libraries --allow-warnings --skip-import-validation
#代码提交到服务器
git add .
git commit -a -m${version}${message}
git tag -a $version -m${message}
git push origin ${version}
git push -u origin master 
#修改version
sed -i '' "s/${oldversion}/${version}/g" ${frameworkName}.podspec

pod package ${frameworkName}.podspec --force --no-mangle
