/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import {Context, RenderMode,  Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import web_webview from '@ohos.web.webview';
import  { BusinessError, RecordData } from '@ohos.base';
import { AppStorage } from 'arkui.stateManagement.storage.appStorage'
import common from '@ohos.app.ability.common';
import abilityAccessCtrl, { PermissionRequestResult } from '@ohos.abilityAccessCtrl';


@Entry
@Component
struct WebCameraApiNoCrash {
  @State str: string = ''
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined)
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController(undefined)

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear');
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && (eventData.data as Record<string , RecordData>)?.['ACTION'] != null) {
        this.str = '' + (eventData.data as Record<string , RecordData>)?.['ACTION'];
      }
    }
  }


  build() {
    Column() {
      Row() {
        Button('WebCameraApiNoCrash').id('WebCameraApiNoCrash').onClick( (event:ClickEvent) => {
          console.log('key==>' + this.str)
          switch (this.str) {
            case 'WebCameraApiNoCrash0100': {
              try {
                this.controller.startCamera();
                Utils.emitEvent(true, 1401)
              } catch (error:BusinessError) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 1401)
              }
              break;
            }
            case 'WebCameraApiNoCrash0200': {
              try {
                this.controller.stopCamera();
                Utils.emitEvent(true, 1402)
              } catch (error:BusinessError) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 1402)
              }
              break;
            }
            case 'WebCameraApiNoCrash0300': {
              try {
                this.controller.closeCamera();
                Utils.emitEvent(true, 1403)
              } catch (error: BusinessError) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 1403)
              }
              break;
            }
            case 'WebCameraApiNoCrash0400': {
              try {
                this.controller.startCamera();
                this.controller.closeCamera();
                Utils.emitEvent(true, 1404)
              } catch (error:BusinessError) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 1404)
              }
              break;
            }
            case 'WebCameraApiNoCrash0500': {
              try {
                this.controller.startCamera();
                this.controller.stopCamera();
                Utils.emitEvent(true, 1405)
              } catch (error:BusinessError) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 1405)
              }
              break;
            }
            case 'WebCameraApiNoCrash0600': {
              try {
                this.controller.startCamera();
                this.controller.stopCamera();
                this.controller.closeCamera();
                Utils.emitEvent(true, 1406)
              } catch (error:BusinessError) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 1406)
              }
              break;
            }
            case 'WebCameraApiNoCrash0700': {
              try {
                this.controller.startCamera();
                this.controller.closeCamera();
                this.controller.stopCamera();
                Utils.emitEvent(true, 1407)
              } catch (error:BusinessError) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 1407)
              }
              break;
            }
            case 'WebCameraApiNoCrash0800': {
              try {
                this.controller.startCamera();
                this.controllerTwo.startCamera();
                Utils.emitEvent(true, 1408)
              } catch (error:BusinessError) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 1408)
              }
              break;
            }
            case 'WebCameraApiNoCrash0900': {
              try {
                this.controller.startCamera();
                this.controller.stopCamera();
                this.controllerTwo.startCamera();
                this.controllerTwo.stopCamera();
                Utils.emitEvent(true, 1409)
              } catch (error:BusinessError) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 1409)
              }
              break;
            }
            case 'WebCameraApiNoCrash1000': {
              try {
                this.controller.startCamera();
                this.controller.closeCamera();
                this.controllerTwo.startCamera();
                this.controllerTwo.closeCamera();
                Utils.emitEvent(true, 1410)
              } catch (error:BusinessError) {
                let e: BusinessError = error as BusinessError;
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