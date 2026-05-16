/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { Entry, Component, Column, Row, Button, ClickEvent, Web, OnPageBeginEvent, OnPageEndEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import Utils from '../../src/test/Utils.test';
import webview from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
import { BusinessError } from '@ohos.base';
import buffer from '@ohos.buffer'

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webViewSdkSchemeHandlerEnhanced {
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  htmlData: string = '<html><body bgcolor="white">Source:<pre>source</pre></body></html>';
  httpBodyStream: webview.WebHttpBodyStream|null = null
  existHttpBodyStream: webview.WebHttpBodyStream|null = null
  @State isComplete: number = -1;
  @State test: boolean = false;
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  requests:webview.WebSchemeHandlerRequest[] = []


  stringObj: StringFields  = new StringFields ();

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
              Button('web click')
              .key('webViewSdkSchemeHandlerEnhanced')
              .onClick((e: ClickEvent) => {
                console.info('key==>' + this.stringObj.str)

                  switch (this.stringObj.str) {

                    case 'emitWebViewSdkSchemeHandler_isEof_false': {
                      let postData = buffer.from(this.htmlData);
                      this.controller.postUrl('https://www.example.com', postData.buffer);
                      setTimeout(() => {
                        Utils.emitEvent(this.test,1537)
                      }, 2000)
                      break;
                    }

                  }
              })
          }
          Web({ src: '', controller: this.controller })
            .javaScriptAccess(this.javaScriptAccess)
            .fileAccess(this.fileAccess)
            .imageAccess(this.imageAccess)
            .domStorageAccess(this.domStorageAccess)
            .onlineImageAccess(this.onlineImageAccess)
            .databaseAccess(this.databaseAccess)
            .onControllerAttached(() => {
              try {
                this.schemeHandler.onRequestStart((request: webview.WebSchemeHandlerRequest, resourceHandler: webview.WebResourceHandler) => {
                  console.log('[schemeHandler] onRequestStart');
                  try {
                    let stream = request.getHttpBodyStream();
                    if (stream) {
                      stream.initialize().then(() => {
                        if (!stream) {
                          return false;
                        }
                        console.log('[schemeHandler] onRequestStart postDataStream size:' + stream.getSize());
                        console.log('[schemeHandler] onRequestStart postDataStream position:' + stream.getPosition());
                        console.log('[schemeHandler] onRequestStart postDataStream isChunked:' + stream.isChunked());
                        console.log('[schemeHandler] onRequestStart postDataStream isEof:' + stream.isEof());
                        console.log('[schemeHandler] onRequestStart postDataStream isInMemory:' + stream.isInMemory());
                   if(stream.isEof() == false) {
                     this.test = true;
                   }
                      })
                    } else {
                      console.log('[schemeHandler] onRequestStart has no http body stream');
                    }
                  } catch (error) {
                    console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                  }

                  return false;
                })

                this.schemeHandler.onRequestStop((request: webview.WebSchemeHandlerRequest) => {
                  console.log('[schemeHandler] onRequestStop');
                });

                this.controller.setWebSchemeHandler('https', this.schemeHandler);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
            })
            .onPageBegin((event:OnPageBeginEvent):void => {
              console.log('onPageBegin ==>' + event.url);
            })
            .onPageEnd((event:OnPageEndEvent):void => {
              console.log('onPageEnd ==>' + event.url);
            })
      }
  }
}
