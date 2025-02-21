/**
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
import webView from '@ohos.web.webview';
import business_error from '@ohos.base'
import Utils from '../../test/Utils';

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

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)

    events_emitter.on({ eventId: 11, priority: events_emitter.EventPriority.LOW }, () => {
      console.info("AfterEach release the download progress.");
      if (this.downloadingItem) {
        console.info("Call downloadingItem.cancel");
        this.downloadingItem.cancel()
      }
    })
  }

  onPageHide() {
    events_emitter.off(10)
    events_emitter.off(11)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
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
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebViewControllerDownloadTestButton')
          .key('WebViewControllerDownloadTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "testSetDownloadDelegate001": {
              try {
                Utils.emitEvent(this.hasSetDownloadDelegate, 79520)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testStartDownload001": {
              try {
                this.controller.startDownload(this.downloadUrl);
                await Utils.sleep(3000)
                Utils.emitEvent(true, 79530)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testWebDownloadState001": {
              try {
                this.controller.startDownload(this.downloadUrl);
                await Utils.sleep(3000)
                Utils.emitEvent(this.currentDownloadState, 79540)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testWebDownloadState002": {
              try {
                this.testCompleted = true
                this.controller.startDownload(this.downloadUrlImg);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testWebDownloadState003": {
              try {
                this.controller.startDownload(this.downloadUrl);
                await Utils.sleep(3000)
                if (this.downloadingItem) {
                  this.downloadingItem.cancel()
                }
                await Utils.sleep(2000)
                Utils.emitEvent(this.currentDownloadState, 79544)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testWebDownloadState004": {
              try {
                this.savePath = 'data/'
                this.controller.startDownload(this.downloadUrl);
                await Utils.sleep(3000)
                Utils.emitEvent(this.currentDownloadState, 79546)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testWebDownloadState005": {
              try {
                this.start = false
                this.controller.startDownload(this.downloadUrl);
                await Utils.sleep(3000)
                Utils.emitEvent(this.currentDownloadState, 79548)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testWebDownloadState006": {
              try {
                this.controller.startDownload(this.downloadUrl);
                await Utils.sleep(3000)
                if (this.downloadingItem) {
                  this.downloadingItem.pause()
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.currentDownloadState, 79550)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testGetGuid001": {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await Utils.sleep(3000)
                console.info('testGetGuid001 guids:' + this.guids)
                if (this.guids.indexOf('') >= 0) {
                  Utils.emitEvent(-1, 79650)
                } else {
                  Utils.emitEvent(this.guids.length, 79650)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testGetGuid002": {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await Utils.sleep(3000)
                this.controller.startDownload(this.downloadUrlImg);
                await Utils.sleep(3000)
                console.info('testGetGuid001 guids:' + this.guids)
                if (this.guids.indexOf('') >= 0) {
                  Utils.emitEvent(-1, 79652)
                } else {
                  Utils.emitEvent(this.guids.length, 79652)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testGetCurrentSpeed001": {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await Utils.sleep(3000)
                Utils.emitEvent(this.currentSpeed > 0, 79654)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testGetPercentComplete001": {
              try {
                this.controller.startDownload(this.downloadUrl);
                await Utils.sleep(6000)
                Utils.emitEvent(this.percentComplete > 0 && this.percentComplete < 100, 79656)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testGetPercentComplete002": {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await Utils.sleep(3000)
                Utils.emitEvent(this.percentComplete == 100, 79658)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testGetTotalBytes001": {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await Utils.sleep(3000)
                Utils.emitEvent(this.totalBytes, 79660)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testGetMethod001": {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await Utils.sleep(3000)
                console.info('testGetMethod001 methods:' + this.methods)
                if (this.methods.indexOf('') >= 0) {
                  Utils.emitEvent(-1, 79662)
                } else {
                  Utils.emitEvent(this.methods.length, 79662)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testGetMimeType001": {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await Utils.sleep(3000)
                console.info('testGetMimeType001 mimeTypes:' + this.mimeTypes)
                if (this.mimeTypes.indexOf('image/png') < 0 || this.mimeTypes.length > 1) {
                  Utils.emitEvent(false, 79664)
                } else {
                  Utils.emitEvent(true, 79664)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testGetMimeType002": {
              try {
                this.controller.startDownload(this.downloadUrlVideo);
                await Utils.sleep(3000)
                console.info('testGetMimeType002 mimeTypes:' + this.mimeTypes)
                if (this.mimeTypes.indexOf('video/mp4') < 0 || this.mimeTypes.length > 1) {
                  Utils.emitEvent(false, 79666)
                } else {
                  Utils.emitEvent(true, 79666)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testGetMimeType003": {
              try {
                this.controller.startDownload(this.downloadUrl);
                await Utils.sleep(3000)
                console.info('testGetMimeType003 mimeTypes:' + this.mimeTypes)
                if (this.mimeTypes.indexOf('application/x-msdownload') < 0 || this.mimeTypes.length > 1) {
                  Utils.emitEvent(false, 79668)
                } else {
                  Utils.emitEvent(true, 79668)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testGetUrl001": {
              try {
                this.controller.startDownload(this.downloadUrl);
                await Utils.sleep(3000)
                console.info('testGetUrl001 urls:' + this.urls)
                if (this.urls.indexOf(this.downloadUrl) < 0 || this.urls.length > 1) {
                  Utils.emitEvent(false, 79670)
                } else {
                  Utils.emitEvent(true, 79670)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testGetSuggestedFileName001": {
              try {
                this.controller.startDownload(this.downloadUrl);
                await Utils.sleep(3000)
                if (this.suggestedFileName.length == 0 || this.downloadUrl.indexOf(this.suggestedFileName) < 0) {
                  Utils.emitEvent(false, 79672)
                } else {
                  Utils.emitEvent(true, 79672)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testGetReceivedBytes001": {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await Utils.sleep(3000)
                Utils.emitEvent(this.receivedBytes > 0 && this.receivedBytes == this.totalBytes, 79674)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testGetFullPath001": {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await Utils.sleep(3000)
                Utils.emitEvent(this.savePath == this.fullPath, 79676)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testSerialize001": {
              try {
                this.controller.startDownload(this.downloadUrl);
                await Utils.sleep(3000)
                if (this.downloadingItem) {
                  this.downloadingItem.cancel()
                }
                await Utils.sleep(2000)
                if (this.failedDownloadSerializedData) {
                  Utils.emitEvent(this.failedDownloadSerializedData.length > 0, 79678)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testDeserialize001": {
              try {
                this.controller.startDownload(this.downloadUrl);
                await Utils.sleep(3000)
                if (this.downloadingItem) {
                  this.downloadingItem.cancel()
                }
                await Utils.sleep(2000)
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
                  Utils.emitEvent(same, 79680)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testResume001": {
              try {
                this.controller.startDownload(this.downloadUrl);
                await Utils.sleep(3000)
                if (this.downloadingItem) {
                  this.downloadingItem.pause()
                }
                await Utils.sleep(2000)
                if (this.currentDownloadState == webView.WebDownloadState.PAUSED) {
                  if (this.downloadingItem) {
                    this.downloadingItem.resume()
                  }
                  await Utils.sleep(2000)
                  Utils.emitEvent(this.currentDownloadState, 79692)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testOnBeforeDownload001": {
              try {
                this.controller.startDownload(this.downloadUrl);
                await Utils.sleep(3000)
                Utils.emitEvent(this.onBeforeDownloadCalled, 79700)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testOnDownloadUpdated001": {
              try {
                this.controller.startDownload(this.downloadUrl);
                await Utils.sleep(3000)
                Utils.emitEvent(this.onDownloadUpdatedCalled, 79702)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testOnDownloadFinish001": {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await Utils.sleep(3000)
                Utils.emitEvent(this.onDownloadFinishCalled, 79704)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testWebDownloadManagerSetDownloadDelegate001": {
              try {
                Utils.emitEvent(this.hasSetDownloadDelegate, 79750)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testResumeDownload001": {
              try {
                this.controller.startDownload(this.downloadUrl);
                await Utils.sleep(3000)
                if (this.downloadingItem) {
                  this.downloadingItem.cancel()
                }
                await Utils.sleep(2000)
                if (this.currentDownloadState == webView.WebDownloadState.CANCELED) {
                  if (this.downloadingItem) {
                    webView.WebDownloadManager.resumeDownload(this.downloadingItem)
                  }
                  await Utils.sleep(2000)
                  Utils.emitEvent(this.currentDownloadState, 79752)
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
        .onPageEnd(() => {
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
                console.log("will start a download guid:" + webDownloadItem.getGuid());
                console.log("will start a download method:" + webDownloadItem.getMethod());
                console.log("will start a download mime type:" + webDownloadItem.getMimeType());
                console.log("will start a download url:" + webDownloadItem.getUrl());
                console.log("will start a download suggest name:" + webDownloadItem.getSuggestedFileName());
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
                console.log("download update download guid: " + webDownloadItem.getGuid());
                console.log("download update download method:" + webDownloadItem.getMethod());
                console.log("download update download state: " + webDownloadItem.getState());
                console.log("download update percent complete: " + webDownloadItem.getPercentComplete());
                console.log("download update full path: " + webDownloadItem.getFullPath());
                console.log("download update current speed: " + webDownloadItem.getCurrentSpeed());
                console.log("download update total bytes: " + webDownloadItem.getTotalBytes());
                console.log("download update received bytes: " + webDownloadItem.getReceivedBytes());
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
                console.log("download failed method:" + webDownloadItem.getMethod());
                console.log("download failed guid: " + webDownloadItem.getGuid());
                console.log("download failed lastErrorCode: " + webDownloadItem.getLastErrorCode());
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
                console.log("download finish method:" + webDownloadItem.getMethod());
                console.log("download finish guid: " + webDownloadItem.getGuid());
                if (this.testCompleted) {
                  Utils.emitEvent(this.currentDownloadState, 79542)
                  this.testCompleted = false
                }
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