/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import {Text, OnRenderExitedEvent, OnPageBeginEvent, RenderProcessNotRespondingReason, RenderProcessNotRespondingData, Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import web_webview from '@ohos.web.webview'
import { BusinessError, RecordData } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import image from '@ohos.multimedia.image';
import web_webview from '@ohos.web.webview';
import  { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector';
class StringFields {
  str: string = '';
}
@Entry
@Component
struct WebComponent {
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = 'enableFollowSystemFontWeight01';
  stringObj: StringFields  = new StringFields ();

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info(' Finish aboutToAppear ' + this.valueChangeCallBack);
  }



  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION value: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        console.info('strValue has been updated to: ' + strValue);
        this.stringObj.str = strValue;
        console.info('this.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build() {
    Column(undefined) {
      Row(undefined) {
        Button('web test').key('enableFollowSystemFontWeightButton')
          .onClick( (event:ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {
            case 'emitenableFollowSystemFontWeight01': {
              try  {
                console.info('start enableFollowSystemFontWeight');
                Utils.emitEvent('enableFollowSystemFontWeight', 20241231)
              } catch (error) {
                console.info(`error info: ${JSON.stringify(error)}`);
              }
              break;
            }
            case 'emitonSwitchNextPage1': {
              console.log('emitonSwitchNextPage in in in')
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webFantasyFont' })
              console.log('push URL success')
            }
          }
        })
      }

      Text('enableFollowSystemFontWeight').fontSize(14).id('textResize')
      Web({ src: 'www.example.com', controller: this.controller })
        .enableFollowSystemFontWeight(true)
    }
  }
}