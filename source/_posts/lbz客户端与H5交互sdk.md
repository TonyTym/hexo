---
title: lbz客户端与H5交互sdk
categories: H5
tags: 
    - H5
    - IOS
    - Android
    - sdk
#description: 
#date: 
---

lbz客户端与H5交互sdk定义文档
<!-- more -->

### 一、APP相关
#### 1.是否是APP环境
H5调用示例：
```js
var env = LBZSdk.app.isAppEnv; // true | false
```
说明：此方法不需要客户端提供接口
#### 2.获取APP信息
接口名：
core.getAppInfo
传入参数：
(function(info){})
回调示例：
```js
{
  name: '{String}', // 应用名称,如:AiQiYi,Letv
  key: '{String}', // 应用对应的key，如：key123
}
```
H5调用示例：
```js
LBZSdk.app.getInfo(function(info){
  console.log(info.name);
})
```
说明：回调字段可能有修改

#### 3.是否安装某个应用
接口名：
core.hasInstalled
传入参数：
(opt, function(info){})
opt参数示例：
```js
{
  "name": "xxx" // 需要判断的应用包名，具体的使用时候跟端定
}
```
回调示例：
```js
{
  status: {Boolean} // 是否已安装  true | false
}
```
H5调用示例：
```js
LBZSdk.app.hasInstalled({name: 'xxx'},function(res){
  console.log(res.status);
})
```

### 二、获取设备信息，网络状态
#### 1.获取设备信息
接口名：
core.getDeviceInfo
传入参数：
(function(info){})
回调示例：
```js
{
  deviceId: '{String}', // 设备唯一标示符
  name: '{String}',  // 设备名称 XiaoMi、Iphone
  version: '{String}', // 系统版本 10.2
  screen: { // 屏幕分辨率
    width: '{Number}', // 宽
    height: '{Number}' // 高
  }
}
```
H5调用示例：
```js
LBZSdk.device.getInfo(function(info){
  console.log(info.deviceId);
})
```
#### 2.获取电量
接口名：
core.getPowerLevel
传入参数：
(function(power){})
回调示例：
```js
{
  level: {Number} // 当前电量0-100
}
```
H5调用示例：
```js
LBZSdk.device.getPower(function(power){
  console.log(power.level);
})
```
#### 3.获取设备存储空间
接口名：
core.getSpaceSize
传入参数：
(function(size){})
回调示例：
```js
{
  spaceSize: {Number}, // 字节 剩余存储空间大小
  totalSize: {Number} // 字节 总存储空间大小
}
```
H5调用示例：
```js
LBZSdk.device.getSpaceSize(function(size){
  console.log(size.spaceSize);
})
```
#### 4.监听屏幕旋转
接口名：
core.onOrientationChange
传入参数：
(function(net){})
回调示例：
```js
{
  orientation: '{String}', // 当前屏幕方向 landscape | portrait
}
```
H5调用示例：
```js
LBZSdk.device.on('onOrientationChange', function(res){
  console.log(res.orientation);
})
```
#### 5.设置屏幕方向
接口名：
core.setOrientation
传入参数：
(opt, function(net){})
opt参数示例：
```js
{
  "orientation": "landscape" // 屏幕方向 landscape | portrait | auto
}
```
回调示例：
```js
{
  status: {Boolean}, // true | false 是否设置成功
}
```
H5调用示例：
```js
LBZSdk.device.setOrientation({"orientation": "landscape"}, function(res){
  console.log(res.status);
})
```
#### 6.获取网络
接口名：
core.getNetwork
传入参数：
(function(net){})
回调示例：
```js
{
  type: '{String}',   // 2G|3G|4G|wifi|unknown|none 当前网络类型
  operator: '{String}'  // CUCC（中国联通）|CMCC（中国移动）|CTCC（中国电信） 通信运营商
}
```
H5调用示例：
```js
LBZSdk.network.getInfo(function(net){
  console.log(net.type);
})
```
#### 7.监听网络
接口名：
core.onNetworkChange
传入参数：
(function(net){})
回调示例：
```js
{
  now: '{String}', //2G|3G|4G|wifi|unknown|none 当前网络类型
  pre: '{String}'  //2G|3G|4G|wifi|unknown|none 上次网络类型
}
```
H5调用示例：
```js
LBZSdk.network.on('onNetworkChange', function(net){
  console.log(net.now);
})
```


