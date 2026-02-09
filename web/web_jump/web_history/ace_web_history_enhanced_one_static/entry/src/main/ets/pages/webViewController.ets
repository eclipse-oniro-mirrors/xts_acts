/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  Row,
  Web,
  WebDarkMode,
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import webview from '@ohos.web.webview';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../hypium/index';
import testsuite from '../../src/test/List.test';
import Utils from '../../src/test/Util.test';
import image from '@ohos.multimedia.image';
import emitter from '@ohos.events.emitter';

@Entry
@Component
struct webViewController {
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = ''
  @State javaScriptAccess: boolean = true
  @State icon: image.PixelMap | undefined = undefined;
  @State darkMode: WebDarkMode = WebDarkMode.OFF
  @State forceDarkAccess: boolean = false

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
        this.str = strValue;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebViewController click').key('WebViewControllerButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' + this.str)
          //  let webRect = Utils.getComponentRect('RowSize');
          //  let X = Utils.getRectHorizontalCenterX(webRect)
          //  let Y = Utils.getRectVerticalCenterY(webRect)
            switch (this.str) {
              case 'testBackForwardListCurrentIndex001': {
                try {
                  this.controller.clearHistory()
                  this.controller.loadUrl('resource://rawfile/HistoryItem.html');
                  let list: webview.BackForwardList = this.controller.getBackForwardEntries();
                  Utils.emitEvent(list.currentIndex, 31027)
                } catch (error: BusinessError) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code, 31027)
                }
                break;
              }

              case 'testBackForwardListCurrentSize001': {
                try {
                  this.controller.clearHistory()
                  this.controller.loadUrl('resource://rawfile/HistoryItem.html');
                  let list: webview.BackForwardList = this.controller.getBackForwardEntries();
                  Utils.emitEvent(list.size, 31028)
                } catch (error: BusinessError) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code, 31028)
                }
                break;
              }

            }
          })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .key('onShowFileSelectorKey')
        .fileAccess(true)
        .darkMode(this.darkMode)
        .forceDarkAccess(this.forceDarkAccess)
    }
    .key('RowSize')
  }
}
