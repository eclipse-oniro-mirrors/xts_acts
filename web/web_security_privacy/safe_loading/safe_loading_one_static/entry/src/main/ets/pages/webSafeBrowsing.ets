/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import emitter from '@ohos.events.emitter';
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
    }
  }
}

  build() {
    Column() {
      Row() {
        Button("web click").key('webViewSdkSchemeHandler').onClick((e: ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          switch (this.stringObj.str) {
            case 'emitEnableSafeBrowsingTrue': {
              try {
                this.controller.enableSafeBrowsing(true);
                let result:boolean = this.controller.isSafeBrowsingEnabled();
                console.log(' emitEnableSafeBrowsingTrue:  ', result);

                Utils.emitEvent(result, 2001)
              } catch (error) {
               error = error as BusinessError;
               console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 2001)
              }
              break;
            }

            case 'emitEnableSafeBrowsingFalse': {
              try {
                this.controller.enableSafeBrowsing(false);
                let result:boolean = this.controller.isSafeBrowsingEnabled();
                console.log(' emitEnableSafeBrowsingFalse:  ', result);

                Utils.emitEvent(!result, 2002)
              } catch (error) {
               error = error as BusinessError;
               console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 2002)
              }
              break;
            }

            case 'emitIsSafeBrowsingEnabledTrue': {
              try {
                this.controller.enableSafeBrowsing(true);
                let result:boolean = this.controller.isSafeBrowsingEnabled();
                console.log(' emitIsSafeBrowsingEnabledTrue:  ', result);

                Utils.emitEvent(result, 2003)
              } catch (error) {
               error = error as BusinessError;
               console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 2003)
              }
              break;
            }

            case 'emitIsSafeBrowsingEnabledFalse': {
              try {
                this.controller.enableSafeBrowsing(false);
                let result:boolean = this.controller.isSafeBrowsingEnabled();
                console.log(' emitIsSafeBrowsingEnabledFalse:  ', result);

                Utils.emitEvent(!result, 2004)
              } catch (error) {
               error = error as BusinessError;
               console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 2004)
              }
              break;
            }
          }
        })

      }

      Web({ src: 'https://m.iqiyi.com/', controller: this.controller })
    }
  }
}
