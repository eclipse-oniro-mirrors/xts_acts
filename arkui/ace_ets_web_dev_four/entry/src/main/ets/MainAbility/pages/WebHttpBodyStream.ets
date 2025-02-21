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
import web_webview from '@ohos.web.webview';
import business_error from '@ohos.base';
import buffer from '@ohos.buffer'
import { WebNetErrorList } from '@ohos.web.netErrorList'

@Entry
@Component
struct WebHttpBodyStream {
  @State str: string = ""
  @State userAgentPC: string = ""
  @State WebHttpBodyStream0100: boolean = false
  controller: web_webview.WebviewController = new web_webview.WebviewController()
  schemeHandler: web_webview.WebSchemeHandler = new web_webview.WebSchemeHandler()
  htmlData: string = "<html><body bgcolor=\"white\">Source:<pre>source</pre></body></html>";

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebHttpBodyStream").id('WebHttpBodyStream').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "WebHttpBodyStream0100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                this.userAgentPC = this.controller.getUserAgent();
                this.controller.refresh();
                await Utils.sleep(3000);
                this.WebHttpBodyStream0100 = true;
                let postData = buffer.from(this.htmlData)
                this.controller.postUrl('https://www.example.com', postData.buffer);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
              break;
            }
          }
        })
      }

      Web({ src: 'https://www.example.com', controller: this.controller })
        .onControllerAttached(() => {
          try {
            this.schemeHandler.onRequestStart((request: web_webview.WebSchemeHandlerRequest, resourceHandler: web_webview.WebResourceHandler) => {
              console.log("[schemeHandler] onRequestStart")
              try {
                let stream = request.getHttpBodyStream();
                if (stream) {
                  stream.initialize().then(() => {
                    if (!stream) {
                      return;
                    }
                    console.log("[schemeHandler] onRequestStart postDataStream size:" + stream.getSize());
                    console.log("[schemeHandler] onRequestStart postDataStream position:" + stream.getPosition());
                    console.log("[schemeHandler] onRequestStart postDataStream isChunked:" + stream.isChunked());
                    console.log("[schemeHandler] onRequestStart postDataStream isEof:" + stream.isEof());
                    console.log("[schemeHandler] onRequestStart postDataStream isInMemory:" + stream.isInMemory());
                    if(stream.getSize() == 66 && stream.getPosition() == 0 && stream.isChunked() == false && stream.isEof() == false && stream.isInMemory() == true){
                      Utils.emitEvent(true, 8820)
                    }
                    stream.read(stream.getSize()).then((buffer) => {
                      if (!stream) {
                        return;
                      }
                      console.log("[schemeHandler] onRequestStart postDataStream readlength:" + buffer.byteLength);
                      console.log("[schemeHandler] onRequestStart postDataStream isEof:" + stream.isEof());
                      console.log("[schemeHandler] onRequestStart postDataStream position:" + stream.getPosition());
                    }).catch((error: business_error.BusinessError) => {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    })
                  }).catch((error: business_error.BusinessError) => {
                    let e: business_error.BusinessError = error as business_error.BusinessError;
                    console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  })
                } else {
                  console.log("[schemeHandler] onRequestStart has no http body stream")
                  if(this.WebHttpBodyStream0100){
                    this.WebHttpBodyStream0100 = false
                    Utils.emitEvent(true, 8820)
                  }
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }

              return false;
            })

            this.schemeHandler.onRequestStop((request: web_webview.WebSchemeHandlerRequest) => {
              console.log("[schemeHandler] onRequestStop")
            });

            this.controller.setWebSchemeHandler('https', this.schemeHandler);
          } catch (error) {
            let e: business_error.BusinessError = error as business_error.BusinessError;
            console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
          }
        })
        .javaScriptAccess(true)
        .domStorageAccess(true)
    }
  }
}