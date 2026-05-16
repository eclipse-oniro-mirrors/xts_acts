/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import webView from '@ohos.web.webview';
import web_webview from '@ohos.web.webview';
import Utils from '../../src/test/Util.test';
import {OnFirstContentfulPaintEvent,Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog';
import { Callback, RecordData } from '@ohos.base';
import emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext'

@Entry
@Component
struct webOnFirstContFour {
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = 'emitRefreshOnfirstcontentfulpaintWebc';
  @State firstId: int = 428;
  @State firstcontentfulpaint: boolean = false;
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State firstBoo: boolean = false;

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }


  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.str = strValue;
        console.info('this.str has been updated to: ' + this.str);
      }
    }
  }

  build() {
    Column(undefined) {
      Row() {
        Button('web click3').key('webOnFirstContFour').onClick((e: ClickEvent) => {
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'emitRefreshOnfirstcontentfulpaintWebc': {
              try {
                this.controller.clearHistory();
                this.controller.loadUrl('resource://rawfile/index.html')
                console.log('web is refresh');
              } catch (error) {
                hilog.info(0x0000, 'testTag',`ErrorCode: `+error);
              }
              break;
            }

            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/wholeWebPageDrawing' })
              console.log('push URL success')
            }
          }
        })
      }

      Web({ src: 'www.baidu.com', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onFirstContentfulPaint((event:OnFirstContentfulPaintEvent ):void=> {
          console.log('onFirstContentfulPaint: ' + '[navigationStartTick]: ' +
          event.navigationStartTick + ', [firstContentfulPaintMs]: ' + event.firstContentfulPaintMs + this.firstId)
          if (event.firstContentfulPaintMs > 0 && event.navigationStartTick > 0) {
            this.firstcontentfulpaint = true;
            Utils.emitEvent(this.firstcontentfulpaint, this.firstId)
            console.error('result of onFirstContentfulPaint is: ' + this.firstcontentfulpaint + this.firstId);
          }
        })
    }
  }
}