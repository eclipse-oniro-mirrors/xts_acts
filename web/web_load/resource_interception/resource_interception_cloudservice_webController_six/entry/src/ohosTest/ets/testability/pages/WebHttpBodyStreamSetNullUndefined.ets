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
import webview from '@ohos.web.webview';
import business_error from '@ohos.base'
import Utils from '../../test/Utils'
import { waitForExist } from '../../test/WaitTest.test';
import { URL_EXAMPLE_HTTPS } from '../../test/Config.test';
import { buffer } from '@kit.ArkTS';

@Entry
@Component
struct WebHttpBodyStream {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler();
  htmlData: string = '<html><body bgcolor="white">Source:<pre>source</pre></body></html>';
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State result: string  = '';

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 26031320,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(26031320)
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

  setWebHttpBodyStream(operate: string){
    try {
      this.schemeHandler.onRequestStart((request: webview.WebSchemeHandlerRequest,
        resourceHandler: webview.WebResourceHandler) => {
        console.info('[schemeHandler] onRequestStart:'+request.getRequestUrl());
        let stream = request.getHttpBodyStream();
        try {
          if (stream) {
            switch (operate){
              case 'readNull':
                console.info('[schemeHandler] stream readNull start');
                stream.read(null);
                console.info('[schemeHandler] stream readNull success');
                this.result = 'success'
                break
              case 'readUndefined':
                console.info('[schemeHandler] stream readUndefined start');
                stream.read(undefined);
                console.info('[schemeHandler] stream readUndefined success');
                this.result = 'success'
                break
            }
          }
        } catch (error) {
          console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          this.result = `${(error as BusinessError).code}`
        }
        return false;
      })

      this.schemeHandler.onRequestStop((request: webview.WebSchemeHandlerRequest) => {
        console.info('[schemeHandler] onRequestStop');
      });

      this.controller.setWebSchemeHandler('https', this.schemeHandler);
      this.controller.setWebSchemeHandler('http', this.schemeHandler);
    } catch (error) {
      console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebHttpBodyStreamTest').key('WebHttpBodyStreamButton').onClick(async () => {
          await waitForExist(()=>this.isPageEnd, 'WebHttpBodyStreamTest_PageEnd', 0);
          await waitForExist(()=>this.isReceive, 'WebHttpBodyStreamTest_Receive', 0);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case 'testReadNull': {
              this.result = 'testReadNull'
              try {
                this.setWebHttpBodyStream('readNull')
                let postData = buffer.from(this.htmlData);
                this.controller.postUrl(URL_EXAMPLE_HTTPS, postData.buffer);
                await waitForExist(() => this.result, 'testReadNull', '401', 1000);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              Utils.emitEvent(this.result, 26031321)
              break;
            }
            case 'testReadUndefined': {
              this.result = 'testReadUndefined'
              try {
                this.setWebHttpBodyStream('readUndefined')
                let postData = buffer.from(this.htmlData);
                this.controller.postUrl(URL_EXAMPLE_HTTPS, postData.buffer);
                await waitForExist(() => this.result, 'testReadUndefined',  '401', 1000);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              Utils.emitEvent(this.result, 26031322)
              break;
            }

          }
        })
      }

      Web({ src: URL_EXAMPLE_HTTPS, controller: this.controller })
        .javaScriptAccess(true)
        .fileAccess(true)
        .imageAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        .databaseAccess(true)
        .onPageEnd((event) => {
          console.log('onPageEnd', event.url)
          this.isPageEnd = 0
        })
    }
  }
}