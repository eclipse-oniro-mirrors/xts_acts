/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
  Blank
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import webview from '@ohos.web.webview';
import { BusinessError, Callback,RecordData  } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Utils.test';


export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webViewGetSecurityLevel {
  stringObj: StringFields  = new StringFields();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  controllerOne: webview.WebviewController = new webview.WebviewController(undefined);
  @State emitKey: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State isFrameResourceType: boolean = false
  @State isPageEnd: number = -1;
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
        Button('web click')
          .key('webViewGetSecurityLevelButton')
          .onClick( (e:ClickEvent) => {
            console.info('key==>' +  this.stringObj.str)
            switch (this.stringObj.str) {
              case 'emitWebViewGetSecurityLevel01': {
                try {
                  this.isPageEnd = -1;
                  let securityLevel = this.controller.getSecurityLevel();
                  console.log('securityLevel===>'+securityLevel)
                  if (securityLevel === 0) {
                    Utils.emitEvent('success', 8008);
                  } else {
                    Utils.emitEvent('fail', 8008);
                  }
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code}`);
                }
                break;
              }

              case 'emitWebViewGetSecurityLevel02': {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://www.baidu.com');
                  setTimeout(() => {
                    let securityLevel = this.controller.getSecurityLevel();
                    console.log('securityLevel===>'+securityLevel)
                    Utils.emitEvent(securityLevel, 80081);
                  }, 5000)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code}`);
                }
                break;
              }

              case 'emitWebViewGetSecurityLevel03': {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl("http://www.example.com");
                  setTimeout(() => {
                    let securityLevel = this.controller.getSecurityLevel();
                    console.log('securityLevel===>'+securityLevel)
                    Utils.emitEvent(securityLevel, 80082);
                  }, 5000)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code}`);
                }
                break;
              }

              case 'emitWebViewGetSecurityLevel04': {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl("https://expired.badssl.com/");
                  setTimeout(() => {
                    let securityLevel = this.controller.getSecurityLevel();
                    console.log('securityLevel===>'+securityLevel)
                    Utils.emitEvent(securityLevel, 80083);
                  }, 5000)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code}`);
                }
                break;
              }

              case 'emitWebViewGetSecurityLevel05': {
                try {
                  this.isPageEnd = -1;
                  this.controllerOne.loadUrl("www.baidu.com");
                  let securityLevel = this.controllerOne.getSecurityLevel();
                  console.log('securityLevel===>'+securityLevel)
                  Utils.emitEvent(securityLevel, 80084);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                  Utils.emitEvent(`${error.code}`, 370241);
                }
                break;
              }
            }
          })
      }
      Web({ src: 'https://weixin://dl/moments', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onPageEnd(()=>{
          this.isPageEnd = 0;
        })
    }
  }
}