### 三、登陆和用户
#### 1.获取登陆信息
接口名：
fun.isLogin
传入参数：
(function(flag){})
回调示例：
```js
{
  login: {Boolean}, // 是否登陆 true | false
}
```
H5调用示例：
```js
LBZSdk.user.isLogin(function(flag){
  console.log(flag);
})
```
#### 2.获取用户信息
接口名：
fun.getUserInfo
传入参数：
(function(info){})
回调示例：
```js
{
  name: '{String}', // 用户名
  nickname: '{String}', // 用户昵称
  email: '{String}', // 邮箱
  uid: '{String}', // uid
  img: '{String}', // 用户头像
  status: {Number} // 用户状态：0:正常 1:已禁用 ...
}
```
H5调用示例：
```js
LBZSdk.user.getInfo(function(info){
  console.log(info.name);
})
```
说明：如果获取不到用户信息则返回为空{}
#### 3.登陆
接口名：
fun.userLogin
传入参数：
(function(info){})
回调示例：
```js
{
  name: '{String}', // 用户名
  nickname: '{String}', // 用户昵称
  email: '{String}', // 邮箱
  uid: '{String}', // uid
  img: '{String}', // 用户头像
  status: {Number} // 用户状态：0:正常 1:已禁用 ...
}
```
H5调用示例：
```js
LBZSdk.user.login(function(info){
  console.log(info.name);
})
```
~~#### 4.登出（废弃）~~
~~接口名：~~
~~fun.userLogout~~
~~传入参数：~~
~~(function(res){})~~
~~回调示例：~~
```js
~~{~~
~~  status: '{Boolean}' // 是否登出成功 true | false~~
~~}~~
```
~~H5调用示例：~~
```js
~~LBZSdk.user.logout(function(res){~~
~~  console.log(res.status);~~
~~})~~
```
~~#### 5.监听登陆状态改变（废弃）~~
~~接口名：~~
~~fun.onLoginChange~~
~~传入参数：~~
~~(function(res){})~~
~~回调示例：~~
```js
~~{~~
~~  action: '{String}', // 动作名称（login | logout）~~
~~  name: '{String}', // 用户名~~
~~  nickname: '{String}', // 用户昵称~~
~~  email: '{String}', // 邮箱~~
~~  uid: '{String}', // uid~~
~~  img: '{String}', // 用户头像~~
~~  status: {Number} // 用户状态：0:正常 1:已禁用 ...~~
~~}~~
```
~~H5调用示例：~~
```js
~~LBZSdk.user.on('onLoginChange', function(res){~~
~~  console.log(res.action);~~
~~})~~
```
~~说明：当action是logout时，其他字段为空~~


### 四、客户端存取数据
#### 1.存储数据
接口名：
fun.setData
传入参数：
(opt, function(res){})
opt示例如下：
```js
{
  key: '{String}', // 存储的key
  value: '{String}}' // 存储的内容
}
```
回调示例：
```js
{
  status: {Boolean}, // 是否存储成功 true | false
}
```
H5调用示例：
```js
LBZSdk.data.setData({key: 'abc', value: '123'}, function(res){
  if(res.status === false){
    console.log('存储失败');
  }
})
```
#### 2.读取数据
接口名：
fun.getData
传入参数：
(opt, function(res){})
opt示例如下：
```js
{
  key: ["abc", "123"] // 获取的key数组
}
```
回调示例：
```js
{
  data: ['111', '222'], // 数据信息数组，单个元素类型可以是String,Number,JSONString
}
```
H5调用示例：
```js
LBZSdk.data.getData({key: ["abc", "123"]}}, function(res){
  console.log('获取的数据为：', res.data);
})
```
说明：如果获取不到数据则返回结果里data为空

#### 3.复制到系统剪切板
接口名：
fun.copyToClipboard
传入参数：
(opt, function(res){})
opt示例如下：
```js
{
  data: 'abc123'
}
```
回调示例：
```js
{
  status: {Boolean}, // 是否复制成功  true | false
}
```
H5调用示例：
```js
LBZSdk.data.copyToClipboard({key: 'abc'}}, function(res){
  console.log('获取的数据为：', res.status);
})
```

#### 4.读取系统剪切板内容
接口名：
fun.getClipboard
传入参数：
(function(res){})
回调示例：
```js
{
  data: '{String}', // 剪切板数据，类型可以是String,Number,JSONString
}
```
H5调用示例：
```js
LBZSdk.data.getClipboard(function(res){
  console.log('获取的数据为：', res.data);
})
```
说明：如果获取不到数据则返回结果里data为空

### 五、webView相关
#### 1.打开新窗口
接口名：
fun.openWebview
传入参数：
(opt)
opt示例如下：
```js
{
  url: '{String}', // 打开的链接
  type: '{String}' // 新webview打开还是当前
}
```
说明：type 可选"new"和"cur"，指定是否需要新开webview，默认"cur"
回调示例：
```js
无回调
```
H5调用示例：
```js
LBZSdk.win.open({url: 'http://www.le.com', type: 'new'});
```
#### 2.窗口前进一页
接口名：
fun.WebviewForward
传入参数：
(function(res){})
回调示例：
```js
{
  status: '{Boolean}', // 前进结果 true | false
}
```
H5调用示例：
```js
LBZSdk.win.forward(function(res){
  console.log(res.status);
})
```
说明：当webview里没有下一页的时候status返回false

#### 3.窗口后退一页
接口名：
fun.WebviewBack
传入参数：
(function(res){})
回调示例：
```js
{
  status: '{Boolean}', // 后退结果 true | false
}
```
H5调用示例：
```js
LBZSdk.win.back(function(res){
  console.log(res.status);
})
```
说明：当webview里没有上一页的时候status返回false

