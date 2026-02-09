/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import web_webview from '@ohos.web.webview';
import Utils from '../../src/test/Util.test';
import { BusinessError, RecordData } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';
import emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import inspector from '@ohos.arkui.inspector';
import { State } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { OnScrollEvent,$rawfile,Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
class StringFields {
  public str: string = '';
}

@Entry
@Component
struct scrollEventComponent {
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  stringObj: StringFields  = new StringFields ();
  @State xOffset: number = 0;
  @State yOffset: number = 0;
  @State str: string = '';
  aboutToAppear() {
    console.info('[boruto] Entry aboutToAppear');
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('[boruto] Finish aboutToAppear ' + this.valueChangeCallBack);
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
    Column() {
      Row() {
        Button('web test').key('scrollEvent01').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {
            case 'scroll01': {
              Utils.emitEvent(this.xOffset,20241225);
              this.controller.scrollTo(0, 0, 0);
              break;
            }

            case 'scroll02': {
              Utils.emitEvent(this.xOffset,20241226);
              break;
            }

            case 'emitonSwitchNextPage2': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webResourceResponseGet' })
              console.log('push URL success')
            }

          }
        })
      }
      Button('scrollTo')
        .onClick((e: ClickEvent) => {
          try {
            this.controller.scrollTo(50, 50, -500);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        }).key('scrollToButton')
      Button('scrollBy')
        .onClick((e: ClickEvent) => {
          try {
            this.controller.scrollBy(80, 80, 100);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        }).key('scrollByButton')
      Web({ src: 'resource://rawfile/scrollEvent.html', controller: this.controller })
        .onScroll((event:OnScrollEvent):void => {
          this.xOffset = event.xOffset;
          this.yOffset = event.yOffset;
          console.info('x = ' + event.xOffset);
          console.info('y = ' + event.yOffset);
        })

    }
  }
}
