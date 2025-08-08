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
import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import business_error, { BusinessError } from '@ohos.base';
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';
import { URL } from '../../test/Config.test';


@Entry
@Component
struct webViewOnSslErrorEventTwo {
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isCertChainData: number = -1;
  controller: webView.WebviewController = new webView.WebviewController();

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 126,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(126)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('webViewOnSslErrorEvent').key('onSslErrorEventCertChainDataButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.str, 0);
          await waitForExist(()=>this.isPageEnd, this.str, 0);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          this.isCertChainData = -1;
          switch (this.str) {
            case 'emitOnSslErrorEventCertChainData0100': {
              this.controller.clearClientAuthenticationCache();
              this.controller.clearSslCache();
              this.isPageEnd = -1;
              this.controller.loadUrl(URL);
              await waitForExist(()=>this.isPageEnd, this.str, 0);
              let check = (v1: number, v2: number): boolean => {
                return v1 == v2 ? true:false;
              }
              await waitForAssert(()=>this.isCertChainData, check, 1, 2025071601, this.str);
              console.log(this.str + ' isCertChainData==>' + this.isCertChainData);
              break;
            }
            case 'emitOnSslErrorEventCertChainData0200': {
              this.controller.clearClientAuthenticationCache();
              this.controller.clearSslCache();
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('iframe.html'));
              await waitForExist(()=>this.isPageEnd, this.str, 0);
              let check = (v1: number, v2: number): boolean => {
                return v1 == v2 ? true:false;
              }
              await waitForAssert(()=>this.isCertChainData, check, 1, 2025071602, this.str);
              console.log(this.str + ' isCertChainData==>' + this.isCertChainData);
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onPageEnd((event) => {
          console.log('onPageEnd url==>' + event.url);
          this.isPageEnd = 0;
        })
        .onSslErrorEvent((event: SslErrorEvent) => {
          console.log('onSslErrorEvent url==>' + event.url);
          console.log('onSslErrorEvent error==>' + event.error);
          console.log('onSslErrorEvent originalUrl==>' + event.originalUrl);
          console.log('onSslErrorEvent referrer==>' + event.referrer);
          console.log('onSslErrorEvent isFatalError==>' + event.isFatalError);
          console.log('onSslErrorEvent isMainFrame==>' + event.isMainFrame);
          console.log('onSslErrorEvent certChainData==>' + event.certChainData);
          if (event) {
            event.handler.handleConfirm();
          }
          if(event.certChainData){
            this.isCertChainData = 1;
          }
        })
    }
  }
}