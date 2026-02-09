/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
struct webViewController {
  stringObj: StringFields = new StringFields();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = ""
  @State javaScriptAccess: boolean = true
  @State enterPageEnd: boolean = false
  @State forceDarkAccess: boolean = false

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
    Column() {
      Row() {
          Button("WebViewController click").key('WebViewControllerButton').onClick((e: ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          switch (this.stringObj.str) {
            case "testSecureDnsModeAUTO001": {
              try {
                webview.WebviewController.setHttpDns(webview.SecureDnsMode.AUTO,
                  "https://httpdns-browser.platform.dbankcloud.cn/dns-query{?dns}")
                setTimeout(() => {
                  Utils.emitEvent(this.controller.getTitle(), 31036)
                }, 1000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31036)
              }
              break;
            }
          }
        })
      }

      Web({ src: 'https://www.example.com', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .key("onShowFileSelectorKey")
        .onPageEnd((event) => {
          if (event) {
            this.enterPageEnd = true
          }
        })
        .fileAccess(true)
        .forceDarkAccess(this.forceDarkAccess)
    }
    .key('RowSize')
  }
}