#### 4.调起APP原生页面
接口名：
fun.openNative
传入参数：
(opt)
opt示例如下：
```js
{
  url: '{String}' // APP内页面地址
}
```
回调示例：
```js
无回调
```
H5调用示例：
```js
LBZSdk.win.openNative({url: 'user_center'});
```
说明：传入的url需要提前知道


### 六、弹框
#### 1.打开弹框
接口名：
fun.Alert
传入参数：
(opt, function(res){})
opt示例如下：
```js
{
  title: '{String}', // 标题
  content: '{String}}', // 内容
  buttons: '{Array}' // 显示按钮的文字，最多两个，如：['确定'] 或 ['Yes'] 或 ['是','否']
}
```
回调示例：
```js
{
  btn: '{String}' // 用户点击的按钮  ok | cancel
}
```
H5调用示例：
```js
LBZSdk.alert.open({title: '显示标题', content: '显示的内容', buttons: ['好的','取消']}, function(res){
  if(res.btn === 'cancel'){
    console.log('用户点击了取消按钮');
  } else {
    console.log('用户点击了确定按钮');
  }
});
```
说明：1.如果传入的参数中buttons只有一个，则默认显示"确认"按钮
     2.如果之前已有一个弹出框了，则覆盖之前的
#### 2.toast
接口名：
fun.Toast
传入参数：
(opt)
opt示例如下：
```js
{
  dur: '{Number}', // 显示时长,单位：毫秒,默认2000 如：2500
  pos: {Number},  // 显示位置， 0 | 1 | 2 | 3 | 4 （0:center,1:left,2:right,3:top,4:bottom）
  content: {String} // 显示的内容，其中 \n 为换行符
}
```
回调示例：
```js
无回调
```
H5调用示例：
```js
LBZSdk.alert.toast({dur: 3000, pos: 0, content: '分享成功\n获得20金币'})
```


### 七、分享
#### 1.打开分享弹框
接口名：
fun.openShare
传入参数：
(opt, function(){})
opt示例如下：
```js
{
  title: '', // 自定义分享标题
  desc: '', // 自定义分享内容
  link: '', // 自定义分享链接
  imgUrl: '' // 自定义分享图标
}
```
回调示例：
```js
{
  code: {Number}, // 分享状态码（200表示成功，400表示用户取消等，具体定义待确定）
  channel: {String} // 用户点击的分享渠道 （一期共三种 wxTimeline | wxFriend | weibo）
}
```
H5调用示例：
```js
LBZSdk.share.open({
  title: '自定义分享标题',
  desc: '自定义分享内容',
  link: '自定义分享链接',
  imgUrl: '自定义分享图标'
}, function(res){
  console.log('分享渠道：' + res.channel + ';分享结果：' + res.code);
});
```
说明：1.一期只支持三种渠道分享：微信朋友圈，微信好友，新浪微博

~~#### 2.分享（废弃）~~
~~接口名：~~
~~fun.callShare~~
~~传入参数：~~
~~(opt, function(res){})~~
~~opt示例如下：~~
```js
~~{~~
~~  channelName: 'wxFriend', //分享渠道：weibo|wxFriend|wxTimeline~~
~~  title: '', // 自定义分享标题~~
~~  desc: '', // 自定义分享内容~~
~~  link: '', // 自定义分享链接~~
~~  imgUrl: '', // 自定义分享图标~~
~~}~~
```
~~回调示例：~~
```js
~~{~~
~~  code: {Number} // 分享结果code，需具体定义，如：200表示分享成功，400表示用户取消分享等...~~
~~}~~
```
~~H5调用示例：~~
```js
~~LBZSdk.share.callShare({~~
~~  channelName: 'wxFriend',~~
~~  title: '自定义分享标题',~~
~~  desc: '自定义分享内容',~~
~~  link: '自定义分享链接',~~
~~  imgUrl: '自定义分享图标'~~
~~}, function(res){~~
~~  if(res.code === 200){~~
~~    console.log('分享成功了，恭喜');~~
~~  }~~
~~})~~
```
~~说明：传入的参数可能需要根据不同的渠道差异化~~


### 八、支付
#### 1.调用支付
接口名：
fun.pay
传入参数：
(opt, function(res){})
opt示例如下：
```js
{
  goodsId: '{String}', // 商品id
  channel: '{String}' // 支付渠道 weixin | alipay | applepay
}
```
回调示例：
```js
{
  code: {Number} // 支付结果code,需具体定义，如：200表示支付成功，400表示用户取消支付，401表示传入的金额与订单实际金额不符等...
}
```
H5调用示例：
```js
LBZSdk.pay.payOrder({orderId: 'abcd1234', channel: 'weixin'}, function(res){
  if(res.code === 200){
    console.log('支付成功');
  } else if(res.code === 400){
    console.log('用户取消支付');
  } else {
    其他情况需具体定义
  }
});
```

### 九、缓存
#### 1.更新缓存
接口名：
fun.updateCache
传入参数：
(function(res){})
回调示例：
```js
{
  status: {Boolean} // 是否更新成功 true | false
}
```
H5调用示例：
```js
LBZSdk.cache.updateCache(function(res){
  console.log(res.status);
});
```

+ 目前能想到的接口文档大致如此，做的过程中会有删改