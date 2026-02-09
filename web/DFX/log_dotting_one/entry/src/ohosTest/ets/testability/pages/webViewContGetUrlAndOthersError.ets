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
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
import cert from '@ohos.security.cert';

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
  @State str: string = "";
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
    console.info("webViewContGetUrlAndOthersError page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 1
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("getUrlAndOthersErrorTest").key('webViewContGetUrlAndOthersError').onClick(async () => {
          await Utils.waitForExist(()=>this.isPageEnd, 'webViewContCreatePdfAndOthersErrorIsPageEnd', 1, 1000);
          await Utils.waitForExist(()=>this.isReceive, 'webViewContCreatePdfAndOthersErrorIsReceive', 1, 1000);
          console.info("key==>" + this.str)
          this.isReceive = -1;
          switch (this.str) {
            case "emitGetUrlInitErr": {
              try {
                this.controllerTwo.getUrl();
              } catch (error) {
                console.error(`emitGetUrlInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 111130)
              Utils.emitEvent(this.errorMsg, 111140)
              break;
            }
            case "emitStopInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.stop();
              } catch (error) {
                console.error(`emitStopInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 111150)
              Utils.emitEvent(this.errorMsg, 111160)
              break;
            }
            case "emitBackOrForwardInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.backOrForward(this.step);
              } catch (error) {
                console.error(`emitBackOrForwardInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 111170)
              Utils.emitEvent(this.errorMsg, 111180)
              break;
            }
            case "emitScrollToInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.scrollTo(50, 50);
              } catch (error) {
                console.error(`emitScrollToInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 111190)
              Utils.emitEvent(this.errorMsg, 111200)
              break;
            }
            case "emitScrollByInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.scrollBy(50, 50);
              } catch (error) {
                console.error(`emitScrollByInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 111210)
              Utils.emitEvent(this.errorMsg, 111220)
              break;
            }
            case "emitSlideScrollInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.slideScroll(500, 500);
              } catch (error) {
                console.error(`emitSlideScrollInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 111230)
              Utils.emitEvent(this.errorMsg, 111240)
              break;
            }
            case "emitGetOriginalUrlInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.getOriginalUrl();
              } catch (error) {
                console.error(`emitGetOriginalUrlInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 111250)
              Utils.emitEvent(this.errorMsg, 111260)
              break;
            }
            case "emitGetFaviconInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.getFavicon();
              } catch (error) {
                console.error(`emitGetFaviconInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 111270)
              Utils.emitEvent(this.errorMsg, 111280)
              break;
            }
            case "emitSetNetworkAvailableInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.setNetworkAvailable(true);
              } catch (error) {
                console.error(`emitSetNetworkAvailableInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 111290)
              Utils.emitEvent(this.errorMsg, 111300)
              break;
            }
            case "emitHasImageCallBackInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.hasImage((error, data) => {
                  if (error) {
                    console.info(`hasImage error: ` + JSON.stringify(error))
                    return;
                  }
                  console.info("hasImage: " + data);
                });
              } catch (error) {
                console.error(`emitHasImageCallBackInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 111310)
              Utils.emitEvent(this.errorMsg, 111320)
              break;
            }
            case "emitHasImagePromiseInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.hasImage()
                  .then((data) => {
                    console.info('hasImage: ' + data);
                  })
                  .catch((error:objectCss) => {
                    console.error("error: " + error);
                  })
              } catch (error) {
                console.error(`emitHasImagePromiseInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 111330)
              Utils.emitEvent(this.errorMsg, 111340)
              break;
            }
            case "emitRemoveCacheInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.removeCache(false);
              } catch (error) {
                console.error(`emitRemoveCacheInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 111350)
              Utils.emitEvent(this.errorMsg, 111360)
              break;
            }
            case "emitPageUpInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.pageUp(false);
              } catch (error) {
                console.error(`emitPageUpInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 111370)
              Utils.emitEvent(this.errorMsg, 111380)
              break;
            }
            case "emitPageDownInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.pageDown(false);
              } catch (error) {
                console.error(`emitPageDownInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 111390)
              Utils.emitEvent(this.errorMsg, 111400)
              break;
            }
            case "emitGetBackForwardEntriesInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.getBackForwardEntries();
              } catch (error) {
                console.error(`emitGetBackForwardEntriesInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 111410)
              Utils.emitEvent(this.errorMsg, 111420)
              break;
            }
            case "emitSerializeWebStateInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.serializeWebState();
              } catch (error) {
                console.error(`emitSerializeWebStateInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 111430)
              Utils.emitEvent(this.errorMsg, 111440)
              break;
            }
            case "emitRestoreWebStateInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                let size = 8;
                let buf = new ArrayBuffer(size);
                this.controllerTwo.restoreWebState(new Uint8Array(buf.slice(0, 8)));
              } catch (error) {
                console.error(`emitRestoreWebStateInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 111450)
              Utils.emitEvent(this.errorMsg, 111460)
              break;
            }
            case "emitGetCertificatePromiseInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.getCertificate().then(x509CertArray => {
                  this.outputStr = ParseX509CertInfo(x509CertArray);
                })
              } catch (error) {
                console.error(`emitGetCertificatePromiseInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 111470)
              Utils.emitEvent(this.errorMsg, 111480)
              break;
            }
            case "emitGetCertificateCallbackInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.getCertificate((error, x509CertArray) => {
                  if (error) {
                    this.outputStr = 'getCertificate failed: ' + error.code + ", errMsg: " + error.message;
                  } else {
                    this.outputStr = ParseX509CertInfo(x509CertArray);
                  }
                })
              } catch (error) {
                console.error(`emitGetCertificateCallbackInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 111490)
              Utils.emitEvent(this.errorMsg, 111500)
              break;
            }
            case "emitSetAudioMutedInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.setAudioMuted(false)
              } catch (error) {
                console.error(`emitSetAudioMutedInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 111510)
              Utils.emitEvent(this.errorMsg, 111520)
              break;
            }
            case "emitAvoidVisibleViewportBottomErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.avoidVisibleViewportBottom(111);
              } catch (error) {
                console.error(`emitAvoidVisibleViewportBottomErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 20250827)
              Utils.emitEvent(this.errorMsg, 20250828)
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