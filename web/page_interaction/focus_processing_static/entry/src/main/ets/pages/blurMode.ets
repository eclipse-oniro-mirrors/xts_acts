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

import { Text,BlurOnKeyboardHideMode,$rawfile,OnConsoleEvent,Entry, Component, Column, Row, Button, ClickEvent, Web } from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement"
import web_webview from '@ohos.web.webview';
import Utils from '../../src/test/Util.test';
import { BusinessError, RecordData } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'

@Entry
@Component
struct WebComponent {
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = "";
  @State blurMode:BlurOnKeyboardHideMode = BlurOnKeyboardHideMode.SILENT;
  @State text:string = ''
  @State userAgentPC:string = "";

  aboutToAppear() {
    console.info("Entry aboutToAppear");
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info("Finish aboutToAppear " + this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(10)
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
        Button("web test")
          .key('blurOnKeyboardHideMode01')
          .onClick((e: ClickEvent) => {
            console.info("key==>" + this.str);
            switch (this.str) {
              case "blurMode01": {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 20241133)
                  break;
                }
                if (this.text == 'focus') {
                  Utils.emitEvent(true, 20241133)
                }
                this.blurMode = BlurOnKeyboardHideMode.BLUR;
                this.controller.loadUrl('resource://rawfile/blurMode.html');
                break;
              }

              case "blurMode02": {
                setTimeout(() => {
                  this.userAgentPC = this.controller.getUserAgent();
                  if ((this.userAgentPC).includes("PC")) {
                    Utils.emitEvent(true, 20241134)
                  } else {
                    if (this.text == 'blur') {
                      Utils.emitEvent(true, 20241134)
                    } else {
                      Utils.emitEvent(false, 20241134)
                    }
                  }
                }, 500)
              }
            }
          })
      }
      Text('' + this.text)

      Web({ src: 'resource://rawfile/blurMode.html', controller: this.controller })
        .javaScriptAccess(true)
        .blurOnKeyboardHideMode(this.blurMode)
        .height("80%")
        .onConsole((event:OnConsoleEvent):boolean => {
          if (event) {
            console.log('getMessage:' + event.message.getMessage());
            this.text = event.message.getMessage();
            console.info('this.blurMode:' + this.blurMode)
          }
          return false;
        })
      .key('blurOnKeyboardHideModeWeb')
    }
  }
}