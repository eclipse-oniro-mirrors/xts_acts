/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Entry, Component, Column, Row, Button, ClickEvent, Web,  WebResourceResponse, Header, OnInterceptRequestEvent, ConsoleMessageSource, OnTitleReceiveEvent} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import Utils from '../../src/test/Util.test';
import webView from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext'

export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebConsoleMessageSource {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ''
  @State httpErrorReceive: Int = 0
  @State responseCode: Int = 200
  heads: Header[] = new Array<Header>()
  responseWeb: WebResourceResponse = new WebResourceResponse()
  webData: string = '<!DOCTYPE html>\n' +
    '<html>\n' +
    '<head>\n' +
    '<title>intercept test</title>\n' +
    '</head>\n' +
    '<body>\n' +
    '<h1>intercept test</h1>\n' +
    '</body>\n' +
    '</html>'
  @State title: string = 'test';

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
        console.info(this.stringObj.str)
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button('WebConsoleMessageSourceTestButton')
          .key('WebConsoleMessageSourceTestButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' +  this.stringObj.str)
            switch (this.stringObj.str) {
              case 'testWebConsoleMessageSourceXML0001': {
                try {
                  Utils.emitEvent(ConsoleMessageSource.XML, 160600);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebConsoleMessageSourceJAVASCRIPT0001': {
                try {
                  Utils.emitEvent(ConsoleMessageSource.JAVASCRIPT, 160601);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebConsoleMessageSourceNETWORK0001': {
                try {
                  Utils.emitEvent(ConsoleMessageSource.NETWORK, 160602);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebConsoleMessageSourceCONSOLE_API0001': {
                try {
                  Utils.emitEvent(ConsoleMessageSource.CONSOLE_API, 160603);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebConsoleMessageSourceSTORAGE0001': {
                try {
                  Utils.emitEvent(ConsoleMessageSource.STORAGE, 160604);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebConsoleMessageSourceRENDERING0001': {
                try {
                  Utils.emitEvent(ConsoleMessageSource.RENDERING, 160605);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebConsoleMessageSourceSECURITY0001': {
                try {
                  Utils.emitEvent(ConsoleMessageSource.SECURITY, 160606);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebConsoleMessageSourceOTHER0001': {
                try {
                  Utils.emitEvent(ConsoleMessageSource.OTHER, 160607);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebConsoleMessageSourceDEPRECATION0001': {
                try {
                  Utils.emitEvent(ConsoleMessageSource.DEPRECATION, 160608);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebConsoleMessageSourceWORKER0001': {
                try {
                  Utils.emitEvent(ConsoleMessageSource.WORKER, 160609);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebConsoleMessageSourceVIOLATION0001': {
                try {
                  Utils.emitEvent(ConsoleMessageSource.VIOLATION, 160610);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebConsoleMessageSourceINTERVENTION0001': {
                try {
                  Utils.emitEvent(ConsoleMessageSource.INTERVENTION, 160611);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testWebConsoleMessageSourceRECOMMENDATION0001': {
                try {
                  Utils.emitEvent(ConsoleMessageSource.RECOMMENDATION, 160612);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
            }
          })

        Web({ src: 'resource://rawfile/index.html', controller: this.controller })
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)

          .onTitleReceive((event:OnTitleReceiveEvent):void => {
            if (event) {
              console.log('title:' + event.title);
              this.title = event.title
            }
          })

           .onHttpErrorReceive((event) => {
             console.info('isHttpErrorReceive==>' + this.httpErrorReceive)
             if (event) {
               this.httpErrorReceive = event.response.getResponseCode()
               console.info('isHttpErrorReceive==>' + this.httpErrorReceive)
             }
           })
      }
    }
  }
}
