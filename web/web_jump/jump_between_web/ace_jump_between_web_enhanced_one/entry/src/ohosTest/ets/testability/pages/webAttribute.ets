/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import { JsProxyObject } from '../../test/Interfaces';
import webView from '@ohos.web.webview';

@Entry
@Component
struct webAttribute {
  controller: WebController = new WebController()
  dialogController: CustomDialogController | null = null
  @State str: string = "emitUserAgent"
  @State loadedResource: string = ""
  @State progress: string = ""
  @State newUrl: string = ""
  @State pageBegin: string = ""
  @State pageEnd: string = ""
  @State console: string = ""
  @State confirm: string = ""
  @State alert: string = ""
  @State errorReceive: string = ""
  @State httpErrorReceive: number = 0
  @State titleReceive: string = ""
  @State isDownloadStart: boolean = false
  @State javaScriptAccess: boolean = true
  @State fileAccess: boolean = true
  @State domStorageAccess: boolean = false
  @State imageAccess: boolean = true
  @State geolocationAccess: boolean = true
  @State onlineImageAccess: boolean = true
  @State databaseAccess: boolean = true
  @State initialScale: number = 100
  @State enterPageEnd: boolean = false
  @State newScale: number = 0
  @State scaleChange: boolean = false
  @State geoShow: boolean = false
  @State mixedMode: MixedMode = MixedMode.All
  @State cacheMode: CacheMode = CacheMode.Default
  @State cacheError: boolean = false
  @State mixedSwitch: boolean = false
  @State mixedAllSwitch: boolean = false
  @State webVisibility: Visibility = Visibility.Visible
  @State isProgressFinish: boolean = false
  @State isHttpErrorReceive: boolean = false
  @State isLargeThan: boolean = false
  @State RegisterJavaScriptProxyFlag: boolean = false
  @State testMultiWindowAccess: boolean = true;
  @State testAllowWindowOpenMethod: boolean = true;
  @State OnWindowNewCallBack: boolean = false
  @State OnWindowExtCallBack: boolean = false

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      console.info("ets toString:" + String(res));
    },
    toString: (str: string) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: object) => {
      if (res) {
        console.info('register:' + res)
      }
      return "web222"
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebAttribute click").key('WebAttributeButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testJavaScriptAccess001": {
              try {
                this.javaScriptAccess = false
                await Utils.sleep(2000);
                this.controller.runJavaScript({ script: "jsAccess()" })
                await Utils.sleep(2000);
                if (this.console !== "web111") {
                  let javaScriptAccessCalled = true
                  Utils.emitEvent(javaScriptAccessCalled, 32019)
                }
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 32019)
              }
              break;
            }

            case "testGeolocationAccess001": {
              try {
                this.javaScriptAccess = true
                this.geolocationAccess = false
                this.controller.loadUrl({ url: "resource://rawfile/geolocation.html" });
                await Utils.sleep(2000)
                this.controller.runJavaScript({ script: "getGeoResult()", callback: (res) => {
                  console.info("getGeoResult==>" + res)
                  Utils.emitEvent(res, 31020)
                  this.geolocationAccess = true
                } })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 31020)
                this.geolocationAccess = true
              }
              break;
            }

            case "testOnResourceLoad001": {
              try {
                this.controller.loadUrl({ url: "resource://rawfile/geolocation.html" });
                await Utils.sleep(2000)
                Utils.emitEvent(this.loadedResource, 31021)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 31021)
              }
              break;
            }

            case "testOnWindowNew001": {
              try {
                this.OnWindowNewCallBack = false;
                this.javaScriptAccess = true;
                this.testAllowWindowOpenMethod = true;
                this.testMultiWindowAccess = true;
                this.controller.loadUrl({ url: "resource://rawfile/onWindowNew.html" });
                await Utils.sleep(2000)
                this.controller.runJavaScript({ script: "onWindowNew()", callback: (res) => {
                  console.log('OpenNewWindow: ' + JSON.stringify(res));
                } })
                await Utils.sleep(2000)
                Utils.emitEvent(this.OnWindowNewCallBack, 30071)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testOnWindowNew002": {
              try {
                this.OnWindowNewCallBack = false;
                this.javaScriptAccess = true;
                this.testAllowWindowOpenMethod = false;
                this.testMultiWindowAccess = true;
                this.controller.loadUrl({ url: "resource://rawfile/onWindowNew.html" });
                await Utils.sleep(2000)
                this.controller.runJavaScript({ script: "onWindowNew()", callback: (res) => {
                  console.log('OpenNewWindow: ' + JSON.stringify(res));
                } })
                await Utils.sleep(2000)
                Utils.emitEvent(this.OnWindowNewCallBack, 30072)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testOnWindowNew003": {
              try {
                this.OnWindowNewCallBack = false;
                this.javaScriptAccess = false;
                this.testAllowWindowOpenMethod = false;
                this.testMultiWindowAccess = true;
                this.controller.loadUrl({ url: "resource://rawfile/onWindowNew.html" });
                await Utils.sleep(2000)
                this.controller.runJavaScript({ script: "onWindowNew()", callback: (res) => {
                  console.log('OpenNewWindow: ' + JSON.stringify(res));
                } })
                await Utils.sleep(2000)
                Utils.emitEvent(this.OnWindowNewCallBack, 30073)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testMultiWindowAccess001": {
              try {
                this.OnWindowNewCallBack = false;
                this.javaScriptAccess = true;
                this.testAllowWindowOpenMethod = false;
                this.testMultiWindowAccess = false;
                this.controller.loadUrl({ url: "resource://rawfile/onWindowNew.html" });
                await Utils.sleep(2000)
                this.controller.runJavaScript({ script: "onWindowNew()", callback: (res) => {
                  console.log('OpenNewWindow: ' + JSON.stringify(res));
                } })
                await Utils.sleep(2000)
                Utils.emitEvent(this.OnWindowNewCallBack, 30074)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }



          }
        })
      }

      TextInput({ placeholder: "inputs your words" })
        .key('textInput')
        .type(InputType.Normal)
        .placeholderColor(Color.Blue)
        .placeholderFont({ size: 20, weight: FontWeight.Normal, family: "sans-serif", style: FontStyle.Normal })
        .enterKeyType(EnterKeyType.Next)
        .caretColor(Color.Green)
        .height(60)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .fontFamily("cursive")
        .fontStyle(FontStyle.Italic)
        .fontColor(Color.Red)
        .maxLength(20)
        .border({ width: 1, color: 0x317AF7, radius: 10, style: BorderStyle.Solid })
        .onClick(() => {
          console.info("TextInput click")
        })
      Web({ src: $rawfile('webPart1index.html'), controller: this.controller })
        .visibility(this.webVisibility)
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .geolocationAccess(this.geolocationAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .cacheMode(this.cacheMode)
        .initialScale(this.initialScale)
        .mixedMode(this.mixedMode)
        .userAgent("Mozila/5.0 (Linux; Andriod 9; VRD-AL10; HMSCore 6.3.0.331) AppleWebKit/537.36 " +
          "(KHTML, like Gecko) Chrome/92.0.4515.105 HuaweiBrowser/12.0.4.1 MobileSafari/537.36")
        .javaScriptProxy({
          object: this.jsObj,
          name: "backToEts",
          methodList: ["test", "toString"],
          controller: this.controller
        })
        .onConsole((event) => {
          if (event) {
            this.console = event.message.getMessage()
          }
          return false
        })
        .onPageBegin((event) => {
          if (event) {
            this.pageBegin = event.url
          }
        })
        .onPageEnd((event) => {
          if (event) {
            this.pageEnd = event.url
            console.log("onPageEnd==>")
          }
        })
        .onRefreshAccessedHistory((event) => {
          if (event) {
            console.info("onRefreshAccessedHistory==>")
            this.newUrl = event.url
          }

        })
        .onResourceLoad((event) => {
          if (event) {
            console.info("onResourceLoad==>" + event.url)
            this.loadedResource = event.url
          }
        })
        .multiWindowAccess(this.testMultiWindowAccess)
        .allowWindowOpenMethod(this.testAllowWindowOpenMethod)
        .onWindowNew((event) => {
          console.log("onWindowNew start");
          if (event) {
            let popController: webView.WebviewController = new webView.WebviewController();
            this.OnWindowNewCallBack = true
            event.handler.setWebController(null);
          }
        })
        .onWindowExit(() => {
          console.info("NewWebViewComp onWindowExit")
          this.OnWindowExtCallBack = true
        })
        .onErrorReceive((event) => {
          if (event) {
            console.log('getErrorInfo:' + event.error.getErrorInfo())
            Utils.emitEvent(event.error.getErrorInfo(), 3)
          }
        })
    }
  }
}
