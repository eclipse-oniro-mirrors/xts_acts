/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import {
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  Header,
  Row,
  UIContext,
  Web,
  WebResourceResponse
} from '@ohos.arkui.component'
import webview from '@ohos.web.webview'
import events_emitter from '@ohos.events.emitter'
import Utils from '../../src/test/Utils.test';
import { BusinessError, Callback, RecordData } from '@ohos.base'
import { State } from '@ohos.arkui.stateManagement'

export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebViewControllerDownloadTest {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  controllerNull: webview.WebviewController = new webview.WebviewController(undefined);
  delegate: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  @State str: string = '';
  @State downloadUrl: string = 'https://consumer.huawei.com/content/dam/' +
    'huawei-cbg-site/cn/mkt/mobileservices/2022/download/' +
    'PC107f1b3947c942ffaa14334a879065d8.2107261020.exe'
  @State downloadUrlImg: string = 'https://consumer.huawei.com/content/dam/huawei-cbg-site/cn/mkt/pdp/tablets/' +
    'matepad-pro-11-2024/assets/imgs/pc/huawei-matepad-11-inch-Huawei-sound.png';
  @State downloadUrlVideo: string = 'https://www-file.huawei.com/-/media/corp2020/' +
    'videos/tech4all/stories/2/shansha-green-turtle.mp4';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State onBeforeDownloadCalled: boolean = false;
  @State onDownloadUpdatedCalled: boolean = false;
  @State onDownloadFailedCalled: boolean = false;
  @State onDownloadFinishCalled: boolean = false;
  @State hasSetDownloadDelegate: boolean = false;
  @State start: boolean = true;
  @State savePath: string = '/data/storage/el2/base/cache/web/';
  downloadingItem: webview.WebDownloadItem = new webview.WebDownloadItem();
  downloadItemErrorCode:  webview.WebDownloadItem = new webview.WebDownloadItem();
  downloadItem: webview.WebDownloadItem = new webview.WebDownloadItem();
  @State currentDownloadState: number = -1;
  @State testCompleted: boolean = false;
  @State guids: string[] = new Array<string>();
  @State currentSpeed: number = -1;
  @State percentComplete: number = -1;
  @State totalBytes: number = -1;
  @State methods: string[] = new Array<string>();
  @State mimeTypes: string[] = new Array<string>();
  @State urls: string[] = new Array<string>();
  @State suggestedFileName: string = '';
  @State receivedBytes: number = -1;
  @State fullPath: string = '';
  @State isDownloadFail: boolean = false;
  @State getLastErrorCodeEnum: number = -1;
  failedDownloadSerializedData: Uint8Array  = new Uint8Array();
  failedDownload: webview.WebDownloadItem = new webview.WebDownloadItem();

  aboutToAppear() {
    console.info('Entry aboutToAppear');
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
        console.info('this.stringObj.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
          Button("WebViewControllerDownloadTestButton").key('WebViewControllerDownloadTestButton').onClick((e: ClickEvent) => {
          console.info("key==>" +  this.stringObj.str)
          switch ( this.stringObj.str) {
            case 'testSetDownloadDelegate001': {
              try {
                Utils.emitEvent(this.hasSetDownloadDelegate, 79520)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testStartDownload001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                Utils.emitEvent(true, 79530)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testStartDownload002': {
              try {
                this.controller.startDownload("");
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 79501)
              }
              break;
            }
            case 'testWebDownloadState001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                if (this.currentDownloadState == webview.WebDownloadState.IN_PROGRESS) {
                  Utils.emitEvent(this.currentDownloadState, 79540);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebDownloadState002': {
              try {
                this.testCompleted = true
                this.controller.startDownload(this.downloadUrlImg);
                if (this.currentDownloadState == webview.WebDownloadState.COMPLETED) {
                  Utils.emitEvent(this.currentDownloadState, 79542);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebDownloadState003': {
              try {
                this.controller.startDownload(this.downloadUrl);
                if (this.downloadingItem) {
                  this.downloadingItem.cancel()
                }
                if ( this.currentDownloadState == webview.WebDownloadState.CANCELED) {
                  Utils.emitEvent(this.currentDownloadState, 79544)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic001': {
              try {
                  Utils.emitEvent(webview.WebDownloadErrorCode.ERROR_UNKNOWN, 260326171)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326171);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic002': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.FILE_FAILED, 260326172)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326172);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic003': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.FILE_ACCESS_DENIED, 260326173)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326173);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic004': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.FILE_NO_SPACE, 260326174)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326174);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic005': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.FILE_NAME_TOO_LONG, 260326175)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326175);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic006': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.FILE_TOO_LARGE, 260326176)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326176);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic007': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.FILE_TRANSIENT_ERROR, 260326177)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326177);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic008': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.FILE_BLOCKED, 260326178)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326178);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic009': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.FILE_TOO_SHORT, 260326179)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326179);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic010': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.FILE_HASH_MISMATCH, 260326180)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326180);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic011': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.FILE_SAME_AS_SOURCE, 260326181)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326181);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic012': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.NETWORK_FAILED, 260326182)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326182);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic013': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.NETWORK_TIMEOUT, 260326183)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326183);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic014': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.NETWORK_DISCONNECTED, 260326184)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326184);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic015': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.NETWORK_SERVER_DOWN, 260326185)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326185);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic016': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.NETWORK_INVALID_REQUEST, 260326186)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326186);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic017': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.SERVER_FAILED, 260326187)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326187);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic018': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.SERVER_NO_RANGE, 260326188)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326188);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic019': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.SERVER_BAD_CONTENT, 260326189)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326189);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic020': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.SERVER_UNAUTHORIZED, 260326190)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326190);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic021': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.SERVER_CERT_PROBLEM, 260326191)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326191);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic022': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.SERVER_FORBIDDEN, 260326192)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326192);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic023': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.SERVER_UNREACHABLE, 260326193)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326193);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic024': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.SERVER_CONTENT_LENGTH_MISMATCH, 260326194)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326194);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic025': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.SERVER_CROSS_ORIGIN_REDIRECT, 260326195)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326195);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic026': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.USER_CANCELED, 260326196)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326196);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic027': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.USER_SHUTDOWN, 260326197)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326197);
              }
              break;
            }
            case 'testWebDownloadGetLastErrorCodeEnumStatic028': {
              try {
                Utils.emitEvent(webview.WebDownloadErrorCode.CRASH, 260326198)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326198);
              }
              break;
            }
            case 'testWebDownloadGetStateEnumStatic001': {
              try {
                Utils.emitEvent(webview.WebDownloadState.IN_PROGRESS, 2603261981)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 2603261981);
              }
              break;
            }
            case 'testWebDownloadGetStateEnumStatic002': {
              try {
                Utils.emitEvent(webview.WebDownloadState.COMPLETED, 2603261982)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 2603261982);
              }
              break;
            }
            case 'testWebDownloadGetStateEnumStatic003': {
              try {
                Utils.emitEvent(webview.WebDownloadState.CANCELED, 2603261983)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 2603261983);
              }
              break;
            }
            case 'testWebDownloadGetStateEnumStatic004': {
              try {
                Utils.emitEvent(webview.WebDownloadState.INTERRUPTED, 2603261984)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 2603261984);
              }
              break;
            }
            case 'testWebDownloadGetStateEnumStatic005': {
              try {
                Utils.emitEvent(webview.WebDownloadState.PENDING, 2603261985)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 2603261985);
              }
              break;
            }
            case 'testWebDownloadGetStateEnumStatic006': {
              try {
                Utils.emitEvent(webview.WebDownloadState.PAUSED, 2603261986)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 2603261986);
              }
              break;
            }
            case 'testWebDownloadGetStateEnumStatic007': {
              try {
                Utils.emitEvent(webview.WebDownloadState.UNKNOWN, 2603261987)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 2603261987);
              }
              break;
            }
            case 'testWebDownloadState004': {
              try {
                this.savePath = 'data/'
                this.controller.startDownload(this.downloadUrl);
                if (this.currentDownloadState == webview.WebDownloadState.INTERRUPTED) {
                  Utils.emitEvent(this.currentDownloadState, 79546)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebDownloadState005': {
              try {
                this.start = false
                this.controller.startDownload(this.downloadUrl);
                if ( this.currentDownloadState == webview.WebDownloadState.PENDING) {
                  Utils.emitEvent(this.currentDownloadState, 79548)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebDownloadState006': {
              try {
                this.controller.startDownload(this.downloadUrl);
                console.log('testWebDownloadState006:' + this.currentDownloadState)
                console.log('testWebDownloadState006 downloadItem', this.downloadingItem)
                if (this.downloadingItem) {
                  this.downloadingItem.pause()
                  console.log('testWebDownloadState006Pause')
                  console.log('testWebDownloadState006:' + this.currentDownloadState)
                }
                if(this.currentDownloadState == webview.WebDownloadState.PAUSED) {
                  Utils.emitEvent(webview.WebDownloadState.PAUSED, 79550)
                }
                console.log('testWebDownloadState006:' + this.currentDownloadState)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebDownloadState007': {
              try {
                this.controller.startDownload("");
                if ( this.currentDownloadState == webview.WebDownloadState.UNKNOWN) {
                  console.log("get download status: ", this.currentDownloadState);
                  Utils.emitEvent(webview.WebDownloadState.UNKNOWN, 79500)
                }
              } catch (error) {
                if ( this.currentDownloadState == webview.WebDownloadState.UNKNOWN) {
                  Utils.emitEvent(webview.WebDownloadState.UNKNOWN, 79500)
                }
              }
              break;
            }
            case 'testWebDownloadPauseFail001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                if (this.downloadItem) {
                  this.downloadItem.cancel()
                }
                this.isDownloadFail = false;
                if (this.downloadItem) {
                  this.downloadItem.pause();
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 79503)
              }
              break;
            }
            case 'testGetGuid001': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                console.info('testGetGuid001 guids:' + this.guids)
                if (this.guids.length >= 1) {
                  Utils.emitEvent(true, 79650)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testGetGuid002': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                this.controller.startDownload(this.downloadUrlImg);
                console.info('testGetGuid002 guids:' + this.guids)
                if(this.guids.length >= 2) {
                  Utils.emitEvent(true, 79652)
                }

              } catch (error) {
                
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testGetCurrentSpeed001': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                for (let i=0; i< 5; i++) {
                  if ( this.currentSpeed >= 0 ) {
                    Utils.emitEvent(true, 79654)
                  }
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testGetPercentComplete001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                if ( this.percentComplete > 0 && this.percentComplete <= 100 ) {
                  Utils.emitEvent(true , 79656)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testGetPercentComplete002': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                if(this.percentComplete == 100) {
                  Utils.emitEvent(this.percentComplete, 79658)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testGetTotalBytes001': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                console.log('testGetTotalBytes001:'+ this.totalBytes)
                for (let i=0; i< 3; i++) {
                  console.log('testGetTotalBytes001:'+ this.totalBytes)
                  if (this.totalBytes > 0 && this.totalBytes >= 381400) {
                    Utils.emitEvent(true, 79660)
                  }
                }
              } catch (error) {
                
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testGetMethod001': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                console.info('testGetMethod001 methods:' + this.methods)
                if (this.methods.length > 0) {
                  Utils.emitEvent(true, 79662)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testGetMimeType001': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                console.info('testGetMimeType001 mimeTypes:' + this.mimeTypes)
                if (this.mimeTypes.indexOf('image/png')>-1) {
                  Utils.emitEvent(true, 79664)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testGetMimeType002': {
              try {
                this.controller.startDownload(this.downloadUrlVideo);
                console.info('testGetMimeType002 mimeTypes:' + this.mimeTypes)
                if (this.mimeTypes.indexOf('video/mp4') > -1 ) {
                  Utils.emitEvent(true, 79666)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testGetMimeType003': {
              try {
                this.controller.startDownload(this.downloadUrl);
                console.info('testGetMimeType003 mimeTypes:' + this.mimeTypes)
                if (this.mimeTypes.indexOf('application/x-msdownload') > -1) {
                  Utils.emitEvent(true, 79668)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testGetUrl001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                console.info('testGetUrl001 urls:' + this.urls)
                if (this.urls.indexOf(this.downloadUrl) > -1) {
                  Utils.emitEvent(true, 79670)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testGetSuggestedFileName001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                if (this.downloadUrl.indexOf(this.suggestedFileName) > -1) {
                  Utils.emitEvent(true, 79672)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testGetReceivedBytes001': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                if (this.receivedBytes > 0 && this.receivedBytes == this.totalBytes) {
                  Utils.emitEvent(true, 79674)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testGetFullPath001': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                console.log('testGetFullPath001:' + this.savePath + ' ' + this.fullPath)
                if (this.savePath == this.fullPath ) {
                  Utils.emitEvent(true, 79676)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testSerialize001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                if (this.downloadingItem) {
                  this.downloadingItem.cancel()
                }
                if (this.failedDownloadSerializedData) {
                  if (this.failedDownloadSerializedData.length > 0) {
                    Utils.emitEvent(true, 79678)
                  }
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testDeserialize001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                if (this.downloadingItem) {
                  this.downloadingItem.cancel()
                  console.log('testDeserialize001 close')
                }
                for (let i = 0; i< 5; i++ ) {
                  if (this.failedDownloadSerializedData && this.failedDownload) {
                    let deserialize = webview.WebDownloadItem.deserialize(this.failedDownloadSerializedData)
                    let same = this.failedDownload.getGuid() == deserialize.getGuid() &&
                      this.failedDownload.getGuid() == deserialize.getGuid() &&
                      this.failedDownload.getCurrentSpeed() == deserialize.getCurrentSpeed() &&
                      this.failedDownload.getPercentComplete() == deserialize.getPercentComplete() &&
                      this.failedDownload.getTotalBytes() == deserialize.getTotalBytes() &&
                      this.failedDownload.getState() == deserialize.getState() &&
                      this.failedDownload.getLastErrorCode() == deserialize.getLastErrorCode() &&
                      this.failedDownload.getMethod() == deserialize.getMethod() &&
                      this.failedDownload.getMimeType() == deserialize.getMimeType() &&
                      this.failedDownload.getUrl() == deserialize.getUrl() &&
                      this.failedDownload.getSuggestedFileName() == deserialize.getSuggestedFileName() &&
                      this.failedDownload.getReceivedBytes() == deserialize.getReceivedBytes() &&
                      this.failedDownload.getFullPath() == deserialize.getFullPath()
                    if(same) {
                      Utils.emitEvent(same, 79680)
                    }
                  }
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testResume001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                if (this.downloadingItem) {
                  this.downloadingItem.pause()
                }
                if (this.currentDownloadState == webview.WebDownloadState.PAUSED) {
                  if (this.downloadingItem) {
                    this.downloadingItem.resume()
                  }
                  if ( this.currentDownloadState == webview.WebDownloadState.IN_PROGRESS) {
                    Utils.emitEvent(webview.WebDownloadState.IN_PROGRESS, 79692)
                  }
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testResume002': {
              try {
                this.controller.startDownload(this.downloadUrl);
                  if (this.downloadingItem) {
                    this.downloadingItem.resume()
                  }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 79504)
              }
              break;
            }
            case 'testOnBeforeDownload001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                if(this.onBeforeDownloadCalled) {
                  Utils.emitEvent(true, 79700)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testOnDownloadUpdated001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                Utils.emitEvent(this.onDownloadUpdatedCalled, 79702)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testOnDownloadFinish001': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                if(this.onDownloadFinishCalled) {
                  Utils.emitEvent(this.onDownloadFinishCalled, 79704)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebDownloadManagerSetDownloadDelegate001': {
              try {
                Utils.emitEvent(this.hasSetDownloadDelegate, 79750)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testSetDownloadDelegateErrorCode001": {
              try {
                this.controllerNull.setDownloadDelegate(this.delegate)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 113930)
              }
              break;
            }

            case "testStartDownloadErrorCode001": {
              try {
                this.controllerNull.startDownload(this.downloadUrl)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 113940)
              }
              break;
            }

            case "testStartDownloadErrorCode002": {
              try {
                this.controller.startDownload("");
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 113950)
              }
              break;
            }

            case 'testResumeDownload001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                webview.WebDownloadManager.setDownloadDelegate(this.delegate);
                for (let i=0; i< 3; i++) {
                  if (this.downloadingItem) {
                    this.downloadingItem.cancel()
                  }
                  if (this.currentDownloadState == webview.WebDownloadState.CANCELED) {
                    if (this.downloadingItem) {
                      webview.WebDownloadManager.resumeDownload(this.downloadingItem)
                    }
                    if (this.currentDownloadState == webview.WebDownloadState.IN_PROGRESS) {
                      Utils.emitEvent(webview.WebDownloadState.IN_PROGRESS, 79752)
                    }
                  }
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testResumeDownloadErrorCode001": {
              try {
                webview.WebDownloadManager.resumeDownload(this.downloadItemErrorCode)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 114070)
              }
              break;
            }
          }
        })
      }

      Web({ src: 'www.example.com', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onPageEnd(() => {
          if (!this.hasSetDownloadDelegate) {
            try {
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                this.downloadItemErrorCode = webDownloadItem;
                this.onBeforeDownloadCalled = true;
                if(this.onBeforeDownloadCalled) {
                  Utils.emitEvent(true, 79700)
                }
                this.currentDownloadState = webDownloadItem.getState();
                if ( this.currentDownloadState == webview.WebDownloadState.IN_PROGRESS) {
                  Utils.emitEvent(webview.WebDownloadState.IN_PROGRESS, 79540)
                }
                if ( this.currentDownloadState == webview.WebDownloadState.CANCELED) {
                  Utils.emitEvent(webview.WebDownloadState.CANCELED, 79544)
                }
                if ( this.currentDownloadState == webview.WebDownloadState.INTERRUPTED) {
                  Utils.emitEvent(webview.WebDownloadState.INTERRUPTED, 79546)
                }
                if(this.currentDownloadState == webview.WebDownloadState.PAUSED) {
                  Utils.emitEvent(webview.WebDownloadState.PAUSED, 79550)
                }
                if ( this.currentDownloadState == webview.WebDownloadState.PENDING) {
                  Utils.emitEvent(webview.WebDownloadState.PENDING, 79548)
                }
                if ( this.currentDownloadState == webview.WebDownloadState.UNKNOWN) {
                  Utils.emitEvent(webview.WebDownloadState.UNKNOWN, 79500)
                }
                console.info('webDownloadItem.getGuid() = ' + webDownloadItem.getGuid())
                if (this.guids.indexOf(webDownloadItem.getGuid()) < 0) {
                  this.guids.push(webDownloadItem.getGuid());
                }
                if ( this.str == 'testGetGuid001') {
                  if (this.guids.length >= 1) {
                    Utils.emitEvent(true, 79650)
                  }
                }
                if ( this.str == 'testGetGuid002') {
                  if (this.guids.length >= 2) {
                    Utils.emitEvent(true, 79652)
                  }
                }
                if (this.methods.indexOf(webDownloadItem.getMethod()) < 0) {
                  this.methods.push(webDownloadItem.getMethod());
                }
                if (this.mimeTypes.indexOf(webDownloadItem.getMimeType()) < 0) {
                  this.mimeTypes.push(webDownloadItem.getMimeType());
                }
                if (this.mimeTypes.indexOf('application/x-msdownload') > -1) {
                  Utils.emitEvent(true, 79668)
                }
                if (this.mimeTypes.indexOf('video/mp4') > -1) {
                  Utils.emitEvent(true, 79666)
                }
                if (this.mimeTypes.indexOf('image/png') > -1) {
                  Utils.emitEvent(true, 79664)
                }
                if (this.urls.indexOf(webDownloadItem.getUrl()) < 0) {
                  this.urls.push(webDownloadItem.getUrl());
                }
                if (this.urls.indexOf(this.downloadUrl) > -1) {
                  Utils.emitEvent(true, 79670)
                }
                this.suggestedFileName = webDownloadItem.getSuggestedFileName();
                console.log('will start a download guid:' + webDownloadItem.getGuid());
                console.log('will start a download method:' + webDownloadItem.getMethod());
                console.log('will start a download mime type:' + webDownloadItem.getMimeType()); // 空了
                console.log('will start a download url:' + webDownloadItem.getUrl());
                console.log('will start a download suggest name:' + webDownloadItem.getSuggestedFileName());
                if (this.start) {
                  console.info('start in onBeforeDownload == > ' + this.savePath + " " + this.suggestedFileName)
                  webDownloadItem.start(this.savePath + this.suggestedFileName);
                }
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                this.downloadItemErrorCode = webDownloadItem;
                this.downloadingItem = webDownloadItem;
                this.onDownloadUpdatedCalled = true;
                this.currentDownloadState = webDownloadItem.getState();
                this.fullPath = webDownloadItem.getFullPath();
                if ( this.savePath == this.fullPath ) {
                  Utils.emitEvent(true, 79676)
                }
                if ( this.currentDownloadState == webview.WebDownloadState.IN_PROGRESS) {
                  Utils.emitEvent(this.currentDownloadState, 79540)
                }
                if ( this.currentDownloadState == webview.WebDownloadState.CANCELED) {
                  Utils.emitEvent(this.currentDownloadState, 79544)
                }
                if ( this.currentDownloadState == webview.WebDownloadState.INTERRUPTED) {
                  Utils.emitEvent(this.currentDownloadState, 79546)
                }

                if(this.currentDownloadState == webview.WebDownloadState.PAUSED) {
                  Utils.emitEvent(webview.WebDownloadState.PAUSED, 79550)
                }
                if ( this.currentDownloadState == webview.WebDownloadState.PENDING) {
                  Utils.emitEvent(this.currentDownloadState, 79548)
                }
                if ( this.currentDownloadState == webview.WebDownloadState.UNKNOWN) {
                  Utils.emitEvent(this.currentDownloadState, 79500)
                }
                if (this.guids.indexOf(webDownloadItem.getGuid()) < 0) {
                  this.guids.push(webDownloadItem.getGuid());
                }

                if ( this.str == 'testGetGuid001') {
                  if (this.guids.length >= 1) {
                    Utils.emitEvent(true, 79650)
                  }

                }
                if ( this.str == 'testGetGuid002') {
                  if (this.guids.length >= 2) {
                    Utils.emitEvent(true, 79652)
                  }
                }
                if (this.methods.indexOf(webDownloadItem.getMethod()) < 0) {
                  this.methods.push(webDownloadItem.getMethod());
                }
                if (this.mimeTypes.indexOf(webDownloadItem.getMimeType()) < 0) {
                  this.mimeTypes.push(webDownloadItem.getMimeType());
                }
                if (this.mimeTypes.indexOf('application/x-msdownload') > -1) {
                  Utils.emitEvent(true, 79668)
                }
                if (this.mimeTypes.indexOf('video/mp4') > -1) {
                  Utils.emitEvent(true, 79666)
                }
                if (this.mimeTypes.indexOf('image/png') > -1) {
                  Utils.emitEvent(true, 79664)
                }
                if (this.urls.indexOf(webDownloadItem.getUrl()) < 0) {
                  this.urls.push(webDownloadItem.getUrl());
                }
                if (this.urls.indexOf(this.downloadUrl) > -1) {
                  Utils.emitEvent(true, 79670)
                }
                if (this.currentSpeed <= 0) {
                  this.currentSpeed = webDownloadItem.getCurrentSpeed();
                }
                this.percentComplete = webDownloadItem.getPercentComplete();
                if ( this.str == 'testGetPercentComplete001') {
                  if ( this.percentComplete > 0 && this.percentComplete <= 100 ) {
                    Utils.emitEvent(true , 79656)
                  }
                }

                this.totalBytes = webDownloadItem.getTotalBytes();
                this.receivedBytes = webDownloadItem.getReceivedBytes();
                if (this.receivedBytes > 0 && this.receivedBytes == this.totalBytes) {
                  Utils.emitEvent(true, 79674)
                }
                console.log('download update download guid: ' + webDownloadItem.getGuid());
                console.log('download update download method:' + webDownloadItem.getMethod());
                console.log('download update download state: ' + webDownloadItem.getState());
                console.log('download update percent complete: ' + webDownloadItem.getPercentComplete());
                console.log('download update full path: ' + webDownloadItem.getFullPath());
                console.log('download update current speed: ' + webDownloadItem.getCurrentSpeed());
                console.log('download update total bytes: ' + webDownloadItem.getTotalBytes());
                console.log('download update received bytes: ' + webDownloadItem.getReceivedBytes());

              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                this.downloadItemErrorCode = webDownloadItem;
                this.downloadItem = webDownloadItem;
                this.onDownloadFailedCalled = true;
                console.info('this.currentDownloadState onDownloadFailed before ' + this.currentDownloadState)
                this.currentDownloadState = webDownloadItem.getState();
                console.info('this.currentDownloadState onDownloadFailed after ' + this.currentDownloadState)
                if ( this.currentDownloadState == webview.WebDownloadState.CANCELED) {
                  Utils.emitEvent(this.currentDownloadState, 79544)
                }
                if ( this.currentDownloadState == webview.WebDownloadState.INTERRUPTED) {
                  Utils.emitEvent(this.currentDownloadState, 79546)
                }

                if(this.currentDownloadState == webview.WebDownloadState.PAUSED) {
                  Utils.emitEvent(webview.WebDownloadState.PAUSED, 79550)
                }
                if ( this.currentDownloadState == webview.WebDownloadState.PENDING) {
                  Utils.emitEvent(this.currentDownloadState, 79548)
                }
                if (this.guids.indexOf(webDownloadItem.getGuid()) < 0) {
                  this.guids.push(webDownloadItem.getGuid());
                }

                if ( this.str == 'testGetGuid001') {
                  if (this.guids.length >= 1) {
                    Utils.emitEvent(true, 79650)
                  }

                }
                if ( this.str == 'testGetGuid002') {
                  if (this.guids.length >= 2) {
                    Utils.emitEvent(true, 79652)
                  }
                }
                if (this.methods.indexOf(webDownloadItem.getMethod()) < 0) {
                  this.methods.push(webDownloadItem.getMethod());
                }
                if (this.mimeTypes.indexOf(webDownloadItem.getMimeType()) < 0) {
                  this.mimeTypes.push(webDownloadItem.getMimeType());
                }
                if (this.mimeTypes.indexOf('application/x-msdownload') > -1) {
                  Utils.emitEvent(true, 79668)
                }
                if (this.mimeTypes.indexOf('video/mp4') > -1) {
                  Utils.emitEvent(true, 79666)
                }
                if (this.mimeTypes.indexOf('image/png') > -1) {
                  Utils.emitEvent(true, 79664)
                }
                if (this.urls.indexOf(webDownloadItem.getUrl()) < 0) {
                  this.urls.push(webDownloadItem.getUrl());
                }
                if (this.urls.indexOf(this.downloadUrl) > -1) {
                  Utils.emitEvent(true, 79670)
                }
                console.log('download failed method:' + webDownloadItem.getMethod());
                console.log('download failed guid: ' + webDownloadItem.getGuid());
                console.log('download failed lastErrorCode: ' + webDownloadItem.getLastErrorCode());
                this.getLastErrorCodeEnum = webDownloadItem.getLastErrorCode();
                webDownloadItem.cancel();
                this.failedDownload = webDownloadItem;
                this.failedDownloadSerializedData = webDownloadItem.serialize();
                this.isDownloadFail = true;
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                this.downloadItemErrorCode = webDownloadItem;
                this.downloadItem = webDownloadItem;
                this.onDownloadFinishCalled = true;
                Utils.emitEvent(this.onDownloadFinishCalled, 79704)
                console.info('this.currentDownloadState onDownloadFinish before ' + this.currentDownloadState)
                this.currentDownloadState = webDownloadItem.getState();
                console.info('this.currentDownloadState onDownloadFinish before ' + this.currentDownloadState)
                if (this.guids.indexOf(webDownloadItem.getGuid()) < 0) {
                  this.guids.push(webDownloadItem.getGuid());
                }

                if ( this.str == 'testGetGuid001') {
                  if (this.guids.length >= 1) {
                    Utils.emitEvent(true, 79650)
                  }

                }
                if ( this.str == 'testGetGuid002') {
                  if (this.guids.length >= 2) {
                    Utils.emitEvent(true, 79652)
                  }
                }
                if (this.methods.indexOf(webDownloadItem.getMethod()) < 0) {
                  this.methods.push(webDownloadItem.getMethod());
                }
                if (this.mimeTypes.indexOf(webDownloadItem.getMimeType()) < 0) {
                  this.mimeTypes.push(webDownloadItem.getMimeType());
                }
                if (this.urls.indexOf(webDownloadItem.getUrl()) < 0) {
                  this.urls.push(webDownloadItem.getUrl());
                }
                this.totalBytes = webDownloadItem.getTotalBytes();
                this.receivedBytes = webDownloadItem.getReceivedBytes();
                if (this.receivedBytes > 0 && this.receivedBytes == this.totalBytes) {
                  Utils.emitEvent(true, 79674)
                }
                this.fullPath = webDownloadItem.getFullPath();
                if ( this.savePath == this.fullPath ) {
                  Utils.emitEvent(true, 79676)
                }
                console.log('download finish method:' + webDownloadItem.getMethod());
                console.log('download finish guid: ' + webDownloadItem.getGuid());
                this.percentComplete = webDownloadItem.getPercentComplete();
                if ( this.str == 'testGetPercentComplete001') {
                  if ( this.percentComplete > 0 && this.percentComplete <= 100 ) {
                    Utils.emitEvent(true , 79656)
                  }
                }
                if ( this.str == 'testGetPercentComplete002') {
                  if ( this.percentComplete == 100 ) {
                    Utils.emitEvent(true , 79658)
                  }
                }
                if (this.testCompleted) {
                  Utils.emitEvent(this.currentDownloadState, 79542)
                  this.testCompleted = false
                }
              })

              this.controller.setDownloadDelegate(this.delegate);
              this.hasSetDownloadDelegate = true
            } catch (error) {
              console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
            }
          }
        })
    }
  }
}
