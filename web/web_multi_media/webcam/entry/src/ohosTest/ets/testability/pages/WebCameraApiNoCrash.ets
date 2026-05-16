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
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
import buffer from '@ohos.buffer'
import { WebNetErrorList } from '@ohos.web.netErrorList'
import common from '@ohos.app.ability.common';
import abilityAccessCtrl, { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import business_error, { BusinessError } from '@ohos.base';
import { waitForExist } from '../../test/WaitTest.test';

let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
try {
  let context: Context = getContext(this) as common.UIAbilityContext;
  atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA'], (err: BusinessError, data: PermissionRequestResult) => {
    console.info('data:' + JSON.stringify(data));
    console.info('data permissions:' + data.permissions);
    console.info('data authResults:' + data.authResults);
  })
} catch (error) {
  let e: business_error.BusinessError = error as business_error.BusinessError;
  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
}

@Entry
@Component
struct WebCameraApiNoCrash {
  @State str: string = ""
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  controller: web_webview.WebviewController = new web_webview.WebviewController()
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController()

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 300400,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(300400)
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
        Button("WebCameraApiNoCrash").id('WebCameraApiNoCrash').onClick(async () => {
          await waitForExist(()=>this.isReceive,  this.str + 'IsReceive', 0);
          await waitForExist(()=>this.isPageEnd, this.str + 'IsPageEnd', 0);
          this.isReceive = -1;
          console.info("key==>" + this.str)
          switch (this.str) {
            case "WebCameraApiNoCrash0100": {
              try {
                this.controller.startCamera();
                await Utils.sleep(1000);
                Utils.emitEvent(true, 300410)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 300410)
                }
              break;
            }
            case "WebCameraApiNoCrash0200": {
              try {
                this.controller.stopCamera();
                await Utils.sleep(1000);
                Utils.emitEvent(true, 300420)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 300420)
                }
              break;
            }
            case "WebCameraApiNoCrash0300": {
              try {
                this.controller.closeCamera();
                await Utils.sleep(1000);
                Utils.emitEvent(true, 300430)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 300430)
                }
              break;
            }
            case "WebCameraApiNoCrash0400": {
              try {
                this.controller.startCamera();
                await Utils.sleep(1000);
                this.controller.closeCamera();
                await Utils.sleep(1000);
                Utils.emitEvent(true, 300440)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 300440)
                }
              break;
            }
            case "WebCameraApiNoCrash0500": {
              try {
                this.controller.startCamera();
                await Utils.sleep(1000);
                this.controller.stopCamera();
                await Utils.sleep(1000);
                Utils.emitEvent(true, 300450)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 300450)
                }
              break;
            }
            case "WebCameraApiNoCrash0600": {
              try {
                this.controller.startCamera();
                await Utils.sleep(1000);
                this.controller.stopCamera();
                await Utils.sleep(1000);
                this.controller.closeCamera();
                await Utils.sleep(1000);
                Utils.emitEvent(true, 300460)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 300460)
                }
              break;
            }
            case "WebCameraApiNoCrash0700": {
              try {
                this.controller.startCamera();
                await Utils.sleep(1000);
                this.controller.closeCamera();
                await Utils.sleep(1000);
                this.controller.stopCamera();
                await Utils.sleep(1000);
                Utils.emitEvent(true, 300470)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 300470)
                }
              break;
            }
            case "WebCameraApiNoCrash0800": {
              try {
                this.controller.startCamera();
                await Utils.sleep(1000);
                this.controllerTwo.startCamera();
                await Utils.sleep(1000);
                Utils.emitEvent(true, 300480)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 300480)
                }
              break;
            }
            case "WebCameraApiNoCrash0900": {
              try {
                this.controller.startCamera();
                this.controller.stopCamera();
                await Utils.sleep(1000);
                this.controllerTwo.startCamera();
                this.controllerTwo.stopCamera();
                await Utils.sleep(1000);
                Utils.emitEvent(true, 300490)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 300490)
                }
              break;
            }
            case "WebCameraApiNoCrash1000": {
              try {
                this.controller.startCamera();
                this.controller.closeCamera();
                await Utils.sleep(1000);
                this.controllerTwo.startCamera();
                this.controllerTwo.closeCamera();
                await Utils.sleep(1000);
                Utils.emitEvent(true, 300500)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 300500)
                }
              break;
            }
          }
        })
      }

      Web({ src: 'https://www.example.com', controller: this.controller, renderMode: RenderMode.SYNC_RENDER })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .onPageEnd(()=>{
          this.isPageEnd = 0;
        })
      Web({ src: 'https://www.example.com', controller: this.controllerTwo, renderMode: RenderMode.ASYNC_RENDER })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .onPageEnd(()=>{
          this.isPageEnd = 0;
        })
    }
  }
}