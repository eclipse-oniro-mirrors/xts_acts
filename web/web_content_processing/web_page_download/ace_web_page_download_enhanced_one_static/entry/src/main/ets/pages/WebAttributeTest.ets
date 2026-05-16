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
import {
  Entry,
  Text,
  Column,
  Row,
  Component,
  Button,
  ClickEvent,
  Web,
  OnDownloadStartEvent
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { Callback, RecordData } from '@ohos.base'
import webView from '@ohos.web.webview';
import Utils from '../../src/test/Utils.test';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebAttributeTest {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ''
  @State initialScale: number = 100
  @State geolocationAccess: boolean = true
  @State blockNetwork: boolean = false
  @State errorReceive: string = ''
  @State isDownloadStart: boolean = false

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
        this.stringObj.str = strValue;
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button('web click')
          .key('WebAttributeTestButton')
          .focusable(true)
          .onClick((e: ClickEvent) => {
            console.info('key==>' +  this.stringObj.str)
            switch (this.stringObj.str) {
              case 'emitOnDownloadStart': {
                try {
                  this.isDownloadStart = true
                  this.controller.loadUrl('https://consumer.huawei.com/content/dam/' +
                    'huawei-cbg-site/cn/mkt/mobileservices/2022/download/' +
                    'PC107f1b3947c942ffaa14334a879065d8.2107261020.exe')
                  setTimeout(() => {
                    console.info('download start')
                  }, 2000)
                } catch (error) {
                  console.error(`ErrorCode: ` + error);
                }
                break;
              }
            }
          })

        Web({ src: 'www.example.com', controller: this.controller })
          .key('webView')
          .height('50%')
          .fileAccess(true)
          .width('100%')
          .javaScriptAccess(true)
          .horizontalScrollBarAccess(true)
          .verticalScrollBarAccess(true)
          .initialScale(this.initialScale)
          .geolocationAccess(this.geolocationAccess)
          .databaseAccess(true)
          .blockNetwork(this.blockNetwork)
          .onDownloadStart((event: OnDownloadStartEvent):void => {
            console.info('onDownloadStart==>' + event.url)
            console.info('onDownloadStart==>' + event.contentDisposition)
            console.info('onDownloadStart==>' + event.mimetype)
            console.info('onDownloadStart==>' + event.contentLength)
            if (event) {
              if (this.isDownloadStart) {
                console.info('isDownloadStart==>')
                this.isDownloadStart = false
                Utils.emitEvent(this.isDownloadStart, 60068)
              }
            }
          })
      }
      .width('100%')
    }

    .height('100%')
  }
}