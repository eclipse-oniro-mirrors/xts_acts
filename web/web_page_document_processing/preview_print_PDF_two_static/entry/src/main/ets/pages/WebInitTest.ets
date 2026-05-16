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

import { Entry, Component, Column, Row, Button, ClickEvent, Web,  WebResourceResponse, Header, OnInterceptRequestEvent, ContextMenuEditStateFlags, OnTitleReceiveEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import Utils from '../../src/test/Util.test';
import webView from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { canIUse } from '@internal.full.global'
export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webViewController {
  stringObj: StringFields  = new StringFields();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  controllerTwo: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ''
  @State httpErrorReceive: Int = 0
  @State responseCode: Int = 200
  @State title: string = 'test';
  @State SiteIsolationModeArr: webView.SiteIsolationMode[] = [webView.SiteIsolationMode.PARTIAL,webView.SiteIsolationMode.STRICT]
  @State result: boolean = true;
  @State domain: int = 0x0000;
  @State tag: string = 'testTag';
  @State origin: string = "resource://rawfile/"
  @State incognito: boolean = false
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
        console.info(this.stringObj.str)
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button('WebInitButton')
          .key('WebInitButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' +  this.stringObj.str)
            switch (this.stringObj.str) {
              case 'emitControllerAttachState001': {
                try {
                  let result = this.controller.getAttachState()
                  Utils.emitEvent(result, 60600);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitControllerAttachState002': {
                try {
                  let result = this.controllerTwo.getAttachState()
                  Utils.emitEvent(result, 60601);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitSetAudioMuted001': {
                try {
                  this.controller.setAudioMuted(false)
                  Utils.emitEvent(this.result, 60602);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitSetAudioMuted002': {
                try {
                  this.controllerTwo.setAudioMuted(true)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code, 60603);
                }
                break;
              }

              case 'emitDeleteAllData001': {
                try {
                  this.controller.loadUrl('resource://rawfile/addOrigin.html')
                    webView.WebStorage.deleteAllData(false);
                      webView.WebStorage.getOrigins()
                        .then((origins: webView.WebStorageOrigin[]) => {
                          for (let i = 0; i < origins.length; i++) {
                          }
                        })
                    Utils.emitEvent("success", 60605);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitDeleteAllData002': {
                try {
                  this.controller.loadUrl('resource://rawfile/addOrigin.html')
                  webView.WebStorage.deleteAllData(true);
                  webView.WebStorage.getOrigins()
                    .then((origins: webView.WebStorageOrigin[]) => {
                      for (let i = 0; i < origins.length; i++) {
                      }
                    })
                    Utils.emitEvent("success", 60606);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitSetWebDestroyMode001': {
                try {
                  webView.WebviewController.setWebDestroyMode(webView.WebDestroyMode.FAST_MODE)
                  Utils.emitEvent(this.result, 60604);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

            }
          })

        Web({ src: 'resource://rawfile/index.html', controller: this.controller })
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)

          .onTitleReceive((event:OnTitleReceiveEvent):void => {
            if (event) {
              console.log('title:' + event.title);
              this.title = event.title
            }
          })

      }
    }
  }
}
