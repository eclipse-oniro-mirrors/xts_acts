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
import webview from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import { Driver, ON } from '@ohos.UiTest';
import { State } from '@ohos.arkui.stateManagement'
import { Callback } from '@ohos.base'
import common from '@ohos.app.ability.common';
import { OverScrollMode,TouchEvent,Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
import { BusinessError, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext'

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebComponent{
  stringObj: StringFields  = new StringFields ();
  @State testTitle: string = 'webScroll'
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State controllerX: number =-100;
  @State controllerY: number =-100;
  @State mode: OverScrollMode = OverScrollMode.ALWAYS;
  @State str: string = 'scrollByTo01';

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear ' + this.valueChangeCallBack);
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



  build(){
    Column(){
      Row(){
        Button('web test').key('scrollByToButton').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)

          switch (this.stringObj.str) {
            case 'scrollByTo01': {
              Utils.emitEvent(webview.ScrollType.EVENT , 20250322)
              break;
            }

            case 'emitonSwitchNextPage1': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/scrollEvent' })
              console.log('push URL success')
            }
          }
        })
      }

      Button('setScrollable').key('setScrollableButton')
        .onClick((e: ClickEvent) => {
          try {
            this.controller.setScrollable(true,webview.ScrollType.EVENT);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })

      Web({ src: 'resource://rawfile/scrollByTo.html', controller: this.controller })
        .key('webScrollByTo')
        .overScrollMode(this.mode)
        .onTouch((event:TouchEvent):void => {
          this.controllerX = this.controller.getScrollOffset().x;
          this.controllerY = this.controller.getScrollOffset().y;
          if (this.controllerY < 0) {
            console.log(`get downwards overscroll offsetY = ${this.controllerY}`);
            console.log(`get downwards overscroll offsetX = ${this.controllerX}`);
          }else {
            console.log(`get scroll offsetY = ${this.controllerY}`);
            console.log(`get downwards overscroll offsetX = ${this.controllerX}`);
          }
        })
        .height(600)
    }
    .width('100%')
    .height('100%')
  }
}