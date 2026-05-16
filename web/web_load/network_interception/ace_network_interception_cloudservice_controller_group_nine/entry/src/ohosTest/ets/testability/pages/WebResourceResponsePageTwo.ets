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
import webview from '@ohos.web.webview';
import { waitForExist } from '../../test/WaitTest.test';
import {URL_EXAMPLE} from '../../test/Config.test';

@Entry
@Component
struct webResourceResponsePage {

  controller: webview.WebviewController = new webview.WebviewController();
  responseWeb: WebResourceResponse = new WebResourceResponse();
  heads: Header[] = [];
  @State webData: string = '<!DOCTYPE html>\n' +
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
    '</html>';
 
  @State emitKey: string = '';
  @State setResponseIsReady: boolean = true;
  @State setResponseCode: number = 403;
  @State responseDataType: string = '';
  @State responseDataString: string = '';
  @State responseDataArrayBuffer: Uint8Array = new Uint8Array(new ArrayBuffer(5));
  @State responseDataResource: Resource = $rawfile('index.html');
  @State getResponseDataExValue: string = '';
  @State getResponseIsReady: boolean = false;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isSetData: boolean = false;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 12788,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(12788)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 0
      }
    }
  }


  build() {
    Column() {
      Row() {
        Button('OnInterceptRequest').key('OnInterceptRequestButton').onClick(async () => {
          console.info('key==>' + this.emitKey)
          this.responseWeb = new WebResourceResponse()
          await waitForExist(()=>this.isReceive, this.emitKey, 0);
          this.isReceive = -1;
          switch (this.emitKey) {
            case 'emitOnInterceptRequestCallback01': {
              try {
                this.responseDataType = 'string';
                this.responseDataString = this.webData;
                this.isPageEnd = -1;
                this.controller.loadUrl(URL_EXAMPLE);
                console.log(this.emitKey + 'getResponseData:' + this.responseWeb.getResponseData());
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitOnInterceptRequestCallback02': {
              try {
                this.responseDataType = 'number';
                this.setResponseCode = 200
                this.isPageEnd = -1;
                this.controller.loadUrl(URL_EXAMPLE);
                await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
                console.log(this.emitKey + 'getResponseDataEx:' + this.responseWeb.getResponseDataEx());
                if (this.responseWeb.getResponseDataEx() === 123) {
                  Utils.emitEvent(true, 26031058);
                } else {
                  Utils.emitEvent(false, 26031058);
                }
                Utils.emitEvent(this.responseWeb.getReasonMessage(), 26031059);
                Utils.emitEvent(this.responseWeb.getResponseCode(), 26031060);
                Utils.emitEvent(this.responseWeb.getResponseEncoding(), 26031061);
                let heads = this.responseWeb.getResponseHeader()
                if (heads && heads.length > 0) {
                  Utils.emitEvent(true, 26031062);
                } else {
                  Utils.emitEvent(false, 26031062);
                }
                Utils.emitEvent(this.responseWeb.getResponseMimeType(), 26031063);
                Utils.emitEvent(this.responseWeb.getResponseIsReady(), 26031064);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitOnInterceptRequestCallback03': {
              try {
                this.responseDataType = 'ArrayBuffer';
                this.isPageEnd  = -1;
                this.controller.loadUrl(URL_EXAMPLE);
                await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
                console.log(this.emitKey + 'getResponseDataEx:' + this.responseWeb.getResponseDataEx());
                if(this.responseWeb.getResponseDataEx()) {
                  Utils.emitEvent(true, 26031065);
                } else {
                  Utils.emitEvent(false, 26031065);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitOnInterceptRequestCallback04': {
              try {
                this.responseDataType = 'Resource';
                this.isPageEnd  = -1;
                this.controller.loadUrl(URL_EXAMPLE);
                await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
                console.log(this.emitKey + 'getResponseDataEx:' + this.responseWeb.getResponseDataEx());
                let result = JSON.stringify(this.responseWeb.getResponseDataEx());
                if(result.includes('index.html')) {
                  Utils.emitEvent(true, 26031066);
                } else {
                  Utils.emitEvent(false, 26031066);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitOnInterceptRequestCallback05': {
              try {
                this.responseDataType = 'undefined';
                this.isPageEnd  = -1;
                this.controller.loadUrl(URL_EXAMPLE);
                await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
                console.log(this.emitKey + 'getResponseDataEx:' + this.responseWeb.getResponseDataEx());
                if(this.responseWeb.getResponseDataEx() === undefined) {
                  Utils.emitEvent(true, 26031067);
                } else {
                  Utils.emitEvent(false, 26031067);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
       
          }
        })
      }


      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onInterceptRequest((event) => {
          this.isPageEnd = 0;
          if (event) {
            console.log('onInterceptRequest url:' + event.request.getRequestUrl());
            console.log('onInterceptRequest getRequestHeader:' + event.request.getRequestHeader());
            console.log('onInterceptRequest isMainFrame:' + event.request.isMainFrame());
            console.log('onInterceptRequest isRedirect:' + event.request.isRedirect());
            console.log('onInterceptRequest isRequestGesture:' + event.request.isRequestGesture());
            console.log('onInterceptRequest getRequestMethod:' + event.request.getRequestMethod());
            let head1: Header = {
              headerKey: 'Connection',
              headerValue: 'keep-alive'
            }
            let head2: Header = {
              headerKey: 'Cache-Control',
              headerValue: 'no-cache'
            }
            this.heads.push(head1)
            this.heads.push(head2)
            this.responseWeb.setResponseHeader(this.heads)
            if (this.responseDataType === 'string') {
              this.responseWeb.setResponseData(this.responseDataString);
              let url = event.request.getRequestUrl();
              if (url.includes('example.com')) {
                Utils.emitEvent(event.request.getRequestUrl(), 26031051);
                let heads = event.request.getRequestHeader();
                if(heads.length > 0){
                  Utils.emitEvent(true, 26031052);
                } else {
                  Utils.emitEvent(false, 26031052);
                }
                Utils.emitEvent(event.request.isMainFrame(), 26031053);
                Utils.emitEvent(event.request.isRedirect(), 26031054);
                Utils.emitEvent(event.request.isRequestGesture(), 26031055);
                Utils.emitEvent(event.request.getRequestMethod(), 26031056);
                if (this.responseWeb.getResponseData() === this.responseDataString) {
                  Utils.emitEvent(true, 26031057);
                } else {
                  Utils.emitEvent(false, 26031057);
                }
              }
            } else if (this.responseDataType === 'number') {
              this.responseWeb.setResponseData(123)
            } else if (this.responseDataType === 'ArrayBuffer'){
              this.responseWeb.setResponseData(this.responseDataArrayBuffer) ;
            } else if(this.responseDataType === 'Resource'){
              this.responseWeb.setResponseData(this.responseDataResource);
            } else if (this.responseDataType === 'undefined') {
              this.responseWeb.setResponseData(undefined);
            }
            this.responseWeb.setResponseEncoding('utf-8')
            this.responseWeb.setResponseMimeType('text/html')
            this.responseWeb.setResponseCode(this.setResponseCode)
            this.responseWeb.setReasonMessage('OK')
            this.responseWeb.setResponseIsReady(this.setResponseIsReady)
          }
          if (this.isSetData) {
            return this.responseWeb
          } else {
            return null
          }

        })
        
    }
  }
}
