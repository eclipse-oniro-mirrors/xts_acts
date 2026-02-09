/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import { waitForExist } from '../../test/WaitTest.test';
import webView from '@ohos.web.webview';

@CustomDialog
struct NewWebViewComp {
controller?: CustomDialogController
webviewController1: webView.WebviewController = new webView.WebviewController()
build() {
    Column() {
      Web({ src: "", controller: this.webviewController1 })
        .javaScriptAccess(true)
        .multiWindowAccess(false)
        .onWindowExit(()=> {
          console.info("NewWebViewComp onWindowExit")
          if (this.controller) {
            this.controller.close()
          }
          Utils.emitEvent(true, 133960);
        })
      }
  }
}

@Entry
@Component
struct webAttributeTwo {
  controller: WebController = new WebController()
  dialogController: CustomDialogController | null = null
  @State str: string = "emitUserAgent"
  @State flag: boolean = false;
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
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isNewPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 133950,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(133950)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }
  

  build() {
    Column() {
      Row() {
        Button("WebAttributeTwo click").key('WebAttributeButton').onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testOnWindowExit001": {
              try {
                this.flag = true
                this.OnWindowExtCallBack = false
                this.javaScriptAccess = true;
                this.testAllowWindowOpenMethod = true;
                this.testMultiWindowAccess = true;
                this.isPageEnd = -1;
                this.controller.loadUrl({ url: "resource://rawfile/onWindowExit.html" });
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.isNewPageEnd = -1;
                this.controller.runJavaScript({ script: "openWindowAllTwo()", callback: (res) => {
                  console.log('OpenWindowAll: ' + JSON.stringify(res));
                } })
                await waitForExist(() => this.isNewPageEnd, this.str, 0);
                
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
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
        .multiWindowAccess(this.testMultiWindowAccess)
        .allowWindowOpenMethod(this.testAllowWindowOpenMethod)
        .onWindowNew((event) => {
          console.log("onWindowNew start");
          if (this.dialogController) {
            console.log('bxb1')
            this.dialogController.close()
          }
          console.log('bxb2')
          let popController:webView.WebviewController = new webView.WebviewController()
          console.log('bxb3')
          this.dialogController = new CustomDialogController({
            builder: NewWebViewComp({webviewController1: popController})
          })
          this.dialogController.open()
          console.log('bxb6');
          event.handler.setWebController(popController)
          console.log('bxb7');
          this.isNewPageEnd = 0;
        })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
    }
  }
}
