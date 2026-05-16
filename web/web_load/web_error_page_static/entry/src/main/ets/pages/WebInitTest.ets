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
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  controllerTwo: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ''
  @State httpErrorReceive: Int = 0
  @State responseCode: Int = 200
  @State title: string = 'test';
  @State SiteIsolationModeArr: webView.SiteIsolationMode[] = [webView.SiteIsolationMode.PARTIAL,webView.SiteIsolationMode.STRICT]

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
        Button('WebErrorPageButton')
          .key('WebErrorPageButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' +  this.stringObj.str)
            switch (this.stringObj.str) {
              case 'emitSetErrorPageEnabledAndGetErrorPageEnabled01': {
                try {
                  this.controller.setErrorPageEnabled(true);
                  let result = this.controller.getErrorPageEnabled();
                  Utils.emitEvent(result, 60600);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitSetErrorPageEnabledAndGetErrorPageEnabled02': {
                try {
                  this.controller.setErrorPageEnabled(false);
                  let result = this.controller.getErrorPageEnabled();
                  Utils.emitEvent(result, 60601);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }


              case 'emitSetErrorPageEnabledErrorCode01': {
                try {
                  this.controllerTwo.setErrorPageEnabled(true);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(Number(error.code), 60604);
                }
                break;
              }

              case 'emitGetErrorPageEnabledErrorCode01': {
                try {
                  this.controllerTwo.getErrorPageEnabled();
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(Number(error.code), 60605);
                }
                break;
              }

              case 'emitPrivateNetworkAccess01': {
                try {
                  webView.WebviewController.enablePrivateNetworkAccess(true);
                  let result = webView.WebviewController.isPrivateNetworkAccessEnabled();
                  Utils.emitEvent(result, 60606);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitPrivateNetworkAccess02': {
                try {
                  webView.WebviewController.enablePrivateNetworkAccess(false);
                  let result = webView.WebviewController.isPrivateNetworkAccessEnabled();
                  Utils.emitEvent(result, 60607);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitSetAutoPreconnectFalse': {
                try {
                  webView.WebviewController.setAutoPreconnect(false)
                  let result = webView.WebviewController.isAutoPreconnectEnabled()
                  Utils.emitEvent(result, 60608);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitSetAutoPreconnectTrue': {
                try {
                  webView.WebviewController.setAutoPreconnect(true)
                  let result = webView.WebviewController.isAutoPreconnectEnabled()
                  Utils.emitEvent(result, 60609);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitWebSiteIsolationMode001': {
                try {
                  webView.WebviewController.setSiteIsolationMode(webView.SiteIsolationMode.PARTIAL)
                  let result1 = webView.WebviewController.getSiteIsolationMode()
                  let result = false;
                  if (this.SiteIsolationModeArr[result1] == webView.SiteIsolationMode.PARTIAL) {
                    result = true;
                  }
                  Utils.emitEvent(result, 60610);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitWebSiteIsolationMode002': {
                try {
                  webView.WebviewController.setSiteIsolationMode(webView.SiteIsolationMode.STRICT)
                  let result1 = webView.WebviewController.getSiteIsolationMode()
                  let result = false;
                  if (this.SiteIsolationModeArr[result1] == webView.SiteIsolationMode.STRICT) {
                    result = true;
                  }
                  Utils.emitEvent(result, 60611);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code, 60611);
                }
                break;
              }
              case 'emitEnableAdsBlockErr': {
                try {
                  this.controllerTwo.enableAdsBlock(true)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code, 60612);
                }
                break;
              }
              case 'emitIsAdsBlockEnabledCheck001': {
                try {
                  this.controller.enableAdsBlock(true)
                  let isBlocked: boolean = this.controller.isAdsBlockEnabled();
                  console.log(' isAdsBlockEnabled:  ', isBlocked);
                  Utils.emitEvent(isBlocked, 60613);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitIsAdsBlockEnabledCheck002': {
                try {
                  this.controller.enableAdsBlock(false)
                  let isBlocked: boolean = this.controller.isAdsBlockEnabled();
                  console.log(' isAdsBlockEnabled:  ', isBlocked);
                  Utils.emitEvent(isBlocked, 60614);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitIsAdsBlockEnabledForCurPage': {
                try {
                  this.controller.enableAdsBlock(false)
                  let isBlocked: boolean = this.controller.isAdsBlockEnabledForCurPage();
                  console.log(' isAdsBlockEnabled:  ', isBlocked);
                  Utils.emitEvent(isBlocked, 60616);
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
