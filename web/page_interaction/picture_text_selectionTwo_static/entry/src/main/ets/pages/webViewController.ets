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
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web,
  UIContext
} from '@ohos.arkui.component'
import webview from '@ohos.web.webview'
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter'
import Utils from '../../src/test/Utils.test';
import image from '@ohos.multimedia.image';
import { Hypium } from '../../../hypium/index';
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import {BusinessError,Callback, RecordData } from '@ohos.base'
class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webViewController {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = ""
  @State javaScriptAccess: boolean = true
  @State blockNetwork: boolean = false
  no_error: string = "no error happened"

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
        Button("WebViewController click").key('WebViewControllerButton').onClick((e: ClickEvent) => {
          console.info("key==>" +  this.stringObj.str)
          switch ( this.stringObj.str) {
            case "testHistoryItemIcon001": {
              try {
                 let icon: image.PixelMap | undefined = undefined;
                this.controller.loadUrl("resource://rawfile/HistoryItem.html");
                  let list = this.controller.getBackForwardEntries();
                  let historyItem = list.getItemAtIndex(list.currentIndex);
                  console.log("HistoryItem: " + JSON.stringify(historyItem));
                  icon = historyItem.icon;
                  if (icon != undefined) {
                    Utils.emitEvent(true, 31023)
                  }
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31023)
              }
              break;
            }


            case "testHistoryItemHistoryUrl001": {
              try {
                let historyItemString: string = ' '
                this.controller.loadUrl("resource://rawfile/HistoryItem.html");
                let list = this.controller.getBackForwardEntries();
                let historyItem = list.getItemAtIndex(list.currentIndex);
                console.log("HistoryItem: " + JSON.stringify(historyItem));
                historyItemString = historyItem.historyUrl;
                Utils.emitEvent(historyItemString, 31024)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31024)
              }
              break;
            }

            case "testHistoryRawUrl001": {
              try {
                let historyItemRawUrl: string = ' '
                this.controller.loadUrl("resource://rawfile/HistoryItem.html");
                let list = this.controller.getBackForwardEntries();
                let historyItem = list.getItemAtIndex(list.currentIndex);
                console.log("HistoryItem: " + JSON.stringify(historyItem));
                historyItemRawUrl = historyItem.historyRawUrl;
                Utils.emitEvent(historyItemRawUrl, 31025)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31025)
              }
              break;
            }

            case "testHistoryItemTitle001": {
              try {
                let historyItemTitle: string = ' '
                this.controller.loadUrl("resource://rawfile/HistoryItem.html");
                let list = this.controller.getBackForwardEntries();
                let historyItem = list.getItemAtIndex(list.currentIndex);
                console.log("HistoryItem: " + JSON.stringify(historyItem));
                historyItemTitle = historyItem.title;
                Utils.emitEvent(historyItemTitle, 31026)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31026)
              }
              break;
            }
          }
        })
      }

      Web({ src: "resource://rawfile/index.html", controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .blockNetwork(this.blockNetwork)
    }
  }
}
