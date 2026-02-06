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
import Utils from '../../test/Utils.test';
import web_webview from '@ohos.web.webview';
import cert from '@ohos.security.cert';
import { waitForExist } from '../../test/WaitTest.test';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';

const EVENT_ID_SET_EMIT_KEY = 111120;

function Uint8ArrayToString(dataArray: Uint8Array) {
  let dataString = ''
  for (let i = 0; i < dataArray.length; i++) {
    dataString += String.fromCharCode(dataArray[i])
  }
  return dataString
}

function ParseX509CertInfo(x509CertArray: Array<cert.X509Cert>) {
  let res: string = 'getCertificate success: len = ' + x509CertArray.length;
  for (let i = 0; i < x509CertArray.length; i++) {
    res += ', index = ' + i + ', issuer name = '
      + Uint8ArrayToString(x509CertArray[i].getIssuerName().data) + ', subject name = '
      + Uint8ArrayToString(x509CertArray[i].getSubjectName().data) + ', valid start = '
      + x509CertArray[i].getNotBeforeTime()
      + ', valid end = ' + x509CertArray[i].getNotAfterTime()
  }
  return res
}

interface objectCss {
  code: number;
  message: string;
}

@Entry
@Component
struct webViewContGetUrlAndOthersError {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
  @State str:string = '';
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State errorCode: string = '0';
  @State errorMsg: string = 'failed';
  @State step: number = -2;
  @State outputStr: string = ''
  @State isPageEnd: number = -1;
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
    console.info("webViewOthersErrorCode page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 0
      }
    }
  }
  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments =  AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }


  build() {
    Column() {
      Row() {
        Button("getUrlAndOthersErrorTest").key('webViewOthersErrorCode').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.str, 0);
          console.info("key==>" + this.str)
          this.isReceive = -1;
          switch (this.str) {
            case "emitGetPageOffsetErrorCode": {
              try {
                this.controllerTwo.getPageOffset().y;
              } catch (error) {
                console.error(`emitGetUrlInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              if(web_webview.WebviewController.getActiveWebEngineVersion() == web_webview.ArkWebEngineVersion.M114) {
                Utils.emitEvent(this.errorCode, 20250907)
                Utils.emitEvent(this.errorMsg, 20250908)
                console.log('emitGetPageOffsetErrorCode' + 'web_webview.ArkWebEngineVersion.M114')
              } else {
                Utils.emitEvent("801", 20250907)
                Utils.emitEvent("Capability not supported", 20250908)
                console.log('emitGetPageOffsetErrorCode' + 'web_webview.ArkWebEngineVersion.M132')
              }

              break;
            }
            case "emitAvoidVisibleViewportBottomErrorCode": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.avoidVisibleViewportBottom(111);;
              } catch (error) {
                console.error(`emitStopInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              if(web_webview.WebviewController.getActiveWebEngineVersion() == web_webview.ArkWebEngineVersion.M114) {
                Utils.emitEvent(this.errorCode, 20250910)
                Utils.emitEvent(this.errorMsg, 20250911)
                console.log('emitAvoidVisibleViewportBottomErrorCode' + 'web_webview.ArkWebEngineVersion.M114')
              } else {
                Utils.emitEvent("801", 20250910)
                Utils.emitEvent("Capability not supported", 20250911)
                console.log('emitAvoidVisibleViewportBottomErrorCode' + 'web_webview.ArkWebEngineVersion.M132')
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
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}