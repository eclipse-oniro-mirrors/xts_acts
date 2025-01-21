/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import webView from '@ohos.web.webview';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
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
struct WebViewControllerGetCertificateTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = "";
  @State callBackId: number = 0;
  @State stressTimes: number = 0;
  @State buttonKey: string = '';
  @State outputStr: string = ''

  onPageShow() {
    Utils.registerEventPage((eventData: events_emitter.EventData) => {
      if (eventData.data) {
        this.str = eventData.data.CASE_NAME;
        this.callBackId = eventData.data.CALL_BACK_ID;
        this.stressTimes = eventData.data.STRESS_TIMES;
        this.buttonKey = eventData.data.BUTTON_KEY
      }
    })
  }

  onPageHide() {
    Utils.unRegisterEventPage()
  }

  build() {
    Row() {
      Column() {
        Button(this.buttonKey)
          .key(this.buttonKey)
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {
              case 'testWebViewControllerGetCertificate001': {
                try {
                  this.controller.loadUrl('https://expired.badssl.com')
                  await Utils.sleep(2000)
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.getCertificate().then(x509CertArray => {
                      this.outputStr = ParseX509CertInfo(x509CertArray);
                      console.log("getCertificate result of this page: " + this.outputStr);
                    })
                    Utils.stressingLog('WebViewController.getCertificate()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebViewControllerGetCertificate002': {
                try {
                  this.controller.loadUrl('https://expired.badssl.com')
                  await Utils.sleep(2000)
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.getCertificate((error, x509CertArray) => {
                      if (error) {
                        this.outputStr = 'getCertificate failed: ' + error.code + ", errMsg: " + error.message;
                      } else {
                        this.outputStr = ParseX509CertInfo(x509CertArray);
                        console.log("getCertificate result of this page: " + this.outputStr);
                      }
                    })
                    Utils.stressingLog('WebViewController.getCertificate()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
            }
          })

        Web({ src: '', controller: this.controller })
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
      }
      .width('100%')
    }

    .height('100%')
  }
}