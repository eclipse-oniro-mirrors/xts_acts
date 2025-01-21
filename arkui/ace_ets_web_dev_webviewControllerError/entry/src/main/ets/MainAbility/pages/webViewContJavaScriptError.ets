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
struct webViewContJavaScriptError {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitRegisterJavaScriptProxyInitErr";
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
  @State webResult: string = '';
  @State name: string = 'UnExistObj';
  testObj = {
    test: (data) => {
      return "ArkUI Web Component";
    },
    toString: () => {
      console.log('Web Component toString');
    }
  }

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("webViewContJavaScriptError page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("javaScriptErrorTest").key('webViewContJavaScriptError').onClick(() => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitRegisterJavaScriptProxyInitErr": {
              try {
                this.controllerTwo.registerJavaScriptProxy(this.testObj, "objName", ["test", "toString"]);
                ;
              } catch (error) {
                console.error(`emitRegisterJavaScriptProxyInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 650)
              Utils.emitEvent(this.errorMsg, 651)
              break;
            }
            case "emitRunJavaScriptCallbackInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.runJavaScript(
                  'test()',
                  (error, result) => {
                    if (error) {
                      console.info(`run JavaScript error: ` + JSON.stringify(error));
                      return;
                    }
                    if (result) {
                      this.webResult = result;
                      console.info(`The test() return value is: ${result}`);
                    }
                  });
              } catch (error) {
                console.error(`emitRunJavaScriptCallbackInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 652)
              Utils.emitEvent(this.errorMsg, 653)
              break;
            }
            case "emitRunJavaScriptPromiseInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.runJavaScript('test()')
                  .then((result) => {
                    console.log('result: ' + result);
                  })
                  .catch((error) => {
                    console.error("error: " + error);
                  })
              } catch (error) {
                console.error(`emitRunJavaScriptPromiseInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 654)
              Utils.emitEvent(this.errorMsg, 655)
              break;
            }
            case "emitRunJavaScriptExtCallbackInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.runJavaScriptExt(
                  'test()',
                  (error, result) => {
                    if (error) {
                      console.info(`run JavaScript error: ` + JSON.stringify(error));
                      return;
                    }
                    if (result) {
                      console.info(`The test() return value is: ${result}`);
                    }
                  });
              } catch (error) {
                console.error(`emitRunJavaScriptExtCallbackInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 656)
              Utils.emitEvent(this.errorMsg, 657)
              break;
            }
            case "emitRunJavaScriptExtPromiseInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.runJavaScriptExt('test()')
                  .then((result) => {
                    console.log('result: ' + result);
                  })
                  .catch((error) => {
                    console.error("error: " + error);
                  })
              } catch (error) {
                console.error(`emitRunJavaScriptExtPromiseInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 658)
              Utils.emitEvent(this.errorMsg, 659)
              break;
            }
            case "emitDeleteJavaScriptRegisterInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.deleteJavaScriptRegister(this.name);
              } catch (error) {
                console.error(`emitDeleteJavaScriptRegisterInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 660)
              Utils.emitEvent(this.errorMsg, 661)
              break;
            }
            case "emitDeleteJavaScriptRegisterNameErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controller.registerJavaScriptProxy(this.testObj, "objName", ["test", "toString"]);
                this.controller.refresh();
                this.controller.deleteJavaScriptRegister(this.name);
              } catch (error) {
                console.error(`emitDeleteJavaScriptRegisterNameErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 662)
              Utils.emitEvent(this.errorMsg, 663)
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
        .userAgent(this.userAgent)
    }
  }
}