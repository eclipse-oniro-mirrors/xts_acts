/*
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
import webView from '@ohos.web.webview';
import { URL } from '../../test/Config.test';
import Utils from '../../test/Utils';

const EVENT_ID_SET_EMIT_KEY = 202490;

@Entry
@Component
struct webViewOnSslErrorEventThree {
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State operationText: string = '';
  @State searchTotalNumber: number = -1;
  @State isSearchEnd: boolean = false;
  controller: webView.WebviewController = new webView.WebviewController();

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
    console.info('web page valueChangeCallBack');
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
      Row() {
        Button('webViewOnSslErrorEvent').key('OnSslErrorEventThreeButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, this.str, 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str, 1, 1000);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          this.operationText = '';
          switch (this.str) {
            case 'emitOnSslErrorEventHandleConfirm': {
              this.controller.clearClientAuthenticationCache();
              this.controller.clearSslCache();
              this.operationText = 'handleConfirm';
              this.isPageEnd = -1;
              this.controller.loadUrl(URL);
              await Utils.waitForExist(()=>this.isPageEnd, this.str, 1, 1000);
              this.controller.searchAllAsync('expired.');
              await Utils.waitForExist(()=>this.isSearchEnd, this.str, true, 1000);
              if (this.searchTotalNumber > 0) {
                Utils.emitEvent(true, 26031026);
              } else {
                Utils.emitEvent(false, 26031026);
              }
              break;
            }
            case 'emitOnSslErrorEventHandleCancel': {
              this.controller.clearClientAuthenticationCache();
              this.controller.clearSslCache();
              this.operationText = 'handleCancel';
              this.isPageEnd = -1;
              this.controller.loadUrl(URL);
              await Utils.waitForExist(()=>this.isPageEnd, this.str, 1, 1000);
              this.controller.searchAllAsync('expired.');
              await Utils.waitForExist(()=>this.isSearchEnd, this.str, true, 1000);
              if (this.searchTotalNumber <= 0) {
                Utils.emitEvent(true, 26031027);
              } else {
                Utils.emitEvent(false, 26031027);
              }

              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onPageEnd((event) => {
          console.log('onPageEnd url==>' + event.url);
          this.isPageEnd = 1;
        })
        .onSslErrorEvent((event: SslErrorEvent) => {
          console.log('onSslErrorEvent url==>' + event.url);
          console.log('onSslErrorEvent error==>' + event.error);
          console.log('onSslErrorEvent originalUrl==>' + event.originalUrl);
          console.log('onSslErrorEvent referrer==>' + event.referrer);
          console.log('onSslErrorEvent isFatalError==>' + event.isFatalError);
          console.log('onSslErrorEvent isMainFrame==>' + event.isMainFrame);
          console.log('onSslErrorEvent certChainData==>' + event.certChainData);
          Utils.emitEvent(event.url, 26031021);
          Utils.emitEvent(event.originalUrl, 26031022);
          Utils.emitEvent(event.referrer, 26031023);
          Utils.emitEvent(event.isFatalError, 26031024);
          if(event.certChainData){
            Utils.emitEvent(true, 26031025);
          }
          if (event) {
            if (this.operationText === 'handleConfirm') {
              event.handler.handleConfirm();
            }
            if (this.operationText === 'handleCancel') {
              event.handler.handleCancel();
            }
          }
        })
        .onSearchResultReceive(ret => {
          if (ret) {
            console.log('on search result receive:' + '[cur]' + ret.activeMatchOrdinal +
              '[total]' + ret.numberOfMatches + '[isDone]' + ret.isDoneCounting);
            this.searchTotalNumber = ret.numberOfMatches;
            this.isSearchEnd = ret.isDoneCounting
          }
        })
    }
  }
}