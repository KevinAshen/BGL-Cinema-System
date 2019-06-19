Table of Contents
=================

   * [前言](#前言)
   * [GitHub](#github)
   * [所有使用到的第三方库](#所有使用到的第三方库)
   * [项目详细说明](#项目详细说明)
      * [登陆注册](#登陆注册)
         * [登陆](#登陆)
            * [预览](#预览)
            * [文件名](#文件名)
         * [注册](#注册)
            * [预览](#预览-1)
            * [文件名](#文件名-1)
         * [总结](#总结)
      * [城市定位](#城市定位)
         * [预览](#预览-2)
         * [文件名](#文件名-2)
         * [总结](#总结-1)
      * [选择电影](#选择电影)
         * [预览](#预览-3)
         * [文件名](#文件名-3)
         * [总结](#总结-2)
      * [选择影院](#选择影院)
         * [预览](#预览-4)
         * [文件名](#文件名-4)
      * [查看我的订单](#查看我的订单)
         * [预览](#预览-5)
         * [文件名](#文件名-5)
      * [选择场次](#选择场次)
         * [预览](#预览-6)
         * [文件名](#文件名-6)
         * [总结](#总结-3)
      * [选座](#选座)
         * [预览](#预览-7)
         * [文件名](#文件名-7)
         * [总结](#总结-4)
   * [遇到的问题](#遇到的问题)
      * [code = xxx](#code--xxx)
      * [数据传不过去](#数据传不过去)
   * [遗憾](#遗憾)

# 前言

- 该作品是2019年软件工程课设作品，整体界面仿照猫眼电影App制作，其中电影列表与影院列表是直接调用的猫眼的api，安排的演出场次以及下订单是合作的后台小伙伴写的接口
- 由于是课设作品，项目中大量的运用了各色第三方库，下面会一一放出，感谢开源，不然一个选座我就得写两周了
- 本次收获最多的还是增加了和后台对接的经验，中间踩了很多网络请求错误的坑，在后面会放我对各种code报错的总结。另外学到最多的还是前后端对于数据类型不一样导致的问题（其实我也不是很懂，都是后台大大牛逼）
- 另外就是对于常用的第三方库越来越熟练了，JSONModel，Masonry，SDWebImage，AFNetworking（其实也就是那几个方法。。。）
- 总的来说，这次收获比我想的还是要大一点，这两周不到的时间能写完这样一个看起来非常像样的项目，很有成就感，比大二上的时候要老来呢多了
- 此外就是觉得很多时候UI部分用用网上开源部分就很好了，没必要浪费太多时间，这次依然写了很多重复的代码，大多是cell布局以及JSONModel解析，真的是又臭又长

# GitHub

- [BGL-Cinema-System](https://github.com/KevinAshen/BGL-Cinema-System)
- Demo前半部分关于热映电影以及所有影院的部分可以正常使用（因为使用的就是猫眼的api），剩下的登陆注册，选座下单部分由于是后台小伙伴自己写的，所以URL全替换成了无效的
- 如果想看效果可以把网络请求部分注释掉，将tableview row改成死数据，应该就能行了

# 所有使用到的第三方库

- [高仿猫眼电影APP框架，tabbar下navigationcontroller框架。](https://github.com/lfny2580832/NYCatEyes)
- [selectSeat movie iOS objective-c(电影选座)](https://github.com/mrhyh/selectSeat)
- [高仿猫眼电影选座（选票）模块（High imitation opal film seat selection (vote) module）](https://github.com/ZFbaby/ZFSeatsSelection)
- [为应对类似淘宝首页，京东首页，国美首页的复杂布局而写的多样化的collectionview。](https://github.com/czl0325/ZLCollectionView)
- [重量级城市选择框架，类似美团、猫眼电影、美团外卖、百度外卖、百度糯米等团购类app城市选择界面。](https://github.com/EamonJoy/YMCitySelect)
- [Autoscroll Banner. 无限循环图片、文字轮播器。](https://github.com/gsdios/SDCycleScrollView)
- JSONModel，Masonry，SDWebImage，AFNetworking四兄弟就不用说了
- 本来还用了一个这个[解决打印日志对于Unicode编码不能正常显示中文的问题，只需要将文件导入工程，不需要引用，就能达到打印日志显示Unicode编码中文数据](https://github.com/CoderJackyHuang/HYBUnicodeReadable),但是用的途中崩溃了，老哥也好久没跟新了，提了issue也没有用，所以后来删了

# 项目详细说明
- 由于扯了很多第三方库，导致整个项目结构无比混乱，除了最开始的登陆注册我还是老老实实按照MVC来写的，后面就开始一个controller就完事了
- 所以这部分我会写清楚每个界面对应ViewController是哪个，至于配套的View和Model看一下头部的#import就行

## 登陆注册
### 登陆
#### 预览
![38444807D07B1C68364B6C1C1AE378BE](http://ww4.sinaimg.cn/large/006tNc79ly1g40orlty84j30o61amb29.jpg)
#### 文件名
BGLLoginViewController
### 注册
#### 预览
![2BAAF1C61A24F7889D671C89DF186558](http://ww3.sinaimg.cn/large/006tNc79ly1g40ors4z3uj30o61am1kx.jpg)
#### 文件名
BGLRegisterViewController.h

### 总结
- 登陆注册是我唯一老老实实按照MVC写的，后面觉得太麻烦了就没搞，一个大C是真的舒服
- 登陆注册可以形成token，但是为了方便展示，并没有使用，最后都是给某个用户使用
- 没加前端输入判断，说实话，就是很粗糙的

## 城市定位
### 预览
![70B68A835B11B22E681E330DCA284F06](http://ww3.sinaimg.cn/large/006tNc79ly1g40rc4ph57j30o61amn1h.jpg)
### 文件名
LocationViewController

### 总结

- 使用[重量级城市选择框架，类似美团、猫眼电影、美团外卖、百度外卖、百度糯米等团购类app城市选择界面。](https://github.com/EamonJoy/YMCitySelect)
- 整个项目使用[高仿猫眼电影APP框架，tabbar下navigationcontroller框架。](https://github.com/lfny2580832/NYCatEyes)作为UI架构，这里有遇到nav的leftitembutton设置title的问题，最后是每次选择城市后都再次新建button

## 选择电影
### 预览
![E05DD87FA222B7DCE91F1C539AFF9AED](http://ww2.sinaimg.cn/large/006tNc79ly1g40riwpxj9j30o61am4of.jpg)
### 文件名
MovieFirstViewController
### 总结
- 使用[Autoscroll Banner. 无限循环图片、文字轮播器。](https://github.com/gsdios/SDCycleScrollView)写最顶上的轮播图
- 这里开始用到了大量的自定义TableViewCell，应该做到着就想好怎样封装

## 选择影院
### 预览

![6C8351C52F7FD4E4860AE5DFFA0BD98D](http://ww1.sinaimg.cn/large/006tNc79ly1g41tmssq14j30o61amai3.jpg)
### 文件名
MovieSecondViewController

## 查看我的订单
### 预览

![E8418E0D2A3082894F6B59DCD0E021EC](http://ww2.sinaimg.cn/large/006tNc79ly1g41ztcs9dwj30o61amgpp.jpg)
### 文件名
MineViewController

## 选择场次
### 预览
![D2C1A4F5-4E7A-46F3-8468-633CC26F5F52](http://ww4.sinaimg.cn/large/006tNc79ly1g422ku92bbj30c30nbgoa.jpg)
### 文件名
ChooseSessionViewController
### 总结
- 使用[淘宝电影(淘票票)影院电影浏览效果](https://github.com/0summer0/ZXMovieBrowser)写了影院图片那一块，还挺酷的

## 选座
### 预览

![86AF0F2A-C4C0-441C-9E3B-97687AF34322](http://ww4.sinaimg.cn/large/006tNc79ly1g422nszrvcj30c30nbjta.jpg)

### 文件名
SMViewController
### 总结
- 使用[selectSeat movie iOS objective-c(电影选座)](https://github.com/mrhyh/selectSeat)，改了几个接口，最后使用遍历dictSeatState，将value为2的key也就是KyoCinameSeatStateSelected的传出key以及在value数组中的序号，即座位号了 
- 这一步的时候对于字典的解析更深了一些，字典还是好用啊

# 遇到的问题
## code = xxx

- 使用AFN遇到了很多code=xxx的问题，写了一篇总结博客
- [iOS与后台对接时使用AFN会遇到的各种问题](https://blog.csdn.net/KevinAshen/article/details/91824699)

## 数据传不过去

- 在下订单界面需要传一个座位数组，当时要以JSON数据的形式发出去
- 首先是看着篇OC转JSON[JSON与OC互相转换](https://www.cnblogs.com/WMHaa/p/hwm_block.html)
- 然后发现使用AFN怎么都不对，后台要么就是连访问都没访问到，要么就是拿到的数据都是NULL最后从网上找到这篇文章[iOS客户端发送json数据，java(servlet)服务器接受json数据](https://blog.csdn.net/feng512275/article/details/76066711)
- 但是之后又出现安全证书的问题code = -1202，靠这个解决了[Error Domain=NSURLErrorDomain Code=-1202,Https服务器证书无效](https://www.cnblogs.com/wobuyayi/p/6269688.html)

# 遗憾

- 课设作品按照道理应该也没啥遗憾不遗憾的，本质上就是个各色第三方库的堆砌，但还是有点小遗憾，写下来希望下次改正
- 测试后台接口的时候，经常要在局域网和公网上切换，导致请求的链接一直要变，其实应该写一个宏定义来写链接，一改全部都改了；同时这样在最后上传GitHub的时候还可以把该宏定义改成乱码，防止后台接口暴露
- 由于是课设作品，没怎么追求美观，没放任何动画上去，有点遗憾
- 写了好多好多自定义cell文件，没有用枚举写成可选类型，但是我对于封装cell后数据应该怎样更新还有点想不通
- 城市定位虽然有，但没有用到，如果还要对城市有选择的话，显然对后台压力有点大
- 登陆注册部分其实我在前端没有做任何判断，别说重复密码有没有输对了，就是没写重复密码都没事
- 选座部分其实第一列的座位选不了。。。
- 本来设想的其实是我在下单成功后，生成一个二维码，用户可以扫一扫返还，算是下单成功。可是后台反应，单纯扫一扫无法发送请求确认订单已支付，so，gg
