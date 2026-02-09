/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import business_error from '@ohos.base';
import cert from '@ohos.security.cert';
import UIAbility from '@ohos.app.ability.UIAbility';
import print from '@ohos.print';
import { BusinessError } from '@ohos.base';
import { waitForExist } from '../../test/WaitTest.test';


class TestObj {
  constructor() {
  }

  test(testStr: string): string {
    console.log('Web Component str' + testStr);
    return testStr;
  }

  toString(): string {
    console.log('Web Component toString');
    if (this) {
      return "ok";
    }
    return "no";
  }

  testNumber(testNum: number): number {
    console.log('Web Component number' + testNum);
    return testNum;
  }

  testBool(testBol: boolean): boolean {
    console.log('Web Component boolean' + testBol);
    return testBol;
  }

  webString = () => {
    console.log('Web test toString');
    if (this) {
      return "ok";
    }
    return "no";
  }
}


export enum ThreatType {
  UNKNOWN = -1,
  THREAT_ILLEGAL = 0,
  THREAT_FRAUD = 1,
  THREAT_RISK = 2,
  THREAT_WARNING = 3,
}

export enum WebNavigationType {
  MAIN_FRAME_NEW_ENTRY = 0,
  MAIN_FRAME_EXISTING_ENTRY = 1,
  NAVIGATION_TYPE_NEW_SUBFRAME = 2,
  NAVIGATION_TYPE_AUTO_SUBFRAME = 3,
}

export enum SecurityLevel {
  NONE = 0,
  SECURE = 1,
  WARNING = 2,
  DANGEROUS = 3
}

function Uint8ArrayToString(dataArray: Uint8Array) {
  let dataString = '';
  for (let i = 0; i < dataArray.length; i++) {
    dataString += String.fromCharCode(dataArray[i]);
  }
  return dataString;
}

function ParseX509CertInfo(x509CertArray: Array<cert.X509Cert>) {
  let res: string = 'getCertificate success: len = ' + x509CertArray.length;
  for (let i = 0; i < x509CertArray.length; i++) {
    res += ', index = ' + i + ', issuer name = '
      + Uint8ArrayToString(x509CertArray[i].getIssuerName().data) + ', subject name = '
      + Uint8ArrayToString(x509CertArray[i].getSubjectName().data) + ', valid start = '
      + x509CertArray[i].getNotBeforeTime()
      + ', valid end = ' + x509CertArray[i].getNotAfterTime();
  }
  return res;
}


