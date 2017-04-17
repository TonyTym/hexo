---
title: letv
tags:
  - dialry
date: 2017-04-17 10:27:58
categories:
---

### components里form和table新加的功能
<!-- more -->

### 一、form组件扩展
#### 1.input后支持增加颜色选择器
+ 示例：
```js
{
    prop:’bgColor’,
    type:’colorPicker’,
    colorChange: function(){},
    colorPickerStyle: 'line-height: normal;position: absolute;font-size: 0;margin-left:10px;'
}
```
+ 效果图：
<img src="http://onm9ileaw.bkt.clouddn.com/letv/1.png">

#### 2.form表单里输入框后支持按钮和tag && leInput支持复合型输入
+ 示例:
<img src="http://onm9ileaw.bkt.clouddn.com/letv/2.png">
+ 效果图：
<img src="http://onm9ileaw.bkt.clouddn.com/letv/3.png">

### 二、table组件扩展
#### 1.table里按钮支持自定义样式
示例：
```js
attributes:[
{
    prop: '',
    title: '',
    value: 1,
    disabled: false,
    onclick: this.closeStatus,
    style: 'color:red'
}
]
```
#### 2.table里普通显示文字支持自定义样式
#### 3.table的custom类型支持传入disabled
示例：
```js
attributes:[{
    prop: 'modManage',
    label: '模块管理',
    type: 'ifelsetext',
    width: '100',
    options: [
        {
    	    prop: 'isEditing',
        	value: false,
            style: 'color:blue;cursor:pointer;text-align:center',
            onclick: this.manageModule
        },
        {
        	prop: 'isEditing',
            value: true,
            style: 'color:red;cursor:pointer;text-align:center',
            onclick: this.unlockPage
        }
    ]
}]
```
#### 4.table里支持列排序 
示例：
```js
attributes: [
{
    prop: 'id',
    label: '页面ID',
    width: '100',
    sortable: true
}
]
```
#### 5.table新增ifelsetext类型
示例：
```js
attributes:[{
    prop: 'modManage',
    label: '模块管理',
    type: 'ifelsetext',
    width: '100',
    options: [
        {
    	    prop: 'isEditing',
        	value: false,
            style: 'color:blue;cursor:pointer;text-align:center',
            onclick: this.manageModule
        },
        {
        	prop: 'isEditing',
            value: true,
            style: 'color:red;cursor:pointer;text-align:center',
            onclick: this.unlockPage
        }
    ]
}]
```
+ 效果图：
<img src="http://onm9ileaw.bkt.clouddn.com/letv/4.png">