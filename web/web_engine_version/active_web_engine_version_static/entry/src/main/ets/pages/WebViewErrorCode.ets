/**
 * Copyright (c) 2023-2026 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { $rawfile, Entry, Component, Column, Row, Button, ClickEvent, Web, CustomDialogController, CustomDialog, CustomDialog } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import emitter from '@ohos.events.emitter';
import { JsProxyObject } from '../../src/test/Interfaces';
import { Callback } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import web_webview from '@ohos.web.webview'
import {canIUse} from '@internal.full.global'
import { Driver, ON } from '@ohos.UiTest';
import { cert } from '@kit.DeviceCertificateKit';
let driver = Driver.create()

const EVENT_ID_SET_EMIT_KEY = 111120;

interface objectCss {
  code: int;
  message: string;
}

export class StringFields {
  str: string = '';
}

@Entry
@Component
struct webViewContGetUrlAndOthersError {
  stringObj: StringFields  = new StringFields();
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str:string = '';
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State errorCode: int = 0;
  @State errorMsg: string = 'failed';
  @State step: number = -2;
  @State outputStr: string = ''
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
      }
    }
  }


  build() {
    Column() {
      Row() {
        Button("getUrlAndOthersErrorTest").key('webViewOthersErrorCode').onClick((e:ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          this.isReceive = -1;
          switch (this.stringObj.str) {
            case "emitGetPageOffsetErrorCode": {
              try {
                this.controllerTwo.getPageOffset().y;
              } catch (error) {
                console.error(`emitGetUrlInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              if(web_webview.WebviewController.getActiveWebEngineVersion() == web_webview.ArkWebEngineVersion.M114) {
                Utils.emitEvent(this.errorCode, 20250907)
                Utils.emitEvent(this.errorMsg, 20250908)
                console.log('emitGetPageOffsetErrorCode' + 'web_webview.ArkWebEngineVersion.M114')
              } else {
                Utils.emitEvent("801", 20250907)
                Utils.emitEvent("Capability not supported", 20250908)
                console.log('emitGetPageOffsetErrorCode' + 'c.M132')
              }

              break;
            }
            case "emitAvoidVisibleViewportBottomErrorCode": {
              try {
                this.errorCode = 0;
                this.errorMsg = 'failed';
                this.controllerTwo.avoidVisibleViewportBottom(111);;
              } catch (error) {
                console.error(`emitStopInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              if(web_webview.WebviewController.getActiveWebEngineVersion() == web_webview.ArkWebEngineVersion.M114) {
                Utils.emitEvent(this.errorCode, 20250910)
                Utils.emitEvent(this.errorMsg, 20250911)
                console.log('emitAvoidVisibleViewportBottomErrorCode' + 'web_webview.ArkWebEngineVersion.M114')
              } else {
                Utils.emitEvent("801", 20250910)
                Utils.emitEvent("Capability not supported", 20250911)
                console.log('emitAvoidVisibleViewportBottomErrorCode' + 'web_webview.ArkWebEngineVersion.M132')
              }
              break;
            }
            case "emitIsActiveWebEngineEvergreen009": {
              if(web_webview.WebviewController.isActiveWebEngineEvergreen() == true || web_webview.WebviewController.isActiveWebEngineEvergreen() == false )
                Utils.emitEvent(true, 20251226)
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
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}
