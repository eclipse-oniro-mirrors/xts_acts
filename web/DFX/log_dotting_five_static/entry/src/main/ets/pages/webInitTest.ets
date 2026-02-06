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
import emitter from '@ohos.events.emitter'
import events_emitter from '@ohos.events.emitter'
import buffer from '@ohos.buffer'
import { BusinessError, Callback, RecordData } from '@ohos.base'
import common from '@ohos.app.ability.common';
import { Hypium } from '../../../hypium';
import { UIContext, Router } from '@ohos.arkui.UIContext'
import Utils from '../../src/test/Utils.test';

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct customizeSchemes {
  stringObj: StringFields = new StringFields();
  @State str: string = ""
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  schemeList: webview.WebCustomScheme[] = [
    { schemeName: "jump1", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "jump2", isSupportCORS: true, isSupportFetch: false },
    { schemeName: "jump3", isSupportCORS: false, isSupportFetch: true },
    { schemeName: "jump4", isSupportCORS: false, isSupportFetch: false }
  ]
  outOfRangeSchemeList: webview.WebCustomScheme[] = [
    { schemeName: "name1", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name2", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name3", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name4", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name5", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name6", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name7", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name8", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name9", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name10", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name11", isSupportCORS: true, isSupportFetch: true }
  ]
  invalidSchemeList: webview.WebCustomScheme[] = [{
    schemeName: "nameLength32nameLength32nameLength32nameLength32",
    isSupportCORS: true,
    isSupportFetch: true
  }]

aboutToAppear() {
  let valueChangeEvent: events_emitter.InnerEvent = {
    eventId: 10,
    priority: events_emitter.EventPriority.LOW
  }
  events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
      try {
      webview.WebviewController.customizeSchemes(this.schemeList)
    } catch (error) {
      error = error as BusinessError;
      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
    }
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
        Button('customizeSchemes')
          .key('customizeSchemes')
          .onClick((e: ClickEvent) => {
            console.info('key==>' + this.stringObj.str)

            switch (this.stringObj.str) {
              case "customizeSchemes0100": {
                try {
                  webview.WebviewController.customizeSchemes(this.invalidSchemeList)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code, 300);
                }
                break;
              }
              case "customizeSchemes0200": {
                try {
                  webview.WebviewController.customizeSchemes(this.outOfRangeSchemeList)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code, 302);
                }
                break;
              }

              case 'emitonSwitchNextPage': {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/webResourceError' })
                console.log('push URL success')
              }
            }
          })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .height('50%')
        .width('100%')
        .javaScriptAccess(true)
        .geolocationAccess(true)
        .databaseAccess(true)
    }
  }
}