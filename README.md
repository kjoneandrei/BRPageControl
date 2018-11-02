# BRPageControl

## About

BRPageControl is a custom UIView which mimics the behaviour of UIPageControl and has some additional features.

### Additional Features

- A border can be added to your controls, and a custom UIColor can be given to it

- Set a custom diameter to your controls 

- Set custom spacing between controls

## Instalation

**BRPageControl is available to install via CocoaPods**

***CocoaPods***

Just add  `pod 'BRPageControl'` to your podfile and then run `pod install`

***Carthage*** 

~~~bash
gitHub "kjoneandrei/BRPageControl"
~~~

## How to use 

**Create an instance of BRPageControl**

```
let brPageControl = BRPageControl()
```

**Set BRPageControl allingment**

```
brPageControl.contentHorizontalAlignment = .center
```

**Set Colors to your controls by accessing the following properties**

```
brPageControl.currentPageTintColor = .white
brPageControl.currentPageBorderColor = .black
brPageControl.pageTintColor = .gray
brPageControl.pageBorderColor = .black
```

**Set diameter and spacing**

```
brPageControl.diameter = 7.5
brPageControl.spacing = 7
```

## 👥 Credits
Made by Andrei Hogea 

## 📄 License
**BRPageControl** is available under the MIT license. 
