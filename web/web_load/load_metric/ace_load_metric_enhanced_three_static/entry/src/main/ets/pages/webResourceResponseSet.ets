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
  UIContext,
  WebResourceResponse,
  WebResourceRequest,
  Header
} from '@ohos.arkui.component'
import webview from '@ohos.web.webview'
import { Hypium } from '../../../hypium/index';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter'
import Utils from '../../src/test/Utils.test';
import { BusinessError,Callback, RecordData } from '@ohos.base'
import { Callback } from '@ohos.base'
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webResourceResponseSet {
  stringObj: StringFields = new StringFields();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  responseWeb: WebResourceResponse = new WebResourceResponse()
  webData: string = "<!DOCTYPE html>\n" +
    "<html>\n" +
    "<head>\n" +
    "<title>intercept test</title>\n" +
    "</head>\n" +
    "<body>\n" +
    "<h1>intercept test</h1>\n" +
    "<script>" +
    "function getTitle(){ return document.write(document.title); }" +
    "gettitle()" +
    "</script>" +
    "</body>\n" +
    "</html>"
  @State str: string = "emitOnHttpErrorReceiveByExampleWebc";
  @State javaScriptAccess: boolean = true;
  @State title: string = "test";
  @State getRequestHeaderValue: number = 0
  @State getResponseHeaderValue: boolean = false
  @State getRequestUrlValue: string = ''
  @State isRequestGestureValue: boolean = true
  @State isMainFrameValue: boolean = true
  @State isRedirectValue: boolean = true
  @State getRequestMethodValue: string = ''
  @State getResponseDataValue: string = ''
  @State getResponseEncodingValue: string = ''
  @State getResponseMimeTypeValue: string = ''
  @State getReasonMessageValue: string = ''
  @State getResponseCodeValue: number = 10000
  @State onHttpErrorReceive: boolean = false
  @State setResponseIsReady: boolean = true
  @State onTitleReceive: boolean = false
  @State setResponseCode: Int = 403

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
        console.info('this.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebResourceResponseSet click").key('WebResourceResponseSetButton').onClick((e: ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          switch (this.stringObj.str) {
            case "testSetResponseData001": {
              try {
                this.onHttpErrorReceive = true
                this.controller.loadUrl('http://1.1.1.123/index.html');
                setTimeout(() => {
                  Utils.emitEvent(this.getResponseDataValue, 36010);
                }, 3000)

              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testSetResponseEncoding001": {
              try {
                this.onHttpErrorReceive = true
                this.controller.loadUrl('http://1.1.1.123/index.html');
                setTimeout(() => {
                  Utils.emitEvent(this.getResponseEncodingValue, 36011);
                }, 3000)

              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testSetResponseMimeType001": {
              try {
                this.onHttpErrorReceive = true
                this.controller.loadUrl('http://1.1.1.123/index.html');
                setTimeout(() => {
                  Utils.emitEvent(this.getResponseMimeTypeValue, 36012);
                }, 3000)

              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testSetReasonMessage001": {
              try {
                this.onHttpErrorReceive = true
                this.controller.loadUrl('www.baidu.com');
                setTimeout(() => {
                  Utils.emitEvent(this.getReasonMessageValue, 36013);
                }, 3000)

              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testSetResponseHeader001": {
              try {
                this.onHttpErrorReceive = true
                this.controller.loadUrl('http://1.1.1.123/index.html');
                setTimeout(() => {
                  Utils.emitEvent(this.getResponseHeaderValue, 36014);
                }, 3000)

              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testSetResponseCode001": {
              try {
                this.onHttpErrorReceive = true
                this.getResponseCodeValue = 0
                this.controller.loadUrl('http://1.1.1.123/index.html');
                setTimeout(() => {
                  Utils.emitEvent(this.getResponseCodeValue, 36015);
                }, 3000)

              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testSetResponseIsReady001": {
              try {
                this.onHttpErrorReceive = true
                this.setResponseIsReady = false
                this.onTitleReceive = true
                this.setResponseCode = 200
                this.controller.loadUrl('http://1.1.1.123/index.html');
                Utils.emitEvent(this.title, 36016);
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }


      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .onHttpErrorReceive((event) => {
          if (event) {
            if (this.onHttpErrorReceive) {
              console.log('url:' + event.request.getRequestUrl());
              this.getRequestUrlValue = event.request.getRequestUrl()
              console.log('isMainFrame:' + event.request.isMainFrame());
              this.isMainFrameValue = event.request.isMainFrame()

              console.log('isRedirect:' + event.request.isRedirect());
              this.isRedirectValue = event.request.isRedirect()
              console.log('isRequestGesture:' + event.request.isRequestGesture());
              this.isRequestGestureValue = event.request.isRequestGesture()
              console.log('getRequestMethod:' + event.request.getRequestMethod());
              this.getRequestMethodValue = event.request.getRequestMethod()
              console.log('getResponseData:' + event.response.getResponseData());
              this.getResponseDataValue = JSON.stringify(event.response.getResponseData())
              console.log('getResponseEncoding:' + event.response.getResponseEncoding());
              this.getResponseEncodingValue = event.response.getResponseEncoding()
              console.log('getResponseMimeType:' + event.response.getResponseMimeType());
              this.getResponseMimeTypeValue = event.response.getResponseMimeType()
              console.log('getResponseCode:' + event.response.getResponseCode());
              this.getResponseCodeValue = event.response.getResponseCode()
              console.log("this.title result is :" + this.title);
              console.log('getReasonMessage:' + event.response.getReasonMessage());
              this.getReasonMessageValue = event.response.getReasonMessage()
              let result = event.request.getRequestHeader()
              this.getRequestHeaderValue = result.length
              console.log('The request header result size is ' + result.length)
              for (let i of result) {
                console.log('The request header key is : ' + i.headerKey + ' , value is : ' + i.headerValue);
              }
              let respHeader = event.response.getResponseHeader()
              console.log(' The response header result size is ' + respHeader.length)
              if (respHeader.length > 0) {
                this.getResponseHeaderValue = true
              }
            }
            this.onHttpErrorReceive = false
          }
        })
        .onTitleReceive((event) => {
          if (event) {
            if (this.onTitleReceive) {
              console.log('title:' + event.title);
              this.title = event.title
            }
          }
        })
    }
  }
}