@Entry
@Component
struct Second {
  private localStorage: string =
    "if (typeof(Storage) !== 'undefined') {" +
      "   localStorage.setItem('color', 'Red');" +
      "}";
  @State outputStr: string = '';
  @State testObjtest: TestObj = new TestObj();
  @State firsttime: number = 0;
  @State arr: Array<number> = [0, 0];
  webviewCtl: web_webview.WebviewController = new web_webview.WebviewController();
  delegate: web_webview.WebDownloadDelegate = new web_webview.WebDownloadDelegate();
  failedData: Uint8Array = new Uint8Array();
  ports: web_webview.WebMessagePort[] = [];
  scheme1: web_webview.WebCustomScheme = { schemeName: "name1", isSupportCORS: true, isSupportFetch: true };
  @State str: string = "emitonDownloadFailed";
  @State embedStatus: string = '';
  @State eventType: string = '';
  @State downloadStateCodeA: number = web_webview.WebDownloadState.IN_PROGRESS;
  @State downloadStateCodeB: number = web_webview.WebDownloadState.COMPLETED;
  @State downloadStateCodeC: number = web_webview.WebDownloadState.CANCELED;
  @State downloadStateCodeD: number = web_webview.WebDownloadState.INTERRUPTED;
  @State downloadStateCodeE: number = web_webview.WebDownloadState.PENDING;
  @State downloadStateCodeF: number = web_webview.WebDownloadState.PAUSED;
  @State downloadStateCodeG: number = web_webview.WebDownloadState.UNKNOWN;
  @State downloadErrorCodeA: number = web_webview.WebDownloadErrorCode.ERROR_UNKNOWN;
  @State downloadErrorCodeB: number = web_webview.WebDownloadErrorCode.FILE_FAILED;
  @State downloadErrorCodeC: number = web_webview.WebDownloadErrorCode.FILE_ACCESS_DENIED;
  @State downloadErrorCodeD: number = web_webview.WebDownloadErrorCode.FILE_NO_SPACE;
  @State downloadErrorCodeE: number = web_webview.WebDownloadErrorCode.FILE_NAME_TOO_LONG;
  @State downloadErrorCodeF: number = web_webview.WebDownloadErrorCode.FILE_TOO_LARGE;
  @State downloadErrorCodeG: number = web_webview.WebDownloadErrorCode.FILE_TRANSIENT_ERROR;
  @State downloadErrorCodeH: number = web_webview.WebDownloadErrorCode.FILE_BLOCKED;
  @State downloadErrorCodeI: number = web_webview.WebDownloadErrorCode.FILE_TOO_SHORT;
  @State downloadErrorCodeJ: number = web_webview.WebDownloadErrorCode.FILE_HASH_MISMATCH;
  @State downloadErrorCodeK: number = web_webview.WebDownloadErrorCode.FILE_SAME_AS_SOURCE;
  @State downloadErrorCodeL: number = web_webview.WebDownloadErrorCode.NETWORK_FAILED;
  @State downloadErrorCodeM: number = web_webview.WebDownloadErrorCode.NETWORK_TIMEOUT;
  @State downloadErrorCodeN: number = web_webview.WebDownloadErrorCode.NETWORK_DISCONNECTED;
  @State downloadErrorCodeO: number = web_webview.WebDownloadErrorCode.NETWORK_SERVER_DOWN;
  @State downloadErrorCodeP: number = web_webview.WebDownloadErrorCode.NETWORK_INVALID_REQUEST;
  @State downloadErrorCodeQ: number = web_webview.WebDownloadErrorCode.SERVER_FAILED;
  @State downloadErrorCodeR: number = web_webview.WebDownloadErrorCode.SERVER_NO_RANGE;
  @State downloadErrorCodeS: number = web_webview.WebDownloadErrorCode.SERVER_BAD_CONTENT;
  @State downloadErrorCodeT: number = web_webview.WebDownloadErrorCode.SERVER_UNAUTHORIZED;
  @State downloadErrorCodeU: number = web_webview.WebDownloadErrorCode.SERVER_CERT_PROBLEM;
  @State downloadErrorCodeV: number = web_webview.WebDownloadErrorCode.SERVER_FORBIDDEN;
  @State downloadErrorCodeW: number = web_webview.WebDownloadErrorCode.SERVER_UNREACHABLE;
  @State downloadErrorCodeX: number = web_webview.WebDownloadErrorCode.SERVER_CONTENT_LENGTH_MISMATCH;
  @State downloadErrorCodeY: number = web_webview.WebDownloadErrorCode.SERVER_CROSS_ORIGIN_REDIRECT;
  @State downloadErrorCodeZ: number = web_webview.WebDownloadErrorCode.USER_CANCELED;
  @State downloadErrorCodeAA: number = web_webview.WebDownloadErrorCode.USER_SHUTDOWN;
  @State downloadErrorCodeBB: number = web_webview.WebDownloadErrorCode.CRASH;
  @State webMediaOptionsPar: WebMediaOptions = { resumeInterval: 10, audioExclusive: true };
  @State sslErrorA: number = SslError.Invalid;
  @State sslErrorB: number = SslError.HostMismatch;
  @State sslErrorC: number = SslError.DateInvalid;
  @State sslErrorD: number = SslError.Untrusted;
  @State fileSelectorModeA: number = FileSelectorMode.FileOpenMode;
  @State fileSelectorModeB: number = FileSelectorMode.FileOpenMultipleMode;
  @State fileSelectorModeC: number = FileSelectorMode.FileOpenFolderMode;
  @State fileSelectorModeD: number = FileSelectorMode.FileSaveMode;
  @State protectedResourceTypeA: string = ProtectedResourceType.MidiSysex;
  @State protectedResourceTypeB: string = ProtectedResourceType.VIDEO_CAPTURE;
  @State protectedResourceTypeC: string = ProtectedResourceType.AUDIO_CAPTURE;
  @State navigationTypeA: number = WebNavigationType.MAIN_FRAME_NEW_ENTRY;
  @State navigationTypeB: number = WebNavigationType.MAIN_FRAME_EXISTING_ENTRY;
  @State navigationTypeC: number = WebNavigationType.NAVIGATION_TYPE_NEW_SUBFRAME;
  @State navigationTypeD: number = WebNavigationType.NAVIGATION_TYPE_AUTO_SUBFRAME;
  @State modeA: OverScrollMode = OverScrollMode.ALWAYS;
  @State modeB: WebLayoutMode = WebLayoutMode.FIT_CONTENT;
  @State setDownloadDelegateKey: boolean = false;
  @State scripts: Array<ScriptItem> = [
    { script: this.localStorage, scriptRules: ["*"] }
  ];
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 130540,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(130540)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webcomponenttwo').onClick(async () => {
          console.info('key==>' + this.str);
          await waitForExist(()=>this.isPageEnd, 'isPageEnd ' + this.str, 0);
          await waitForExist(()=>this.isReceive, 'isReceive ' + this.str, 0);
          this.isReceive = -1;
          switch (this.str) {
            case "emitGetCertificate": {
              this.webviewCtl.loadUrl('https://www.baidu.com')
              try {
                this.webviewCtl.getCertificate().then(x509CertArray => {
                  this.outputStr = ParseX509CertInfo(x509CertArray);
                  console.info('11111111111111' + this.outputStr);
                  Utils.emitEvent(this.outputStr, 130580);
                })
              } catch (error) {
                this.outputStr = 'getCertificate failed: ' + (error as BusinessError).code + ", errMsg: " + (error as BusinessError).message;
              }
              break;
            }

            case "emitonDownloadFailed": {
              try {
                this.webviewCtl.setDownloadDelegate(this.delegate);
                Utils.emitEvent(true, 130550)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "emitsetDownloadDelegate": {
              try {
                if (this.setDownloadDelegateKey) {
                  this.webviewCtl.setDownloadDelegate(this.delegate);
                }
                Utils.emitEvent(true, 130560)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "emitresumeDownload": {
              try {
                if (this.setDownloadDelegateKey) {
                  web_webview.WebDownloadManager.resumeDownload(web_webview.WebDownloadItem.deserialize(this.failedData));
                  this.ports = this.webviewCtl.createWebMessagePorts(true);
                  this.webviewCtl.startDownload('www.example.com');
                  let webPrintDocadapter = this.webviewCtl.createWebPrintDocumentAdapter('example.pdf');
                  let securityLevel = this.webviewCtl.getSecurityLevel();
                  this.webviewCtl.isIncognitoMode();
                  let result = this.webviewCtl.isSafeBrowsingEnabled();
                  this.webviewCtl.enableSafeBrowsing(true);
                }
                Utils.emitEvent(true, 130570)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }


            default:
              console.info("can not match case");
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.webviewCtl, incognitoMode: true })
        .fileAccess(true)
        .javaScriptOnDocumentEnd(this.scripts)
        .enableNativeEmbedMode(false)
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        .javaScriptOnDocumentStart(this.scripts)
        .overScrollMode(OverScrollMode.NEVER)
        .onSafeBrowsingCheckResult(() => {
          console.log("onSafeBrowsingCheckResult");
        })
        .onPageEnd((e: ESObject) => {
          this.outputStr = 'onPageEnd : url = ' + e.url
          console.log('web pageEnd==>' + e.url);
          this.isPageEnd = 0;
          console.log('this.isPageEnd==>' + this.isPageEnd);
        })
        .onFirstContentfulPaint((event: ESObject) => {
          console.log("onFirstContentfulPaint:" + "[navigationStartTick]:" +
          event.navigationStartTick + ", [firstContentfulPaintMs]:" +
          event.firstContentfulPaintMs);
          this.firsttime = event.firstContentfulPaintMs - event.navigationStartTick / 1000;
          this.arr.push(this.firsttime);
        })
        .onScreenCaptureRequest((event: ESObject) => {
          if (this.setDownloadDelegateKey) {
            if (event) {
              AlertDialog.show({
                title: 'title: ' + event.handler.getOrigin(),
                message: 'text',
                primaryButton: {
                  value: 'deny',
                  action: () => {
                    event.handler.deny()
                  }
                },
                secondaryButton: {
                  value: 'onConfirm',
                  action: () => {
                    event.handler.grant({ captureMode: WebCaptureMode.HOME_SCREEN })
                  }
                },
                cancel: () => {
                  event.handler.deny()
                }
              })
            }
          }
        })
        .onNavigationEntryCommitted((details: ESObject) => {
          if (this.setDownloadDelegateKey) {
            if (details) {
              console.log("onNavigationEntryCommitted: [isMainFrame]= " + details.isMainFrame +
                ", [isSameDocument]=" + details.isSameDocument +
                ", [didReplaceEntry]=" + details.didReplaceEntry +
                ", [navigationType]=" + details.navigationType +
                ", [url]=" + details.url);
            }
          }
        })
        .onContextMenuHide(() => {
          if (this.setDownloadDelegateKey) {
            console.log("success");
          }
        })
        .onNativeEmbedLifecycleChange((event: ESObject) => {
          if (this.setDownloadDelegateKey) {
            if (event.status == NativeEmbedStatus.CREATE) {
              this.embedStatus = 'Create';
            }
            if (event.status == NativeEmbedStatus.UPDATE) {
              this.embedStatus = 'Update';
            }
            if (event.status == NativeEmbedStatus.DESTROY) {
              this.embedStatus = 'Destroy';
            }
            console.log("status = " + this.embedStatus);
            console.log("surfaceId = " + event.surfaceId);
            console.log("embedId = " + event.embedId);
            if (event.info) {
              console.log("id = " + event.info.id);
              console.log("type = " + event.info.type);
              console.log("src = " + event.info.src);
              console.log("width = " + event.info.width);
              console.log("height = " + event.info.height);
              console.log("url = " + event.info.url);
            }
          }
        })
        .onNativeEmbedGestureEvent((event: ESObject) => {
          if (this.setDownloadDelegateKey) {
            if (event && event.touchEvent) {
              if (event.touchEvent.type == TouchType.Down) {
                this.eventType = 'Down';
              }
              if (event.touchEvent.type == TouchType.Up) {
                this.eventType = 'Up';
              }
              if (event.touchEvent.type == TouchType.Move) {
                this.eventType = 'Move';
              }
              if (event.touchEvent.type == TouchType.Cancel) {
                this.eventType = 'Cancel';
              }
              console.log("embedId = " + event.embedId);
              console.log("touchType = " + this.eventType);
              console.log("x = " + event.touchEvent.touches[0].x);
              console.log("y = " + event.touchEvent.touches[0].y);
              console.log("Component globalPos:(" + event.touchEvent.target.area.globalPosition.x + "," + event.touchEvent.target.area.globalPosition.y + ")");
              console.log("width = " + event.touchEvent.target.area.width);
              console.log("height = " + event.touchEvent.target.area.height);
            }
          }
        })
    }
  }
}