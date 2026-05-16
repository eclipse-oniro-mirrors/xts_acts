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
import webView from '@ohos.web.webview';
import Utils from '../../src/test/Util.test';
import emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import { BusinessError, RecordData } from '@ohos.base';
import { State } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import {
  Color,
  TextInput,
  TextInputController,
  $rawfile,
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web
} from '@ohos.arkui.component'


class StringFields {
  str: string = '';
}


@Entry
@Component
struct WebViewZoomRatio {
  stringObj: StringFields = new StringFields();
  @State text: string = ''
  @State fontSize: Int = 16
  @State zoom: Int = 0
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  controllerText: TextInputController = new TextInputController()

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
        Button('WebViewZoomRatioTestButton').key('WebViewZoomRatioTestButton').onClick((e: ClickEvent) => {
          switch (this.stringObj.str) {
            case 'emitZoomRatio': {
              this.zoom = -1
              this.controller.refresh()
              console.info('valueChangeCallBack:');
              this.controller.runJavaScript('getFontSize()', (error, result) => {
                console.log('getFontSize return:', JSON.stringify(result));
                if (this.fontSize != null && result != null) {
                  if (this.fontSize.toString() == result.substring(1, result.length - 3)) {
                    Utils.emitEvent(true, 3701)
                    console.info('valueChangeCallBack:');
                  }
                }
              })
              break;
            }

            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/WebAttributeTest' })
              console.log('push URL success')
            }
          }
        })
      }

      Row() {
        TextInput({ text: this.text, placeholder: 'input your word...', controller: this.controllerText })
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .width(400)
          .height(200)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string): void => {
            this.text = value
          })
      }

      Web({ src: 'resource://rawfile/indexJru.html', controller: this.controller })
        .textZoomRatio(this.zoom)
        .defaultFontSize(this.fontSize)
    }
  }
}
