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


@Entry
@Component
struct webViewContPageOperationsError {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitAccessForwardInitErr";
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

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("webViewContPageOperationsError page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("pageOperationsErrorTest").key('webViewContPageOperationsError').onClick(() => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitAccessForwardInitErr": {
              try {
                this.controllerTwo.accessForward();
              } catch (error) {
                console.error(`emitAccessForwardInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code
                this.errorMsg = error.message
              }
              Utils.emitEvent(this.errorCode, 630)
              Utils.emitEvent(this.errorMsg, 631)
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
              Utils.emitEvent(this.errorCode, 632)
              Utils.emitEvent(this.errorMsg, 633)
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
              Utils.emitEvent(this.errorCode, 634)
              Utils.emitEvent(this.errorMsg, 635)
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
              Utils.emitEvent(this.errorCode, 636)
              Utils.emitEvent(this.errorMsg, 637)
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
              Utils.emitEvent(this.errorCode, 638)
              Utils.emitEvent(this.errorMsg, 639)
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
              Utils.emitEvent(this.errorCode, 640)
              Utils.emitEvent(this.errorMsg, 641)
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
              Utils.emitEvent(this.errorCode, 642)
              Utils.emitEvent(this.errorMsg, 643)
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
              Utils.emitEvent(this.errorCode, 644)
              Utils.emitEvent(this.errorMsg, 645)
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
              Utils.emitEvent(this.errorCode, 646)
              Utils.emitEvent(this.errorMsg, 647)
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
              Utils.emitEvent(this.errorCode, 648)
              Utils.emitEvent(this.errorMsg, 649)
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
    }
  }
}