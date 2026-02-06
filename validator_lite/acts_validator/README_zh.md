# acts_validator

- ## 简介

  acts_validator 是lite应用工程，提供了运动表上组件及API接口测试用例

- ## 测试内容

  | 组件           | 说明                                                    |
  | -------------- | ------------------------------------------------------- |
  | chart(bar)     | 柱状图                                                  |
  | chart(line)    | 线形图                                                  |
  | image-animator | 图片帧动画播放器                                        |
  | input          | 交互式组件，包括单选框，多选框，按钮                    |
  | list-item      | 展示列表具体item                                        |
  | longpress      | 长按动作触发该事件                                      |
  | marquee        | 跑马灯组件，用于展示一段单行滚动的文字                  |
  | opacity        | 元素的透明度，取值范围为0-1，1表示不透明，0表示完全透明 |
  | picker-view    | 滑动选择器                                              |
  | progress       | 进度条                                                  |
  | qrcode         | 生成并显示二维码                                        |
  | slider         | 滑动条组件                                              |
  | swipe(event)   | 组件上快速滑动触发                                      |
  | swiper         | 滑动容器，提供切换子组件显示的能力                      |
  | switch         | 开关选择器                                              |
  | transition     | 平移动画                                                |

  | API              | 说明                                                         |
  | ---------------- | ------------------------------------------------------------ |
  | 应用上下文       | 获取当前应用文件中声明的信息                                 |
  | 应用配置         | 获取应用当前的语言和地区                                     |
  | 定时器(timeout)  | 设置一个定时器，取消先前通过调用setTimeout()建立的定时器     |
  | 定时器(interval) | 重复调用一个函数，取消先前通过setInterval()设置的重复定时任务 |
  | 数据存储         | 读取，修改，清空，删除存储的内容                             |
  | 文件存储         | 对文件的读写，移动，拷贝，删除等操作                         |
  | 振动             | 触发设备振动                                                 |
  | 传感器(计步)     | 订阅计步传感器数据变化，取消订阅计步传感器                   |
  | 传感器(气压)     | 订阅气压传感器数据变化，取消订阅气压传感器                   |
  | 传感器(心率)     | 订阅心率传感器数据变化，取消订阅心率传感器                   |
  | 传感器(佩戴)     | 订阅设备佩戴状态，取消订阅设备佩戴状态，获取设备佩戴状态     |
  | 传感器(加速度)   | 观察加速度数据变化，取消订阅加速度                           |
  | 传感器(陀螺仪)   | 观察陀螺仪数据变化，取消订阅陀螺仪数据                       |
  | 地理位置(info)   | 获取设备地理位置，当前设备支持的定位类型，坐标系类型         |
  | 地理位置(订阅)   | 订阅设备的地理位置信息，取消订阅设备的地理位置信息           |
  | 设备信息         | 获取当前设备的信息                                           |
  | 屏幕亮度(value)  | 获取和设置当前屏幕亮度值                                     |
  | 屏幕亮度(Mode)   | 获取和设置屏幕亮度模式                                       |
  | 电量信息         | 获取设备当前的充电状态及剩余电量                             |
  | NFC卡片          | 操作及管理NFC卡模拟                                          |

  参考[运动表应用开发](https://e.gitcode.com/kunyuan-hongke/repos/cooperation-team-L0UI/doc/tree/master/%E8%BF%90%E5%8A%A8%E8%A1%A8%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91)

- ## 编译说明

  1. 修改`hvigor/hvigor-config.json5`文件

     ~~~
       "hvigorVersion": "4.0.5",
       "dependencies": {
         "@ohos/hvigor-ohos-plugin": "4.0.5"
       },
     ~~~

     改成

     ~~~
       "modelVersion": "6.0.0",
       "dependencies": {
       },
     ~~~

  2. 使用开发工具打开工程，开发工具[下载地址](https://developer.huawei.com/consumer/cn/download/deveco-studio)。

  3. 配置自动签名，选择菜单项 File -> Project Structure... ，在弹出的 Project Structure 窗口中 Signing Configs 项，启用 Automatically generate signature 选项以实现签名自动生成，完成设置后，依次点击 Apply 和 OK 按钮。

  4. 构建bin包，执行 Build -> Build Hap(s)/APP(s) -> Build Hap(s) ，生成bin包。

- ## 安装说明

  使用标准工具将bin包传输至设备，例如放置在`/usr`目录下，通过串口或其他标准通讯接口进行bin包的安装
  
- ## 测试方法

  对于每项测试，点击`？`按钮查详细项测试说明，测试结束后，需在首页点击`生成报告`按钮以生成测试文件
  
- ## 报告说明

  取应用沙箱路径下的`summary_report.json`文件，具体路径例如：`/user/app/user/ace/data/com.examplemini.actsvalidator`下
  
  文件格式如下：
  
  ~~~
  char(bar):false;char(line):true ;
  ~~~
  
  说明：`char(bar):false;`表示char组件的柱状图测试失败
  
  ​		    `char(line):true ;`表示char组件的线形图测试成功
  
- ## 约束

  DevEco版本需 5.0.3.500 ，OpenHarmony SDK 版本 API 12

​		