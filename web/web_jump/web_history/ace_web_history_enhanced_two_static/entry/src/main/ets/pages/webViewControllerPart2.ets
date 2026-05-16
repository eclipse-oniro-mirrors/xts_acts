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
import { JsProxyObject } from '../../src/test/Interfaces';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import {
  __memo_context_type,
  __memo_id_type,
  State
} from '@ohos.arkui.stateManagement'
import {
  BlurOnKeyboardHideMode,
  Button,
  ButtonAttribute,
  ClickEvent,
  Column,
  Component,
  Entry,
  KeyEvent,
  OnAudioStateChangedEvent,
  OnOverScrollEvent,
  OnRenderExitedEvent,
  RenderExitReason,
  Row,
  Text,
  TextAttribute,
  TouchEvent,
  Web,
  WebMediaOptions
} from '@ohos.arkui.component'
import hilog from '@ohos.hilog';
import { Driver, ON } from '@ohos.UiTest';
import emitter from '@ohos.events.emitter';
import { Hypium } from '../../../hypium';
import { Callback, RecordData } from '@ohos.base'
import testsuite from '../../src/test/List.test';
import Utils from '../../src/test/Utils.test';
import events_emitter from '@ohos.events.emitter';
import image from '@ohos.multimedia.image';

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webViewControllerPart2 {
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  stringObj: StringFields  = new StringFields ();
  @State str: string = ""
  @State onScrollCallBack: boolean = false
  @State javaScriptAccess: boolean = true
  @State icon: image.PixelMap | undefined = undefined;
  @State onShowFileSelectorCallBack: boolean = false
  @State FileSelectorParamGetTitle: string = ''
  @State FileSelectorParamGetGetMode: number = 100
  @State userAgent: string = "Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 " +
    "(KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36";
  @State uri: string = "file://docs/storage/Users/currentUser/Documents/1.json";
  @State FileSelectorParamGetIsCapture: boolean = true
  @State enterPageEnd: boolean = false
  @State numberOfMatches: number = 0
  @State searchNext: boolean = false
  no_error: string = "no error happened"

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION vaclue: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        console.info('strValue has been updated to: ' + strValue);
        this.stringObj.str = strValue;
        console.info('this.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebViewControllerPart2 click").key('WebViewControllerPart2Button').onClick((e: ClickEvent) => {
          console.info("key==>" +  this.stringObj.str)
          switch ( this.stringObj.str) {

            case "testClearHistory001": {
              try {
                this.controller.clearHistory()
                let accessStep = this.controller.accessStep(-1);
                Utils.emitEvent(accessStep, 37000)
              } catch (error: BusinessError) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src:'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(true)
        .key("onShowFileSelectorKey")
    }
  }
}
