/**
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

import {OnFirstContentfulPaintEvent, Visibility,OnRenderExitedEvent, OnPageBeginEvent, RenderProcessNotRespondingReason, RenderProcessNotRespondingData, Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import web_webview from '@ohos.web.webview'
import { BusinessError, RecordData } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import image from '@ohos.multimedia.image';
import web_webview from '@ohos.web.webview';
import  { BusinessError } from '@ohos.base';
import webView from '@ohos.web.webview';
import hilog from '@ohos.hilog';

class StringFields {
  str: string = '';
}

@Entry
@Component
struct WebOnFirstContentfulPaint {
  controller1: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State vis: Visibility = Visibility.None
  @State onFirstContentfulPaintCalled: boolean = false;
  stringObj: StringFields  = new StringFields ();

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
        Button('web click').key('WebOnFirstContentfulPaintButton')
          .onClick((event:ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {
            case 'emitOnFirstContentfulPaint001': {
              try {
                Utils.emitEvent(this.onFirstContentfulPaintCalled, 520)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitOnFirstContentfulPaint002': {
              try {
                this.vis = Visibility.Visible
                setTimeout(()=>{
                  this.controller1.refresh();
                  setTimeout(() => {
                    Utils.emitEvent(this.onFirstContentfulPaintCalled, 522);
                  }, 3000);
                },3000);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }
      Web({ src: 'www.baidu.com', controller: this.controller1 })
        .javaScriptAccess(this.javaScriptAccess)
        .visibility(this.vis)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onFirstContentfulPaint((event:OnFirstContentfulPaintEvent):void => {
          if (event) {
            console.log('onFirstContentfulPaint:' + '[navigationStartTick]:' +
            event.navigationStartTick + ', [firstContentfulPaintMs]:' + event.firstContentfulPaintMs)
            if (event.firstContentfulPaintMs > 0 && event.navigationStartTick > 0) {
              this.onFirstContentfulPaintCalled = true
            }
          }
        })
    }
  }
}