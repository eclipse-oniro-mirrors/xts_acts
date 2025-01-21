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
import web_webview from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct DNSHostIP {
  @State userAgentPC:string = "";
  @State hostName: string | null | undefined= 'www.baidu.com';
  @State str: string = "";
  @State getURL: string = "";
  @State getURL1: string = "";
  @State getURL2: string = "";
  @State getURL3: string = "";
  @State getURL4: string = "";
  @State value: boolean = false;
  @State isMetaViewport: boolean | null | undefined = false;
  controller: web_webview.WebviewController = new web_webview.WebviewController();

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

  build() {
    Column() {
      Row() {
        Button("DNSHostIP").id('DNSHostIP').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "setHostIP0100": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 8770)
                  break;
                }else if ((this.userAgentPC).includes("Tablet")){
                  Utils.emitEvent(true, 8770)
                  break;
                }
              this.value = false;
              this.getURL = '';
              this.getURL1 = '';
              try {
                web_webview.WebviewController.setHostIP('www.baidu.com', '124.95.179.4', 30);
                await Utils.sleep(3000);
                this.controller.loadUrl('www.baidu.com');
                await Utils.sleep(5000);
                this.getURL = this.controller.getUrl();
                console.log('setHostIP0100_getUrl: ' + this.getURL);
                await Utils.sleep(2000);
                web_webview.WebviewController.clearHostIP('www.dnstest.com');
                this.controller.removeCache(true);
                await Utils.sleep(65000);
                this.controller.loadUrl('www.baidu.com');
                await Utils.sleep(5000);
                this.getURL1 = this.controller.getUrl();
                console.log('setHostIP0100_getUrl: ' + this.getURL1)
                if (this.getURL != this.getURL1) {
                  this.value = true;
                }
                console.log('setHostIP0100_value: ' + this.value)
                this.controller.removeCache(true);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                Utils.emitEvent(this.value, 8770)
              }, 3000)
              break;
            }
            case "setHostIP1200": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 8771)
                  break;
                }else if ((this.userAgentPC).includes("Tablet")){
                  Utils.emitEvent(true, 8771)
                  break;
                }
              this.value = false;
              this.getURL = '';
              this.getURL1 = '';
              try {
                web_webview.WebviewController.setHostIP('baidu.com', '124.95.179.4', 30);
                await Utils.sleep(3000);
                this.controller.loadUrl('baidu.com');
                await Utils.sleep(5000);
                this.getURL = this.controller.getUrl();
                console.log('setHostIP1200_getUrl: ' + this.getURL);
                await Utils.sleep(2000);
                web_webview.WebviewController.clearHostIP('baidu.com');
                this.controller.removeCache(true);
                await Utils.sleep(65000);
                this.controller.loadUrl('baidu.com');
                await Utils.sleep(5000);
                this.getURL1 = this.controller.getUrl();
                console.log('setHostIP1200_getUrl1: ' + this.getURL1)
                if (this.getURL != this.getURL1) {
                  this.value = true;
                }
                console.log('setHostIP1200_value: ' + this.value)
                this.controller.removeCache(true);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                Utils.emitEvent(this.value, 8771)
              }, 3000)
              break;
            }
            case "setHostIP1300": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 8772)
                  break;
                }else if ((this.userAgentPC).includes("Tablet")){
                  Utils.emitEvent(true, 8772)
                  break;
                }
              this.value = false;
              this.getURL = '';
              this.getURL1 = '';
              try {
                web_webview.WebviewController.setHostIP('store.apple.com', '124.95.179.4', 30);
                await Utils.sleep(3000);
                this.controller.loadUrl('store.apple.com');
                await Utils.sleep(5000);
                this.getURL = this.controller.getUrl();
                console.log('setHostIP1300_getUrl: ' + this.getURL);
                await Utils.sleep(2000);
                web_webview.WebviewController.clearHostIP('store.apple.com');
                this.controller.removeCache(true);
                await Utils.sleep(60000);
                this.controller.loadUrl('store.apple.com');
                await Utils.sleep(5000);
                this.getURL1 = this.controller.getUrl();
                console.log('setHostIP1300_getUrl1: ' + this.getURL1);
                if (this.getURL != this.getURL1) {
                  this.value = true;
                }
                console.log('setHostIP1300_value: ' + this.value);
                this.controller.removeCache(true);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                Utils.emitEvent(this.value, 8772)
              }, 3000)
              break;
            }
            case "setHostIP1500": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 8773)
                  break;
                }else if ((this.userAgentPC).includes("Tablet")){
                  Utils.emitEvent(true, 8773)
                  break;
                }
              this.value = false;
              let value1: boolean = false;
              let value2: boolean = false;
              this.getURL1 = '';
              this.getURL2 = '';
              this.getURL3 = '';
              this.getURL4 = '';

              try {
                web_webview.WebviewController.setHostIP('www.baidu.com', '124.95.179.4', 30);
                await Utils.sleep(20000);
                this.controller.loadUrl('www.baidu.com');
                await Utils.sleep(5000);
                this.getURL1 = this.controller.getUrl();
                console.log('setHostIP1500_getUrl1' + this.getURL1)
                await Utils.sleep(2000);
                web_webview.WebviewController.clearHostIP('www.baidu.com');
                this.controller.removeCache(true);
                await Utils.sleep(65000);
                this.controller.loadUrl('https://www.baidu.com')
                await Utils.sleep(5000);
                this.getURL2 = this.controller.getUrl();
                console.log('setHostIP1500_getUrl2' + this.getURL2)
                if (this.getURL1 != this.getURL2) {
                  value1 = true
                }
                this.controller.removeCache(true);
                await Utils.sleep(65000);
                web_webview.WebviewController.setHostIP('www.baidu.com', '124.95.179.4', 30);
                await Utils.sleep(3000);
                this.controller.loadUrl('www.baidu.com')
                await Utils.sleep(5000);
                this.getURL3 = this.controller.getUrl();
                console.log('setHostIP1500_getUrl3' + this.getURL3)
                await Utils.sleep(2000);
                web_webview.WebviewController.clearHostIP('www.baidu.com');
                this.controller.removeCache(true);
                await Utils.sleep(65000);
                this.controller.loadUrl('http://www.baidu.com')
                await Utils.sleep(5000);
                this.getURL4 = this.controller.getUrl();
                console.log('setHostIP1500_getUrl4' + this.getURL4)
                if (this.getURL3 != this.getURL4) {
                  value2 = true
                }
                if ((value1 == true) && (value2 == true)) {
                  this.value = true
                }
                console.log('setHostIP1500_value: ' + this.value)
                this.controller.removeCache(true);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                Utils.emitEvent(this.value, 8773)
              }, 3000)
              break;
            }
          }
        })

      }
      
      Web({ src: 'www.dnsTest.com', controller: this.controller })
        .height(500)
        .width(500)
    }
  }
}
