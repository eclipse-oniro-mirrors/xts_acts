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
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import web_webview from '@ohos.web.webview'
import { BusinessError, Callback,RecordData } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext'


@Entry
@Component
struct clearPrefetchedResourceTest {
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = ''

  aboutToAppear() {
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.str = strValue;
      }
    }
  }

  build() {
    Column() {
      Button('clearPrefetchedResourceTest click')
        .key('clearPrefetchedResourceTestButton')
        .onClick((e: ClickEvent) => {
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'testClearPrefetchedResource001': {
              let msg = 'testClearPrefetchedResource001'
              try {
                let requestInfo: web_webview.RequestInfo = {
                  url: '',
                  method: 'POST',
                  formData: 'a=x&b=y'
                } as web_webview.RequestInfo
                web_webview.WebviewController.prefetchResource(
                  requestInfo,
                  [
                    {
                      headerKey: 'Accept',
                      headerValue: 'application/json',
                    },
                    {
                      headerKey: 'Content-Type',
                      headerValue: 'application/x-www-form-urlencoded',
                    },
                  ],
                  'KeyX', 500);
                Utils.emitEvent(true, 10110)
              } catch (error) {
                error = error as BusinessError;
                Utils.emitEvent(error.code, 10110)
                console.error(`${msg} prefetchResource ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                try {
                  web_webview.WebviewController.clearPrefetchedResource(['KeyX']);
                  Utils.emitEvent(true, 10112)
                } catch (err) {
                  err = err as BusinessError;
                  Utils.emitEvent(err.code, 10112)
                  console.error(msg + 'clearPrefetchedResource error: ' + err.code + ' Message: ' + err.message);
                }
              }, 1000)
              break;
            }
            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/InjectOfflineResourcesTest' })
            }
          }
        })
      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
    }
  }
}