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
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview'

@Entry
@Component
struct webviewTerminateRenderProcess {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitTerminateRenderProcess0100";
  @State userAgentPC:string = '';

  onPageShow(){
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: ESObject) => {
    console.info("webOnSslError page valueChangeCallBack");
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('TerminateRenderProcess').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitTerminateRenderProcess0100": {
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 5300)
                  break;
                }else if((this.userAgentPC).includes("Tablet")){
                  Utils.emitEvent(true, 5300)
                  break;
                }
                this.controller.loadUrl('www.baidu.com');
                await Utils.sleep(4000);
                let result = this.controller.terminateRenderProcess();
                console.log("terminateRenderProcess result: " + result);
                await Utils.sleep(1000);
                Utils.emitEvent(result, 5300)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitTerminateRenderProcess0200": {
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 5302)
                  break;
                }else if((this.userAgentPC).includes("Tablet")){
                  Utils.emitEvent(true, 5302)
                  break;
                }
                this.controller.loadUrl('www.baidu.com');
                await Utils.sleep(4000);
                let result = this.controller.terminateRenderProcess();
                console.log("terminateRenderProcess result: " + result);
                await Utils.sleep(3000);
                let title = this.controller.getTitle();
                console.log("title: " + title);
                if ((this.controller.getTitle()).includes("百度")) {
                  Utils.emitEvent(true, 5302)
                  console.log("title:" + this.controller.getTitle())
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitTerminateRenderProcess0300": {
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 5304)
                  break;
                }else if((this.userAgentPC).includes("Tablet")){
                  Utils.emitEvent(true, 5304)
                  break;
                }
                this.controller.loadUrl($rawfile("indexdemo.html"))
                await Utils.sleep(4000);
                let result = this.controller.terminateRenderProcess();
                console.log("terminateRenderProcess result: " + result);
                await Utils.sleep(1000);
                Utils.emitEvent(result, 5304)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitTerminateRenderProcess0400": {
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 5306)
                  break;
                }else if((this.userAgentPC).includes("Tablet")){
                  Utils.emitEvent(true, 5306)
                  break;
                }
                this.controller.loadUrl($rawfile("indexdemo.html"))
                await Utils.sleep(4000);
                let result = this.controller.terminateRenderProcess();
                console.log("terminateRenderProcess result: " + result);
                await Utils.sleep(1000);
                this.controller.slideScroll(500, 500);
                await Utils.sleep(4000);
                Utils.emitEvent(true, 5306)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: 'https://wrong.host.badssl.com', controller: this.controller })
      .onOverScroll((event) => {
          console.info('x = ' + event.xOffset)
          console.info('y = ' + event.yOffset)
          Utils.emitEvent(false, 5306)
      })
    }
  }
}