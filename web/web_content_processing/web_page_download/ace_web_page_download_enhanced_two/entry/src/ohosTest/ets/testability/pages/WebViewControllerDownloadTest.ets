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

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
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
    events_emitter.off(10)
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
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebViewControllerDownloadTestButton')
          .key('WebViewControllerDownloadTestButton').onClick(async () => {
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'testSetDownloadDelegate001': {
              try {
                let check = (v1: boolean, v2: boolean): boolean => {
                  return v1 ? true: false;
                };
                await waitForAssert(()=>this.hasSetDownloadDelegate, check, true, 79520, this.str);

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              await Utils.sleep(1000)
              this.download.cancel();
              await Utils.sleep(1000)
              break;
            }
            case 'testStartDownload001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                await Utils.sleep(3000)
                Utils.emitEvent(true, 79530)

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              await Utils.sleep(1000)
              this.download.cancel();
              await Utils.sleep(1000)
              break;
            }
            case 'testWebDownloadState001': {
              try {
                this.controller.startDownload(this.downloadUrl);

                let check = (v1: number, v2: number): boolean => {
                  return v1 == v2 ? true: false;
                }
                await waitForAssert(()=>this.currentDownloadState, check, webView.WebDownloadState.IN_PROGRESS,
                  79540, this.str);

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              await Utils.sleep(3000)
              this.download.cancel();
              await Utils.sleep(3000)
              break;
            }
            case 'testWebDownloadState002': {
              try {
                this.controller.startDownload(this.downloadUrlImg);
                let check = (v1: number, v2: number): boolean => {
                  return v1 == v2 ? true:false;
                }
                await waitForAssert(()=>this.currentDownloadState, check, webView.WebDownloadState.COMPLETED,
                  79542, this.str);

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              await Utils.sleep(3000)
              this.download.cancel();
              await Utils.sleep(3000)
              break;
            }
            case 'testWebDownloadState003': {
              try {
                this.controller.startDownload(this.downloadUrl);
                await waitForExist(()=>this.downloadingItem, this.str)
                if (this.downloadingItem) {
                  this.downloadingItem.cancel()
                }
                let check = (v1: number, v2: number): boolean => {
                  return v1 == v2 ? true:false;
                }
                await waitForAssert(()=>this.currentDownloadState, check, webView.WebDownloadState.CANCELED,
                  79544, this.str);

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              await Utils.sleep(3000)
              this.download.cancel();
              await Utils.sleep(3000)
              break;
            }
            case 'testWebDownloadState004': {
              try {
                this.savePath = 'data/'
                this.controller.startDownload(this.downloadUrl);

                let check = (v1:number, v2:number):boolean => {
                  return v1 == v2 ? true:false;
                }
                await waitForAssert(()=>this.currentDownloadState, check, webView.WebDownloadState.INTERRUPTED,
                  79546, this.str);

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              await Utils.sleep(3000)
              this.download.cancel();
              await Utils.sleep(3000)
              break;
            }
            case 'testWebDownloadState005': {
              try {
                this.start = false
                this.controller.startDownload(this.downloadUrl);

                let check = (v1: number, v2: number): boolean => {
                  return v1 == v2 ? true: false;
                }
                await waitForAssert(()=>this.currentDownloadState, check, webView.WebDownloadState.PENDING,
                  79548, this.str);

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              await Utils.sleep(3000)
              this.download.cancel();
              await Utils.sleep(3000)
              break;
            }
            case 'testWebDownloadState006': {
              try {
                this.controller.startDownload(this.downloadUrl);

                await waitForExist(()=>this.downloadingItem, this.str)
                if (this.downloadingItem) {
                  this.downloadingItem.pause()
                }
                let check = (v1: number, v2: number): boolean => {
                  return v1 == v2 ? true: false;
                }
                await waitForAssert(()=>this.currentDownloadState, check, webView.WebDownloadState.PAUSED,
                  79550, this.str);

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              await Utils.sleep(3000)
              this.download.cancel();
              await Utils.sleep(3000)
              break;
            }
            case 'testResume001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                await waitForExist(()=>this.downloadingItem, this.str)
                if (this.downloadingItem) {
                  this.downloadingItem.pause()
                }
                await waitForExist(()=>this.currentDownloadState, this.str, webView.WebDownloadState.PAUSED)
                if (this.currentDownloadState == webView.WebDownloadState.PAUSED) {
                  await waitForExist(()=>this.downloadingItem, this.str)
                  if (this.downloadingItem) {
                    this.downloadingItem.resume()
                  }
                  let check = (v1: number, v2: number): boolean => {
                    return v1 == v2 ? true: false;
                  }
                  await waitForAssert(()=>this.currentDownloadState, check, webView.WebDownloadState.IN_PROGRESS,
                    79692, this.str);

                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              await Utils.sleep(3000)
              this.download.cancel();
              await Utils.sleep(3000)
              break;
            }
            case 'testOnBeforeDownload001': {
              try {
                this.controller.startDownload(this.downloadUrl);

                let check = (v1: boolean, v2: boolean): boolean => {
                  return v1 ? true: false;
                }
                await waitForAssert(()=>this.onBeforeDownloadCalled, check, true, 79700, this.str);

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              await Utils.sleep(3000)
              this.download.cancel();
              await Utils.sleep(3000)
              break;
            }
            case 'testOnDownloadUpdated001': {
              try {
                this.controller.startDownload(this.downloadUrl);

                let check = (v1: boolean, v2: boolean): boolean => {
                  return v1 ? true: false;
                }
                await waitForAssert(()=>this.onDownloadUpdatedCalled, check, true, 79702, this.str);

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              await Utils.sleep(1000)
              this.download.cancel();
              await Utils.sleep(1000)
              break;
            }
            case 'testOnDownloadFinish001': {
              try {
                this.controller.startDownload(this.downloadUrlImg);

                let check = (v1: boolean, v2: boolean): boolean => {
                  return v1 ? true: false;
                }
                await waitForAssert(()=>this.onDownloadFinishCalled, check, true, 79704, this.str);

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              await Utils.sleep(1000)
              this.download.cancel();
              await Utils.sleep(1000)
              break;
            }
            case 'testWebDownloadManagerSetDownloadDelegate001': {
              try {
                let check = (v1: boolean, v2: boolean): boolean => {
                  return v1 ? true: false;
                }
                await waitForAssert(()=>this.hasSetDownloadDelegate, check, true, 79750, this.str);

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              await Utils.sleep(1000)
              this.download.cancel();
              await Utils.sleep(1000)
              break;
            }
            case 'testResumeDownload001': {
              try {
                this.controller.startDownload(this.downloadUrl);
                await waitForExist(()=>this.downloadingItem, this.str)
                if (this.downloadingItem) {
                  this.downloadingItem.cancel()
                }
                await waitForExist(()=>this.currentDownloadState, this.str, webView.WebDownloadState.CANCELED)
                if (this.currentDownloadState == webView.WebDownloadState.CANCELED) {
                  await waitForExist(()=>this.downloadingItem, this.str)
                  if (this.downloadingItem) {
                    webView.WebDownloadManager.resumeDownload(this.downloadingItem)
                  }
                  let check = (v1: number, v2: number): boolean => {
                    return v1 == v2 ? true:false;
                  }
                  await waitForAssert(()=>this.currentDownloadState, check, webView.WebDownloadState.IN_PROGRESS,
                    79752, this.str);
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              await Utils.sleep(1000)
              this.download.cancel();
              await Utils.sleep(1000)
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
