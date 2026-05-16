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
  OnTitleReceiveEvent,
  OnDataResubmittedEvent,
  OnRenderExitedEvent,
  OnPageBeginEvent,
  RenderProcessNotRespondingReason,
  RenderProcessNotRespondingData,
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web
} from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement"
import webView from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog';

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebOnDataResubmitted {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = '';
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State errorTestCode: number = 0;
  @State ConfirmCancel: string = '';
  @State onSslErrorEventReceiveCallBack: boolean = false
  @State cancel_result: number = 100;


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
        Button("SslErrorHandler click").key('SslErrorHandlerButton').onClick((e: ClickEvent) => {
          console.info("key==>" + this.stringObj.str);
          switch (this.stringObj.str) {
            case "testOnSslErrorEventReceive001": {
              try {
                this.onSslErrorEventReceiveCallBack = false
                this.ConfirmCancel = 'handleCancel'
                this.controller.clearSslCache();
                setTimeout(() => {
                  this.controller.loadUrl("https://expired.badssl.com");
                  setTimeout(() => {
                    Utils.emitEvent(this.onSslErrorEventReceiveCallBack, 30272)
                  }, 6000)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testSslErrorHandlerHandleCancel001": {
              try {
                this.ConfirmCancel = 'handleCancel'
                const startUrl = this.controller.getUrl();
                this.cancel_result = 10000
                this.controller.clearSslCache();
                setTimeout(() => {
                  this.controller.loadUrl("https://expired.badssl.com");
                  setTimeout(() => {
                    const endUrl = this.controller.getUrl();
                    this.cancel_result = (endUrl === startUrl) ? 0 : 1;
                    Utils.emitEvent(this.cancel_result, 30271);
                  }, 3000)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testSslErrorHandlerHandleConfirm001": {
              try {
                let title: string = ' '
                this.ConfirmCancel = 'handleConfirm'
                this.controller.clearSslCache();
                setTimeout(() => {
                  this.controller.loadUrl("https://expired.badssl.com");
                  setTimeout(() => {
                    title = this.controller.getTitle()
                    if (title != "index") {
                      Utils.emitEvent(true, 30270)
                    } else {
                      Utils.emitEvent(false, 30270)
                    }
                  }, 6000)
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testClearSslCache001": {
              try {
                this.onSslErrorEventReceiveCallBack = false
                this.controller.clearClientAuthenticationCache()
                this.controller.clearSslCache();
                setTimeout(() => {
                  this.controller.loadUrl("https://expired.badssl.com");
                  setTimeout(() => {
                    Utils.emitEvent(this.onSslErrorEventReceiveCallBack, 100073)
                  }, 6000)
                }, 3000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(true)
        .onSslErrorEventReceive((event) => {
          if (event) {
            if (this.ConfirmCancel == 'handleConfirm') {
              event.handler.handleConfirm()
            }
            if (this.ConfirmCancel == 'handleCancel') {
              event.handler.handleCancel()
            }
            this.ConfirmCancel = ' '
            this.onSslErrorEventReceiveCallBack = true
          }
        })
        .onSearchResultReceive(ret => {
          if (ret) {
            console.log("on search result receive:" + "[cur]" + ret.activeMatchOrdinal +
              "[total]" + ret.numberOfMatches + "[isDone]" + ret.isDoneCounting);
            this.cancel_result = ret.numberOfMatches
          }
        })
    }
  }
}
