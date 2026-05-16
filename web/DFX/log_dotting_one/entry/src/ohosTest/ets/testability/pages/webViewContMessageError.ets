/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import web_webview from '@ohos.web.webview';

const EVENT_ID_SET_EMIT_KEY = 111780;

@Entry
@Component
struct webViewContMessageError {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
  ports: web_webview.WebMessagePort[] | null = null;
  msgPort: web_webview.WebMessagePort[] | null= null;
  @State sendFromEts: string = 'Send this message from ets to HTML';
  @State receivedFromHtml: string = 'Display received message send from HTML';
  @State str: string = "";
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State errorCode: string = '0';
  @State errorMsg: string = 'failed';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

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
    console.info("webViewContMessageError page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 1;
      }
    }
  }

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments =  AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Column() {
      Row() {
        Button("messageEventErrorTest").key('webViewContMessageError').onClick(async () => {
          await Utils.waitForExist(()=>this.isPageEnd, 'webViewContMessageErrorIsPageEnd', 1, 1000);
          await Utils.waitForExist(()=>this.isReceive, 'webViewContMessageErrorIsReceive', 1, 1000);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case "emitPostMessageInitErr": {
              try {
                this.ports = this.controller.createWebMessagePorts();
                this.controllerTwo.postMessage('__init_port__', [this.ports[0]], '*');
              } catch (error) {
                console.error(`emitPostMessageInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code
                this.errorMsg = error.message
              }
              this.controller.runJavaScript("test()", (res) => {
                Utils.emitEvent(this.errorCode, 111790)
                Utils.emitEvent(this.errorMsg, 111800)
              })
              break;
            }
            case "emitPostMessageEventUnPortErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.ports = this.controller.createWebMessagePorts();
                this.controller.postMessage('__init_port__', [this.ports[0]], '*');
                if (this.ports && this.ports[1]) {
                  this.ports[1].close();
                } else {
                  console.log("ports is null, Please initialize first");
                }
                this.ports[1].postMessageEvent("post message from ets to html5");
              } catch (error) {
                console.error(`emitPostMessageEventUnPortErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code
                this.errorMsg = error.message
              }
              this.controller.runJavaScript("test()", (res) => {
                Utils.emitEvent(this.errorCode, 111810)
                Utils.emitEvent(this.errorMsg, 111820)
              })
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('indexEdit.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}