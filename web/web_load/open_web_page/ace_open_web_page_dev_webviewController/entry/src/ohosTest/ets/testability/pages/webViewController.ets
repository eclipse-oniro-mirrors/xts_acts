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
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
import business_error from '@ohos.base'

const EVENT_ID_SET_EMIT_KEY = 200320;

class testObj {
  constructor() {
  }

  test(str: string): ArrayBuffer {
    let buf = new ArrayBuffer(str.length);
    let buff = new Uint8Array(buf);

    for (let i = 0; i < str.length; i++) {
      buff[i] = str.charCodeAt(i);
    }
    return buf;
  }
}

@Entry
@Component
struct Index {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
  controllerThree: web_webview.WebviewController = new web_webview.WebviewController();
  delegate: web_webview.WebDownloadDelegate = new web_webview.WebDownloadDelegate();
  failedDownload: Uint8Array | null = null;
  @State str: string = "emitPostUrl";
  @State webId: number = 0;
  @State webId2: number = 0;
  @State webId3: number = 0;
  @State webIdTol: number = 0;
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State userAgent2: string = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " Chrome/86.0.4240.198 Safari/537.36";


  @State testObjtest: testObj = new testObj();
  @State isOnePageEnd: number = -1;
  @State isTwoPageEnd: number = -1;
  @State isThreePageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 1;
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
        Button("web click").key('webcomponent').onClick(async () => {
          await Utils.waitForExist(()=>this.isOnePageEnd, 'onePageIsPageEnd', 1, 1000);
          await Utils.waitForExist(()=>this.isOnePageEnd, 'twoPageIsPageEnd', 1, 1000);
          await Utils.waitForExist(()=>this.isOnePageEnd, 'threeIsPageEnd', 1, 1000);
          await Utils.waitForExist(()=>this.isReceive, 'webcomponentIsReceive', 1, 1000);
          console.info("key==>" + this.str);
          this.isReceive = -1;

          switch (this.str) {
            case "emitPostUrl": {
              try {
                let postData = this.testObjtest.test("Name=test&Password=test");
                this.controller.postUrl('www.example.com', postData);
                let url = this.controller.getUrl();
                console.log("emitPostUrl: " + url);
                Utils.emitEvent(url, 200330);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "emitgetUserAgent": {
              try {
                this.isOnePageEnd = -1;
                this.controller.loadUrl($rawfile('indexCopy.html'));
                const realVal = await Utils.waitForExist(()=>this.isOnePageEnd, 'loadUrlIndexCopyIsPageEnd', 1, 1000);
                if (realVal !== 1) {
                  break;
                }
                const userAgentAll = this.controller.getUserAgent() + this.controllerTwo.getUserAgent();
                console.log("userAgentAll: " + userAgentAll);
                if ((userAgentAll).includes("Mozilla")) {
                  Utils.emitEvent('success', 200340);
                } else {
                  Utils.emitEvent('fail', 200340);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent('fail', 200340);
              }
              break;
            }
            case "emitgetUserAgentAgain": {
              try {
                this.controllerThree.runJavaScript("getUserAgent()", (error, result) => {
                  console.log(`The controllerThree.getUserAgent() return value is: ${result}`);
                  if (result.includes("Mozilla")) {
                    Utils.emitEvent('success', 200350);
                  } else {
                    Utils.emitEvent('fail', 200350);
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent('fail', 200350);
              }
              break;
            }
            case "emitGetOriginalUrl": {
              try {
                this.controller.loadUrl($rawfile('secondCopy.html'))
                let indexUrl = this.controller.getOriginalUrl();
                console.log("original url: " + indexUrl);
                if (indexUrl.includes('indexCopy.html')) {
                  Utils.emitEvent('success', 200360);
                } else {
                  Utils.emitEvent('fail', 200360);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent('fail', 200360);
              }
              break;
            }
            case "emitGetOriginalUrlTwo": {
              try {
                this.controllerTwo.loadUrl($rawfile('secondCopy.html'))
                let indexUrlTwo = this.controllerTwo.getOriginalUrl();
                console.log("original urlTwo: " + indexUrlTwo);
                this.controllerThree.loadUrl($rawfile('secondCopy.html'));
                let indexUrlThree = this.controllerThree.getOriginalUrl();
                console.log("original url: " + indexUrlThree);
                if (indexUrlThree.includes('indexThree.html') &&
                    indexUrlTwo.includes('indexTwo.html')) {
                  Utils.emitEvent('success', 200370);
                } else {
                  Utils.emitEvent('fail', 200370);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent('fail', 200370);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('indexCopy.html'), controller: this.controller })
        .userAgent(this.userAgent)
        .overScrollMode(OverScrollMode.NEVER)
        .onPageEnd((event) => {
          console.log('indexCopy onPageEnd url:' + event.url);
          this.isOnePageEnd = 1;
        })

      Web({ src: $rawfile('indexTwo.html'), controller: this.controllerTwo })
        .id('2')
        .key('web2')
        .userAgent(this.userAgent2)
        .onPageEnd((event) => {
          console.log('indexTwo onPageEnd url:' + event.url);
          this.isTwoPageEnd = 1;
        })

      Web({ src: $rawfile('indexThree.html'), controller: this.controllerThree })
        .id('3')
        .key('web3')
        .userAgent(this.userAgent)
        .userAgent(this.userAgent2)
        .onPageEnd((event) => {
          console.log('indexThree onPageEnd url:' + event.url);
          this.isThreePageEnd = 1;
        })
    }
  }
}