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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import image from '@ohos.multimedia.image';
import { JsProxyObject } from '../../test/Interfaces';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';

@Entry
@Component
struct WebViewControllerPart3 {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerTwo: webView.WebviewController = new webView.WebviewController();
  nativePort: webView.WebMessagePort | null = null;
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ""
  @State pixelMap: image.PixelMap | undefined = undefined;
  @State javaScriptAccess: boolean = true
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = false;
  @State databaseAccess: boolean = true;
  @State checkEleResult: number[] = [];
  @State registerJavaScriptProxyFlag: boolean = false;
  @State console: string = ""
  @State arrTime: Array<number> = [0, 0]
  @State time: number = 0
  @State onScrollCallBack: boolean = false;
  @State onMessageEventCallBack: boolean = false
  @State ports: webView.WebMessagePort[] = [];
  @State userAgentPC:string = "";

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
        if (this.controller) {
          this.controller.loadUrl("resource://rawfile/index.html");
          this.controller.clearHistory()
        }
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
        Utils.emitEvent(String(res), 100075);
      }
      return "web222"
    }
  }


  build() {
    Column() {
      Row() {
        Button("WebViewController click").key('WebViewControllerTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "testPrefetchPage001": {
              try {
                this.arrTime = []
                this.controller.removeCache(true)
                this.controller.loadUrl('https://www.huawei.com')
                await Utils.sleep(3000)
                this.controller.removeCache(true);
                await Utils.sleep(3000)
                this.controller.prefetchPage('https://www.huawei.com');
                await Utils.sleep(3000)
                this.controller.loadUrl('https://www.huawei.com')
                await Utils.sleep(3000)
                if (this.arrTime[1] - this.arrTime[0] < 0) {
                  Utils.emitEvent(true, 100079)
                } else {
                  Utils.emitEvent(false, 100079)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onConsole((event) => {
          if (event) {
            this.console = event.message.getMessage()
          }
          return false
        })
        .onFirstContentfulPaint(event => {
          if (event) {
            console.log("onFirstContentfulPaint:" + "[navigationStartTick]:" +
            event.navigationStartTick + ", [firstContentfulPaintMs]:" +
            event.firstContentfulPaintMs)
            this.time = event.firstContentfulPaintMs - event.navigationStartTick / 1000
            this.arrTime.push(this.time)
          }
        })
        .onScroll((event) => {
          if (event) {
            console.info("onScroll x = " + event.xOffset)
            console.info("onScroll y = " + event.yOffset)
            this.onScrollCallBack = true
          }
        })
        .onPageEnd((event) => {
          if (event) {
            if (this.onMessageEventCallBack) {
              this.ports = this.controller.createWebMessagePorts(true);
              this.controller.postMessage("init_web_messageport", [this.ports[1]], "*");
              this.nativePort = this.ports[0];
              this.nativePort.onMessageEvent((result) => {
                if (result) {
                  console.log(`log error result: ${result}`);
                }
              });
            }
            console.log('url:' + event.url)
          }
        })
      Web({ src: $rawfile('indexTwo.html'), controller: this.controllerTwo })
        .id('2')
        .key('web2')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
    }
  }
}
