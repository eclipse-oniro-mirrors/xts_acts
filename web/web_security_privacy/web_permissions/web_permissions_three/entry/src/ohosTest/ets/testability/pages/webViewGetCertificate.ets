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
import { BusinessError } from '@ohos.base'
import UIAbility from '@ohos.app.ability.UIAbility';
import web_webview from '@ohos.web.webview';
import cert from '@ohos.security.cert';
import {waitForExist} from '../../test/WaitTest';
import { CommonConstants } from '../../test/Constants.test';

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
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 161010,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(161010)
  }


  private valueChangeCallBack = (eventData:events_emitter.EventData) => {
    console.info("webViewGetCertificate page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("getCertTest").key('webViewGetCertificate').onClick(async () => {
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info('key==>' + this.str)
          switch (this.str) {
            case "emitGetCertificateCallback": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl('https://expired.badssl.com');
                await waitForExist(() => this.isPageEnd, this.str, 0);
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
                Utils.emitEvent(this.certificateResult, 161020)
              })
              break;
            }

            case "emitGetCertificateCallback01": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl('https://www.baidu.com');
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.getCertificate((error, x509CertArray) => {
                  if (error) {
                    this.outputStr = 'getCertificate failed: ' + error.code + ", errMsg: " + error.message;
                  } else {
                    console.log('emitGetCertificateCallback01getCertificate' + x509CertArray)
                    if(!x509CertArray) {
                      this.outputStr = ParseX509CertInfo(x509CertArray);
                    }
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
                Utils.emitEvent(this.certificateResult, 20251028)
              })
              break;
            }
            case "emitGetCertificatePromise": {
              try {
                this.controller.clearHistory();
                this.isPageEnd = -1;
                this.controller.loadUrl('https://expired.badssl.com');
                await waitForExist(() => this.isPageEnd, this.str, 0);
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
                Utils.emitEvent(this.certificateResult, 161030 )
              })
              break;
            }

            case "emitGetCertificatePromise01": {
              try {
                this.controller.clearHistory();
                this.isPageEnd = -1;
                this.controller.loadUrl('https://www.baidu.com');
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.getCertificate().then(x509CertArray => {
                  if(!x509CertArray) {
                    this.outputStr = ParseX509CertInfo(x509CertArray);
                    console.log('emitGetCertificatePromise01ParseX509CertInfo' + this.outputStr)
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
                Utils.emitEvent(this.certificateResult, 20251029)
              })
              break;
            }
            case "testGetCertificateCallbackReturnArrayEqual0": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl(CommonConstants.URL_HTTP_EXAMPLE);
                await waitForExist(() => this.isPageEnd, 'testGetCertificateCallbackReturnArrayEqual0_isPageEnd', 0, 1000);
                 this.controller.getCertificate((error: BusinessError, x509CertArray: Array<cert.X509Cert>) => {
                  if (error) {
                    console.error('getCertificate failed: ' + error.code + ', errMsg: ' + error.message)
                  } else {
                    console.log('getCertificate callback x509CertArray length: ' + x509CertArray.length)
                    console.log('getCertificate callback x509CertArray result: ' + ParseX509CertInfo(x509CertArray))
                    Utils.emitEvent(x509CertArray.length, 25102122)
                  }
                })
              } catch (error) {
                console.error(`getCertificate ErrorCode: ${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`)
                Utils.emitEvent(error.code, 25102122)
              }
              break;
            }
            case "testGetCertificateCallbackReturnArrayLarger0": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl(CommonConstants.URL_HTTPS_EXAMPLE);
                await waitForExist(() => this.isPageEnd, 'testGetCertificateCallbackReturnArrayLarger0_isPageEnd', 0, 1000);
                 this.controller.getCertificate((error: BusinessError, x509CertArray: Array<cert.X509Cert>) => {
                  if (error) {
                    console.error('getCertificate failed: ' + error.code + ', errMsg: ' + error.message)
                  } else {
                    console.log('getCertificate callback x509CertArray length: ' + x509CertArray.length)
                    console.log('getCertificate callback x509CertArray result: ' + ParseX509CertInfo(x509CertArray))
                    Utils.emitEvent(x509CertArray.length, 25102121)
                  }
                })
              } catch (error) {
                console.error(`getCertificate ErrorCode: ${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`)
                Utils.emitEvent(error.code, 25102121)
              }
              break;
            }
            case "testGetCertificatePromiseReturnArrayEqual0": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl(CommonConstants.URL_HTTP_EXAMPLE);
                await waitForExist(() => this.isPageEnd, 'testGetCertificatePromiseReturnArrayEqual0_isPageEnd', 0, 1000);
                this.controller.getCertificate().then((x509CertArray: Array<cert.X509Cert>) => {
                    console.log('getCertificate promise x509CertArray length: ' + x509CertArray.length)
                    console.log('getCertificate promise x509CertArray result: ' + ParseX509CertInfo(x509CertArray))
                    Utils.emitEvent(x509CertArray.length, 2510219)
                 })
              } catch (error) {
                console.error(`getCertificate ErrorCode: ${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`)
                Utils.emitEvent(error.code, 2510219)
              }
              break;
            }
            case "testGetCertificatePromiseReturnArrayLarger0": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl(CommonConstants.URL_HTTPS_EXAMPLE);
                await waitForExist(() => this.isPageEnd, 'testGetCertificatePromiseReturnArrayLarger0_isPageEnd', 0, 1000);
                this.controller.getCertificate().then((x509CertArray: Array<cert.X509Cert>) => {
                    console.log('getCertificate promise x509CertArray length: ' + x509CertArray.length)
                    console.log('getCertificate promise x509CertArray result: ' + ParseX509CertInfo(x509CertArray))
                    Utils.emitEvent(x509CertArray.length, 25102118)
                 })
              } catch (error) {
                console.error(`getCertificate ErrorCode: ${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`)
                Utils.emitEvent(error.code, 25102118)
              }
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
          this.isPageEnd = 0;
          this.outputStr = 'onPageEnd : url = ' + e.url
        })
        .onSslErrorEventReceive((e) => {
          e.handler.handleConfirm()
        })
    }
  }
}