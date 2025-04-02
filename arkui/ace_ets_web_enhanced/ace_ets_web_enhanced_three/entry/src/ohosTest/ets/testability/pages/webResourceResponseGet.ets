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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';

@Entry
@Component
struct webResourceResponseGet {
  controller: WebController = new WebController();
  heads: Header[] = new Array()
  @State webdata: string = "<!DOCTYPE html>\n" +
    "<html>\n" +
    "<head>\n" +
    "<title>intercept test</title>\n" +
    "</head>\n" +
    "<body>\n" +
    "<h1>intercept test</h1>\n" +
    "<script>" +
    "function gettitle(){ return document.write(document.title); }" +
    "gettitle()" +
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

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Column() {
      Row() {
        Button("WebResourceResponseGet click").key('WebResourceResponseGetButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testGetRequestHeader001": {
              try {
                this.getRequestHeaderValue = 0
                this.controller.loadUrl({ url: 'https://gitee.com/openharmony/123' });
                await Utils.sleep(4000);
                if (this.getRequestHeaderValue > 0) {
                  Utils.emitEvent(true, 35010);
                  return
                }
                Utils.emitEvent(false, 35010);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetRequestUrl001": {
              try {
                this.getRequestUrlValue = ' '
                this.controller.loadUrl({ url: 'https://gitee.com/openharmony/123' });
                await Utils.sleep(4000);
                Utils.emitEvent(this.getRequestUrlValue, 35011);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testIsRequestGesture001": {
              try {
                this.isRequestGestureValue = true
                this.controller.loadUrl({ url: 'https://gitee.com/openharmony/123' });
                await Utils.sleep(4000);
                Utils.emitEvent(this.isRequestGestureValue, 35012);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testIsMainFrame001": {
              try {
                this.controller.clearHistory()
                await Utils.sleep(2000);
                this.isMainFrameValue = false
                this.controller.loadUrl({ url: 'https://gitee.com/openharmony/123' });
                await Utils.sleep(4000);
                Utils.emitEvent(this.isMainFrameValue, 35013);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testIsRedirect001": {
              try {
                this.isRedirectValue = false
                this.controller.loadUrl({ url: 'https://gitee.com/openharmony/123' });
                await Utils.sleep(4000);
                Utils.emitEvent(this.isRedirectValue, 35014);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetRequestMethod001": {
              try {
                this.isRedirectValue = false
                this.controller.loadUrl({ url: 'https://gitee.com/openharmony/123' });
                await Utils.sleep(4000);
                Utils.emitEvent(this.getRequestMethodValue, 35015);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetResponseData001": {
              try {
                this.getResponseDataValue = ''
                this.controller.loadUrl({ url: 'https://gitee.com/openharmony/123' });
                await Utils.sleep(4000);
                Utils.emitEvent(this.getResponseDataValue, 35016);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetResponseEncoding001": {
              try {
                this.getResponseEncodingValue = ''
                this.controller.loadUrl({ url: 'https://gitee.com/openharmony/123' });
                await Utils.sleep(4000);
                Utils.emitEvent(this.getResponseEncodingValue, 35017);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetResponseMimeType001": {
              try {
                this.getResponseMimeTypeValue = ''
                this.controller.loadUrl({ url: 'https://gitee.com/openharmony/123' });
                await Utils.sleep(4000);
                Utils.emitEvent(this.getResponseMimeTypeValue, 35018);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetReasonMessage001": {
              try {
                this.getReasonMessageValue = ''
                this.controller.loadUrl({ url: 'https://gitee.com/openharmony/123' });
                await Utils.sleep(4000);
                Utils.emitEvent(this.getReasonMessageValue, 35019);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetResponseHeader001": {
              try {
                this.getResponseHeaderValue = 0
                this.controller.loadUrl({ url: 'https://gitee.com/openharmony/123' });
                await Utils.sleep(4000);
                if (this.getResponseHeaderValue > 0) {
                  Utils.emitEvent(true, 35020);
                  return;
                }
                Utils.emitEvent(false, 35020);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetResponseCode001": {
              try {
                this.getResponseCodeValue = 0
                this.controller.loadUrl({ url: 'https://gitee.com/openharmony/123' });
                await Utils.sleep(4000);
                Utils.emitEvent(this.getResponseCodeValue, 35021);
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
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .onHttpErrorReceive((event) => {
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
            console.log('GetRequest getResponseData:' + JSON.stringify(event.response.getResponseData()));
            this.getResponseDataValue = JSON.stringify(event.response.getResponseData())
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
        })
        .onTitleReceive((event) => {
          if (event) {
            console.log('title:' + event.title);
            this.title = event.title
            Utils.emitEvent(this.title, 492);
          }

        })
    }
  }
}
