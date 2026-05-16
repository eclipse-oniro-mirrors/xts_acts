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
import Utils from '../../test/Utils.test';
import web_webview from '@ohos.web.webview';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
const EVENT_ID_SET_EMIT_KEY = 112330;

@Entry
@Component
struct webViewContZoomAndOthersError {
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
  @State zoomAccess: boolean = false;
  @State errorCode: string = '0';
  @State errorMsg: string = 'failed';
  @State factor: number = 1;
  @State searchString: string = "test";
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
    console.info('webViewContZoomAndOthersError page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
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
        Button("zoomAndOthersErrorTest").key('webViewContZoomAndOthersError').onClick(async () => {
          await Utils.waitForExist(()=>this.isPageEnd, 'webViewContZoomAndOthersErrorIsPageEnd', 1, 1000);
          await Utils.waitForExist(()=>this.isReceive, 'webViewContZoomAndOthersErrorIsReceive', 1, 1000);
          console.info('key==>' + this.str)
          this.isReceive = -1;
          switch (this.str) {
            case "emitZoomInitErr": {
              try {
                this.controllerTwo.zoom(this.factor);
              } catch (error) {
                console.error(`emitZoomInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 112340)
              Utils.emitEvent(this.errorMsg, 112350)
              break;
            }
            case "emitZoomEnableErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controller.zoom(this.factor);
              } catch (error) {
                console.error(`emitZoomEnableErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 112360)
              Utils.emitEvent(this.errorMsg, 112370)
              break;
            }
            case "emitSearchAllAsyncInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.searchAllAsync(this.searchString);
              } catch (error) {
                console.error(`emitSearchAllAsyncInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 112380)
              Utils.emitEvent(this.errorMsg, 112390)
              break;
            }
            case "emitClearMatchesInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.clearMatches();
              } catch (error) {
                console.error(`emitClearMatchesInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 112400)
              Utils.emitEvent(this.errorMsg, 112410)
              break;
            }
            case "emitSearchNextInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.searchNext(true);
              } catch (error) {
                console.error(`emitSearchNextInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 112420)
              Utils.emitEvent(this.errorMsg, 112430)
              break;
            }
            case "emitClearSslCacheInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.clearSslCache();
              } catch (error) {
                console.error(`emitClearSslCacheInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 112440)
              Utils.emitEvent(this.errorMsg, 112450)
              break;
            }
            case "emitClearClientAuthenticationCacheInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.clearClientAuthenticationCache();
              } catch (error) {
                console.error(`emitClearClientAuthenticationCacheInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 112460)
              Utils.emitEvent(this.errorMsg, 112470)
              break;
            }
            case "emitCreateWebMessagePortsInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.createWebMessagePorts();
              } catch (error) {
                console.error(`emitCreateWebMessagePortsInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 112480)
              Utils.emitEvent(this.errorMsg, 112490)
              break;
            }
            case "emitRequestFocusInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.requestFocus();
              } catch (error) {
                console.error(`emitRequestFocusInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 112500)
              Utils.emitEvent(this.errorMsg, 112510)
              break;
            }
            case "emitZoomInInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.zoomIn();
              } catch (error) {
                console.error(`emitZoomInInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 112520)
              Utils.emitEvent(this.errorMsg, 112530)
              break;
            }
            case "emitZoomInEnableErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controller.zoomIn();
              } catch (error) {
                console.error(`emitZoomInEnableErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 112540)
              Utils.emitEvent(this.errorMsg, 112550)
              break;
            }
            case "emitZoomOutInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.zoomOut();
              } catch (error) {
                console.error(`emitZoomOutInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 112560)
              Utils.emitEvent(this.errorMsg, 112570)
              break;
            }
            case "emitZoomOutEnableErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controller.zoomOut();
              } catch (error) {
                console.error(`emitZoomOutEnableErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 112580)
              Utils.emitEvent(this.errorMsg, 112590)
              break;
            }
            case "emitGetHitTestValueInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.getHitTestValue();
              } catch (error) {
                console.error(`emitGetHitTestValueInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 112600)
              Utils.emitEvent(this.errorMsg, 112610)
              break;
            }
            case "emitGetWebIdInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.getWebId();
              } catch (error) {
                console.error(`emitGetWebIdInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 112620)
              Utils.emitEvent(this.errorMsg, 112630)
              break;
            }
            case "emitGetUserAgentInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.getUserAgent();
              } catch (error) {
                console.error(`emitGetUserAgentInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 112640)
              Utils.emitEvent(this.errorMsg, 112650)
              break;
            }
            case "emitGetTitleInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.getTitle();
              } catch (error) {
                console.error(`emitGetTitleInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 112660)
              Utils.emitEvent(this.errorMsg, 112670)
              break;
            }
            case "emitGetPageHeightInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.getPageHeight();
              } catch (error) {
                console.error(`emitGetPageHeightInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 112680)
              Utils.emitEvent(this.errorMsg, 112690)
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
        .zoomAccess(this.zoomAccess)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}