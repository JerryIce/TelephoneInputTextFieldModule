# JITelephoneInputTextField

[![CI Status](https://img.shields.io/travis/jerryelectricity@me.com/JITelephoneInputTextField.svg?style=flat)](https://travis-ci.org/jerryelectricity@me.com/JITelephoneInputTextField)
[![Version](https://img.shields.io/cocoapods/v/JITelephoneInputTextField.svg?style=flat)](https://cocoapods.org/pods/JITelephoneInputTextField)
[![License](https://img.shields.io/cocoapods/l/JITelephoneInputTextField.svg?style=flat)](https://cocoapods.org/pods/JITelephoneInputTextField)
[![Platform](https://img.shields.io/cocoapods/p/JITelephoneInputTextField.svg?style=flat)](https://cocoapods.org/pods/JITelephoneInputTextField)

>手机号模式输入框

>语言：Objective-C

>支持：ios9.0 及以上

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

JITelephoneInputTextField is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'JITelephoneInputTextField'
```

## 具体样式展示示意图如下：
***
* 限位模式：最大13位 & 3-4-4间隔显示 & 首位限制为1

![JITelephoneInputTextField功能示意图default](https://github.com/JerryIce/JITelephoneInputTextField/blob/master/other/JITelephoneInputTextFieldDiagram.gif)

## 介绍说明：
***
使用场景：在输入手机号的需求下使用，可设置手机号最大限位，数字以3-4-4间断显示以及设定首位为特定数字。

## API使用说明：

> 直接取出Demo项目中的:JITelephoneInputTextField.h 和 JITelephoneInputTextField.m文件添加到自己的项目中即可使用。

1. 创建：JITelephoneInputTextField

基本和UITextfield创建方法一致，设置模式时参考Demo中ViewController.m中的设置方法。

```
JITelephoneInputTextField *telInputTextField = [[JITelephoneInputTextField alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame) - 270)/2, 200, 270, 30)];
    //    设置模式
    telInputTextField.numShowMode = JITelephoneInputTextField_numShowMode_344;
    telInputTextField.openFirstNumLimit = YES;
    telInputTextField.firstNum = 1;
    telInputTextField.delegate = self;
    [self.view addSubview:telInputTextField];
```
> 需要在下面textfield的代理方法里调用JITelephoneInputTextField 的telephoneTextFieldShouldChangeCharactersInRange: withValueString: 方法，并使用其返回值作为代理方法的返回值

```
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if([textField isKindOfClass:JITelephoneInputTextField.class]){
        JITelephoneInputTextField *field = (JITelephoneInputTextField*)textField;
        return [field telephoneTextFieldShouldChangeCharactersInRange:range withValueString:string];
    }else{
        return YES;
    }
}
```

2. 调整属性样式

```

typedef NS_ENUM(NSUInteger, JITelephoneInputTextField_numShowMode) {
    JITelephoneInputTextField_numShowMode_default,//默认数字显示模式：正常输入
    JITelephoneInputTextField_numShowMode_344,//3-4-4的数字显示模式：数字会3位-4位-4位间隔开
};

@property (nonatomic) NSUInteger limitedNum; //限制最大输入位数

@property (nonatomic) JITelephoneInputTextField_numShowMode numShowMode; //数字间隔显示模式

@property (nonatomic) BOOL openFirstNumLimit; //是否需要限制首位的数字为特定数字

@property (nonatomic) NSUInteger firstNum; //首位的数字设定为特定数字

```

## Author

jerryelectricity@me.com

## License

JITelephoneInputTextField is available under the MIT license. See the LICENSE file for more info.
