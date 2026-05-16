/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { $rawfile, Entry, Component, Column, Row, Button, ClickEvent, Web, CustomDialogController, CustomDialog, CustomDialog } from '@ohos.arkui.component'
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
let driver = Driver.create()

const EVENT_ID_SET_SUITE_KEY = 154011;

export class StringFields {
  str: string = '';
}

@Entry
@Component
struct WebviewControllerSetActiveWebEngineVersion {
  stringObj: StringFields  = new StringFields();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State emitKey: string = '';
  @State isReceive: number = -1;
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
        Button("web click").key('setActiveWebEngineVersionClick').onClick((E:ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          this.isReceive = -1;

          switch (this.stringObj.str) {
            case "testSetActiveWebEngineVersionArkwebEvergreen": {
              try {
                webview.WebviewController.setActiveWebEngineVersion(webview.ArkWebEngineVersion.ARKWEB_EVERGREEN);
                Utils.emitEvent("success", 20260255);
              } catch (error) {
                console.error("setActiveWebEngineVersion with ARKWEB_EVERGREEN error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260255);
              }
              break;
            }
            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/WebViewErrorCode' })
              console.log('push URL success')
            }
          }
        })
      }
      Web({ src: 'www.example.com', controller: this.controller })
        .databaseAccess(true)
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}
