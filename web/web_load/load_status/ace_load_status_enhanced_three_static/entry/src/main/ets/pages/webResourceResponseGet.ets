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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import testsuite from '../../src/test/List.test';
import {OnTitleReceiveEvent,OnHttpErrorReceiveEvent,$rawfile,Header,OnRenderExitedEvent, OnPageBeginEvent, RenderProcessNotRespondingReason, RenderProcessNotRespondingData, Entry, Component, Column, Row, Button, ClickEvent, Web } from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement" // should be insert by ui-plugins
import web_webview from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import image from '@ohos.multimedia.image';
import  { BusinessError } from '@ohos.base';
import { Hypium } from '../../../hypium/index';
import emitter from '@ohos.events.emitter';
import webView from '@ohos.web.webview';
import { Callback, RecordData } from '@ohos.base'
class StringFields {
  public str: string = '';
}
@Entry
@Component
struct webResourceResponseGet {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  heads: Header[] = new Array<Header>()
  @State webdata: string = "<!DOCTYPE html>\n" +
    "<html>\n" +
    "<head>\n" +
    "<title>intercept test</title>\n" +
    "</head>\n" +
    "<body>\n" +
    "<h1>intercept test</h1>\n" +
    "<script>" +
    "function getTitle(){ return document.write(document.title); }" +
    "getTitle()" +
    "</script>" +
    "</body>\n" +
    "</html>"
  @State str: string = "emitOnHttpErrorReceiveByExampleWebc";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = "Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 " +
    "(KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36";
  @State title: string = "test";
  @State getRequestHeaderValue: number = 0
  @State getResponseHeaderValue: number = 0
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
        Button("WebResourceResponseGet click").key('WebResourceResponseGetButton').onClick( (e:ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          switch (this.stringObj.str) {

            case "testGetRequestHeader001": {
              try {
                this.getRequestHeaderValue = 0
                console.log("getRequestHeaderValue" + this.getRequestHeaderValue);
                this.controller.loadUrl('https://gitee.com/openharmony/123' );
                setTimeout(() => {
                  console.log('this.getRequestHeaderValue = ' + this.getRequestHeaderValue)
                  if (this.getRequestHeaderValue > 0) {
                    Utils.emitEvent(true, 35010);
                    return
                  }
                  Utils.emitEvent(false, 35010);
                }, 4000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testGetRequestUrl001": {
              try {
                this.getRequestUrlValue = ' '
                this.controller.loadUrl('https://gitee.com/openharmony/123' );
                setTimeout(() => {
                Utils.emitEvent(this.getRequestUrlValue, 35011);
                }, 4000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testIsRequestGesture001": {
              try {
                this.isRequestGestureValue = true
                this.controller.loadUrl('https://gitee.com/openharmony/123' );
                setTimeout(() => {
                  Utils.emitEvent(this.isRequestGestureValue, 35012);
                }, 4000)

              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testIsMainFrame001": {
              try {
                this.controller.clearHistory()
                this.isMainFrameValue = false
                this.controller.loadUrl('https://gitee.com/openharmony/123' );
                setTimeout(() => {
                  Utils.emitEvent(this.isMainFrameValue, 35013);
                }, 4000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testIsRedirect001": {
              try {
                this.isRedirectValue = false
                this.controller.loadUrl('https://gitee.com/openharmony/123' );
                setTimeout(() => {
                  Utils.emitEvent(this.isRedirectValue, 35014);
                }, 4000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetRequestMethod001": {
              try {
                this.isRedirectValue = false
                this.controller.loadUrl('https://gitee.com/openharmony/123' );
                setTimeout(() => {
                  Utils.emitEvent(this.getRequestMethodValue, 35015);
                }, 4000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetResponseEncoding001": {
              try {
                this.getResponseEncodingValue = ''
                this.controller.loadUrl('https://gitee.com/openharmony/123' );
                setTimeout(() => {
                  Utils.emitEvent(this.getResponseEncodingValue, 35017);
                }, 4000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetResponseMimeType001": {
              try {
                this.getResponseMimeTypeValue = ''
                this.controller.loadUrl('https://gitee.com/openharmony/123' );
                setTimeout(() => {
                  Utils.emitEvent(this.getResponseMimeTypeValue, 35018);
                }, 4000)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetReasonMessage001": {
              try {
                this.getReasonMessageValue = ''
                this.controller.loadUrl('https://gitee.com/openharmony/123' );
                setTimeout(() => {
                  Utils.emitEvent(this.getReasonMessageValue, 35019);
                }, 4000)

              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetResponseHeader001": {
              try {
                this.getResponseHeaderValue = 0
                this.controller.loadUrl('https://gitee.com/openharmony/123' );
                setTimeout(() => {
                  if (this.getResponseHeaderValue > 0) {
                    Utils.emitEvent(true, 35020);
                    return;
                  }
                  Utils.emitEvent(false, 35020);
                }, 4000)

              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetResponseCode001": {
              try {
                this.getResponseCodeValue = 0
                this.controller.loadUrl('https://gitee.com/openharmony/123' );
                setTimeout(() => {
                  Utils.emitEvent(this.getResponseCodeValue, 35021);
                }, 4000)

              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }


      Web({src: 'https://gitee.com/openharmony/123', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onHttpErrorReceive((event:OnHttpErrorReceiveEvent) => {
          if (event) {
            console.log('GetRequest url:' + event.request.getRequestUrl());
            this.getRequestUrlValue = event.request.getRequestUrl()
            console.log('GetRequest isMainFrame:' + event.request.isMainFrame());
            this.isMainFrameValue = event.request.isMainFrame()
            console.log('GetRequest isRedirect:' + event.request.isRedirect());
            this.isRedirectValue = event.request.isRedirect()
            console.log('GetRequest isRequestGesture:' + event.request.isRequestGesture());
            this.isRequestGestureValue = event.request.isRequestGesture()
            console.log('GetRequest getRequestMethod:' + event.request.getRequestMethod());
            this.getRequestMethodValue = event.request.getRequestMethod()
            console.log('GetRequest getResponseEncoding:' + event.response.getResponseEncoding());
            this.getResponseEncodingValue = event.response.getResponseEncoding()
            console.log('GetRequest getResponseMimeType:' + event.response.getResponseMimeType());
            this.getResponseMimeTypeValue = event.response.getResponseMimeType()
            console.log('GetRequest getResponseCode:' + event.response.getResponseCode());
            this.getResponseCodeValue = event.response.getResponseCode()
            console.log("GetRequest this.title result is :" + this.title);
            console.log('GetRequest getReasonMessage:' + event.response.getReasonMessage());
            this.getReasonMessageValue = event.response.getReasonMessage()
            let result = event.request.getRequestHeader()
            this.getRequestHeaderValue = result.length
            console.log('GetRequest The request header result size is ' + result.length)
            for (let i of result) {
              console.log('GetRequest The request header key is : ' + i.headerKey +
                ' , value is : ' + i.headerValue);
            }
            let respHeader = event.response.getResponseHeader()
            this.getResponseHeaderValue = respHeader.length
            console.log('GetRequest The response header result size is ' + respHeader.length)
            for (let i of respHeader) {
              console.log('GetRequest The response header key is : ' + i.headerKey +
                ' , value is : ' + i.headerValue);
            }
          }
        } as Callback<OnHttpErrorReceiveEvent>)
        .onTitleReceive((event:OnTitleReceiveEvent) => {
          if (event) {
            console.log('title:' + event.title);
            this.title = event.title
            Utils.emitEvent(this.title, 492);
          }

        } as Callback<OnTitleReceiveEvent>)
    }
  }
}
