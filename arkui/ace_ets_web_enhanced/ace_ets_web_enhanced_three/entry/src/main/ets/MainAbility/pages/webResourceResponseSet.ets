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
import webView from '@ohos.web.webview';

@Entry
@Component
struct webResourceResponseSet {
  controller: webView.WebviewController = new webView.WebviewController();
  responseWeb: WebResourceResponse = new WebResourceResponse()
  heads: Header[] = new Array()
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
  @State userAgent: string = "Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 " +
  "(KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36";
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
  @State setResponseCode: number = 403

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
        Button("WebResourceResponseSet click").key('WebResourceResponseSetButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testSetResponseData001": {
              try {
                this.onHttpErrorReceive = true
                this.getResponseDataValue = '123'
                this.controller.loadUrl('http://1.1.1.123/index.html');
                await Utils.sleep(2000);
                Utils.emitEvent(this.getResponseDataValue == '""', 36010);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testSetResponseEncoding001": {
              try {
                this.onHttpErrorReceive = true
                this.getResponseEncodingValue = ''
                this.controller.loadUrl('http://1.1.1.123/index.html');
                await Utils.sleep(2000);
                Utils.emitEvent(this.getResponseEncodingValue, 36011);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testSetResponseMimeType001": {
              try {
                this.onHttpErrorReceive = true
                this.getResponseMimeTypeValue = ''
                this.controller.loadUrl('http://1.1.1.123/index.html');
                await Utils.sleep(2000);
                Utils.emitEvent(this.getResponseMimeTypeValue, 36012);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testSetReasonMessage001": {
              try {
                this.onHttpErrorReceive = true
                this.getReasonMessageValue = ''
                this.controller.loadUrl('http://1.1.1.123/index.html');
                await Utils.sleep(2000);
                Utils.emitEvent(this.getReasonMessageValue, 36013);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testSetResponseHeader001": {
              try {
                this.onHttpErrorReceive = true
                this.getResponseHeaderValue = false
                this.controller.loadUrl('http://1.1.1.123/index.html');
                await Utils.sleep(2000);
                Utils.emitEvent(this.getResponseHeaderValue, 36014);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testSetResponseCode001": {
              try {
                this.onHttpErrorReceive = true
                this.getResponseCodeValue = 0
                this.controller.loadUrl('http://1.1.1.123/index.html');
                await Utils.sleep(2000);
                Utils.emitEvent(this.getResponseCodeValue, 36015);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testSetResponseIsReady001": {
              try {
                this.onHttpErrorReceive = true
                this.setResponseIsReady = false
                this.setResponseCode = 200
                await Utils.sleep(2000);
                this.controller.loadUrl('http://1.1.1.123/index.html');
                await Utils.sleep(2000);
                Utils.emitEvent(this.title, 36016);

              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testSetResponseIsReady002": {
              try {
                this.onHttpErrorReceive = true
                this.setResponseIsReady = true
                this.onTitleReceive = true
                this.setResponseCode = 200
                await Utils.sleep(2000);
                this.controller.loadUrl('http://1.1.1.123/index.html');
                await Utils.sleep(2000);
                Utils.emitEvent(this.title, 36017);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }


      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .userAgent(this.userAgent)
        .onInterceptRequest((event) => {
          if (event) {
            console.log('url:' + event.request.getRequestUrl())
            let head1: Header = {
              headerKey: "Connection",
              headerValue: "keep-alive"
            }
            let head2: Header = {
              headerKey: "Cache-Control",
              headerValue: "no-cache"
            }
            this.heads.push(head1)
            this.heads.push(head2)
            this.responseWeb.setResponseHeader(this.heads)
            this.responseWeb.setResponseData(this.webData)
            this.responseWeb.setResponseEncoding('utf-8')
            this.responseWeb.setResponseMimeType('text/html')
            this.responseWeb.setResponseCode(this.setResponseCode)
            this.responseWeb.setReasonMessage('OK')
            this.responseWeb.setResponseIsReady(this.setResponseIsReady)
          }
          return this.responseWeb
        })
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
              console.log('getResponseData:' + JSON.stringify(event.response.getResponseData()));
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
              for (let i of respHeader) {
                console.log('The response header key is : ' + i.headerKey + ' , value is : ' + i.headerValue);
                if (i.headerKey == 'Connection' && i.headerValue == 'keep-alive') {
                  this.getResponseHeaderValue = true
                }
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
