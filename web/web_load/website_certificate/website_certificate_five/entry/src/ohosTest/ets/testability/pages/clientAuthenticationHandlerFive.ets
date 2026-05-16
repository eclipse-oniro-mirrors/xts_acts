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
import web_webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import { URL_CLIENT } from '../../test/Config.test';
import { Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';

const EVENT_ID_SET_EMIT_KEY = 20260300;

@Entry
@Component
struct ClientAuthenticationHandlerFiveTest {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = '';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State searchTotalNumber: number = -1;
  @State isSearchEnd: boolean = false;


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
    if (eventData != null) {
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 1;
        console.log('valueChangeCallBack==>' + this.str)
      }
    }
  }
  build() {
    Column() {

      Row() {
        Button('clientAuthenticationHandlerFive').key('clientAuthenticationHandlerFiveButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, this.str, 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str, 1, 1000);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case 'emitClientAuthenticationHandlerCancel001': {
              try {
                this.controller.clearClientAuthenticationCache();
                this.controller.clearSslCache();
                this.isPageEnd = -1;
                this.controller.loadUrl(URL_CLIENT);
                await Utils.waitForExist(()=>this.isPageEnd, this.str, 1, 1000);
                this.controller.searchAllAsync('SSL');
                await Utils.waitForExist(()=>this.isSearchEnd, this.str, true, 1000);
                Utils.emitEvent(this.searchTotalNumber, 26031045);
              } catch (error) {
                console.log(this.str + 'errorInfo==>' + error.toString());
              }
              break;
            }

          }
        }).margin(10)

      }
      Web({ src: $rawfile('second.html'), controller: this.controller })
        .onPageEnd((event) => {
          console.log('onPageEnd url==>' + event.url);
          this.isPageEnd = 1;
        })
        .onSslErrorEvent((event: SslErrorEvent) => {
          if (event) {
            console.log('onSslErrorEvent url: ' + event.url);
            console.log('onSslErrorEvent error: ' + event.error);
            console.log('onSslErrorEvent originalUrl: ' + event.originalUrl);
            console.log('onSslErrorEvent referrer: ' + event.referrer);
            console.log('onSslErrorEvent isFatalError: ' + event.isFatalError);
            console.log('onSslErrorEvent isMainFrame: ' + event.isMainFrame);
            console.log('onSslErrorEvent handler: ' + event.handler);
            event.handler.handleConfirm();
          }
        })
        .onClientAuthenticationRequest((event) => {
          console.log('onClientAuthenticationRequest==>');
          console.log('onClientAuthenticationRequest: ' + event.host);
          console.log('onClientAuthenticationRequest: ' + event.port);
          console.log('onClientAuthenticationRequest: ' + event.issuers);
          console.log('onClientAuthenticationRequest: ' + event.keyTypes);
          if (event) {
            Utils.emitEvent(event.host, 26031041);
            Utils.emitEvent(event.port, 26031042);
            if (event.issuers && event.issuers.length > 0) {
              Utils.emitEvent(true, 26031043);
            } else {
              Utils.emitEvent(false, 26031043);
            }
            if (event.keyTypes && event.keyTypes.length > 0) {
              Utils.emitEvent(true, 26031044);
            } else {
              Utils.emitEvent(false, 26031044);
            }

          }
          event.handler.cancel();
        })
        .onErrorReceive((event) => {
          if (event) {
            console.info('getErrorInfo:' + event.error.getErrorInfo());
            console.info('getErrorCode:' + event.error.getErrorCode());
            console.info('url:' + event.request.getRequestUrl());
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