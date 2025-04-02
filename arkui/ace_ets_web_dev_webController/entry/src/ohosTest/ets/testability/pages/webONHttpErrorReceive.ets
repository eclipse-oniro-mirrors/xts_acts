/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import UIAbility from '@ohos.app.ability.UIAbility';

@Entry
@Component
struct webONHttpErrorReceive {
  controller: WebController = new WebController();
  @State str: string = "emitOnHttpErrorReceiveFixedUserAgentWebc";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = "Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36";
  @State title: string = "test";
  @State requestKey: string = "";
  @State requestValue: string = "";
  @State responseKey: string = "";
  @State responseValue: string = "";
  @State onlineResult: boolean = false;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: ESObject) => {
    console.info("webONHttpErrorReceive page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("onHttpErrorTest").key('webONHttpErrorReceive').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitOnHttpErrorReceiveFixedUserAgentWebc": {
              try {
                this.onlineResult = true;
                this.controller.loadUrl({ url: 'http://1.1.1.123/index.html' });
                await Utils.sleep(1000);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: 'http://1.1.1.123/index.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .onHttpErrorReceive((event) => {
          if(this.onlineResult){
            console.log('url:' + event.request.getRequestUrl());
            Utils.emitEvent(event.request.getRequestUrl(), 462);
            console.log('isMainFrame:' + event.request.isMainFrame());
            Utils.emitEvent(event.request.isMainFrame(), 464);
            console.log('isRedirect:' + event.request.isRedirect());
            Utils.emitEvent(event.request.isRedirect(), 466);
            console.log('isRequestGesture:' + event.request.isRequestGesture());
            Utils.emitEvent(event.request.isRequestGesture(), 468);
            console.log('getRequestMethod:' + event.request.getRequestMethod());
            Utils.emitEvent(event.request.getRequestMethod(), 470);
            console.log('getResponseData:' + JSON.stringify(event.response.getResponseData()));
            Utils.emitEvent(JSON.stringify(event.response.getResponseData()), 472);
            console.log('getResponseEncoding:' + event.response.getResponseEncoding());
            Utils.emitEvent(event.response.getResponseEncoding(), 474);
            console.log('getResponseMimeType:' + event.response.getResponseMimeType());
            Utils.emitEvent(event.response.getResponseMimeType(), 476);
            console.log('getResponseCode:' + event.response.getResponseCode());
            Utils.emitEvent(event.response.getResponseCode(), 478);
            console.log("this.title result is :" + JSON.stringify(event.response.getResponseCode()) + event.request.getRequestUrl());
            console.log('getReasonMessage:' + event.response.getReasonMessage());
            Utils.emitEvent(event.response.getReasonMessage(), 480);
            let result = event.request.getRequestHeader()
            console.log('The request header result size is ' + result.length)
            for (let i of result) {
              console.log('The request header key is : ' + i.headerKey + ' , value is : ' + i.headerValue);
              this.requestKey = i.headerKey;
              this.requestValue = i.headerValue;
            }
            console.log('The request header last result is ' + this.requestKey + this.requestValue);
            Utils.emitEvent(this.requestKey, 482);
            Utils.emitEvent(this.requestValue, 484);
            let resph = event.response.getResponseHeader()
            console.log('The response header result size is ' + resph.length)
            for (let i of resph) {
              console.log('The response header key is : ' + i.headerKey + ' , value is : ' + i.headerValue);
              this.responseKey = i.headerKey;
              this.responseValue = i.headerValue;
            }
            console.log('The response header last result is ' + this.responseKey + this.responseValue);
            Utils.emitEvent(this.responseKey, 486);
            Utils.emitEvent(this.responseValue, 488);
            Utils.emitEvent(JSON.stringify(event.response.getResponseCode()) + event.request.getRequestUrl(), 490)
            this.onlineResult = false;
          }
        })
    }
  }
}