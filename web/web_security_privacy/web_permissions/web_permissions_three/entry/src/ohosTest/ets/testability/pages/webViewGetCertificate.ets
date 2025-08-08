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
import web_webview from '@ohos.web.webview';
import cert from '@ohos.security.cert';

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

@Entry
@Component
struct webViewGetCertificate {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitGetCertificateCallback";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = "Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36";
  @State outputStr: string = ''
  @State certificateResult: boolean = false;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData:events_emitter.EventData) => {
    console.info("webViewGetCertificate page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("getCertTest").key('webViewGetCertificate').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitGetCertificateCallback": {
              try {
                this.controller.loadUrl('https://expired.badssl.com');
                await Utils.sleep(2000);
                this.controller.getCertificate((error, x509CertArray) => {
                  if (error) {
                    this.outputStr = 'getCertificate failed: ' + error.code + ", errMsg: " + error.message;
                  } else {
                    this.outputStr = ParseX509CertInfo(x509CertArray);
                  }
                })
              } catch (error) {
                this.outputStr = 'getCertificate failed: ' + error.code + ", errMsg: " + error.message;
              }
              console.log("getCertificate result of this page: " + this.outputStr);
              if ((this.outputStr).includes("failed")) {
                this.certificateResult = false
              }
              else {
                this.certificateResult = true
              }
              this.controller.runJavaScript("test()", (res) => {
                Utils.emitEvent(this.certificateResult, 403)
              })
              break;
            }
            case "emitGetCertificatePromise": {
              try {
                this.controller.clearHistory();
                this.controller.loadUrl('https://expired.badssl.com');
                await Utils.sleep(2000);
                this.controller.getCertificate().then(x509CertArray => {
                  this.outputStr = ParseX509CertInfo(x509CertArray);
                })
              } catch (error) {
                this.outputStr = 'getCertificate failed: ' + error.code + ", errMsg: " + error.message;
              }
              console.log("getCertificate result of this page: " + this.outputStr);
              if ((this.outputStr).includes("failed")) {
                this.certificateResult = false
              }
              else {
                this.certificateResult = true
              }
              this.controller.runJavaScript("test()", (res) => {
                Utils.emitEvent(this.certificateResult, 404)
              })
              break;
            }
          }
        })
      }

      Web({ src: 'https://expired.badssl.com', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .onPageEnd((e) => {
          this.outputStr = 'onPageEnd : url = ' + e.url
        })
        .onSslErrorEventReceive((e) => {
          e.handler.handleConfirm()
        })
    }
  }
}