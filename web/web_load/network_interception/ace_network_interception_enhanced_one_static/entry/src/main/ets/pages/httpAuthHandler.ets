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
import webview from '@ohos.web.webview'
import { State } from '@ohos.arkui.stateManagement'
import {
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  Row,
  Web
} from '@ohos.arkui.component'
import events_emitter from '@ohos.events.emitter'
import { Hypium } from '../../../hypium';
import { BusinessError,Callback, RecordData } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import Utils from '../../src/test/Utils.test';

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct httpAuthHandler {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = ''
  @State onScrollCallBack: boolean = false
  @State javaScriptAccess: boolean = true
  @State onShowFileSelectorCallBack: boolean = false
  @State HttpAuthHandlerCallBack: string = ''
  @State HttpAuthHandlerConfirmCallBack: boolean = false
  @State HttpAuthHandlerCancelCallBack: boolean = false
  @State HttpAuthHandlerIsHttpAuthInfoSavedCallBack: boolean = false
  @State Http_Error_Code: number = 0
  no_error: string = 'no error happened'

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
        console.info('this.stringObj.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
          Button('HttpAuthHandler click').key('HttpAuthHandlerButton').onClick((e: ClickEvent) => {
          console.info('key==>' +  this.stringObj.str)
          switch ( this.stringObj.str) {
            case 'testHttpAuthHandlerConfirm001': {
              try {
                this.HttpAuthHandlerCallBack = 'confirm'
                this.controller.loadUrl('http://httpbin.org/basic-auth/admin/123456')
                setTimeout(() => {
                  Utils.emitEvent(this.HttpAuthHandlerConfirmCallBack, 32040)
                }, 3000)

              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 32040)
              }
              break;
            }

            case 'testHttpAuthHandlerCancel001': {
              try {
                this.HttpAuthHandlerCallBack = 'cancel'
                this.HttpAuthHandlerCancelCallBack = true
                this.controller.loadUrl('www.example.com')
                setTimeout(() => {
                  Utils.emitEvent(this.Http_Error_Code, 32041)
                }, 5000)

              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 32041)
              }
              break;
            }

            case 'testHttpAuthHandlerIsHttpAuthInfoSaved001': {
              try {
                this.HttpAuthHandlerCallBack = 'isHttpAuthInfoSaved'
                this.controller.loadUrl('http://httpbin.org/basic-auth/admin/123456')
                setTimeout(() => {
                  Utils.emitEvent(this.HttpAuthHandlerIsHttpAuthInfoSavedCallBack, 32042)
                }, 3000)

              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 32042)
              }
              break;
            }

            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webController' })
              console.log('push URL success')
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .onHttpAuthRequest((event) => {
          if (event) {
            if (this.HttpAuthHandlerCallBack == 'confirm') {
              this.HttpAuthHandlerConfirmCallBack = event.handler.confirm('2222', '3333')
              this.HttpAuthHandlerCallBack = ''
            }
            if (this.HttpAuthHandlerCallBack == 'cancel') {
              event.handler.cancel()
              this.HttpAuthHandlerCallBack = ''
            }
            if (this.HttpAuthHandlerCallBack == 'isHttpAuthInfoSaved') {
              this.HttpAuthHandlerIsHttpAuthInfoSavedCallBack = event.handler.isHttpAuthInfoSaved()
              this.HttpAuthHandlerCallBack = ''
            }
          }
          return true
        })
        .onHttpErrorReceive((event) => {
          console.log('onHttpErrorReceive')
          if (event) {
              this.Http_Error_Code = event.response.getResponseCode()
              console.log('errorCode:' + this.Http_Error_Code)
              this.HttpAuthHandlerCancelCallBack = false
          }
        })
    }
  }
}
