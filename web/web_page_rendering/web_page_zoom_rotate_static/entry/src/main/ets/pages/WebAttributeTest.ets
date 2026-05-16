/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import {
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  Row,
  Web,
  OnScaleChangeEvent
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import webview from '@ohos.web.webview';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct WebAttributeTest {
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = "emitInitialScale001"
  @State initialScale: number = 100
  @State newScale: number = 0
  @State oldScale: number = 0
  @State zoomAccessValue: boolean = true;

  aboutToAppear() {
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  aboutToDisappear() {
    emitter.off(10)
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data["ACTION"] != null) {
        console.info('Received ACTION value: ' + data["ACTION"]);
        let strValue: string = String(data["ACTION"]);
        console.info('strValue has been updated to: ' + strValue);
        this.str = strValue;
        console.info('this.str has been updated to: ' + this.str);
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button("web click")
          .key('WebAttributeTestButton')
          .onClick((e: ClickEvent) => {
            console.info("key==>" + this.str)
            switch (this.str) {
              case "emitInitialScale001": {
                try {
                  this.initialScale = 300

                  setTimeout(() => {
                    Utils.emitEvent(`oldScale=${this.oldScale},newScale=${this.newScale}`, 70001)
                  }, 2000);
                } catch (error) {
                  console.error(`==> ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitInitialScale002": {
                try {
                  this.initialScale = 100

                  setTimeout(() => {
                    Utils.emitEvent(`oldScale=${this.oldScale},newScale=${this.newScale}`, 70003)
                  }, 2000);
                } catch (error) {
                  console.error(`==> ${error.code},  Message: ${error.message}`);
                }
                break;
              }
            }
          })

        Web({ src: 'resource://rawfile/index.html', controller: this.controller })
          .key('webView')
          .height('50%')
          .fileAccess(true)
          .zoomAccess(this.zoomAccessValue)
          .width('100%')
          .initialScale(this.initialScale)
          .onScaleChange((event: OnScaleChangeEvent): void => {
            console.log('onScaleChange called oldScale :' + event.oldScale)
            console.log('onScaleChange called newScale :' + event.newScale)
            this.oldScale = event.oldScale
            this.newScale = event.newScale
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}