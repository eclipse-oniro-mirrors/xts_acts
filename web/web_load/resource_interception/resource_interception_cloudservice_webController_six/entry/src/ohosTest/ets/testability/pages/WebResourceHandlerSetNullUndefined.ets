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
import events_emitter from '@ohos.events.emitter'
import webview from '@ohos.web.webview'
import Utils from '../../test/Utils'


const EVENT_ID_SET_EMIT_KEY = 26031310;

@Entry
@Component
struct WebResourceHandlerSetNullUndefined {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State result: string = ''

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
          console.info('valueChangeCallBack:' + JSON.stringify(eventData));
          if (eventData.data != null && eventData.data.ACTION != null) {
              this.emitKey = eventData.data.ACTION;
              this.isReceive = 1;
          }
      }
  }

  setWebResourceHandler(operate: string){
    try {
      this.schemeHandler.onRequestStart((request: webview.WebSchemeHandlerRequest,
        resourceHandler: webview.WebResourceHandler) => {
        console.info('[schemeHandler] onRequestStart:' + request.getRequestUrl());
        switch (operate) {
          case 'didReceiveResponseNull':
            try {
              console.info('[schemeHandler] didReceiveResponseNull start');
              resourceHandler.didReceiveResponse(null)
              console.info('[schemeHandler] didReceiveResponseNull success');
              this.result = 'success'
            } catch (error) {
              console.error(`didReceiveResponse ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              this.result = `${(error as BusinessError).code}`
            }
            break
          case 'didReceiveResponseUndefined':
            try {
              console.info('[schemeHandler] didReceiveResponseUndefined start');
              resourceHandler.didReceiveResponse(undefined)
              console.info('[schemeHandler] didReceiveResponseUndefined success');
              this.result = 'success'
            } catch (error) {
              console.error(`didReceiveResponse ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              this.result = `${(error as BusinessError).code}`
            }
            break
          case 'didFailNull':
            try {
              console.info('[schemeHandler] didFailNull start');
              resourceHandler.didFail(null)
              console.info('[schemeHandler] didFailNull success');
              this.result = 'success'
            } catch (error) {
              console.error(`didFail ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              this.result = `${(error as BusinessError).code}`
            }
            break
          case 'didFailUndefined':
            try {
              console.info('[schemeHandler] didFailUndefined start');
              resourceHandler.didFail(undefined)
              console.info('[schemeHandler] didFailUndefined success');
              this.result = 'success'
            } catch (error) {
              console.error(`didFail ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              this.result = `${(error as BusinessError).code}`
            }
            break
          case 'didFailWithCompleteIfNoResponseNull':
            try {
              console.info('[schemeHandler] didFailWithCompleteIfNoResponseNull start');
              resourceHandler.didFail(null, true)
              console.info('[schemeHandler] didFailWithCompleteIfNoResponseNull success');
              this.result = 'success'
            } catch (error) {
              console.error(`didFailWithCompleteIfNoResponseNull ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              this.result = `${(error as BusinessError).code}`
            }
            break
          case 'didFailWithCompleteIfNoResponseUndefined':
            try {
              console.info('[schemeHandler] didFailWithCompleteIfNoResponseUndefined start');
              resourceHandler.didFail(undefined, true)
              console.info('[schemeHandler] didFailWithCompleteIfNoResponseUndefined success');
              this.result = 'success'
            } catch (error) {
              console.error(`didFailWithCompleteIfNoResponseUndefined ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              this.result = `${(error as BusinessError).code}`
            }
            break
          default :
            break

        }
        return false;
      })

      this.schemeHandler.onRequestStop((request: webview.WebSchemeHandlerRequest) => {
        console.info('[schemeHandler] onRequestStop');
      });

      this.controller.setWebSchemeHandler('https', this.schemeHandler);
      this.controller.setWebSchemeHandler('http', this.schemeHandler);
      this.controller.setWebSchemeHandler('resource', this.schemeHandler);
      this.controller.setWebSchemeHandler('custom', this.schemeHandler);
    } catch (error) {
      console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
    }
  }


  
  build() {
    Column() {
      Row() {
        Button('WebResourceHandler').key('WebResourceHandlerButton').onClick(async () => {
            await Utils.waitForExist(()=>this.isReceive, 'WebResourceHandler_Receive', 1, 1000);
            await Utils.waitForExist(()=>this.isReceive, 'WebResourceHandler_PageEnd', 1, 1000);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            switch (this.emitKey) {
              case 'testDidReceiveResponseNull': {
                this.result = 'testDidReceiveResponseNull'
                this.setWebResourceHandler('didReceiveResponseNull')
                this.controller.loadUrl('resource://rawfile/index.html');
                await Utils.waitForExist(()=>this.result, 'testDidReceiveResponseNull', 'success', 1000);
                Utils.emitEvent(this.result, 26031311)
                break;
              }
              case 'testDidReceiveResponseUndefined': {
                this.result = 'testDidReceiveResponseUndefined'
                this.setWebResourceHandler('didReceiveResponseUndefined')
                this.controller.loadUrl('resource://rawfile/index.html');
                await Utils.waitForExist(()=>this.result, 'testDidReceiveResponseUndefined', 'success', 1000);
                Utils.emitEvent(this.result, 26031312)
                break;
              }
              case 'testDidFailNull': {
                this.result = 'testDidFailNull'
                this.setWebResourceHandler('didFailNull')
                this.controller.loadUrl('resource://rawfile/index.html');
                await Utils.waitForExist(()=>this.result, 'testDidFailNull', '401', 1000);
                Utils.emitEvent(this.result, 26031313)
                break;
              }
              case 'testDidFailUndefined': {
                this.result = 'testDidFailUndefined'
                this.setWebResourceHandler('didFailUndefined')
                this.controller.loadUrl('resource://rawfile/index.html');
                await Utils.waitForExist(()=>this.result, 'testDidFailUndefined', '401', 1000);
                Utils.emitEvent(this.result, 26031314)
                break;
              }
              case 'testDidFailWithCompleteIfNoResponseNull': {
                this.result = 'testDidFailWithCompleteIfNoResponseNull'
                this.setWebResourceHandler('didFailWithCompleteIfNoResponseNull')
                this.controller.loadUrl('resource://rawfile/index.html');
                await Utils.waitForExist(()=>this.result, 'testDidFailWithCompleteIfNoResponseNull', '17100101', 1000);
                Utils.emitEvent(this.result, 26031315)
                break;
              }
              case 'testDidFailWithCompleteIfNoResponseUndefined': {
                this.result = 'testDidFailWithCompleteIfNoResponseUndefined'
                this.setWebResourceHandler('didFailWithCompleteIfNoResponseUndefined')
                this.controller.loadUrl('resource://rawfile/index.html');
                await Utils.waitForExist(()=>this.result, 'testDidFailWithCompleteIfNoResponseUndefined', '17100101', 1000);
                Utils.emitEvent(this.result, 26031316)
                break;
              }
            }
          })
      }
      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onPageBegin((event) => {
          console.log('onPageBegin ==>' + event.url);
        })
        .onPageEnd((event) => {
          console.log('onPageEnd ==>' + event.url);
          this.isPageEnd = 1
        })
      }
  }
}