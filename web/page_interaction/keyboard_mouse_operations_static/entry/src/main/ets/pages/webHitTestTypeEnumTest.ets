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

import webView from '@ohos.web.webview';
import { Utils } from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { BusinessError, RecordData } from '@ohos.base';
import { State } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { Callback } from '@ohos.base'
import { Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'

@Entry
@Component
struct WebHitTestTypeEnumTest {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ''

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
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button('WebHitTestTypeEnumTestButton').key('WebHitTestTypeEnumTestButton')
          .onClick((e: ClickEvent) => {
            console.log('key==>' + this.str)
            switch (this.str) {
              case 'testWebHitTestTypeEnum001': {
                try {
                  Utils.emitEvent(webView.WebHitTestType.EDIT_TEXT, 70143)
                } catch (error: BusinessError) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebHitTestTypeEnum002': {
                try {
                  Utils.emitEvent(webView.WebHitTestType.EMAIL, 70144)
                } catch (error: BusinessError) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebHitTestTypeEnum003': {
                try {
                  Utils.emitEvent(webView.WebHitTestType.HTTP_ANCHOR, 70145)
                } catch (error: BusinessError) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebHitTestTypeEnum004': {
                try {
                  Utils.emitEvent(webView.WebHitTestType.HTTP_ANCHOR_IMG, 70146)
                } catch (error: BusinessError) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebHitTestTypeEnum005': {
                try {
                  Utils.emitEvent(webView.WebHitTestType.IMG, 70147)
                } catch (error: BusinessError) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebHitTestTypeEnum006': {
                try {
                  Utils.emitEvent(webView.WebHitTestType.MAP, 70148)
                } catch (error: BusinessError) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebHitTestTypeEnum007': {
                try {
                  Utils.emitEvent(webView.WebHitTestType.PHONE, 70149)
                } catch (error: BusinessError) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebHitTestTypeEnum008': {
                try {
                  Utils.emitEvent(webView.WebHitTestType.UNKNOWN, 70150)
                } catch (error: BusinessError) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitonSwitchNextPage': {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/WebOnInterceptKeyEvent' })
                console.log('push URL success')
              }
            }
          })

        Web({ src: 'resource://rawfile/hitType.html', controller: this.controller })
          .javaScriptAccess(true)
          .javaScriptAccess(true)
          .horizontalScrollBarAccess(true)
          .verticalScrollBarAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
      }
      .width('100%')
    }
    .height('100%')
  }
}