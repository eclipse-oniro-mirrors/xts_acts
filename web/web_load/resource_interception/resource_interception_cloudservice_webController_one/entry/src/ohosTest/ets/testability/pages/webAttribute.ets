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

const EVENT_ID_SET_EMIT_KEY = 201700;

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
  @State console: string | null = null
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
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
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
          await Utils.waitForExist(()=>this.isReceive, 'WebAttributeButtonIsReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, 'WebAttributeButtonIsPageEnd', 1, 1000);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case "testGeolocationAccess001": {
              try {
                this.javaScriptAccess = true
                this.geolocationAccess = false
                this.isPageEnd = -1;
                this.controller.refresh();
                await Utils.waitForExist(()=>this.isPageEnd, 'refreshIsPageEnd', 1, 1000);
                this.isPageEnd = -1;
                this.controller.loadUrl({ url: "resource://rawfile/geolocation.html" });
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                this.controller.runJavaScript({ script: "getGeoResult()", callback: (res) => {
                  console.info("getGeoResult==>" + res)
                  Utils.emitEvent(res, 201710)
                  this.geolocationAccess = true
                } })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 201710)
                this.geolocationAccess = true
              }
              break;
            }

            case "testOnResourceLoad001": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl({ url: "resource://rawfile/geolocation.html" });
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                Utils.emitEvent(this.loadedResource, 201720)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 201720)
              }
              break;
            }

            case "testOnWindowNew001": {
              try {
                this.OnWindowNewCallBack = false;
                this.javaScriptAccess = true;
                this.testAllowWindowOpenMethod = true;
                this.testMultiWindowAccess = true;
                this.isPageEnd = -1;
                this.controller.loadUrl({ url: "resource://rawfile/onWindowNew.html" });
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                this.controller.runJavaScript({ script: "onWindowNew()", callback: (res) => {
                  console.log('OpenNewWindow: ' + JSON.stringify(res));
                  Utils.emitEvent(this.OnWindowNewCallBack, 201730)
                } })
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
                this.isPageEnd = -1;
                this.controller.loadUrl({ url: "resource://rawfile/onWindowNew.html" });
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                this.controller.runJavaScript({ script: "onWindowNew()", callback: (res) => {
                  console.log('OpenNewWindow: ' + JSON.stringify(res));
                  Utils.emitEvent(this.OnWindowNewCallBack, 201740)
                } })
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
                this.isPageEnd = -1;
                this.controller.loadUrl({ url: "resource://rawfile/onWindowNew.html" });
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                this.controller.runJavaScript({ script: "onWindowNew()", callback: (res) => {
                  console.log('OpenNewWindow: ' + JSON.stringify(res));
                  Utils.emitEvent(this.OnWindowNewCallBack, 201750)
                } })
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
                this.isPageEnd = -1;
                this.controller.loadUrl({ url: "resource://rawfile/onWindowNew.html" });
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                this.controller.runJavaScript({ script: "onWindowNew()", callback: (res) => {
                  console.log('OpenNewWindow: ' + JSON.stringify(res));
                  Utils.emitEvent(this.OnWindowNewCallBack, 201760)
                } })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testJavaScriptAccess001": {
              try {
                this.javaScriptAccess = false;
                this.isPageEnd = -1;
                this.controller.refresh();
                await Utils.waitForExist(()=>this.isPageEnd, 'refreshIsPageEnd', 1, 1000);
                this.controller.runJavaScript({ script: "jsAccess()" })
                await Utils.waitForExist(()=>this.console, 'waitNull', null, 1000, 5);
                if (this.console !== "web111") {
                  Utils.emitEvent(true, 201770)
                } else {
                  Utils.emitEvent(false, 201770)
                }
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(false, 201770)
              }
              break;
            }
          }
        })
      }

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
            if (this.str === 'testJavaScriptAccess001') {
              this.console = event.message.getMessage();
              console.log('this.console = ' + this.console);
            }
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
            this.isPageEnd = 1;
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