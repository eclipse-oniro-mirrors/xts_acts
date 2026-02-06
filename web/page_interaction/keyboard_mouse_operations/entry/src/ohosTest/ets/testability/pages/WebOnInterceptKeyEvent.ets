/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';

import { Driver } from '@kit.TestKit';

const EVENT_ID_SET_SUITE_KEY = 175201;
const driver = Driver.create();

@Entry
@Component
struct WebOnInterceptKeyEvent {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = "";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State mediaPlayGestureAccess: boolean = true;
  @State onInterceptKeyEventCode: number = 0;
  @State interceptKeyEvent: boolean = false;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isOnInterceptKeyEventEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebOnInterceptKeyEventTestButton")
          .key('WebOnInterceptKeyEventTestButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, this.str + ' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitOnInterceptKeyEvent002": {
              try {
                this.interceptKeyEvent = true
                this.isPageEnd = -1
                this.controller.loadUrl('resource://rawfile/keyEvent.html')
                await Utils.waitForExist(()=>this.isPageEnd, 'WebOnInterceptKeyEventWebView', 1, 1000);
                await Utils.clickComponent('WebOnInterceptKeyEventWebView', driver)
                await Utils.waitForReleaseDriver(this.str,driver)
                this.isOnInterceptKeyEventEnd = -1
                await Utils.triggerKey(2047,driver)
                await Utils.waitForExist(()=>this.isOnInterceptKeyEventEnd, 'isOnInterceptKeyEventEnd', 1, 1000);
                await Utils.waitForReleaseDriver(this.str,driver)
                Utils.emitEvent(this.onInterceptKeyEventCode, 175210)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitOnInterceptKeyEvent003": {
              try {
                this.interceptKeyEvent = false
                this.isPageEnd = -1
                this.controller.loadUrl('resource://rawfile/keyEvent.html')
                await Utils.waitForExist(()=>this.isPageEnd, 'WebOnInterceptKeyEventWebView', 1, 1000);
                await Utils.clickComponent('WebOnInterceptKeyEventWebView', driver)
                await Utils.waitForReleaseDriver(this.str,driver)
                this.isOnInterceptKeyEventEnd = -1
                await Utils.triggerKey(2047,driver)
                await Utils.waitForReleaseDriver(this.str,driver)
                await Utils.waitForExist(()=>this.isOnInterceptKeyEventEnd, 'isOnInterceptKeyEventEnd = -1', 1, 1000);
                Utils.emitEvent(this.onInterceptKeyEventCode, 175220)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .key('WebOnInterceptKeyEventWebView')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .mediaPlayGestureAccess(this.mediaPlayGestureAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onInterceptKeyEvent((event) => {
          console.log("onInterceptKeyEvent==>")
          if (event) {
            console.log("onInterceptKeyEvent==>" + JSON.stringify(event.keyCode))
            this.onInterceptKeyEventCode = event.keyCode
          }
          this.isOnInterceptKeyEventEnd = 1
          return this.interceptKeyEvent;
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}