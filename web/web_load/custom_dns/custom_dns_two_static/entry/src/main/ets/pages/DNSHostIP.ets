/*
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

import webview from '@ohos.web.webview'
import { State } from '@ohos.arkui.stateManagement'
import { Button, ClickEvent, Column, Component, Entry, Row, Text, Web, } from '@ohos.arkui.component'
import events_emitter from '@ohos.events.emitter'
import { BusinessError, Callback, RecordData } from '@ohos.base'
import { Hypium } from '../../../hypium';
import Utils from '../../src/test/Utils.test';

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct DNSHostIP {
  stringObj: StringFields = new StringFields();
  @State userAgentPC: string = "";
  @State str: string = "";
  @State getURL: string = "";
  @State getURL1: string = "";
  @State value: boolean = false;
  controller: webview.WebviewController = new webview.WebviewController(undefined);

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
        console.info('this.stringObj.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("DNSHostIP").key('DNSHostIP').onClick((e: ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          switch (this.stringObj.str) {
            case "setHostIP0100": {
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                Utils.emitEvent(true, 8770)
                break;
              } else if ((this.userAgentPC).includes("Tablet")) {
                Utils.emitEvent(true, 8770)
                break;
              }
              this.value = false;
              this.getURL = '';
              this.getURL1 = '';
              try {
                this.getURL = this.controller.getUrl();
                console.log('setHostIP0100_getUrl: ' + this.getURL);
                webview.WebviewController.setHostIP('www.baidu.com', '124.95.179.4', 30);
                this.controller.loadUrl('www.baidu.com');
                webview.WebviewController.clearHostIP('www.dnstest.com');
                this.controller.removeCache(true);
                this.controller.loadUrl('www.baidu.com');
                this.getURL1 = this.controller.getUrl();
                console.log('setHostIP0100_getUrl: ' + this.getURL1)
                if (this.getURL != this.getURL1) {
                  this.value = true;
                }
                console.log('setHostIP0100_value: ' + this.value)
                this.controller.removeCache(true);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                Utils.emitEvent(this.value, 8770)
              }, 3000)
              break;
            }
          }
        })

      }

      Web({ src: 'www.dnsTest.com', controller: this.controller })
        .height(500)
        .width(500)
    }
  }
}
