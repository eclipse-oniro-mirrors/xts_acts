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
import { Entry, Component, Column, Row, Button, ClickEvent, Web } from "@ohos.arkui.component"
import { State } from '@ohos.arkui.stateManagement'
import webView from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import image from '@ohos.multimedia.image';
import emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'

class StringFields {
  public str: string = '';
}
@Entry
@Component
struct webViewControllerPart2 {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ''
  @State javaScriptAccess: boolean = true
  @State numberOfMatches: number = 0
  @State searchNext: boolean = false
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
    Column() {
      Row() {
        Button('WebViewControllerPart2 click').key('WebViewControllerPart2Button').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {
            case 'testSearchAllAsync001': {
              try {
                this.numberOfMatches = 0
                  console.info('searchAllAsync start')
                  this.controller.searchAllAsync('Hello World');
                  console.info('searchAllAsync finish' + this.numberOfMatches)
                setTimeout(() => {
                  Utils.emitEvent(this.numberOfMatches, 37012)
                }, 2000)

              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'testSearchNext001': {
              try {
                this.numberOfMatches = 0
                this.controller.searchAllAsync('Hello World');
                this.searchNext = false
                this.controller.searchNext(true)
                setTimeout(() => {
                Utils.emitEvent(this.searchNext, 100080)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'testSetCustomUserAgent001': {
              try {
                let setUA = 'userAgent'
                this.controller.setCustomUserAgent(setUA)
                Utils.emitEvent(this.controller.getCustomUserAgent(), 37019);
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: 'resource://rawfile/searchAllAsync.html', controller: this.controller })
        .javaScriptAccess(true)
        .fileAccess(true)
        .key('onShowFileSelectorKey')
        .onSearchResultReceive(ret => {
          if (ret) {
            console.log('on search result receive:' + '[cur]' + ret.activeMatchOrdinal +
              '[total]' + ret.numberOfMatches + '[isDone]' + ret.isDoneCounting);
            this.numberOfMatches = ret.numberOfMatches
            this.searchNext = true
          }
        })
    }
  }
}

