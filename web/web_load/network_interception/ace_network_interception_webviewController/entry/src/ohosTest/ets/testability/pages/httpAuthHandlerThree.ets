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

import Utils from '../../test/Utils';
import {URL, URL3} from '../../test/Config.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct httpAuthHandlerThree {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State isReceive:number = -1;
  @State isPageEnd:number = -1;
  @State operateStr:string = '';

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 125,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(125)
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
        Button('HttpAuthHandlerEnhanced click').key('HttpAuthHandlerThreeButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, this.str, 1);
          console.info('key==>' + this.str)
          this.isReceive = -1;
          this.controller.clearSslCache();
          this.controller.clearClientAuthenticationCache();
          this.controller.removeCache(true);
          this.controller.clearHistory();
          switch (this.str) {
            case 'emitHttpAuthHandlerConfirmUserNameNull': {
              try {
                this.operateStr = 'setUserNameNull';
                this.controller.loadUrl(URL);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitHttpAuthHandlerConfirmUserNameUndefined': {
              try {
                this.operateStr = 'setUserNameUndefined';
                this.controller.loadUrl(URL);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitHttpAuthHandlerConfirmUserNameEmpty': {
              try {
                this.operateStr = 'setUserNameEmpty';
                this.controller.loadUrl(URL);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitHttpAuthHandlerConfirmPasswordNull': {
              try {
                this.operateStr = 'setPasswordNull';
                this.controller.loadUrl(URL);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitHttpAuthHandlerConfirmPasswordUndefined': {
              try {
                this.operateStr = 'setPasswordUndefined';
                this.controller.loadUrl(URL);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitHttpAuthHandlerConfirmPasswordEmpty': {
              try {
                this.operateStr = 'setPasswordEmpty';
                this.controller.loadUrl(URL);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onHttpAuthRequest((event) => {
          if (event) {
            console.log('onHttpAuthRequest host==>' + event.host);
            console.log('onHttpAuthRequest realm==>' + event.realm);
            if (this.operateStr == 'setUserNameNull') {
              let result = event.handler.confirm(null, '123');
              Utils.emitEvent(result, 26031201);
            } else if (this.operateStr == 'setUserNameUndefined') {
              let result = event.handler.confirm(undefined, '456');
              Utils.emitEvent(result, 26031202);
            } else if (this.operateStr == 'setUserNameEmpty') {
              let result = event.handler.confirm('', '789');
              Utils.emitEvent(result, 26031203);
            } else if (this.operateStr == 'setPasswordNull') {
              let result = event.handler.confirm('222', null);
              Utils.emitEvent(result, 26031204);
            } else if (this.operateStr == 'setPasswordUndefined') {
              let result = event.handler.confirm('111', undefined);
              Utils.emitEvent(result, 26031205);
            } else if (this.operateStr == 'setPasswordEmpty') {
              let result = event.handler.confirm('333', '');
              Utils.emitEvent(result, 26031206);
            }
          }
          return true
        })

    }
  }
}
