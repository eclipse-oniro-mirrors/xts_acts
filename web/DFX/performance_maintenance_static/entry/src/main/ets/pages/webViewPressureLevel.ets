/*
Copyright (c) 2025 Huawei Device Co., Ltd.
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
*
http://www.apache.org/licenses/LICENSE-2.0
*
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import { BusinessError, RecordData } from '@ohos.base';
import emitter from '@ohos.events.emitter';
import web_webview from '@ohos.web.webview'
import Utils from '../../src/test/Util.test';
import { State } from '@ohos.arkui.stateManagement'
import { Callback } from '@ohos.base'
import { Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
class StringFields {
  str: string = '';
}
@Entry
@Component
struct WebComponent {
  webviewController: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = ''
  stringObj: StringFields  = new StringFields ();

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear' + this.valueChangeCallBack);
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION vaclue: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        console.info('strValue has been updated to: ' + strValue);
        this.stringObj.str = strValue;
        console.info('this.str has been updated to: ' + this.stringObj.str);
      }
    }
  }


  build(){
    Column(){
      Row(){
        Button('web click')
          .key('webviewPressureLevelButton')
          .onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {
            case 'emitWebviewPressureLevelModerate': {
              web_webview.WebviewController.trimMemoryByPressureLevel(
                web_webview.PressureLevel.MEMORY_PRESSURE_LEVEL_MODERATE)
              if (web_webview.PressureLevel.MEMORY_PRESSURE_LEVEL_MODERATE === 1) {
                console.log('MEMORY_PRESSURE_LEVEL is:' + web_webview.PressureLevel.MEMORY_PRESSURE_LEVEL_MODERATE);
                Utils.emitEvent('success', 20001)
              }
            }
            case 'emitWebviewPressureLevelCritical': {
              web_webview.WebviewController.trimMemoryByPressureLevel(
                web_webview.PressureLevel.MEMORY_PRESSURE_LEVEL_CRITICAL)
              if (web_webview.PressureLevel.MEMORY_PRESSURE_LEVEL_CRITICAL === 2) {
                console.log('MEMORY_PRESSURE_LEVEL is:' + web_webview.PressureLevel.MEMORY_PRESSURE_LEVEL_CRITICAL);
                Utils.emitEvent('success', 20002)
              }
            }
          }
        })
      }
      Web({ src: "resource://rawfile/index.html", controller: this.webviewController})
        .optimizeParserBudget(true)
    }
  }
}