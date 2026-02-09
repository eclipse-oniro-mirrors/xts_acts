/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {OnScreenCaptureRequestEvent, Entry, Component, Column, Row, Button, ClickEvent, Web, WebCaptureMode } from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement"
import { Callback } from '@ohos.base'
import Utils from '../../src/test/Util.test';
import webview from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON, On } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from "../../../hypium/index";
import { BusinessError, RecordData } from '@ohos.base';


@Entry
@Component
struct webViewContCreatePdfAndOthersError {
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  controllerNull: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State zoomAccess: boolean = false;
  @State errorCode: Int = 0;
  @State errorMsg: string = 'failed';

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
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && (eventData.data as Record<string , RecordData>)?.["ACTION"] != null) {
        this.str = "" + (eventData.data as Record<string , RecordData>)?.["ACTION"];
      }
    }
  }


  build() {
    Column() {
      Row() {
        Button('createPdfAndOthersError').key('webViewContCreatePdfAndOthersError').onClick((e: ClickEvent) => {
          console.info(' key==>' + this.str)
          switch (this.str) {

            case 'emitSetPrintBackgroundInitErr': {
              try {
                this.controllerNull.setPrintBackground(false)
              } catch (error: BusinessError) {
                console.error(`XXXXXXXX emitGetScrollableInitErr ErrorCode: ${error.code}`);
                this.errorCode = error.code;
                Utils.emitEvent(this.errorCode, 17113)
              }
              break;
            }

            case 'emitCreateWebPrintDocumentAdapterInitErr': {
              try {
                this.controllerNull.createWebPrintDocumentAdapter('example.pdf')
              } catch (error:BusinessError) {
                console.error(`XXXXXXXX emitCreateWebPrintDocumentAdapterInitErr ErrorCode: ${error.code}`);
                this.errorCode = error.code;
              }
              Utils.emitEvent(this.errorCode, 17107)
              break;
            }

          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .zoomAccess(this.zoomAccess)
        .enableHapticFeedback(true)
        .enableNativeEmbedMode(true)
    }
  }
}