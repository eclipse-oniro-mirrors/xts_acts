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
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web,
} from '@ohos.arkui.component'
import buffer from '@ohos.buffer';
import webview from '@ohos.web.webview'
import events_emitter from '@ohos.events.emitter'
import Utils from '../../src/test/Utils.test';
import { BusinessError,Callback, RecordData } from '@ohos.base'
import { State } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext'
class StringFields {
  public str: string = '';
}


@Entry
@Component
struct WebHttpBodyStream {
  stringObj: StringFields  = new StringFields ();
  @State str: string = ""
  @State WebHttpBodyStream0100: boolean = false
  controller: webview.WebviewController = new webview.WebviewController(undefined)
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  htmlData: string = "<html><body bgcolor=\"white\">Source:<pre>source</pre></body></html>";

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
          Button("WebHttpBodyStream").key('WebHttpBodyStream').onClick((e: ClickEvent) => {
          console.info("key==>" +  this.stringObj.str)
            switch ( this.stringObj.str) {
              case "WebHttpBodyStream0100": {
                let response = new webview.WebSchemeHandlerResponse();
                try {
                  this.controller.refresh();
                  this.WebHttpBodyStream0100 = true;
                  let postData = buffer.from(this.htmlData)
                  this.controller.postUrl('https://www.example.com', postData.buffer);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitonSwitchNextPage': {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/setAndClearServiceWorkerWebSchemeHandler' })
                console.log('push URL success')
              }
          }
        })
      }

      Web({ src: 'https://www.example.com', controller: this.controller })
        .onControllerAttached(() => {
          try {
            this.schemeHandler.onRequestStart((request: webview.WebSchemeHandlerRequest, resourceHandler: webview.WebResourceHandler) => {
              console.log("[schemeHandler] onRequestStart")
              try {
                let stream = request.getHttpBodyStream();
                if (stream) {
                  stream.initialize().then(() => {
                    console.log("[schemeHandler] onRequestStart postDataStream size:" + stream.getSize());
                    console.log("[schemeHandler] onRequestStart postDataStream position:" + stream.getPosition());
                    console.log("[schemeHandler] onRequestStart postDataStream isChunked:" + stream.isChunked());
                    console.log("[schemeHandler] onRequestStart postDataStream isEof:" + stream.isEof());
                    console.log("[schemeHandler] onRequestStart postDataStream isInMemory:" + stream.isInMemory());
                    if(stream.getSize() == 66 && stream.getPosition() == 0 && stream.isChunked() == false && stream.isEof() == false && stream.isInMemory() == true){
                      Utils.emitEvent(true, 8820)
                    }
                  })
                } else {
                  console.log("[schemeHandler] onRequestStart has no http body stream")
                  if(this.WebHttpBodyStream0100){
                    this.WebHttpBodyStream0100 = false
                    Utils.emitEvent(true, 8820)
                  }
                }
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }

              return false;
            })

            this.schemeHandler.onRequestStop((request: webview.WebSchemeHandlerRequest) => {
              console.log("[schemeHandler] onRequestStop")
            });

            this.controller.setWebSchemeHandler('https', this.schemeHandler);
          } catch (error) {
            error = error as BusinessError;
            console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
          }
        })
    }
  }
}