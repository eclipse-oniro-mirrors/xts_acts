/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { Text,CustomDialog,CustomDialogController,BlurOnKeyboardHideMode,OnWindowNewEvent,$rawfile,OnConsoleEvent,Entry, Component, Column, Row, Button, ClickEvent, Web, BlankScreenDetectionMethod, DetectedBlankScreenReason, BlankScreenDetectionEventInfo } from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement"
import { UIContext, Router } from '@ohos.arkui.UIContext'
import web_webview from '@ohos.web.webview';
import Utils from '../../src/test/Util.test';
import { BusinessError, RecordData } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'

// 在同一page页有两个Web组件。在WebComponent新开窗口时，会跳转到NewWebViewComp。
@CustomDialog
struct NewWebViewComp {
  controller?: CustomDialogController;
  webviewController_1: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State onActivateContent:boolean = false

  build() {
    Column() {
      Web({ src: "resource://rawfile/newWebviewComp.html", controller: this.webviewController_1 })
        .javaScriptAccess(true)
        .multiWindowAccess(false)
        .onWindowExit((): void => {
          console.info("NewWebViewComp onWindowExit");
          if (this.controller) {
            this.controller?.close();
          }
        })
        .onActivateContent((): void => {
          console.log("NEU-onActivateContent");
        })
    }
  }
}

@Entry
@Component
struct WebComponent {
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  dialogController?: CustomDialogController
  @State str: string = "";
  @State offsetX: number = 0;
  @State offsetY: number = 0;

  aboutToAppear() {
    console.info("Entry aboutToAppear");
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info("Finish aboutToAppear " + this.valueChangeCallBack);
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data["ACTION"] != null) {
        console.info('Received ACTION value: ' + data["ACTION"]);
        let strValue: string = String(data["ACTION"]);
        console.info('strValue has been updated to: ' + strValue);
        this.str = strValue;
        console.info('this.str has been updated to: ' + this.str);
      }
    }
  }



  build() {
    Column() {
      Row() {
        Button("web click")
          .key('onActivateContentButton')
          .onClick((e: ClickEvent) => {
            console.info("key==>" + this.str);
            switch (this.str) {
              case "testOnActivateContent00": {
                Utils.emitEvent(true, 141310);
                break;
              }
            }
          })
      }
      Web({ src: 'resource://rawfile/name12.html', controller: this.controller })
        .key("WebButton")
        .javaScriptAccess(true)
        .allowWindowOpenMethod(true)
        .multiWindowAccess(true)
        .onWindowNew((event: OnWindowNewEvent): void => {
          console.log("NEU-onWindowNew");
          if (this.dialogController) {
            this.dialogController?.close();
          }
          this.offsetX += 20;
          this.offsetY += 200;
          let popController: web_webview.WebviewController = new web_webview.WebviewController(undefined);
          this.dialogController = new CustomDialogController({
            width: 80,
            height: 80,
            builder: NewWebViewComp({ webviewController_1: popController }),
            isModal:false,
            offset: { dx: this.offsetX, dy: this.offsetY }
          })
          this.dialogController?.open();
          event.handler.setWebController(popController);
        })
    }
  }
}
