/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { State } from "@ohos.arkui.stateManagement"
import webView from '@ohos.web.webview'
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
struct WebOnDataResubmitted {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = '';
  @State onDataResubmittedCalled: boolean = false;
  @State resend: boolean = true;
  @State title: string = '';

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
        console.info('this.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebViewControllerPart2 click").key('WebViewControllerPart2Button').onClick((e: ClickEvent) => {
          console.info("key==>" + this.stringObj.str);
          switch (this.stringObj.str) {
            case "testBackOrForward002": {
              try {
                this.controller.clearHistory()
                this.controller.loadUrl("resource://rawfile/index.html");
                setTimeout(() => {
                  this.controller.loadUrl("resource://rawfile/second.html");
                }, 2000)
                setTimeout(() => {
                  this.controller.backOrForward(-1)
                }, 4000)
                setTimeout(() => {
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 37006)
                }, 6000)
              } catch (error) {
                hilog.info(0X0000,"testTag",`ErrorCode: ` + error);
              }
              break;
            }

            case "testBackOrForward003": {
              try {
                this.controller.clearHistory()
                this.controller.loadUrl("resource://rawfile/index.html");
                setTimeout(() => {
                  this.controller.backOrForward(-3)
                }, 2000)
                setTimeout(() => {
                  let title = this.controller.getTitle();
                  Utils.emitEvent(title, 37007)
                }, 4000)
              } catch (error) {
                hilog.info(0X0000,"testTag",`ErrorCode: ` + error);
              }
              break;
            }

            case "testBackOrForward004": {
              try {
                this.controller.clearHistory()
                this.controller.loadUrl("resource://rawfile/index.html");
                setTimeout(() => {
                  this.controller.backOrForward(3)
                }, 2000)
                setTimeout(() => {
                  let title = this.controller.getTitle();
                  Utils.emitEvent(title, 37008)
                }, 4000)
              } catch (error) {
                hilog.info(0X0000,"testTag",`ErrorCode: ` + error);
              }
              break;
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(true)
        .fileAccess(true)
        .key("onShowFileSelectorKey")
    }
  }
}
