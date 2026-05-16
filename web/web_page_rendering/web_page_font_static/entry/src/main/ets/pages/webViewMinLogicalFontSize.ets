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
export class StringFields {
  str: string = '';
}
@Entry
@Component
struct WebComponent {
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  stringObj: StringFields  = new StringFields();
  @State minFontSize: int | undefined = 8
  @State defaultFontSize: int | undefined = 16
  @State minLogicalFontSize: int | undefined = 8
  @State defaultFixedFontSize: int | undefined = 13

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
        Button('WebViewMinLogicalFontSizeTest').key('WebViewMinLogicalFontSizeTestButton')
          .onClick( (event:ClickEvent) => {
            console.info('key==>' + this.stringObj.str)
            switch (this.stringObj.str) {
              case 'emitMinLogicalFontSize': {
                try  {
                  this.minLogicalFontSize = 5
                  this.minFontSize = 4
                  this.defaultFontSize = 3
                  this.defaultFixedFontSize = 2
                  this.controller.refresh();
                  setTimeout(() => {
                    this.controller.runJavaScript('getFontSize()', (error, result) => {
                      console.log(' return data => ', result, error)
                      if (result == '"5px"') {
                        Utils.emitEvent(true, 20260319)
                      }
                    })
                  }, 2000)
                } catch (error) {
                  console.info(`error info: ${JSON.stringify(error)}`);
                }
                break;
              }
              case 'emitMinLogicalFontSizeMin': {
                try  {
                  this.minLogicalFontSize = undefined
                  this.minFontSize = undefined
                  this.defaultFontSize = undefined
                  this.defaultFixedFontSize = undefined
                  this.controller.refresh();
                  setTimeout(() => {
                    this.controller.runJavaScript('getFontSize()', (error, result) => {
                      console.log(' return data => ', result, error)
                      if (result == '"5px"') {
                        Utils.emitEvent(true, 20260320)
                      }
                    })
                  }, 2000)
                } catch (error) {
                  console.info(`error info: ${JSON.stringify(error)}`);
                }
                break;
              }
              case 'emitMinLogicalFontSizeMax': {
                try  {
                  this.minLogicalFontSize = 75
                  this.minFontSize = 74
                  this.defaultFontSize = 73
                  this.defaultFixedFontSize = 76
                  this.controller.refresh();
                  setTimeout(() => {
                    this.controller.runJavaScript('getFontSize()', (error, result) => {
                      console.log(' return data => ', result, error)
                      if (result == '"72px"') {
                        Utils.emitEvent(true, 20260321)
                      }
                    })
                  }, 2000)
                } catch (error) {
                  console.info(`error info: ${JSON.stringify(error)}`);
                }
                break;
              }
              case 'emitonSwitchNextPage1': {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/enableFollowSystemFontWeight' })
              }
            }
          })
      }
      Web({ src: 'resource://rawfile/indexJru.html', controller: this.controller })
        .minLogicalFontSize(this.minLogicalFontSize)
        .defaultFontSize(this.defaultFontSize)
        .minFontSize(this.minFontSize)
        .defaultFixedFontSize(this.defaultFixedFontSize)
        .javaScriptAccess(true)
    }
  }
}