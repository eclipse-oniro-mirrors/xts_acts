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
import webView from '@ohos.web.webview';

@Entry
@Component
struct webResourceResponseGet {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerone: webView.WebviewController = new webView.WebviewController();
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
            case "testScrollType001": {
              try {
                console.log('testScrollType001 :'+webView.ScrollType.EVENT)
                Utils.emitEvent(webView.ScrollType.EVENT, 37023);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case "testscrollByWithResult001": {
              try {
                this.controller.loadUrl($rawfile('theScrolltwo.html'))
                await Utils.sleep(4000);
                let result = this.controllerone.scrollByWithResult(200, 200);
                await Utils.sleep(2000);
                console.log("original result: " + result);
                Utils.emitEvent(result, 37024);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent("error", 37024);
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
    }
  }
}
