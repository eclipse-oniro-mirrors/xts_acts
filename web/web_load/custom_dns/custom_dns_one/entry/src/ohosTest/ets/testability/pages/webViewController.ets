/**
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
import { waitForExist } from '../../test/WaitTest';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { JsProxyObject } from '../../test/Interfaces';
import image from '@ohos.multimedia.image';
import { Driver } from '@ohos.UiTest';

const EVENT_ID_SET_EMIT_KEY = 330000;

@Entry
@Component
struct webViewController {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State onScrollCallBack: boolean = false
  @State javaScriptAccess: boolean = true
  @State icon: image.PixelMap | undefined = undefined;
  @State onShowFileSelectorCallBack: boolean = false
  @State FileSelectorParamGetTitle: string = ''
  @State FileSelectorParamGetGetMode: number = 100
  @State FileSelectorParamGetGetAcceptType: Array<String> = []
  @State uri: string = "file://docs/storage/Users/currentUser/Documents/1.json";
  @State FileSelectorParamGetIsCapture: boolean = true
  @State FileSelectorResultHandleFileList: Array<String> = []
  @State enterPageEnd: boolean = false
  @State isPageEnd:number = -1;
  @State isReceive: number = -1;
  @State onOverScrollCallBack: boolean = false
  @State darkMode: WebDarkMode = WebDarkMode.Off
  @State forceDarkAccess: boolean = false
  @State userAgentPC:string = "";
  no_error: string = "no error happened"

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
      Utils.emitEvent(String(res), 102);
    },
    toString: (str: string) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: object) => {
      Utils.emitEvent(String(res), 86);
      return "web222"
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebViewController click").key('WebViewControllerButton').onClick(async () => {
          console.info('key==>' + this.str)
          await Utils.waitForExist(()=>this.isReceive, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
          this.isReceive = -1;
          let webRect = Utils.getComponentRect('RowSize');
          let X = Utils.getRectHorizontalCenterX(webRect)
          let Y = Utils.getRectVerticalCenterY(webRect)
          switch (this.str) {
            case "testSecureDnsModeOFF001": {
              try {
                webView.WebviewController.setHttpDns(webView.SecureDnsMode.OFF,
                  "https://www.example.com/dns-query{?dns}")
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.isPageEnd = -1;
                this.controller.loadUrl("https://www.example.com/");
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                console.log('title of this page: ' + this.controller.getTitle());
                Utils.emitEvent(this.controller.getTitle(), 330010)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 330010)
              }
              break;
            }

            case "testSecureDnsModeAUTO001": {
              try {
                webView.WebviewController.setHttpDns(webView.SecureDnsMode.AUTO,
                  "https://www.example.com/dns-query{?dns}")
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.isPageEnd = -1;
                this.controller.loadUrl("https://www.example.com/");
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                console.log("title of this page: " + this.controller.getTitle());
                Utils.emitEvent(this.controller.getTitle(), 330020)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 330020)
              }
              break;
            }

            case "testSecureDnsModeSECURE_ONLY001": {
              try {
                this.enterPageEnd = false
                webView.WebviewController.setHttpDns(webView.SecureDnsMode.AUTO,
                  "https://www.example.com/dns-query{?dns}")
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.isPageEnd = -1;
                this.controller.loadUrl("https://www.example.com/");
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                console.log("title of this page: " + this.controller.getTitle());
                Utils.emitEvent(this.controller.getTitle(), 330030);
                this.enterPageEnd = true
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 330030)
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .key("onShowFileSelectorKey")
        .javaScriptProxy({
          object: this.jsObj,
          name: "backToEts",
          methodList: ["test", "toString"],
          controller: this.controller
        })
        .onScroll((event) => {
          if (event) {
            console.info('onScroll x = ' + event.xOffset)
            console.info('onScroll y = ' + event.yOffset)
            this.onScrollCallBack = true
          }
        })
        .onOverScroll((event) => {
          if (event) {
            console.info('onOverScroll x = ' + event.xOffset)
            console.info('onOverScroll y = ' + event.yOffset)
            this.onOverScrollCallBack = true
          }
        })
        .onPageEnd((event) => {
          if (event) {
            this.enterPageEnd = true
            this.isPageEnd = 1;
          }
        })
        .onSslErrorEvent((event: SslErrorEvent) => {
          if (event) {
            console.log('onSslErrorEvent url: ' + event.url);
            console.log('onSslErrorEvent error: ' + event.error);
            console.log('onSslErrorEvent originalUrl: ' + event.originalUrl);
            console.log('onSslErrorEvent referrer: ' + event.referrer);
            console.log('onSslErrorEvent isFatalError: ' + event.isFatalError);
            console.log('onSslErrorEvent isMainFrame: ' + event.isMainFrame);
            console.log('onSslErrorEvent handler: ' + event.handler);
            event.handler.handleConfirm();
          }
        })
        .onShowFileSelector((event) => {
          if (event) {
            this.onShowFileSelectorCallBack = true
            console.log('MyFileUploader onShowFileSelector invoked')
            event.result.handleFileList([this.uri]);
            console.info('getTitle:', event.fileSelector.getTitle())
            console.info('getMode:', event.fileSelector.getMode())
            console.info('getAcceptType:', event.fileSelector.getAcceptType())
            console.info('isCapture:', event.fileSelector.isCapture())
            this.FileSelectorParamGetTitle = event.fileSelector.getTitle()
            this.FileSelectorParamGetGetMode = event.fileSelector.getMode()
            this.FileSelectorParamGetGetAcceptType = event.fileSelector.getAcceptType()
            this.FileSelectorParamGetIsCapture = event.fileSelector.isCapture()
          }
          return true
        })
        .fileAccess(true)
        .darkMode(this.darkMode)
        .forceDarkAccess(this.forceDarkAccess)
    }
    .key('RowSize')
  }
}
