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

import { $rawfile, Entry, Component, Column, Row, Button, ClickEvent, Web, CustomDialogController, CustomDialog, CustomDialog, SslErrorEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import emitter from '@ohos.events.emitter';
import { JsProxyObject } from '../../src/test/Interfaces';
import { Callback } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import webview from '@ohos.web.webview'
import {canIUse} from '@internal.full.global'
import { Driver, ON } from '@ohos.UiTest';

export class StringFields {
  str: string = '';
}

@Entry
@Component
struct WebSslErrorTest {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  controller2: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = ""
  @State sslErrorType: number = -1
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isSslErrorHandlerComplete: number = 0;
  @State titleReceive: string = ""
  @State handlerLength:number = 0

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
        Button("WebSslErrorTestButton").key('WebSslErrorTestButton').onClick((e:ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          this.isReceive = -1;
          switch (this.stringObj.str) {
            case "emitSslErrorInvalid": {
              this.controller.clearClientAuthenticationCache();
              this.controller.clearSslCache();
              Utils.emitEvent(0, 202699)
              break;
            }
            case "emitSslErrorDateInvalid": {
              this.controller.clearClientAuthenticationCache();
              this.controller.clearSslCache();
              this.controller.loadUrl('https://expired.badssl.com');
              break;
            }
            case "emitSslErrorUntrusted": {
              this.controller.loadUrl('https://untrusted-root.badssl.com/');
              break;
            }
            case "emitSslErrorHostMismatch": {
              this.controller.loadUrl('https://wrong.host.badssl.com');
              break;
            }
            case "emitSslErrorHandler": {
              this.controller.loadUrl('https://expired.badssl.com');
              break;
            }
            case "testLoadUrl005": {
              try {
                this.controller.loadUrl("");
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 201120)
              }
              break;
            }

            case "testLoadUrl006": {
              try {
                this.controller.loadUrl('resource://rawfile/index.html',
                  [{
                    headerKey: "customHeaderKey",
                    headerValue: "customHeaderValue"
                  }]
                );
                Utils.emitEvent(this.titleReceive, 201130)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case "testLoadUrl008": {
              try {
                this.controller.loadUrl(`resource://rawfile/index.html`,
                  []
                );
                Utils.emitEvent(this.titleReceive, 201150)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case "testLoadUrl009": {
              try {
                this.controller2.loadUrl("resource://rawfile/index.html");
                Utils.emitEvent(this.titleReceive, 201151)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 201151)
              }
              break;
            }
            case "testLoadUrl010": {
              try {
                this.controller.loadUrl('');
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 201152)
              }
              break;
            }
            case "testLoadUrl011": {
              try {
                this.controller.loadUrl('file://', [{ headerKey: 'headerKey', headerValue: 'headerValue' }]);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 201153)
              }
              break;
            }
            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/WebTwo' })
              console.log('push URL success')
            }
          }
        })
      }

      Web({ src: $rawfile("index.html"), controller: this.controller })
        .javaScriptAccess(true)
        .geolocationAccess(true)
        .databaseAccess(true)
        .onTitleReceive((event) => {
          if (event) {
            console.log('onTitleReceive title:' + event.title)
            this.titleReceive = event.title
          }
        })
        .onSslErrorEventReceive((event) => {
          if (event) {
            console.log('onSslErrorEventReceive =====> event.error:' + event.error)
            this.sslErrorType = event.error;
            this.handlerLength = JSON.stringify(event.handler).length
            if (this.stringObj.str === 'emitSslErrorDateInvalid') {
              Utils.emitEvent(Number(this.sslErrorType), 202700);
            } else if (this.stringObj.str === 'emitSslErrorUntrusted') {
              Utils.emitEvent(Number(this.sslErrorType), 202710)
            } else if (this.stringObj.str === 'emitSslErrorHostMismatch') {
              Utils.emitEvent(Number(this.sslErrorType), 202730)
            }else if(this.stringObj.str === 'emitSslErrorHandler') {
              Utils.emitEvent(Number(this.handlerLength), 202740)
            }
          }
        })
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 1;
            console.log("onPageEnd==>")
          }
        })
    }
  }
}