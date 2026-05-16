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

import webview from '@ohos.web.webview';
import {
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  Row,
  Web } from '@ohos.arkui.component'
import { State, } from '@ohos.arkui.stateManagement'
import Utils from '../../src/test/Util.test';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import image from '@ohos.multimedia.image';
import hilog from '@ohos.hilog';
import { Hypium } from '../../../hypium/index';
import cert from '@ohos.security.cert';
import { BusinessError, Callback, RecordData } from '@ohos.base'

function Uint8ArrayToString(dataArray: Uint8Array) {
  let dataString = ''
  for (let i = 0; i < dataArray.length; i++) {
    dataString += String.fromCharCode(dataArray[i])
  }
  return dataString
}

function ParseX509CertInfo(x509CertArray?: Array<cert.X509Cert>) {
  if (!x509CertArray || x509CertArray.length === 0) {
    return 'No certificate available';
  }

  let res = 'getCertificate success: len = ' + x509CertArray.length;
  for (let i = 0; i < x509CertArray.length; i++) {
    const cert = x509CertArray[i];
    res += ', index = ' + i +
      ', issuer name = ' + Uint8ArrayToString(cert.getIssuerName().data) +
      ', subject name = ' + Uint8ArrayToString(cert.getSubjectName().data) +
      ', valid start = ' + cert.getNotBeforeTime() +
      ', valid end = ' + cert.getNotAfterTime();
  }
  return res;
}

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webViewGetCertificate {
  stringObj: StringFields = new StringFields();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = "emitGetCertificateCallback";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string =
    "Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36";
  @State outputStr: string = ''
  @State certificateResult: boolean = false;

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
        Button("getCertTest").key('webViewGetCertificate').onClick((e: ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          switch (this.stringObj.str) {
            case "emitGetCertificateCallback": {
              try {
                this.controller.loadUrl('https://expired.badssl.com');
                this.controller.getCertificate((error, x509CertArray) => {
                  if (error) {
                    this.outputStr = 'getCertificate failed: ' + error.code + ", errMsg: " + error.message;
                  } else {
                    this.outputStr = ParseX509CertInfo(x509CertArray);
                  }
                })
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              if ((this.outputStr).includes("failed")) {
                this.certificateResult = false
              } else {
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
                this.controller.getCertificate().then(x509CertArray => {
                  this.outputStr = ParseX509CertInfo(x509CertArray);
                })
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              console.log("getCertificate result of this page: " + this.outputStr);
              if ((this.outputStr).includes("failed")) {
                this.certificateResult = false
              } else {
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
        .onPageEnd((e) => {
          this.outputStr = 'onPageEnd : url = ' + e.url
        })
    }
  }
}