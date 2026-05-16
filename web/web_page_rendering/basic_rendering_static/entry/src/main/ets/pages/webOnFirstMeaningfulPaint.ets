/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import web_webview from '@ohos.web.webview';
import Utils from '../../src/test/Util.test';
import { FirstMeaningfulPaint, Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog';
import { Callback, RecordData } from '@ohos.base';
import emitter from '@ohos.events.emitter';
import { BusinessError, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext'

@Entry
@Component
struct webOnFirstMeaningfulPaint {
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = '';
  @State ScreenPaintNavigationStartTime: long | undefined = 0;
  @State ScreenPaintFirstMeaningfulPaintTime: long | undefined = 0;
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;

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
    Column() {
      Row() {
        Button('WebOnFirstMeaningfulPaint click')
          .key('WebOnFirstMeaningfulPaintButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' + this.str)
            switch (this.str) {
              case 'testWebOnFirstMeaningfulPaintLoadUrl': {
                try {
                  this.controller.loadUrl('https://www.baidu.com/')
                  setTimeout(() => {
                    console.log(`testWebOnFirstMeaningfulPaintLoadUrl finish.`);
                  }, 4000)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebOnFirstMeaningfulPaint001': {
                try {
                  console.log(`testWebOnFirstMeaningfulPaint001 navigationStartTime: ${this.ScreenPaintNavigationStartTime}.`);
                  Utils.emitEvent((this.ScreenPaintNavigationStartTime ?? 0) > 0, 20260320);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error, 20260320)
                }
                break;
              }
              case 'testWebOnFirstMeaningfulPaint002': {
                try {
                  console.log(`testWebOnFirstMeaningfulPaint002 largestImagePaintTime: ${this.ScreenPaintFirstMeaningfulPaintTime}.`);
                  Utils.emitEvent((this.ScreenPaintFirstMeaningfulPaintTime ?? 0) > 0, 20260321);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error, 20260321)
                }
              }
            }
          })
      }
      Web({ src: 'https://www.baidu.com/', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onFirstMeaningfulPaint((event: FirstMeaningfulPaint): void => {
          this.ScreenPaintNavigationStartTime = event.navigationStartTime;
          this.ScreenPaintFirstMeaningfulPaintTime = event.firstMeaningfulPaintTime;
          console.log(`FirstMeaningfulPaint navigationStartTime: ${event.navigationStartTime}.`);
          console.log(`FirstMeaningfulPaint firstMeaningfulPaintTime: ${event.firstMeaningfulPaintTime}.`);
        })
    }
  }
}