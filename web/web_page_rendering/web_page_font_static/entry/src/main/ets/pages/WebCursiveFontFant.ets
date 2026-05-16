
/**
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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

import Utils from '../../src/test/Util.test';
import webView from '@ohos.web.webview'
import emitter from '@ohos.events.emitter';
import { BusinessError } from '@ohos.base';
import { State } from "@ohos.arkui.stateManagement";
import { Callback, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { CopyOptions,WebMediaOptions,Entry, Component, Column, Row, Button,Text,ClickEvent, Web,$rawfile } from "@ohos.arkui.component";
export class StringFields {
  public str: string = '';
}
@Entry
@Component
struct webViewWebCursiveFont {
  @State str: string = ""
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State family: string | undefined= "cursive";
  stringObj: StringFields  = new StringFields();

  aboutToAppear(): void {
    console.info("Entry aboutToAppear");
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 150207,
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
        console.info('Received ACTION vaclue: ' + data['ACTION']);
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
        Button('WebCursiveFontButton')
          .key('WebCursiveFontButton')
          .onClick( (e: ClickEvent) => {
            console.log('key==>' + this.stringObj.str)
            switch (this.stringObj.str) {
              case "testWebCursiveFontCursive001": {
                try {
                  this.family = 'cursive';
                  this.controller.loadUrl("resource://rawfile/font.html");
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                      Utils.emitEvent('default', 20260311)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 20260311)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('default', 20260311)
                }
                break;
              }

              case "testWebCursiveFontCursive002": {
                try {
                  this.family = undefined;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                      Utils.emitEvent('default', 20260312)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 20260312)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('default', 20260312)
                }
                break;
              }
            }
          })
      }

      Web({ src: $rawfile('font.html'), controller: this.controller })
        .webCursiveFont(this.family)
        .javaScriptAccess(true)
    }
  }
}