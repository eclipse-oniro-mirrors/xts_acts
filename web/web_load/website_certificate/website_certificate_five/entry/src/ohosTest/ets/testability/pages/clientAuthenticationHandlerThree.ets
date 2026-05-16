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

const EVENT_ID_SET_EMIT_KEY = 202514;

@Entry
@Component
struct clientAuthenticationHandlerThreeTest {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = '';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State isError: number = -1;


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
        Button('clientAuthenticationHandlerThree').key('clientAuthenticationHandlerThreeButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, this.str, 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str, 1, 1000);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          this.isError = -1;
          switch (this.str) {
            case 'emitClientAuthenticationHandlerConfirmType003': {
              try {
                this.controller.clearClientAuthenticationCache();
                this.controller.loadUrl(URL_CLIENT);
                await Utils.waitForExist(()=>this.isError, this.str, 1, 1000);
                console.log(this.str + ' result==>' + this.isError);
                Utils.emitEvent(this.isError, 25121103);
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
          console.log('CredentialType==>' + CredentialType.CREDENTIAL_APP);
          event.handler.confirm('234', CredentialType.CREDENTIAL_APP);
          return true;
        })
        .onErrorReceive((event) => {
          if (event) {
            console.info('getErrorInfo:' + event.error.getErrorInfo());
            console.info('getErrorCode:' + event.error.getErrorCode());
            console.info('url:' + event.request.getRequestUrl());
            this.isError = 1;
          }
        })
    }
  }
}