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
  RenderProcessNotRespondingReason,
  RenderProcessNotRespondingData,
  Entry,
  Component,
  Column,
  Row,
  MixedMode,
  Button,
  ClickEvent,
  OnErrorReceiveEvent,
  OnHttpErrorReceiveEvent,
  OnPageBeginEvent,
  Image,
  OnPageEndEvent,
  OnLoadInterceptEvent,
  OnProgressChangeEvent,
  Web
} from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement" // should be insert by ui-plugins
import webview from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { JsProxyObject } from '../../src/test/Interfaces'; //编译失败待解决P2 | 已解决
import { Callback } from '@ohos.base'
import { Callback, RecordData } from '@ohos.base'
import inspector from '@ohos.arkui.inspector';

class StringFields {
  public str: string = '';
}
export enum ThreatType {
  UNKNOWN = -1,
  THREAT_ILLEGAL = 0,
  THREAT_FRAUD = 1,
  THREAT_RISK = 2,
  THREAT_WARNING = 3,
}

export class OnSafeBrowsingCheckResultCallback {
  threatType: ThreatType = ThreatType.UNKNOWN;
}

@Entry
@Component
struct WebOnDataResubmitted {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = '';
  @State onDataResubmittedCalled: boolean = false;
  @State resend: boolean = true;
  @State title: string = '';
  @State mixedMode: MixedMode = MixedMode.ALL;
  @State precomposedResult:boolean =  false;
  @State mixedSwitch: boolean = false;
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
        Button("web click").key('buttonEnumAndSetWebController').onClick((e: ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          switch (this.stringObj.str) {
            case "emitOnTouchIconUrlReceived": {
              this.controller.refresh()
              this.controller.loadUrl("resource://rawfile/index.html")
              this.controller.refresh()
              setTimeout(() => {
                this.controller.loadUrl("http://49853.com")
              }, 3000)
            }
          }
        })
      }
      Web({src: 'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .onTouchIconUrlReceived((event) => {
          console.log('onTouchIconUrlReceived:' + JSON.stringify(event));
            Utils.emitEvent(event.url + '', 1371)
        })
        .onSafeBrowsingCheckResult((callback) => {
          console.log("onSafeBrowsingCheckResult!!!");
        })
        .mixedMode(this.mixedMode)
  }
}}

