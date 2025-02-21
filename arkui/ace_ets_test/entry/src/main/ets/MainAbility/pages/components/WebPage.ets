/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// xxx.ets
import web_webview from '@ohos.web.webview'

class TestObj {
  constructor() {
  }

  test(data1: string, data2: string, data3: string): string {
    console.log("data1:" + data1)
    console.log("data2:" + data2)
    console.log("data3:" + data3)
    return "AceString"
  }

  toString(): void {
    console.log('toString' + "interface instead.")
  }
}

@Entry
@Component
struct WebComponent {
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State geolocationAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State onlineImageAccess: boolean = true;
  @State zoomAccess: boolean = true;
  @State accessBackward: boolean = true;
  @State accessForward: boolean = true;
  @State accessStep: boolean = true;
  @State password: boolean = true;
  @State tableData: boolean = true;
  @State wideViewModeAccess: boolean = true;
  @State overviewModeAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State textZoomAtio: number = 1;
  @State mixedMode: MixedMode = MixedMode.None
  @State cacheMode: CacheMode = CacheMode.None
  @State getHitTest: HitTestType = HitTestType.Unknown
  controller: WebController = new WebController();
  cookie: WebCookie = new WebCookie()
  testObj: TestObj = new TestObj()

  build() {
    Column() {
      Row() {
        Button('混合内容')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            this.mixedMode = MixedMode.All
          })
        Button('混合内容兼容性模式')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            this.mixedMode = MixedMode.Compatible
          })
        Button('不允许混合内容')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            this.mixedMode = MixedMode.None
          })
        Button('确认弹框')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            AlertDialog.show(
              {
                title: 'title',
                message: 'text',
                primaryButton: {
                  value: 'cancel',
                  action: () => {
                    console.info('Callback when the first button is clicked')
                  }
                },
                secondaryButton: {
                  value: 'ok',
                  action: () => {
                    console.info('Callback when the second button is clicked')
                  }
                },
                cancel: () => {
                  console.info('Closed callbacks')
                }
              }
            )
          })
        Button('警告弹框')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            AlertDialog.show(
              {
                title: 'title',
                message: 'text',
                confirm: {
                  value: 'button',
                  action: () => {
                    console.info('Button-clicking callback')
                  }
                },
                cancel: () => {
                  console.info('Closed callbacks')
                }
              }
            )
          })

      }

      Row() {
        Button('先缓存后在线')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            this.cacheMode = CacheMode.Online
          })
        Button('加载缓存')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            this.cacheMode = CacheMode.Only
          })
        Button('加载在线')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            this.cacheMode = CacheMode.None
          })
        Button('设置cookie')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            this.cookie.setCookie()
          })
        Button('保存cookie')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            this.cookie.saveCookie()
          })
      }

      Row() {
        Button(this.accessBackward ? '页面可后退' : '页面不可后退')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            this.accessBackward = this.controller.accessBackward()
          })
        Button(this.accessForward ? '页面可前进' : '页面不可前进')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            this.accessForward = this.controller.accessForward()
          })
        Button(this.accessStep ? '页面可前进1步' : '页面不可前进1步')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            this.accessStep = this.controller.accessStep(1)
          })
        Button('清空JavaScript方法')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            this.controller.deleteJavaScriptRegister('objName')
          })
        Button('Web组件获焦')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            this.controller.requestFocus()
          })
        Button('停止页面加载')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            this.controller.stop()
          })
      }

      Row() {
        Button('页面后退')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            this.controller.backward()
          })
        Button('页面前进')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            this.controller.forward()
          })
        Button('清理历史')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            this.controller.clearHistory()
          })
        Button('获取点击对象类型')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            let getHitTest = this.controller.getHitTest()
            if (getHitTest == HitTestType.EditText) {
              console.log('this getHitTest : Edit');
            } else if (getHitTest == HitTestType.Email) {
              console.log('this getHitTest : Email');
            } else if (getHitTest == HitTestType.HttpAnchor) {
              console.log('this getHitTest : Http');
            } else if (getHitTest == HitTestType.HttpAnchorImg) {
              console.log('this getHitTest : HttpImg');
            } else if (getHitTest == HitTestType.Img) {
              console.log('this getHitTest : Img');
            } else if (getHitTest == HitTestType.Map) {
              console.log('this getHitTest : Map');
            } else if (getHitTest == HitTestType.Phone) {
              console.log('this getHitTest : Phone');
            } else {
              getHitTest = HitTestType.Unknown
              console.log('this getHitTest : Unknown');
            }
          })
        Button('加载数据')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            this.controller.loadData({
              data: "<html><body bgcolor=\"white\">Source : <pre> source:</pre></body></html>",
              mimeType: "text/html",
              encoding: "UTF-8",
              baseUrl: "https://www.baidu.com",
              historyUrl: "https://www.gitee.com"
            })
          })
        Button('加载URL')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            this.controller.loadUrl({url:'https://www.baidu.com'});
            // this.controller.loadUrl(
            //   'https://www.baidu.com',
            //   [{ key: "div", value: "div" }])
          })
      }

      Row() {
        Button('页面重新激活')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            this.controller.onActive()
          })
        Button('页面暂停渲染')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            this.controller.onInactive()
          })
        Button('刷新页面')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            this.controller.refresh()
          })
        Button('注册JavaScript')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            this.controller.registerJavaScriptProxy({ object: this.testObj, name: 'objName', methodList: ['test', 'toString']});
            // this.controller.registerJavaScriptProxy(
            //   this.testObj,
            //   'objName',
            //   ['test', 'toString']
            // );
          })
        Button('执行JavaScript脚本')
          .margin({ right: 10 })
          .fontSize(15)
          .width(150)
          .onClick(() => {
            this.controller.runJavaScript({
              script: "test()",
              callback: (result: string) => {
                console.log('run javascript result : ' + result);
              }
            })
          })
      }

      Web({ src: "", controller: this.controller })
        .domStorageAccess(this.domStorageAccess)
        .fileAccess(this.fileAccess)
        .geolocationAccess(this.geolocationAccess)
        .imageAccess(this.imageAccess)
        .javaScriptAccess(this.javaScriptAccess)
        .mixedMode(this.mixedMode)
        .onlineImageAccess(this.onlineImageAccess)
        .zoomAccess(this.zoomAccess)
        .cacheMode(this.cacheMode)
        .tableData(this.tableData)
        .wideViewModeAccess(this.wideViewModeAccess)
        .overviewModeAccess(this.overviewModeAccess)
        .textZoomAtio(this.textZoomAtio)
        .databaseAccess(this.databaseAccess)
        .javaScriptProxy({
          object: this.testObj,
          name: 'objName',
          methodList: ['test', 'toString'],
          controller: this.controller,
        })
        .password(this.password)
    }
  }
}
