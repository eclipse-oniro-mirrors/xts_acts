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
import {
  OnTitleReceiveEvent,
  OnDataResubmittedEvent,
  OnRenderExitedEvent,
  OnPageBeginEvent,
  RenderProcessNotRespondingReason,
  RenderProcessNotRespondingData,
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web
} from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement" // should be insert by ui-plugins
import webview from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { JsProxyObject } from '../../src/test/Interfaces';
import { Callback } from '@ohos.base'
import { Callback, RecordData } from '@ohos.base'
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog';
class StringFields {
  public str: string = '';
}
@Entry
@Component
struct webCookieManager {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  controllerNull: webview.WebviewController = new webview.WebviewController(undefined);
  @State webResult: string = ' ';
  @State str: string = ""
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
          .key('WebCookieManagerButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' + this.stringObj.str)
            switch (this.stringObj.str) {
              case "testIsCookieAllowed001": {
                webview.WebCookieManager.putAcceptCookieEnabled(true);
                setTimeout(() => {
                  Utils.emitEvent(webview.WebCookieManager.isCookieAllowed(), 30015)
                }, 3000)
                break;
              }
              case "testIsCookieAllowed002": {
                webview.WebCookieManager.putAcceptCookieEnabled(false);
                setTimeout(() => {
                  Utils.emitEvent(webview.WebCookieManager.isCookieAllowed(), 30016)
                }, 3000)
                break;
              }
              case "testIsThirdPartyCookieAllowed001": {
                webview.WebCookieManager.putAcceptThirdPartyCookieEnabled(true);
                setTimeout(() => {
                  let result = webview.WebCookieManager.isThirdPartyCookieAllowed();
                  
                  Utils.emitEvent(webview.WebCookieManager.isThirdPartyCookieAllowed(), 30025)
                }, 3000)
                break;
              }

              case "testIsThirdPartyCookieAllowed002": {
                webview.WebCookieManager.putAcceptThirdPartyCookieEnabled(false);
                setTimeout(() => {
                  let result = webview.WebCookieManager.isThirdPartyCookieAllowed();
                  
                  Utils.emitEvent(webview.WebCookieManager.isThirdPartyCookieAllowed(), 30026)
                }, 3000)
                break;
              }
              case "testPutAcceptThirdPartyCookieEnabled001": {
                webview.WebCookieManager.putAcceptThirdPartyCookieEnabled(false);
                setTimeout(() => {
                  let result = webview.WebCookieManager.isThirdPartyCookieAllowed();
                  
                  Utils.emitEvent(webview.WebCookieManager.isThirdPartyCookieAllowed(), 30033)
                }, 3000)
                break;
              }


            }
          })
      }
      Web({ src: "resource://rawfile/index.html", controller: this.controller })
        .fileAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        .javaScriptAccess(true)

    }
  }
}
