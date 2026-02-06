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

const EVENT_ID_SET_EMIT_KEY = 201780;

@Entry
@Component
struct webController {
  controller: WebController = new WebController()
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
  @State registerJavaScriptProxyFlag: boolean = false
  @State zoomAccess: boolean = false
  @State requestFocus: boolean = false
  isReceive: number = -1;
  isPageEnd: number = -1;

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
        this.titleReceive = '';
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebController click").key('WebControllerButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, 'WebControllerButtonIsReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, 'WebControllerButtonIsPageEnd', 1, 1000);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case "testImageAccess001": {
              try {
                this.imageAccess = false;
                this.isPageEnd = -1;
                this.controller.refresh();
                await Utils.waitForExist(()=>this.isPageEnd, 'refreshIsPageEnd', 1, 1000);
                this.isPageEnd = -1;
                this.controller.loadUrl({ url: "resource://rawfile/index.html" });
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                this.controller.runJavaScript({ script: "getImgResult01()", callback: (res) => {
                  console.info("getImgResult==>" + res)
                  Utils.emitEvent(res, 201790)
                } })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 201790)
              }
              break;
            }

            case "testImageAccess002": {
              try {
                this.imageAccess = true
                this.isPageEnd = -1;
                this.controller.refresh();
                await Utils.waitForExist(()=>this.isPageEnd, 'refreshIsPageEnd', 1, 1000);
                this.isPageEnd = -1;
                this.controller.loadUrl({ url: "resource://rawfile/index.html" });
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                this.controller.runJavaScript({ script: "getImgResult02()", callback: (res) => {
                  console.info("getImgResult==>" + res)
                  Utils.emitEvent(res, 201800)
                } })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 201800)
              }
              break;
            }

            case "testOnlineImageAccess001": {
              try {
                this.onlineImageAccess = false
                this.isPageEnd = -1;
                this.controller.refresh();
                await Utils.waitForExist(()=>this.isPageEnd, 'refreshIsPageEnd', 1, 1000);
                this.isPageEnd = -1;
                this.controller.loadUrl({ url: "resource://rawfile/onlineImageAccess.html" });
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                this.controller.runJavaScript({ script: "getImageLoadResult()", callback: (res) => {
                  console.info("getImageLoadResult==>" + res)
                  Utils.emitEvent(res, 201810)
                } })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 201810)
              }
              break;
            }

            case "testOnlineImageAccess002": {
              try {
                this.onlineImageAccess = true
                this.isPageEnd = -1;
                this.controller.refresh();
                await Utils.waitForExist(()=>this.isPageEnd, 'refreshIsPageEnd', 1, 1000);
                this.isPageEnd = -1;
                this.controller.loadUrl({ url: "resource://rawfile/onlineImageAccess.html" });
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                this.controller.runJavaScript({ script: "getImageLoadResult()", callback: (res) => {
                  console.info("getImageLoadResult==>" + res)
                  Utils.emitEvent(res, 201820)
                } })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 201820)
              }
              break;
            }

            case "testFileAccess001": {
              try {
                this.fileAccess = true
                this.isPageEnd = -1;
                this.controller.loadUrl({ url: "resource://rawfile/index.html" });
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                this.isPageEnd = -1;
                this.controller.runJavaScript({ script: "openRawFile()" })
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                this.controller.runJavaScript({ script: "getTitle()", callback: (res) => {
                  Utils.emitEvent(res, 201830)
                } })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 201830)
              }
              break;
            }

            case "testFileAccess002": {
              try {
                this.fileAccess = false
                this.isPageEnd = -1;
                this.controller.loadUrl({ url: "resource://rawfile/index.html" });
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                this.isPageEnd = -1;
                this.controller.runJavaScript({ script: "openRawFile()" })
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                this.controller.runJavaScript({ script: "getTitle()", callback: (res) => {
                  Utils.emitEvent(res, 201840)
                } })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 201840)
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
        .userAgent("Mozila/5.0 (Linux; Andriod 9; VRD-AL10; HMSCore 6.3.0.331) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.105 HuaweiBrowser/12.0.4.1 MobileSafari/537.36")
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
        .onTitleReceive((event) => {
          if (event) {
            console.log('onTitleReceive title:' + event.title)
            this.titleReceive = event.title
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
          console.info("onResourceLoad==>" + event.url)
          this.loadedResource = event.url
        })
        .zoomAccess(this.zoomAccess)
        .onBlur(() => {
          console.info("onBlur==>")
          this.controller.requestFocus()
        })
        .onFocus(() => {
          this.requestFocus = true
        })
    }
  }
}