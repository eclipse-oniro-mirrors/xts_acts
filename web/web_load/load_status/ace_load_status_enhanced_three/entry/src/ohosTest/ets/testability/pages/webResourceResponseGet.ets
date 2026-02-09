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
import { waitForExist } from '../../test/WaitTest.test';
import { webview } from '@kit.ArkWeb';

@Entry
@Component
struct webResourceResponseGet {
  controller: webview.WebviewController = new webview.WebviewController();
  heads: Header[] = new Array()
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
  @State isReceive: number = -1;
  @State isEnd: number = -1;
  @State HttpErrorEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 141511,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(141511)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
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
          await waitForExist(()=>this.isReceive, this.str, 0);
          await waitForExist(()=>this.isEnd, this.str, 0);
          await waitForExist(()=>this.HttpErrorEnd, this.str, 0);
          this.isReceive = -1
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testGetRequestHeader001": {
              try {
                if (this.getRequestHeaderValue > 0) {
                  Utils.emitEvent(true, 141520);
                  return
                }
                Utils.emitEvent(false, 141520);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetRequestUrl001": {
              try {
                Utils.emitEvent(this.getRequestUrlValue, 141530);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testIsRequestGesture001": {
              try {
                Utils.emitEvent(this.isRequestGestureValue, 141540);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testIsMainFrame001": {
              try {
                Utils.emitEvent(this.isMainFrameValue, 141550);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testIsRedirect001": {
              try {
                Utils.emitEvent(this.isRedirectValue, 141560);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetRequestMethod001": {
              try {
                Utils.emitEvent(this.getRequestMethodValue, 141570);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetResponseData001": {
              try {
                Utils.emitEvent(this.getResponseDataValue, 141580);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetResponseEncoding001": {
              try {
                Utils.emitEvent(this.getResponseEncodingValue, 141590);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetResponseMimeType001": {
              try {
                Utils.emitEvent(this.getResponseMimeTypeValue, 141600);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetReasonMessage001": {
              try {
                Utils.emitEvent(this.getReasonMessageValue, 141610);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetResponseHeader001": {
              try {
                if (this.getResponseHeaderValue > 0) {
                  Utils.emitEvent(true, 141620);
                  return;
                }
                Utils.emitEvent(false, 141620);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetResponseCode001": {
              try {
                Utils.emitEvent(this.getResponseCodeValue, 141630);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }


          }
        })
      }


      Web({ src: 'https://www.example.com/404', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .onPageEnd(()=>{
          this.isEnd = 0;
        })
        .onSslErrorEvent((event: SslErrorEvent) => {
          if (event) {
            console.log('onSslErrorEvent url: ' + event.url);
            console.log('onSslErrorEvent error: ' + event.error);
            console.log('onSslErrorEvent originalUrl: ' + event.originalUrl);
            console.log('onSslErrorEvent referrer: ' + event.referrer);
            console.log('onSslErrorEvent isFatalError: ' + event.isFatalError);
            console.log('onSslErrorEvent isMainFrame: ' + event.isMainFrame);
            console.log('onSslErrorEvent handler: ' + event.handler);
            event.handler.handleConfirm();
          }
        })
        .onHttpErrorReceive((event) => {
          if (event) {
            if (event.request.getRequestUrl() != "https://www.example.com/404") {
              return;
            }
            this.getRequestUrlValue = event.request.getRequestUrl()
            console.log('GetRequest url:' + this.getRequestUrlValue);
            this.isMainFrameValue = event.request.isMainFrame()
            console.log('GetRequest isMainFrame:' + this.isMainFrameValue);
            this.isRedirectValue = event.request.isRedirect()
            console.log('GetRequest isRedirect:' + this.isRedirectValue);
            this.isRequestGestureValue = event.request.isRequestGesture()
            console.log('GetRequest isRequestGesture:' + this.isRequestGestureValue);
            this.getRequestMethodValue = event.request.getRequestMethod()
            console.log('GetRequest getRequestMethod:' + this.getRequestMethodValue);
            this.getResponseDataValue = JSON.stringify(event.response.getResponseData())
            console.log('GetRequest getResponseData:' + this.getResponseDataValue);
            this.getResponseEncodingValue = event.response.getResponseEncoding()
            console.log('GetRequest getResponseEncoding:' +  this.getResponseEncodingValue);
            this.getResponseMimeTypeValue = event.response.getResponseMimeType()
            console.log('GetRequest getResponseMimeType:' +  this.getResponseMimeTypeValue);
            this.getResponseCodeValue = event.response.getResponseCode()
            console.log('GetRequest getResponseCode:' + this.getResponseCodeValue);
            console.log("GetRequest this.title result is :" + this.title);
            this.getReasonMessageValue = event.response.getReasonMessage()
            console.log('GetRequest getReasonMessage:' + this.getReasonMessageValue);
            let result = event.request.getRequestHeader()
            this.getRequestHeaderValue = result.length
            console.log('GetRequest The request header result size is ' + result.length)
            let respHeader = event.response.getResponseHeader()
            this.getResponseHeaderValue = respHeader.length
            console.log('GetRequest The response header result size is ' + respHeader.length)
            this.HttpErrorEnd = 0;
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
