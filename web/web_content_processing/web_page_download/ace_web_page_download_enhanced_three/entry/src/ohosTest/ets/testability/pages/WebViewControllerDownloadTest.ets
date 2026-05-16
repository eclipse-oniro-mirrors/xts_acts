/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import events_emitter from '@ohos.events.emitter';
import webView from '@ohos.web.webview';
import business_error from '@ohos.base'
import Utils from '../../test/Utils';
import {waitForAssert, waitForExist} from '../../test/WaitTest';

@Entry
@Component
struct WebViewControllerDownloadTest {
  controller: webView.WebviewController = new webView.WebviewController();
  delegate: webView.WebDownloadDelegate = new webView.WebDownloadDelegate();
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
  @State savePath: string = '';
  downloadingItem: webView.WebDownloadItem | null = null
  @State currentDownloadState: number = -1;
  @State testCompleted: boolean = false;
  @State guids: string[] = [];
  @State currentSpeed: number = -1;
  @State percentComplete: number = -1;
  @State totalBytes: number = -1;
  @State methods: string[] = [];
  @State mimeTypes: string[] = [];
  @State urls: string[] = [];
  @State suggestedFileName: string = '';
  @State receivedBytes: number = -1;
  @State fullPath: string = '';
  failedDownloadSerializedData: Uint8Array | null = null;
  failedDownload: webView.WebDownloadItem | null = null;
  download: webView.WebDownloadItem = new webView.WebDownloadItem();
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 131570,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)

    events_emitter.on({ eventId: 11, priority: events_emitter.EventPriority.LOW }, () => {
      console.info('AfterEach release the download progress.');
      if (this.downloadingItem) {
        console.info('Call downloadingItem.cancel');
        this.downloadingItem.cancel()
      }
    })
  }

  onPageHide() {
    events_emitter.off(131570)
    events_emitter.off(11)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.downloadingItem = null
        this.currentDownloadState = -1
        this.start = true
        this.testCompleted = false
        this.savePath = Utils.getSandboxFileDir() + 'testDownloadFile'
        this.guids = []
        this.currentSpeed = -1
        this.percentComplete = -1
        this.totalBytes = -1
        this.methods = []
        this.mimeTypes = []
        this.urls = []
        this.suggestedFileName = ''
        this.receivedBytes = -1
        this.fullPath = ''
        this.failedDownloadSerializedData = null
        this.failedDownload = null
        this.onBeforeDownloadCalled = false
        this.onDownloadUpdatedCalled = false
        this.onDownloadFailedCalled = false
        this.onDownloadFinishCalled = false
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebViewControllerDownloadTestButton')
          .key('WebViewControllerDownloadTestButton').onClick(async () => {
          console.info('key==>' + this.str)
          await waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 0);
          await waitForExist(() => this.isReceive, this.str + ' isReceive', 0);
          this.isReceive = -1;
          switch (this.str) {
            case 'testGetGuid001': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await waitForExist(() => this.currentDownloadState, this.str, webView.WebDownloadState.COMPLETED);
                console.info(this.str + ' guids:' + this.guids)
                
                let check = (v1: string[], v2: number): boolean => {
                  return v1.length == 1 && v1.indexOf('') < 0 ? true: false;
                }
                await waitForAssert(()=>this.guids, check, 1, 131580, this.str);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetGuid002': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                this.controller.startDownload(this.downloadUrlImg);
                await waitForExist(() => this.currentDownloadState, this.str, webView.WebDownloadState.COMPLETED);
                console.info(this.str + ' guids:' + this.guids)

                let check = (v1: string[], v2: number): boolean => {
                  return v1.length == v2 && v1.indexOf('') < 0 ? true:false;
                }
                await waitForAssert(()=>this.guids, check, 2, 131590, this.str);

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetCurrentSpeed001': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                let flag = false;
                await waitForExist(()=> {
                  if (this.currentSpeed > 0 || (this.currentDownloadState == 1 && this.currentSpeed == 0)) {
                    flag = true;
                  }
                  return '' + flag;
                }, this.str, 'true');

                await waitForExist(() => this.currentDownloadState, this.str, webView.WebDownloadState.COMPLETED);
                console.info(this.str + ' currentSpeed:' + this.currentSpeed)
                Utils.emitEvent(flag, 131600);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetPercentComplete001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                let flag = false;
                await waitForExist(()=> {
                  if (this.percentComplete > 0 && this.percentComplete <= 100) {
                    flag = true;
                  }
                  return '' + flag;
                }, this.str, 'true');

                await waitForExist(()=>this.downloadingItem, this.str)
                if (this.downloadingItem && this.currentDownloadState == webView.WebDownloadState.IN_PROGRESS) {
                  this.downloadingItem.cancel()
                  await waitForExist(() => this.currentDownloadState, this.str, webView.WebDownloadState.CANCELED);
                }
                console.info(this.str + ' percentComplete:' + this.percentComplete)
                Utils.emitEvent(flag, 131610);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetPercentComplete002': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                let flag = false;
                await waitForExist(()=> {
                  if (this.percentComplete == 100) {
                    flag = true;
                  }
                  return '' + flag;
                }, this.str, 'true');
                await waitForExist(() => this.currentDownloadState, this.str, webView.WebDownloadState.COMPLETED);
                console.info(this.str + ' percentComplete:' + this.percentComplete)
                Utils.emitEvent(flag, 131620);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetTotalBytes001': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await waitForExist(() => this.currentDownloadState, this.str, webView.WebDownloadState.COMPLETED);
                console.info(this.str + ' totalBytes:' + this.totalBytes)

                let check = (v1: number, v2: number): boolean => {
                  return v1 == v2 ? true: false;
                }
                await waitForAssert(()=>this.totalBytes, check, 381400, 131630, this.str);

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetMethod001': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await waitForExist(() => this.currentDownloadState, this.str, webView.WebDownloadState.COMPLETED);
                console.info(this.str + ' methods:' + this.methods)

                let check = (v1: string[], v2: number): boolean => {
                  return v1.length == 1 && v1.indexOf('') < 0 ? true:false;
                }
                await waitForAssert(()=>this.methods, check, 1, 131640, this.str);

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetMimeType001': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await waitForExist(() => this.currentDownloadState, this.str, webView.WebDownloadState.COMPLETED);
                console.info(this.str + ' mimeTypes:' + this.mimeTypes)

                let check = (v1: string[], v2: boolean): boolean => {
                  return v1.length <= 1 && v1.indexOf('image/png') >= 0 ? true:false;
                }
                await waitForAssert(()=>this.mimeTypes, check, true, 131650, this.str);

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetMimeType002': {
              try {
                this.controller.startDownload(this.downloadUrlVideo);
                console.info(this.str + ' mimeTypes:' + this.mimeTypes)

                let flag = false;
                await waitForExist(()=> {
                  if (this.mimeTypes.length <= 1 && this.mimeTypes.indexOf('video/mp4') >= 0) {
                    flag = true;
                  }
                  return '' + flag;
                }, this.str, 'true');
                await waitForExist(()=>this.downloadingItem, this.str)
                if (this.downloadingItem && this.currentDownloadState == webView.WebDownloadState.IN_PROGRESS) {
                  this.downloadingItem.cancel()
                  await waitForExist(() => this.currentDownloadState, this.str, webView.WebDownloadState.CANCELED);
                }
                Utils.emitEvent(flag, 131660);

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetMimeType003': {
              try {
                this.controller.startDownload(this.downloadUrl);
                console.info(this.str + ' mimeTypes:' + this.mimeTypes)

                let flag = false;
                await waitForExist(()=> {
                  if (this.mimeTypes.length <=1 && this.mimeTypes.indexOf('application/x-msdownload') >= 0) {
                    flag = true;
                  }
                  return '' + flag;
                }, this.str, 'true');
                await waitForExist(()=>this.downloadingItem, this.str)
                if (this.downloadingItem && this.currentDownloadState == webView.WebDownloadState.IN_PROGRESS) {
                  this.downloadingItem.cancel()
                  await waitForExist(() => this.currentDownloadState, this.str, webView.WebDownloadState.CANCELED);
                }
                Utils.emitEvent(flag, 131670);

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetUrl001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                console.info(this.str + ' urls:' + this.urls)

                let flag = false;
                await waitForExist(()=> {
                  if (this.urls.length <=1 && this.urls.indexOf(this.downloadUrl) >= 0) {
                    flag = true;
                  }
                  return '' + flag;
                }, this.str, 'true');
                await waitForExist(()=>this.downloadingItem, this.str)
                if (this.downloadingItem && this.currentDownloadState == webView.WebDownloadState.IN_PROGRESS) {
                  this.downloadingItem.cancel()
                  await waitForExist(() => this.currentDownloadState, this.str, webView.WebDownloadState.CANCELED);
                }
                Utils.emitEvent(flag, 131680);

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetSuggestedFileName001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                console.info(this.str + ' suggestedFileName:' + this.suggestedFileName)

                let flag = false;
                await waitForExist(()=> {
                  if (this.suggestedFileName.length != 0 && this.downloadUrl.indexOf(this.suggestedFileName) >= 0) {
                    flag = true;
                  }
                  return '' + flag;
                }, this.str, 'true');
                await waitForExist(()=>this.downloadingItem, this.str)
                if (this.downloadingItem && this.currentDownloadState == webView.WebDownloadState.IN_PROGRESS) {
                  this.downloadingItem.cancel()
                  await waitForExist(() => this.currentDownloadState, this.str, webView.WebDownloadState.CANCELED);
                }
                Utils.emitEvent(flag, 131690);

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetReceivedBytes001': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await waitForExist(() => this.currentDownloadState, this.str, webView.WebDownloadState.COMPLETED);
                console.info(this.str + ' receivedBytes:' + this.receivedBytes)

                let check = (v1: number, v2: boolean): boolean => {
                  return v1 == 381400 ? true: false;
                }
                await waitForAssert(()=>this.receivedBytes, check, true, 131700, this.str);

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetFullPath001': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await waitForExist(() => this.currentDownloadState, this.str, webView.WebDownloadState.COMPLETED);
                console.info(this.str + ' fullPath:' + this.fullPath)

                this.savePath = Utils.getSandboxFileDir() + 'testDownloadFile';
                let check = (v1: string, v2: boolean): boolean => {
                  return v1 == this.savePath ? true:false;
                }
                await waitForAssert(()=>this.fullPath, check, true, 131710, this.str);

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testSerialize001': {
              try {
                this.controller.startDownload(this.downloadUrl);

                await waitForExist(()=>this.downloadingItem, this.str)
                if (this.downloadingItem) {
                  this.downloadingItem.cancel()
                }
                await waitForExist(()=>this.failedDownloadSerializedData, this.str)
                if (this.failedDownloadSerializedData) {
                  let check = (v1: Uint8Array | null, v2: boolean): boolean => {
                    return v1 && v1.length > 0 ? true:false;
                  }
                  await waitForAssert(()=>this.failedDownloadSerializedData, check, true, 131720, this.str);

                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testDeserialize001': {
              try {
                this.controller.startDownload(this.downloadUrl);

                await waitForExist(()=>this.downloadingItem, this.str)
                if (this.downloadingItem) {
                  this.downloadingItem.cancel()
                }
                await waitForExist(()=>this.failedDownloadSerializedData, this.str)
                await waitForExist(()=>this.failedDownload, this.str)
                if (this.failedDownloadSerializedData && this.failedDownload) {
                  let deserialize = webView.WebDownloadItem.deserialize(this.failedDownloadSerializedData)
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
                  Utils.emitEvent(same, 131730)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('second.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
          if (!this.hasSetDownloadDelegate) {
            try {
              this.delegate.onBeforeDownload((webDownloadItem: webView.WebDownloadItem) => {
                this.onBeforeDownloadCalled = true;
                this.currentDownloadState = webDownloadItem.getState();
                if (this.guids.indexOf(webDownloadItem.getGuid()) < 0) {
                  this.guids.push(webDownloadItem.getGuid());
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
                this.suggestedFileName = webDownloadItem.getSuggestedFileName();
                console.log('will start a download guid:' + webDownloadItem.getGuid());
                console.log('will start a download method:' + webDownloadItem.getMethod());
                console.log('will start a download mime type:' + webDownloadItem.getMimeType());
                console.log('will start a download url:' + webDownloadItem.getUrl());
                console.log('will start a download suggest name:' + webDownloadItem.getSuggestedFileName());
                if (this.start) {
                  webDownloadItem.start(this.savePath);
                }
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webView.WebDownloadItem) => {
                this.onDownloadUpdatedCalled = true;
                this.currentDownloadState = webDownloadItem.getState();
                if (this.guids.indexOf(webDownloadItem.getGuid()) < 0) {
                  this.guids.push(webDownloadItem.getGuid());
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
                if (this.currentSpeed <= 0) {
                  this.currentSpeed = webDownloadItem.getCurrentSpeed();
                }
                this.percentComplete = webDownloadItem.getPercentComplete();
                this.totalBytes = webDownloadItem.getTotalBytes();
                this.receivedBytes = webDownloadItem.getReceivedBytes();
                console.log('download update download guid: ' + webDownloadItem.getGuid());
                console.log('download update download method:' + webDownloadItem.getMethod());
                console.log('download update download state: ' + webDownloadItem.getState());
                console.log('download update percent complete: ' + webDownloadItem.getPercentComplete());
                console.log('download update full path: ' + webDownloadItem.getFullPath());
                console.log('download update current speed: ' + webDownloadItem.getCurrentSpeed());
                console.log('download update total bytes: ' + webDownloadItem.getTotalBytes());
                console.log('download update received bytes: ' + webDownloadItem.getReceivedBytes());
                this.downloadingItem = webDownloadItem;
              })
              this.delegate.onDownloadFailed((webDownloadItem: webView.WebDownloadItem) => {
                this.onDownloadFailedCalled = true;
                this.currentDownloadState = webDownloadItem.getState();
                if (this.guids.indexOf(webDownloadItem.getGuid()) < 0) {
                  this.guids.push(webDownloadItem.getGuid());
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
                console.log('download failed method:' + webDownloadItem.getMethod());
                console.log('download failed guid: ' + webDownloadItem.getGuid());
                console.log('download failed lastErrorCode: ' + webDownloadItem.getLastErrorCode());
                webDownloadItem.cancel();
                this.failedDownload = webDownloadItem;
                this.failedDownloadSerializedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webView.WebDownloadItem) => {
                this.onDownloadFinishCalled = true;
                this.currentDownloadState = webDownloadItem.getState();
                if (this.guids.indexOf(webDownloadItem.getGuid()) < 0) {
                  this.guids.push(webDownloadItem.getGuid());
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
                this.fullPath = webDownloadItem.getFullPath();
                console.log('download finish method:' + webDownloadItem.getMethod());
                console.log('download finish guid: ' + webDownloadItem.getGuid());

              })
              this.controller.setDownloadDelegate(this.delegate);
              webView.WebDownloadManager.setDownloadDelegate(this.delegate);
              this.hasSetDownloadDelegate = true
            } catch (error) {
              let e: business_error.BusinessError = error as business_error.BusinessError;
              console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
            }
          }
        })
    }
  }
}
