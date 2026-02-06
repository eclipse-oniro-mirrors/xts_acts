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
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';

const EVENT_ID_SET_EMIT_KEY = 111890;

@Entry
@Component
struct webViewContPageOperationsError {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
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
  @State steps: number = 2;
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
    console.info("webViewContPageOperationsError page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("pageOperationsErrorTest").key('webViewContPageOperationsError').onClick(async () => {
          await Utils.waitForExist(()=>this.isPageEnd, 'webViewContPageOperationsErrorIsPageEnd', 1, 1000);
          await Utils.waitForExist(()=>this.isReceive, 'webViewContPageOperationsErrorIsReceive', 1, 1000);
          console.info("key==>" + this.str)
          this.isReceive = -1;
          switch (this.str) {
            case "emitAccessForwardInitErr": {
              try {
                this.controllerTwo.accessForward();
              } catch (error) {
                console.error(`emitAccessForwardInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code
                this.errorMsg = error.message
              }
              Utils.emitEvent(this.errorCode, 111900)
              Utils.emitEvent(this.errorMsg, 111910)
              break;
            }
            case "emitForwardInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.forward();
              } catch (error) {
                console.error(`emitForwardInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code
                this.errorMsg = error.message
              }
              Utils.emitEvent(this.errorCode, 111920)
              Utils.emitEvent(this.errorMsg, 111930)
              break;
            }
            case "emitAccessBackwardInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.accessBackward();
              } catch (error) {
                console.error(`emitAccessBackwardInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code
                this.errorMsg = error.message
              }
              Utils.emitEvent(this.errorCode, 111940)
              Utils.emitEvent(this.errorMsg, 111950)
              break;
            }
            case "emitBackwardInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.backward();
              } catch (error) {
                console.error(`emitBackwardInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code
                this.errorMsg = error.message
              }
              Utils.emitEvent(this.errorCode, 111960)
              Utils.emitEvent(this.errorMsg, 111970)
              break;
            }
            case "emitOnActiveInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.onActive();
              } catch (error) {
                console.error(`emitOnActiveInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code
                this.errorMsg = error.message
              }
              Utils.emitEvent(this.errorCode, 111980)
              Utils.emitEvent(this.errorMsg, 111990)
              break;
            }
            case "emitOnInactiveInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.onInactive();
              } catch (error) {
                console.error(`emitOnInactiveInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code
                this.errorMsg = error.message
              }
              Utils.emitEvent(this.errorCode, 112000)
              Utils.emitEvent(this.errorMsg, 112010)
              break;
            }
            case "emitRefreshInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.refresh();
              } catch (error) {
                console.error(`emitRefreshInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code
                this.errorMsg = error.message
              }
              Utils.emitEvent(this.errorCode, 112020)
              Utils.emitEvent(this.errorMsg, 112030)
              break;
            }
            case "emitAccessStepInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.accessStep(this.steps);
              } catch (error) {
                console.error(`emitAccessStepInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code
                this.errorMsg = error.message
              }
              Utils.emitEvent(this.errorCode, 112040)
              Utils.emitEvent(this.errorMsg, 112050)
              break;
            }
            case "emitClearHistoryInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.clearHistory();
              } catch (error) {
                console.error(`emitClearHistoryInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code
                this.errorMsg = error.message
              }
              Utils.emitEvent(this.errorCode, 112060)
              Utils.emitEvent(this.errorMsg, 112070)
              break;
            }
            case "emitGetHitTestInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.getHitTest();
              } catch (error) {
                console.error(`emitGetHitTestInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code
                this.errorMsg = error.message
              }
              Utils.emitEvent(this.errorCode, 112080)
              Utils.emitEvent(this.errorMsg, 112090)
              break;
            }
          }
        })
      }

      Web({ src: 'www.example.com', controller: this.controller })
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