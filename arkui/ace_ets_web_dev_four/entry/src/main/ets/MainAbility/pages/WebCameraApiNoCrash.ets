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
  controller: web_webview.WebviewController = new web_webview.WebviewController()
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController()

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
        Button("WebCameraApiNoCrash").id('WebCameraApiNoCrash').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "WebCameraApiNoCrash0100": {
              try {
                this.controller.startCamera();
                await Utils.sleep(1000);
                Utils.emitEvent(true, 1401)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 1401)
                }
              break;
            }
            case "WebCameraApiNoCrash0200": {
              try {
                this.controller.stopCamera();
                await Utils.sleep(1000);
                Utils.emitEvent(true, 1402)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 1402)
                }
              break;
            }
            case "WebCameraApiNoCrash0300": {
              try {
                this.controller.closeCamera();
                await Utils.sleep(1000);
                Utils.emitEvent(true, 1403)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 1403)
                }
              break;
            }
            case "WebCameraApiNoCrash0400": {
              try {
                this.controller.startCamera();
                await Utils.sleep(1000);
                this.controller.closeCamera();
                await Utils.sleep(1000);
                Utils.emitEvent(true, 1404)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 1404)
                }
              break;
            }
            case "WebCameraApiNoCrash0500": {
              try {
                this.controller.startCamera();
                await Utils.sleep(1000);
                this.controller.stopCamera();
                await Utils.sleep(1000);
                Utils.emitEvent(true, 1405)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 1405)
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
                Utils.emitEvent(true, 1406)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 1406)
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
                Utils.emitEvent(true, 1407)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 1407)
                }
              break;
            }
            case "WebCameraApiNoCrash0800": {
              try {
                this.controller.startCamera();
                await Utils.sleep(1000);
                this.controllerTwo.startCamera();
                await Utils.sleep(1000);
                Utils.emitEvent(true, 1408)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 1408)
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
                Utils.emitEvent(true, 1409)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 1409)
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
                Utils.emitEvent(true, 1410)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 1410)
                }
              break;
            }
          }
        })
      }

      Web({ src: 'https://www.example.com', controller: this.controller, renderMode: RenderMode.SYNC_RENDER })
        .javaScriptAccess(true)
        .domStorageAccess(true)
      Web({ src: 'https://www.example.com', controller: this.controllerTwo, renderMode: RenderMode.ASYNC_RENDER })
        .javaScriptAccess(true)
        .domStorageAccess(true)
    }
  }
}