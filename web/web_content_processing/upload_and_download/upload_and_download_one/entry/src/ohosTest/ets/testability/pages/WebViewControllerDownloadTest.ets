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
import { waitForExist } from '../../test/WaitTest.test';

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
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 130080,
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
    events_emitter.off(130080)
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
          console.info('key==>' + this.str);
          await waitForExist(()=>this.isPageEnd, this.str, 0);
          await waitForExist(()=>this.isReceive, this.str, 0);
          this.isReceive = -1;
          switch (this.str) {
            case 'testSetDownloadDelegate001': {
              try {
                Utils.emitEvent(this.hasSetDownloadDelegate, 130090)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testStartDownload001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                await waitForExist(() => this.downloadUrl ? 1 : 0, this.str, 1);
                Utils.emitEvent(true, 130100)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testWebDownloadState001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                await waitForExist(() => this.currentDownloadState, this.str, webView.WebDownloadState.IN_PROGRESS);
                if ( this.currentDownloadState == webView.WebDownloadState.IN_PROGRESS) {
                  Utils.emitEvent(this.currentDownloadState, 130110)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testWebDownloadState002': {
              try {
                this.testCompleted = true
                this.controller.startDownload(this.downloadUrlImg);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testWebDownloadState003': {
              try {
                this.controller.startDownload(this.downloadUrl);
                await waitForExist(() => this.currentDownloadState, this.str, webView.WebDownloadState.IN_PROGRESS);
                if (this.downloadingItem) {
                  this.downloadingItem.cancel()
                }
                await waitForExist(() => this.currentDownloadState, this.str, webView.WebDownloadState.CANCELED);
                if ( this.currentDownloadState == webView.WebDownloadState.CANCELED) {
                  Utils.emitEvent(this.currentDownloadState, 130130)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testWebDownloadState004': {
              try {
                this.savePath = 'data/'
                this.controller.startDownload(this.downloadUrl);
                await waitForExist(() => this.currentDownloadState, this.str, webView.WebDownloadState.INTERRUPTED);
                if ( this.currentDownloadState == webView.WebDownloadState.INTERRUPTED) {
                  Utils.emitEvent(this.currentDownloadState, 130140)
                }

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testWebDownloadState005': {
              try {
                this.start = false
                this.controller.startDownload(this.downloadUrl);
                await waitForExist(() => this.currentDownloadState, this.str, webView.WebDownloadState.PENDING);
                if ( this.currentDownloadState == webView.WebDownloadState.PENDING) {
                  Utils.emitEvent(this.currentDownloadState, 130150)
                }

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testWebDownloadState006': {
              try {
                this.controller.startDownload(this.downloadUrl);
                console.log('testWebDownloadState006:' + this.currentDownloadState)
                await waitForExist(() => this.downloadingItem ? 1 : 0, this.str, 1);
                console.log('testWebDownloadState006 downloadItem', this.downloadingItem)
                if (this.downloadingItem) {
                  this.downloadingItem.pause()

                  console.log('testWebDownloadState006Pause')
                  console.log('testWebDownloadState006:' + this.currentDownloadState)
                }
                console.log('testWebDownloadState006:' + this.currentDownloadState)
                if(this.currentDownloadState == webView.WebDownloadState.PAUSED) {
                  Utils.emitEvent(webView.WebDownloadState.PAUSED, 130360)
                }
                console.log('testWebDownloadState006 downloadItem', this.downloadingItem)
                if (this.downloadingItem) {
                  this.downloadingItem.pause()
                  console.log('testWebDownloadState006Pause')
                  console.log('testWebDownloadState006:' + this.currentDownloadState)
                }
                console.log('testWebDownloadState006:' + this.currentDownloadState)
                await waitForExist(() => this.currentDownloadState, this.str, webView.WebDownloadState.PAUSED);
                if(this.currentDownloadState == webView.WebDownloadState.PAUSED) {
                  Utils.emitEvent(webView.WebDownloadState.PAUSED, 130360)
                }
                console.log('testWebDownloadState006:' + this.currentDownloadState)
                console.log('testWebDownloadState006 downloadItem', this.downloadingItem)
                await waitForExist(() => this.downloadingItem ? 1 : 0, this.str, 1);
                if (this.downloadingItem) {
                  this.downloadingItem.pause()
                  console.log('testWebDownloadState006Pause')
                  console.log('testWebDownloadState006:' + this.currentDownloadState)
                }
                if(this.currentDownloadState == webView.WebDownloadState.PAUSED) {
                  Utils.emitEvent(webView.WebDownloadState.PAUSED, 130360)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetGuid001': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await waitForExist(() => (this.guids.length >= 1) ? 1 : 0, this.str, 1);
                console.info('testGetGuid001 guids:' + this.guids)
                if (this.guids.length >= 1) {
                  Utils.emitEvent(true, 130160)
                }

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetGuid002': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await waitForExist(() => this.downloadingItem ? 1 : 0, this.str, 1);
                this.controller.startDownload(this.downloadUrlImg);
                await waitForExist(() => (this.guids.length >= 2) ? 1 : 0, this.str, 1);
                console.info('testGetGuid002 guids:' + this.guids)
                if(this.guids.length >= 2) {
                  Utils.emitEvent(true, 130170)
                }

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetCurrentSpeed001': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                for (let i=0; i< 5; i++) {
                  if ( this.currentSpeed >= 0 ) {
                    Utils.emitEvent(true, 130180)
                  }
                  await waitForExist(() => this.currentSpeed >= 0 ? 1 : 0, this.str, 1);
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetPercentComplete001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                await waitForExist(() => (this.percentComplete > 0 && this.percentComplete <= 100) ? 1 : 0, this.str, 1);
                if ( this.percentComplete > 0 && this.percentComplete <= 100 ) {
                  Utils.emitEvent(true , 130190)
                }

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetPercentComplete002': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await waitForExist(() => this.percentComplete == 100 ? 1 : 0, this.str, 1);
                if(this.percentComplete == 100) {
                  Utils.emitEvent(this.percentComplete == 100, 130200)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetTotalBytes001': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await waitForExist(() => this.downloadingItem ? 1 : 0, this.str, 1);
                console.log('testGetTotalBytes001:'+ this.totalBytes)
                for (let i=0; i< 3; i++) {
                  await waitForExist(() => (this.totalBytes > 0 && this.totalBytes >= 381400) ? 1 : 0, this.str, 1);
                  console.log('testGetTotalBytes001:'+ this.totalBytes)
                  if (this.totalBytes > 0 && this.totalBytes >= 381400) {
                    Utils.emitEvent(true, 130210)
                  }
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetMethod001': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await waitForExist(() => this.methods.length > 0 ? 1: 0, this.str, 1);
                console.info('testGetMethod001 methods:' + this.methods)
                if (this.methods.length > 0) {
                  Utils.emitEvent(true, 130220)
                }
                await waitForExist(() => this.methods.length > 0 ? 1: 0, this.str, 1);
                if (this.methods.length > 0) {
                  Utils.emitEvent(true, 130220)
                }
                await waitForExist(() => this.methods.length > 0 ? 1: 0, this.str, 1);
                if (this.methods.length > 0) {
                  Utils.emitEvent(true, 130220)
                }

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetMimeType001': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await waitForExist(() => (this.mimeTypes.indexOf('image/png') > -1) ? 1 : 0, this.str, 1);
                console.info('testGetMimeType001 mimeTypes:' + this.mimeTypes)
                if (this.mimeTypes.indexOf('image/png')>-1) {
                  Utils.emitEvent(true, 130230)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetMimeType002': {
              try {
                this.controller.startDownload(this.downloadUrlVideo);
                await waitForExist(() => (this.mimeTypes.indexOf('video/mp4') > -1) ? 1 : 0, this.str, 1);
                console.info('testGetMimeType002 mimeTypes:' + this.mimeTypes)
                if (this.mimeTypes.indexOf('video/mp4') > -1 ) {
                  Utils.emitEvent(true, 130240)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetMimeType003': {
              try {
                this.controller.startDownload(this.downloadUrl);
                await waitForExist(() => (this.mimeTypes.indexOf('application/x-msdownload') > -1) ? 1 : 0, this.str, 1);
                console.info('testGetMimeType003 mimeTypes:' + this.mimeTypes)
                if (this.mimeTypes.indexOf('application/x-msdownload') > -1) {
                  Utils.emitEvent(true, 130250)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetUrl001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                await waitForExist(() => (this.urls.indexOf(this.downloadUrl) > -1) ? 1 : 0, this.str, 1);
                console.info('testGetUrl001 urls:' + this.urls)
                if (this.urls.indexOf(this.downloadUrl) > -1) {
                  Utils.emitEvent(true, 130260)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetSuggestedFileName001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                await waitForExist(() => (this.downloadUrl.indexOf(this.suggestedFileName) > -1) ? 1 : 0, this.str, 1);
                if (this.downloadUrl.indexOf(this.suggestedFileName) > -1) {
                  Utils.emitEvent(true, 130270)
                }
                await waitForExist(() => (this.downloadUrl.indexOf(this.suggestedFileName) > -1) ? 1 : 0, this.str, 1);
                if (this.downloadUrl.indexOf(this.suggestedFileName) > -1) {
                  Utils.emitEvent(true, 130270)
                }
                await waitForExist(() => (this.downloadUrl.indexOf(this.suggestedFileName) > -1) ? 1 : 0, this.str, 1);
                if (this.downloadUrl.indexOf(this.suggestedFileName) > -1) {
                  Utils.emitEvent(true, 130270)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetReceivedBytes001': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await waitForExist(() => (this.receivedBytes > 0 && 
                  this.receivedBytes == this.totalBytes) ? 1 : 0, this.str, 1);
                if (this.receivedBytes > 0 && this.receivedBytes == this.totalBytes) {
                  Utils.emitEvent(true, 130280)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testGetFullPath001': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await waitForExist(() => (this.savePath == this.fullPath) ? 1 : 0, this.str, 1);
                console.log('testGetFullPath001:' + this.savePath + ' ' + this.fullPath)
                if ( this.savePath == this.fullPath ) {
                  Utils.emitEvent(true, 130290)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testSerialize001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                await waitForExist(() => this.downloadingItem ? 1 : 0, this.str, 1);
                if (this.downloadingItem) {
                  this.downloadingItem.cancel()
                }
                await waitForExist(() => (this.failedDownloadSerializedData && 
                  this.failedDownloadSerializedData.length > 0) ? 1 : 0, this.str, 1);
                if (this.failedDownloadSerializedData) {
                  if (this.failedDownloadSerializedData.length > 0) {
                    Utils.emitEvent(true, 130300)
                  }
                }
                await waitForExist(() => (this.failedDownloadSerializedData && 
                  this.failedDownloadSerializedData.length > 0) ? 1 : 0, this.str, 1);
                if (this.failedDownloadSerializedData) {
                  if (this.failedDownloadSerializedData.length > 0) {
                    Utils.emitEvent(true, 130300)
                  }
                }
                await waitForExist(() => (this.failedDownloadSerializedData && 
                  this.failedDownloadSerializedData.length > 0) ? 1 : 0, this.str, 1);
                if (this.failedDownloadSerializedData) {
                  if (this.failedDownloadSerializedData.length > 0) {
                    Utils.emitEvent(true, 130300)
                  }
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
                await waitForExist(() => this.downloadingItem ? 1 : 0, this.str, 1);
                if (this.downloadingItem) {
                  this.downloadingItem.cancel()
                  console.log('testDeserialize001 close')
                }
                for (let i = 0; i< 5; i++ ) {
                  await waitForExist(() => (this.failedDownloadSerializedData && 
                    this.failedDownload) ? 1 : 0, this.str, 1);
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
                    if( same ) {
                      Utils.emitEvent(same, 130310)
                    }
                  }
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testResume001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                await waitForExist(() => this.downloadingItem ? 1 : 0, this.str, 1);
                if (this.downloadingItem) {
                  this.downloadingItem.pause()
                }
                if (this.currentDownloadState == webView.WebDownloadState.PAUSED) {
                  if (this.downloadingItem) {
                    this.downloadingItem.resume()
                  }
                  if ( this.currentDownloadState == webView.WebDownloadState.IN_PROGRESS) {
                    Utils.emitEvent(webView.WebDownloadState.IN_PROGRESS, 130370)
                  }
                }
                await waitForExist(() => this.downloadingItem ? 1 : 0, this.str, 1);
                if (this.downloadingItem) {
                  this.downloadingItem.pause()
                }
                if (this.currentDownloadState == webView.WebDownloadState.PAUSED) {
                  if (this.downloadingItem) {
                    this.downloadingItem.resume()
                  }
                  if ( this.currentDownloadState == webView.WebDownloadState.IN_PROGRESS) {
                    Utils.emitEvent(webView.WebDownloadState.IN_PROGRESS, 130370)
                  }
                }
                if (this.downloadingItem) {
                  this.downloadingItem.pause()
                }
                await waitForExist(() => this.currentDownloadState, this.str, webView.WebDownloadState.PAUSED);
                if (this.currentDownloadState == webView.WebDownloadState.PAUSED) {
                  if (this.downloadingItem) {
                    this.downloadingItem.resume()
                  }
                  if ( this.currentDownloadState == webView.WebDownloadState.IN_PROGRESS) {
                    Utils.emitEvent(webView.WebDownloadState.IN_PROGRESS, 130370)
                  }
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testOnBeforeDownload001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                await waitForExist(() => this.onBeforeDownloadCalled ? 1 : 0, this.str, 1);
                if(this.onBeforeDownloadCalled) {
                  Utils.emitEvent(true, 130320)
                }

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testOnDownloadUpdated001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                await waitForExist(() => this.onDownloadUpdatedCalled ? 1 : 0, this.str, 1);
                Utils.emitEvent(this.onDownloadUpdatedCalled, 130330)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testOnDownloadFinish001': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                await waitForExist(() => this.onDownloadFinishCalled ? 1 : 0, this.str, 1);
                if(this.onDownloadFinishCalled) {
                  Utils.emitEvent(this.onDownloadFinishCalled, 130340)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testWebDownloadManagerSetDownloadDelegate001': {
              try {
                Utils.emitEvent(this.hasSetDownloadDelegate, 130350)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testResumeDownload001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                await waitForExist(() => this.downloadingItem ? 1 : 0, this.str, 1);
                for (let i=0;i++;i<3) {
                  if (this.downloadingItem) {
                    this.downloadingItem.cancel()
                  }
                  await waitForExist(() => this.currentDownloadState, this.str, webView.WebDownloadState.CANCELED);
                  if (this.currentDownloadState == webView.WebDownloadState.CANCELED) {
                    if (this.downloadingItem) {
                      webView.WebDownloadManager.resumeDownload(this.downloadingItem)
                    }
                    if (this.currentDownloadState == webView.WebDownloadState.IN_PROGRESS) {
                      Utils.emitEvent(webView.WebDownloadState.IN_PROGRESS, 130380)
                    }
                  }
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
          if (!this.hasSetDownloadDelegate) {
            try {
              this.delegate.onBeforeDownload((webDownloadItem: webView.WebDownloadItem) => {
                this.onBeforeDownloadCalled = true;
                if(this.onBeforeDownloadCalled) {
                  Utils.emitEvent(true, 130320)
                }
                this.currentDownloadState = webDownloadItem.getState();
                if ( this.currentDownloadState == webView.WebDownloadState.IN_PROGRESS) {
                  Utils.emitEvent(webView.WebDownloadState.IN_PROGRESS, 130110)
                }
                if ( this.currentDownloadState == webView.WebDownloadState.CANCELED) {
                  Utils.emitEvent(webView.WebDownloadState.CANCELED, 130130)
                }
                if ( this.currentDownloadState == webView.WebDownloadState.INTERRUPTED) {
                  Utils.emitEvent(webView.WebDownloadState.INTERRUPTED, 130140)
                }

                if(this.currentDownloadState == webView.WebDownloadState.PAUSED) {
                  Utils.emitEvent(webView.WebDownloadState.PAUSED, 130360)
                }
                if ( this.currentDownloadState == webView.WebDownloadState.PENDING) {
                  Utils.emitEvent(webView.WebDownloadState.PENDING, 130150)
                }
                if (this.guids.indexOf(webDownloadItem.getGuid()) < 0) {
                  this.guids.push(webDownloadItem.getGuid());
                }
                if ( this.str == 'testGetGuid001') {
                  if (this.guids.length >= 1) {
                    Utils.emitEvent(true, 130160)
                  }
                }
                if ( this.str == 'testGetGuid002') {
                  if (this.guids.length >= 2) {
                    Utils.emitEvent(true, 130170)
                  }
                }
                if (this.methods.indexOf(webDownloadItem.getMethod()) < 0) {
                  this.methods.push(webDownloadItem.getMethod());
                }
                if (this.mimeTypes.indexOf(webDownloadItem.getMimeType()) < 0) {
                  this.mimeTypes.push(webDownloadItem.getMimeType());
                }
                if (this.mimeTypes.indexOf('application/x-msdownload') > -1) {
                  Utils.emitEvent(true, 130250)
                }
                if (this.mimeTypes.indexOf('video/mp4') > -1) {
                  Utils.emitEvent(true, 130240)
                }
                if (this.mimeTypes.indexOf('image/png') > -1) {
                  Utils.emitEvent(true, 130230)
                }
                if (this.urls.indexOf(webDownloadItem.getUrl()) < 0) {
                  this.urls.push(webDownloadItem.getUrl());
                }
                if (this.urls.indexOf(this.downloadUrl) > -1) {
                  Utils.emitEvent(true, 130260)
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
                this.downloadingItem = webDownloadItem;
                this.onDownloadUpdatedCalled = true;
                this.currentDownloadState = webDownloadItem.getState();
                this.fullPath = webDownloadItem.getFullPath();
                if ( this.savePath == this.fullPath ) {
                  Utils.emitEvent(true, 130290)
                }
                if ( this.currentDownloadState == webView.WebDownloadState.IN_PROGRESS) {
                  Utils.emitEvent(this.currentDownloadState, 130110)
                }
                if ( this.currentDownloadState == webView.WebDownloadState.CANCELED) {
                  Utils.emitEvent(this.currentDownloadState, 130130)
                }
                if ( this.currentDownloadState == webView.WebDownloadState.INTERRUPTED) {
                  Utils.emitEvent(this.currentDownloadState, 130140)
                }

                if(this.currentDownloadState == webView.WebDownloadState.PAUSED) {
                  Utils.emitEvent(webView.WebDownloadState.PAUSED, 130360)
                }
                if ( this.currentDownloadState == webView.WebDownloadState.PENDING) {
                  Utils.emitEvent(this.currentDownloadState, 130150)
                }
                if (this.guids.indexOf(webDownloadItem.getGuid()) < 0) {
                  this.guids.push(webDownloadItem.getGuid());
                }

                if ( this.str == 'testGetGuid001') {
                  if (this.guids.length >= 1) {
                    Utils.emitEvent(true, 130160)
                  }

                }
                if ( this.str == 'testGetGuid002') {
                  if (this.guids.length >= 2) {
                    Utils.emitEvent(true, 130170)
                  }
                }
                if (this.methods.indexOf(webDownloadItem.getMethod()) < 0) {
                  this.methods.push(webDownloadItem.getMethod());
                }
                if (this.mimeTypes.indexOf(webDownloadItem.getMimeType()) < 0) {
                  this.mimeTypes.push(webDownloadItem.getMimeType());
                }
                if (this.mimeTypes.indexOf('application/x-msdownload') > -1) {
                  Utils.emitEvent(true, 130250)
                }
                if (this.mimeTypes.indexOf('video/mp4') > -1) {
                  Utils.emitEvent(true, 130240)
                }
                if (this.mimeTypes.indexOf('image/png') > -1) {
                  Utils.emitEvent(true, 130230)
                }
                if (this.urls.indexOf(webDownloadItem.getUrl()) < 0) {
                  this.urls.push(webDownloadItem.getUrl());
                }
                if (this.urls.indexOf(this.downloadUrl) > -1) {
                  Utils.emitEvent(true, 130260)
                }
                if (this.currentSpeed <= 0) {
                  this.currentSpeed = webDownloadItem.getCurrentSpeed();
                }
                this.percentComplete = webDownloadItem.getPercentComplete();
                if ( this.str == 'testGetPercentComplete001') {
                  if ( this.percentComplete > 0 && this.percentComplete <= 100 ) {
                    Utils.emitEvent(true , 130190)
                  }
                }

                this.totalBytes = webDownloadItem.getTotalBytes();
                this.receivedBytes = webDownloadItem.getReceivedBytes();
                if (this.receivedBytes > 0 && this.receivedBytes == this.totalBytes) {
                  Utils.emitEvent(true, 130280)
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
              this.delegate.onDownloadFailed((webDownloadItem: webView.WebDownloadItem) => {
                this.onDownloadFailedCalled = true;
                this.currentDownloadState = webDownloadItem.getState();
                if ( this.currentDownloadState == webView.WebDownloadState.CANCELED) {
                  Utils.emitEvent(this.currentDownloadState, 130130)
                }
                if ( this.currentDownloadState == webView.WebDownloadState.INTERRUPTED) {
                  Utils.emitEvent(this.currentDownloadState, 130140)
                }

                if(this.currentDownloadState == webView.WebDownloadState.PAUSED) {
                  Utils.emitEvent(webView.WebDownloadState.PAUSED, 130360)
                }
                if ( this.currentDownloadState == webView.WebDownloadState.PENDING) {
                  Utils.emitEvent(this.currentDownloadState, 130150)
                }
                if (this.guids.indexOf(webDownloadItem.getGuid()) < 0) {
                  this.guids.push(webDownloadItem.getGuid());
                }

                if ( this.str == 'testGetGuid001') {
                  if (this.guids.length >= 1) {
                    Utils.emitEvent(true, 130160)
                  }

                }
                if ( this.str == 'testGetGuid002') {
                  if (this.guids.length >= 2) {
                    Utils.emitEvent(true, 130170)
                  }
                }
                if (this.methods.indexOf(webDownloadItem.getMethod()) < 0) {
                  this.methods.push(webDownloadItem.getMethod());
                }
                if (this.mimeTypes.indexOf(webDownloadItem.getMimeType()) < 0) {
                  this.mimeTypes.push(webDownloadItem.getMimeType());
                }
                if (this.mimeTypes.indexOf('application/x-msdownload') > -1) {
                  Utils.emitEvent(true, 130250)
                }
                if (this.mimeTypes.indexOf('video/mp4') > -1) {
                  Utils.emitEvent(true, 130240)
                }
                if (this.mimeTypes.indexOf('image/png') > -1) {
                  Utils.emitEvent(true, 130230)
                }
                if (this.urls.indexOf(webDownloadItem.getUrl()) < 0) {
                  this.urls.push(webDownloadItem.getUrl());
                }
                if (this.urls.indexOf(this.downloadUrl) > -1) {
                  Utils.emitEvent(true, 130260)
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
                Utils.emitEvent(this.onDownloadFinishCalled, 130340)
                this.currentDownloadState = webDownloadItem.getState();
                if (this.guids.indexOf(webDownloadItem.getGuid()) < 0) {
                  this.guids.push(webDownloadItem.getGuid());
                }

                if ( this.str == 'testGetGuid001') {
                  if (this.guids.length >= 1) {
                    Utils.emitEvent(true, 130160)
                  }

                }
                if ( this.str == 'testGetGuid002') {
                  if (this.guids.length >= 2) {
                    Utils.emitEvent(true, 130170)
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
                  Utils.emitEvent(true, 130280)
                }
                this.fullPath = webDownloadItem.getFullPath();
                if ( this.savePath == this.fullPath ) {
                  Utils.emitEvent(true, 130290)
                }
                console.log('download finish method:' + webDownloadItem.getMethod());
                console.log('download finish guid: ' + webDownloadItem.getGuid());
                this.percentComplete = webDownloadItem.getPercentComplete();
                if ( this.str == 'testGetPercentComplete001') {
                  if ( this.percentComplete > 0 && this.percentComplete <= 100 ) {
                    Utils.emitEvent(true , 130190)
                  }
                }
                if ( this.str == 'testGetPercentComplete002') {
                  if ( this.percentComplete == 100 ) {
                    Utils.emitEvent(true , 130200)
                  }
                }
                if (this.testCompleted) {
                  Utils.emitEvent(this.currentDownloadState, 130120)
                  this.testCompleted = false
                }
              })

              this.controller.setDownloadDelegate(this.delegate);
              webView.WebDownloadManager.setDownloadDelegate(this.delegate);
              this.hasSetDownloadDelegate = true
              console.log('web pageEnd==>' + event.url);
              this.isPageEnd = 0;
            } catch (error) {
              let e: business_error.BusinessError = error as business_error.BusinessError;
              console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
            }
          }
        })
    }
  }
}