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
  OnHttpErrorReceiveEvent,
  OnInterceptRequestEvent,
  Header,
  WebResourceResponse,
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
import { State } from "@ohos.arkui.stateManagement" // should be insert by ui-plugins
import webview from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webResourceResponsePage {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  responseWeb: WebResourceResponse = new WebResourceResponse()
  @State webdata: string = '<!DOCTYPE html>\n' +
    '<html>\n' +
    '<head>\n' +
    '<title>intercept test</title>\n' +
    '</head>\n' +
    '<body>\n' +
    '<h1>intercept test</h1>\n' +
    '<script>' +
    'function gettitle(){ return document.write(document.title); }' +
    'gettitle()' +
    '</script>' +
    '</body>\n' +
    '</html>'
  @State emitKey: string = '';
  @State str: string = '';
  @State onHttpErrorReceive: boolean = false
  @State setResponseIsReady: boolean = true
  @State setResponseCode: int = 403
  @State responseDataType: string = ''
  @State responseDataString: string = ''
  @State getResponseDataExValue: string = ''
  @State getResponseIsReady: boolean = false

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info(' Finish aboutToAppear ' + this.valueChangeCallBack);
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION vaclue: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        console.info('strValue has been updated to: ' + strValue);
        this.stringObj.str = strValue;
        console.info('this.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebResourceResponse click").key('WebResourceResponseButton').onClick((e: ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          this.responseWeb = new WebResourceResponse()
          switch (this.stringObj.str) {
            case 'testGetResponseDataExReturnString': {
              try {
                this.onHttpErrorReceive = true
                this.responseDataType = 'string'
                this.responseDataString = this.webdata
                this.setResponseCode = 200
                this.controller.loadUrl('www.example.com');
                let result: boolean = false;
                console.log('testGetResponseDataExReturnString:' + result)
                Utils.emitEvent(true, 36010);
              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testGetResponseIsReadyReturnTrue': {
              try {
                this.onHttpErrorReceive = true
                this.setResponseIsReady = true
                this.setResponseCode = 403
                this.getResponseIsReady = false
                this.controller.loadUrl('www.example.com');
                console.log('testGetResponseIsReadyReturnTrue getResponseIsReady:' +
                this.responseWeb.getResponseIsReady())
              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: 'https://gitee.com/openharmony/123', controller: this.controller })
        .onInterceptRequest((event: OnInterceptRequestEvent): WebResourceResponse => {
          if (event) {
            console.log('url:' + event.request.getRequestUrl())
            let head1: Header = {
              headerKey: 'Connection',
              headerValue: 'keep-alive'
            }
            let head2: Header = {
              headerKey: 'Cache-Control',
              headerValue: 'no-cache'
            }
            this.responseWeb.setResponseHeader([head1, head2])

            if (this.responseDataType === 'string') {
              this.responseWeb.setResponseData(this.responseDataString)
            }
            this.responseWeb.setResponseEncoding('utf-8')
            this.responseWeb.setResponseMimeType('text/html')
            this.responseWeb.setResponseCode(this.setResponseCode)
            this.responseWeb.setReasonMessage('OK')
            this.responseWeb.setResponseIsReady(this.setResponseIsReady)
          }
          return this.responseWeb
        })
        .onHttpErrorReceive((event: OnHttpErrorReceiveEvent): void => {
          if (event) {
              console.info("ResponseDataEx: " + JSON.stringify(event.response.getResponseDataEx()));
              console.log('onHttpErrorReceive url:' + event.request.getRequestUrl());
              console.log('onHttpErrorReceive getResponseIsReady:' + event.response.getResponseIsReady());
              this.getResponseIsReady = event.response.getResponseIsReady()
              Utils.emitEvent(true, 36015);
              console.log('onHttpErrorReceive getResponseDataEx JSON stringify:' +
              JSON.stringify(event.response.getResponseDataEx()));
              console.log('onHttpErrorReceive getResponseDataEx :' + event.response.getResponseDataEx());
              this.getResponseDataExValue = JSON.stringify(event.response.getResponseDataEx())
          }
        })
    }
  }
}
