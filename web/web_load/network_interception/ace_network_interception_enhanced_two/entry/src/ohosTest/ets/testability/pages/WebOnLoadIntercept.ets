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
const EVENT_ID_SET_EIMIT_KEY = 142018;

@Entry
@Component
struct WebOnLoadIntercept {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = "";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State mediaPlayGestureAccess: boolean = true;
  @State statusResult: string = '';
  @State interceptLoad: boolean = false;
  @State interceptUrl: string = ''
  @State title: string = ''
  @State isReceive: number = -1;
  @State isEnd:number = -1;
  @State isTitle:number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EIMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EIMIT_KEY)
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
        Button("audioStateTest").key('WebOnLoadInterceptTestButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, this.str, 1);
          console.info("key==>" + this.str)
          this.isReceive = -1;
          switch (this.str) {
            case "emitOnLoadIntercept001": {
              try {
                this.isEnd = -1;
                this.isTitle = -1;
                this.controller.loadUrl('https://www.openharmony.cn/')
                await Utils.waitForExist(()=>this.isEnd, this.str, 1);
                Utils.emitEvent(this.interceptUrl, 142028)
                await Utils.waitForExist(()=>this.isTitle, this.str, 1);
                Utils.emitEvent(this.title, 142038)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitOnLoadIntercept002": {
              try {
                this.isTitle = -1;
                this.controller.loadUrl("resource://rawfile/index.html");
                await Utils.waitForExist(()=>this.isTitle, this.str, 1);
                Utils.emitEvent(this.title, 142058)
                this.isEnd = -1;
                this.interceptLoad = true
                this.controller.loadUrl('https://www.openharmony.cn/')
                await Utils.waitForExist(()=>this.isEnd, this.str, 1);
                Utils.emitEvent(this.interceptUrl, 142048)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .mediaPlayGestureAccess(this.mediaPlayGestureAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onLoadIntercept((event) => {
          if (event) {
            this.interceptUrl = event.data.getRequestUrl()
            console.log('url:' + event.data.getRequestUrl())
            console.log('isMainFrame:' + event.data.isMainFrame())
            console.log('isRedirect:' + event.data.isRedirect())
            console.log('isRequestGesture:' + event.data.isRequestGesture())
            this.isEnd = 1;
          }

          return this.interceptLoad
        })
        .onTitleReceive((event) => {
          if (event) {
            console.log('title:' + event.title);
            this.title = event.title
            this.isTitle = 1;
          }
        })
    }
  }
}