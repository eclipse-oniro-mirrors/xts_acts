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
import { LargestContentfulPaint, Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog';
import { Callback, RecordData } from '@ohos.base';
import emitter from '@ohos.events.emitter';
import { BusinessError, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext'

@Entry
@Component
struct webOnLargestContentfulPaint {
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = '';
  @State ScreenPaintNavigationStartTime: long | undefined = 0;
  @State ScreenPaintLargestImagePaintTime: long | undefined = 0;
  @State ScreenPaintLargestTextPaintTime: long | undefined = 0;
  @State ScreenPaintImageBPP: double | undefined = 0;
  @State ScreenPaintLargestImageLoadStartTime: long | undefined = 0;
  @State ScreenPaintLargestImageLoadEndTime: long | undefined = 0;
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
        Button('WebOnLargestContentfulPaint click')
          .key('WebOnLargestContentfulPaintButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' + this.str)
            switch (this.str) {
              case 'testWebOnLargestContentfulPaintLoadUrl': {
                try {
                  this.controller.loadUrl('https://www.people.com.cn/')
                  setTimeout(() => {
                    console.log(`testWebOnLargestContentfulPaintLoadUrl finish.`);
                  }, 4000)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebOnLargestContentfulPaint001': {
                try {
                  console.log(`testWebOnLargestContentfulPaint001 navigationStartTime: ${this.ScreenPaintNavigationStartTime}.`);
                  Utils.emitEvent((this.ScreenPaintNavigationStartTime ?? 0) > 0, 20260314);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error, 20260314)
                }
                break;
              }
              case 'testWebOnLargestContentfulPaint002': {
                try {
                  console.log(`testWebOnLargestContentfulPaint002 largestImagePaintTime: ${this.ScreenPaintLargestImagePaintTime}.`);
                  Utils.emitEvent((this.ScreenPaintLargestImagePaintTime ?? 0) > 0, 20260315);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error, 20260315)
                }
                break;
              }
              case 'testWebOnLargestContentfulPaint003': {
                try {
                  console.log(`testWebOnLargestContentfulPaint003 largestTextPaintTime: ${this.ScreenPaintLargestTextPaintTime}.`);
                  Utils.emitEvent((this.ScreenPaintLargestTextPaintTime ?? 0) > 0, 20260316);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error, 20260316)
                }
                break;
              }
              case 'testWebOnLargestContentfulPaint004': {
                try {
                  console.log(`testWebOnLargestContentfulPaint004 imageBPP: ${this.ScreenPaintImageBPP}.`);
                  Utils.emitEvent((this.ScreenPaintImageBPP ?? 0) > 0, 20260317);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error, 20260317)
                }
                break;
              }
              case 'testWebOnLargestContentfulPaint005': {
                try {
                  console.log(`testWebOnLargestContentfulPaint005 largestImageLoadStartTime: ${this.ScreenPaintLargestImageLoadStartTime}.`);
                  Utils.emitEvent((this.ScreenPaintLargestImageLoadStartTime ?? 0) > 0, 20260318);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error, 20260318)
                }
                break;
              }
              case 'testWebOnLargestContentfulPaint006': {
                try {
                  console.log(`testWebOnLargestContentfulPaint006 largestImageLoadEndTime: ${this.ScreenPaintLargestImageLoadEndTime}.`);
                  Utils.emitEvent((this.ScreenPaintLargestImageLoadEndTime ?? 0) > 0, 20260319);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error, 20260319)
                }
                break;
              }
              case 'emitonSwitchNextPage': {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/webOnFirstMeaningfulPaint' })
              }
            }
          })
      }
      Web({ src: 'https://www.people.com.cn/', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onLargestContentfulPaint((event: LargestContentfulPaint): void => {
          this.ScreenPaintNavigationStartTime = event.navigationStartTime;
          this.ScreenPaintLargestImagePaintTime = event.largestImagePaintTime;
          this.ScreenPaintLargestTextPaintTime = event.largestTextPaintTime;
          this.ScreenPaintImageBPP = event.imageBPP;
          this.ScreenPaintLargestImageLoadStartTime = event.largestImageLoadStartTime;
          this.ScreenPaintLargestImageLoadEndTime = event.largestImageLoadEndTime;
          console.log(`LargestContentfulPaint navigationStartTime: ${event.navigationStartTime}.`);
          console.log(`LargestContentfulPaint largestImagePaintTime:${event.largestImagePaintTime}.`);
          console.log(`LargestContentfulPaint largestTextPaintTime: ${event.largestTextPaintTime}.`);
          console.log(`LargestContentfulPaint imageBPP: ${event.imageBPP}.`);
          console.log(`LargestContentfulPaint largestImageLoadStartTime: ${event.largestImageLoadStartTime}.`);
          console.log(`LargestContentfulPaint largestImageLoadEndTime: ${event.largestImageLoadEndTime}.`);
        })
    }
  }
}