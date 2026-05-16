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

import { Text,BlurOnKeyboardHideMode,$rawfile,OnConsoleEvent,Entry, Component, Column, Row, Button, ClickEvent, Web, GestureFocusMode } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext'
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
  @State str: string = '';

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear ' + this.valueChangeCallBack);
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION value: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        console.info('strValue has been updated to: ' + strValue);
        this.str = strValue;
        console.info('this.str has been updated to: ' + this.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebGestureFocusMode click')
          .key('WebGestureFocusModeButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' + this.str);
            switch (this.str) {
              case 'testWebGestureFocusMode00': {
                try {
                  console.info(`testWebGestureFocusMode00: ${GestureFocusMode.DEFAULT}`);
                  Utils.emitEvent(GestureFocusMode.DEFAULT, 20260310)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error, 20260310)
                }
                break;
              }
              case 'testWebGestureFocusMode01': {
                try {
                  console.info(`testWebGestureFocusMode01: ${GestureFocusMode.GESTURE_TAP_AND_LONG_PRESS}`);
                  Utils.emitEvent(GestureFocusMode.GESTURE_TAP_AND_LONG_PRESS, 20260311)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error, 20260311)
                }
                break;
              }
              case 'emitonSwitchNextPage': {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/WebForceEnableZoom' })
              }
            }
          })
      }
      Web({ src: 'https://www.example.com', controller: this.controller })
        .javaScriptAccess(true)
    }
  }
}