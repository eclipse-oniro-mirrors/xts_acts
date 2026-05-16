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
import business_error, { BusinessError } from '@ohos.base';
const EVENT_ID_SET_EIMIT_KEY = 142016;

@Entry
@Component
struct webController {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = "testStop001"
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
  @State isPageEnd: number = -1;
  @State isReceive:number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EIMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EIMIT_KEY)
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
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      console.info("ets toString:" + String(res));
    },
    toString: (str: string) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: object) => {
      if (this.registerJavaScriptProxyFlag == true) {
        Utils.emitEvent(String(res), 31008);
      }
      return "web222"
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebController click").key('WebControllerButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, this.str, 1);
          console.info("key==>" + this.str)
          this.isReceive = -1;
          switch (this.str) {

            case "testStop001": {
              try {
                let stopCalled = false
                this.controller.loadUrl("www.example.com")
                this.controller.stop()
                await Utils.waitForExist(()=>this.isPageEnd, this.str, 1);
                if (this.pageEnd !== 'www.example.com') {
                  stopCalled = true
                }
                Utils.emitEvent(stopCalled, 142026)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 142026)
              }
              break;
            }
            case 'emitLoadUrlWithHeaderErrorCode01': {
              try {
                this.controller.loadUrl(null, [{ headerKey: 'headerKey', headerValue: 'headerValue' }]);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(Number(error.code), 2025110602)
              }
              break;
            }
            case 'emitLoadUrlWithHeaderErrorCode02': {
              try {
                this.controller.loadUrl(undefined, [{ headerKey: 'headerKey', headerValue: 'headerValue' }]);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(Number(error.code), 2025110603)
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
        .onPageEnd(()=>{
          this.isPageEnd = 1;
        })
    }
  }
}
