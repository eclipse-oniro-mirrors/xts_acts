/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import Utils from '../../test/Utils.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { waitForExist } from '../../test/WaitTest.test';

const EVENT_ID_SET_EMIT_KEY = 174040;

@Entry
@Component
struct WebViewControllerRefresh {
  controller: WebviewController = new webView.WebviewController();
  @State str: string = 'emitRefresh';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('WebViewControllerRefresh valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Button('WebViewControllerRefresh click').key('WebViewControllerRefreshButton').onClick(async () => {
        await waitForExist(() => this.isReceive, 'WebViewControllerRefreshButtonIsReceive', 1, 1000);
        await waitForExist(() => this.isPageEnd, 'WebViewControllerRefreshButtonIsPageEnd', 1, 1000);
        console.info('key==>' + this.str);
        this.isReceive = -1;
        switch (this.str) {

          case 'emitRefreshTrue': {
            try {
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('index.html'));
              await waitForExist(() => this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
              this.isReceive = -1;
              this.controller.refresh(true);
              await waitForExist(() => this.isPageEnd, 'refreshIsPageEnd', 1, 1000);
              Utils.emitEvent(true, 174050);
            } catch (error) {
              console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              if (Number(error.code) === 401) {
                Utils.emitEvent('401', 174050);
              } else if (Number(error.code) == 17100001) {
                Utils.emitEvent('17100001', 174050);
              } else {
                Utils.emitEvent(String(error.code), 174050);
              }
            }
            break;
          }

          case 'emitRefreshFalse': {
            try {
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('index.html'));
              await waitForExist(() => this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
              this.isReceive = -1;
              this.controller.refresh(false);
              await waitForExist(() => this.isPageEnd, 'refreshIsPageEnd', 1, 1000);
              Utils.emitEvent(true, 174060);
            } catch (error) {
              console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              if (Number(error.code) == 401) {
                Utils.emitEvent('401', 174060);
              } else if (Number(error.code) == 17100001) {
                Utils.emitEvent('17100001', 174060);
              } else {
                Utils.emitEvent(String(error.code), 174060);
              }
            }
            break;
          }

          case 'emitRefreshNull': {
            try {
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('index.html'));
              await waitForExist(() => this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
              this.isReceive = -1;
              this.controller.refresh(null);
              await waitForExist(() => this.isPageEnd, 'refreshIsPageEnd', 1, 1000);
              Utils.emitEvent('no_error', 174070);
            } catch (error) {
              console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              if (Number(error.code) == 401) {
                Utils.emitEvent('401', 174070);
              } else if (Number(error.code) == 17100001) {
                Utils.emitEvent('17100001', 174070);
              } else {
                Utils.emitEvent(String(error.code), 174070);
              }
            }
            break;
          }

          case 'emitRefreshUndefined': {
            try {
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('index.html'));
              await waitForExist(() => this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
              this.isReceive = -1;
              this.controller.refresh(undefined);
              await waitForExist(() => this.isPageEnd, 'refreshIsPageEnd', 1, 1000);
              Utils.emitEvent('no_error', 174080);
            } catch (error) {
              console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              if (Number(error.code) == 401) {
                Utils.emitEvent('401', 174080);
              } else if (Number(error.code) == 17100001) {
                Utils.emitEvent('17100001', 174080);
              } else {
                Utils.emitEvent(String(error.code), 174080);
              }
            }
            break;
          }

          case 'emitRefreshNoParam': {
            try {
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('index.html'));
              await waitForExist(() => this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
              this.isReceive = -1;
              this.controller.refresh();
              await waitForExist(() => this.isPageEnd, 'refreshIsPageEnd', 1, 1000);
              Utils.emitEvent(true, 174090);
            } catch (error) {
              console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              if (Number(error.code) == 401) {
                Utils.emitEvent('401', 174090);
              } else if (Number(error.code) == 17100001) {
                Utils.emitEvent('17100001', 174090);
              } else {
                Utils.emitEvent(String(error.code), 174090);
              }
            }
            break;
          }

          case 'emitRefreshError17100001': {
            try {
              let testController: WebviewController = new webView.WebviewController();
              testController.refresh(true);
              Utils.emitEvent('no_error', 174100);
            } catch (error) {
              console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              if (Number(error.code) == 401) {
                Utils.emitEvent('401', 174100);
              } else if (Number(error.code) == 17100001) {
                Utils.emitEvent('17100001', 174100);
              } else {
                Utils.emitEvent(String(error.code), 174100);
              }
            }
            break;
          }

          default:
            break;
        }
      })

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onPageBegin(() => {
          console.info('onPageBegin');
        })
        .onPageEnd(() => {
          console.info('onPageEnd');
          this.isPageEnd = 1;
        })
        .onErrorReceive((event) => {
          console.info('onErrorReceive: ' + JSON.stringify(event));
        })
    }
  }
}
