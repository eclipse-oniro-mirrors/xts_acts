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

import webView from '@ohos.web.webview';
import { $rawfile, Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'

export class StringFields {
  str: string = '';
}

@Entry
@Component
struct geolocationPermissions {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  controllerNull: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ''
  @State javaScriptAccess: boolean = true;
  @State incognito: boolean = false;
  @State origin: string = 'resource://rawfile/'
  no_error: string = 'no error happened'


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
    Column(undefined) {
      Row(undefined) {
        Button('GeolocationPermissions click')
          .key('GeolocationPermissionsButton').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {

            case 'emitPrepareForPageLoadStatic001': {
              try {
                this.controller.refresh();
                webView.WebviewController.prepareForPageLoad('https://www.baidu.com', true, 3);
                Utils.emitEvent(true, 202603241)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 202603241);
              }
              break;
            }

            case 'emitPrepareForPageLoadStatic002': {
              try {
                this.controller.refresh();
                webView.WebviewController.prepareForPageLoad('', true, 3);
                Utils.emitEvent(true, 202603242)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 202603242);
              }
              break;
            }

            case 'emitPrepareForPageLoadStatic003': {
              try {
                this.controller.refresh();
                webView.WebviewController.prepareForPageLoad('https://www.baidu.com', false, 3);
                Utils.emitEvent(true, 202603243)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 202603243);
              }
              break;
            }

            case 'emitPrepareForPageLoadStatic004': {
              try {
                this.controller.refresh();
                webView.WebviewController.prepareForPageLoad('asgagawersxw%,.', true, 3);
                Utils.emitEvent(true, 202603244)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 202603244);
              }
              break;
            }

            case 'emitPrepareForPageLoadStatic005': {
              try {
                this.controller.refresh();
                webView.WebviewController.prepareForPageLoad('https://www.baidu.com', true, -99);
                Utils.emitEvent(true, 202603245)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 202603245);
              }
              break;
            }

            case 'emitSetUrlTrustListStatic01': {
              try {
                let urlTrustList: string = '{\"UrlPermissionList\":[{\"scheme\":\"http\", \"host\":\"www.example.com\", \"path\":\"test\"}]}'
                this.controller.setUrlTrustList(urlTrustList, true, true);
                Utils.emitEvent(true, 202603246);
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 202603246);
              }
              break;
            }

            case 'emitSetUrlTrustListStatic02': {
              try {
                let urlTrustList: string = '{\"UrlPermissionList\":[{\"scheme\":\"http\", \"host\":\"www.example.com\", \"path\":\"test\"}]}'
                this.controller.setUrlTrustList(urlTrustList, false, false);
                Utils.emitEvent(true, 202603247);
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 202603247);
              }
              break;
            }

            case 'emitSetUrlTrustListStatic03': {
              try {
                let urlTrustList: string = '{\"UrlPermissionList\":[{\"scheme\":\"http\", \"host\":\"www.example.com\", \"path\":\"test\"}]}'
                this.controllerNull.setUrlTrustList(urlTrustList, true, true);
                Utils.emitEvent(true, 202603248);
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 202603248);
              }
              break;
            }

          }
        })
      }

      Web({ src: 'www.baidu.com', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)

    }
  }
}
