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
  @State hasInitDownloadDelegate: boolean = false;
  @State savePath: string = '';
  downloadingItem: webView.WebDownloadItem | null = null
  failedDownloadSerializedData: Uint8Array | null = null;
  failedDownload: webView.WebDownloadItem | null = null;
  @State stressTimes: number = 0;
  @State successTimes: number = 0;
  @State testOnBeforeDownload: boolean = false;
  @State testOnDownloadUpdated: boolean = false;
  @State testOnDownloadFailed: boolean = false;
  @State testOnDownloadFinish: boolean = false;
  @State testStart: boolean = false;
  @State testStartDownload: boolean = false;
  @State callBackId: number = 0;
  @State buttonKey: string = '';

  onPageShow() {
    Utils.registerEventPage((eventData: events_emitter.EventData) => {
      if (eventData.data) {
        this.str = eventData.data.CASE_NAME;
        this.callBackId = eventData.data.CALL_BACK_ID;
        this.stressTimes = eventData.data.STRESS_TIMES;
        this.buttonKey = eventData.data.BUTTON_KEY
        this.downloadingItem = null
        this.savePath = Utils.getSandboxFileDir() + 'testDownloadFileFile'
        this.failedDownloadSerializedData = null
        this.failedDownload = null
        this.successTimes = 0
        this.testOnBeforeDownload = false;
        this.testOnDownloadUpdated = false;
        this.testOnDownloadFailed = false;
        this.testOnDownloadFinish = false;
        this.testStart = false;
        this.testStartDownload = false;
      }
    })

    events_emitter.on({ eventId: 11, priority: events_emitter.EventPriority.LOW }, () => {
      console.info("AfterEach release the download progress.")
      if (this.downloadingItem) {
        console.info("Call downloadingItem.cancel guid:" + this.downloadingItem.getGuid())
        this.downloadingItem.cancel()
      }
    })
  }

  onPageHide() {
    Utils.unRegisterEventPage()
    events_emitter.off(11)
  }

  build() {
    Column() {
      Row() {
        Button(this.buttonKey)
          .key(this.buttonKey)
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {
              case "testSetDownloadDelegate001": {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.setDownloadDelegate(this.delegate);
                    Utils.stressingLog('WebViewController.setDownloadDelegate()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testStartDownload001": {
                try {
                  this.testStartDownload = true
                  this.savePath = '/data'
                  this.controller.startDownload(this.downloadUrl);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testGetGuid001": {
                try {
                  this.controller.startDownload(this.downloadUrl);
                  await Utils.sleep(6000)
                  if (this.downloadingItem) {
                    for (let i = 0; i < this.stressTimes; i++) {
                      this.downloadingItem.getGuid();
                      Utils.stressingLog('WebDownloadItem.getGuid()', i + 1, this.stressTimes)
                    }
                    Utils.emitEvent(true, this.callBackId)
                  } else {
                    console.error('Download item is null');
                    Utils.emitEvent(false, this.callBackId)
                  }
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testGetCurrentSpeed001": {
                try {
                  this.controller.startDownload(this.downloadUrl);
                  await Utils.sleep(6000)
                  if (this.downloadingItem) {
                    for (let i = 0; i < this.stressTimes; i++) {
                      this.downloadingItem.getCurrentSpeed();
                      Utils.stressingLog('WebDownloadItem.getCurrentSpeed()', i + 1, this.stressTimes)
                    }
                    Utils.emitEvent(true, this.callBackId)
                  } else {
                    console.error('Download item is null');
                    Utils.emitEvent(false, this.callBackId)
                  }
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testGetPercentComplete001": {
                try {
                  this.controller.startDownload(this.downloadUrl);
                  await Utils.sleep(6000)
                  if (this.downloadingItem) {
                    for (let i = 0; i < this.stressTimes; i++) {
                      this.downloadingItem.getPercentComplete();
                      Utils.stressingLog('WebDownloadItem.getPercentComplete()', i + 1, this.stressTimes)
                    }
                    Utils.emitEvent(true, this.callBackId)
                  } else {
                    console.error('Download item is null');
                    Utils.emitEvent(false, this.callBackId)
                  }
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testGetTotalBytes001": {
                try {
                  this.controller.startDownload(this.downloadUrl);
                  await Utils.sleep(6000)
                  if (this.downloadingItem) {
                    for (let i = 0; i < this.stressTimes; i++) {
                      this.downloadingItem.getTotalBytes();
                      Utils.stressingLog('WebDownloadItem.getTotalBytes()', i + 1, this.stressTimes)
                    }
                    Utils.emitEvent(true, this.callBackId)
                  } else {
                    console.error('Download item is null');
                    Utils.emitEvent(false, this.callBackId)
                  }
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testGetState001": {
                try {
                  this.controller.startDownload(this.downloadUrl);
                  await Utils.sleep(6000)
                  if (this.downloadingItem) {
                    for (let i = 0; i < this.stressTimes; i++) {
                      this.downloadingItem.getState();
                      Utils.stressingLog('WebDownloadItem.getState()', i + 1, this.stressTimes)
                    }
                    Utils.emitEvent(true, this.callBackId)
                  } else {
                    console.error('Download item is null');
                    Utils.emitEvent(false, this.callBackId)
                  }
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testGetLastErrorCode001": {
                try {
                  this.controller.startDownload(this.downloadUrl);
                  await Utils.sleep(6000)
                  if (this.downloadingItem) {
                    for (let i = 0; i < this.stressTimes; i++) {
                      this.downloadingItem.getLastErrorCode();
                      Utils.stressingLog('WebDownloadItem.getLastErrorCode()', i + 1, this.stressTimes)
                    }
                    Utils.emitEvent(true, this.callBackId)
                  } else {
                    console.error('Download item is null');
                    Utils.emitEvent(false, this.callBackId)
                  }
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testGetMethod001": {
                try {
                  this.controller.startDownload(this.downloadUrl);
                  await Utils.sleep(6000)
                  if (this.downloadingItem) {
                    for (let i = 0; i < this.stressTimes; i++) {
                      this.downloadingItem.getMethod();
                      Utils.stressingLog('WebDownloadItem.getMethod()', i + 1, this.stressTimes)
                    }
                    Utils.emitEvent(true, this.callBackId)
                  } else {
                    console.error('Download item is null');
                    Utils.emitEvent(false, this.callBackId)
                  }
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testGetMimeType001": {
                try {
                  this.controller.startDownload(this.downloadUrl);
                  await Utils.sleep(6000)
                  if (this.downloadingItem) {
                    for (let i = 0; i < this.stressTimes; i++) {
                      this.downloadingItem.getMimeType();
                      Utils.stressingLog('WebDownloadItem.getMimeType()', i + 1, this.stressTimes)
                    }
                    Utils.emitEvent(true, this.callBackId)
                  } else {
                    console.error('Download item is null');
                    Utils.emitEvent(false, this.callBackId)
                  }
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testGetUrl001": {
                try {
                  this.controller.startDownload(this.downloadUrl);
                  await Utils.sleep(6000)
                  if (this.downloadingItem) {
                    for (let i = 0; i < this.stressTimes; i++) {
                      this.downloadingItem.getUrl();
                      Utils.stressingLog('WebDownloadItem.getUrl()', i + 1, this.stressTimes)
                    }
                    Utils.emitEvent(true, this.callBackId)
                  } else {
                    console.error('Download item is null');
                    Utils.emitEvent(false, this.callBackId)
                  }
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testGetSuggestedFileName001": {
                try {
                  this.controller.startDownload(this.downloadUrl);
                  await Utils.sleep(6000)
                  if (this.downloadingItem) {
                    for (let i = 0; i < this.stressTimes; i++) {
                      this.downloadingItem.getSuggestedFileName();
                      Utils.stressingLog('WebDownloadItem.getSuggestedFileName()', i + 1, this.stressTimes)
                    }
                    Utils.emitEvent(true, this.callBackId)
                  } else {
                    console.error('Download item is null');
                    Utils.emitEvent(false, this.callBackId)
                  }
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testGetReceivedBytes001": {
                try {
                  this.controller.startDownload(this.downloadUrl);
                  await Utils.sleep(6000)
                  if (this.downloadingItem) {
                    for (let i = 0; i < this.stressTimes; i++) {
                      this.downloadingItem.getReceivedBytes();
                      Utils.stressingLog('WebDownloadItem.getReceivedBytes()', i + 1, this.stressTimes)
                    }
                    Utils.emitEvent(true, this.callBackId)
                  } else {
                    console.error('Download item is null');
                    Utils.emitEvent(false, this.callBackId)
                  }
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testGetFullPath001": {
                try {
                  this.controller.startDownload(this.downloadUrl);
                  await Utils.sleep(6000)
                  if (this.downloadingItem) {
                    for (let i = 0; i < this.stressTimes; i++) {
                      this.downloadingItem.getFullPath();
                      Utils.stressingLog('WebDownloadItem.getFullPath()', i + 1, this.stressTimes)
                    }
                    Utils.emitEvent(true, this.callBackId)
                  } else {
                    console.error('Download item is null');
                    Utils.emitEvent(false, this.callBackId)
                  }
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testSerialize001": {
                try {
                  this.controller.startDownload(this.downloadUrl);
                  await Utils.sleep(6000)
                  if (this.downloadingItem) {
                    this.downloadingItem.cancel()
                  }
                  await Utils.sleep(2000)
                  if (this.failedDownload) {
                    for (let i = 0; i < this.stressTimes; i++) {
                      this.failedDownload.serialize();
                      Utils.stressingLog('WebDownloadItem.serialize()', i + 1, this.stressTimes)
                    }
                    Utils.emitEvent(true, this.callBackId)
                  } else {
                    console.error('Download item is null');
                    Utils.emitEvent(false, this.callBackId)
                  }
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testDeserialize001": {
                try {
                  this.controller.startDownload(this.downloadUrl);
                  await Utils.sleep(6000)
                  if (this.downloadingItem) {
                    this.downloadingItem.cancel()
                  }
                  await Utils.sleep(2000)
                  if (this.failedDownloadSerializedData) {
                    for (let i = 0; i < this.stressTimes; i++) {
                      webView.WebDownloadItem.deserialize(this.failedDownloadSerializedData)
                      Utils.stressingLog('WebDownloadItem.deserialize()', i + 1, this.stressTimes)
                    }
                    Utils.emitEvent(true, this.callBackId)
                  } else {
                    console.error('Download item is null');
                    Utils.emitEvent(false, this.callBackId)
                  }
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case "testStart001": {
                try {
                  this.testStart = true
                  this.controller.startDownload(this.downloadUrl);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case "testCancel001": {
                try {
                  this.controller.startDownload(this.downloadUrl);
                  await Utils.sleep(6000)
                  if (this.downloadingItem) {
                    for (let i = 0; i < this.stressTimes; i++) {
                      this.downloadingItem.cancel();
                      Utils.stressingLog('WebDownloadItem.cancel()', i + 1, this.stressTimes)
                    }
                    Utils.emitEvent(true, this.callBackId)
                  } else {
                    console.error('Download item is null');
                    Utils.emitEvent(false, this.callBackId)
                  }
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testPause001": {
                try {
                  this.controller.startDownload(this.downloadUrl);
                  await Utils.sleep(6000)
                  if (this.downloadingItem) {
                    for (let i = 0; i < this.stressTimes; i++) {
                      this.downloadingItem.pause()
                      Utils.stressingLog('WebDownloadItem.pause()', i + 1, this.stressTimes)
                    }
                    Utils.emitEvent(true, this.callBackId)
                  } else {
                    console.error('Download item is null');
                    Utils.emitEvent(false, this.callBackId)
                  }
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testResume001": {
                try {
                  this.controller.startDownload(this.downloadUrl);
                  await Utils.sleep(6000)
                  if (this.downloadingItem) {
                    this.downloadingItem.pause()
                    await Utils.sleep(3000)
                    for (let i = 0; i < this.stressTimes; i++) {
                      this.downloadingItem.resume()
                      Utils.stressingLog('WebDownloadItem.resume()', i + 1, this.stressTimes)
                    }
                    Utils.emitEvent(true, this.callBackId)
                  } else {
                    console.error('Download item is null');
                    Utils.emitEvent(false, this.callBackId)
                  }
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testOnBeforeDownload001": {
                try {
                  this.testOnBeforeDownload = true
                  await Utils.sleep(1000)
                  this.controller.startDownload(this.downloadUrl);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case "testOnDownloadUpdated001": {
                try {
                  this.testOnDownloadUpdated = true
                  await Utils.sleep(1000)
                  this.controller.startDownload(this.downloadUrl);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case "testOnDownloadFailed001": {
                try {
                  this.testOnDownloadFailed = true
                  this.savePath = 'data/'
                  await Utils.sleep(1000)
                  this.controller.startDownload(this.downloadUrl);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case "testOnDownloadFinish001": {
                try {
                  this.testOnDownloadFinish = true
                  await Utils.sleep(1000)
                  this.controller.startDownload(this.downloadUrlImg);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case "testWebDownloadManagerSetDownloadDelegate001": {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.setDownloadDelegate(this.delegate);
                    Utils.stressingLog('WebDownloadManager.setDownloadDelegate()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testResumeDownload001": {
                try {
                  this.controller.startDownload(this.downloadUrl);
                  await Utils.sleep(6000)
                  if (this.downloadingItem) {
                    this.downloadingItem.cancel()
                  }
                  await Utils.sleep(2000)
                  if (this.downloadingItem) {
                    for (let i = 0; i < this.stressTimes; i++) {
                      webView.WebDownloadManager.resumeDownload(this.downloadingItem)
                      Utils.stressingLog('WebDownloadItem.resume()', i + 1, this.stressTimes)
                    }
                    Utils.emitEvent(true, this.callBackId)
                  } else {
                    console.error('Download item is null');
                    Utils.emitEvent(false, this.callBackId)
                  }
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, this.callBackId)
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
          if (!this.hasInitDownloadDelegate) {
            try {
              this.delegate.onBeforeDownload((webDownloadItem: webView.WebDownloadItem) => {
                console.log("will start a download guid:" + webDownloadItem.getGuid());
                console.log("will start a download method:" + webDownloadItem.getMethod());
                console.log("will start a download mime type:" + webDownloadItem.getMimeType());
                console.log("will start a download url:" + webDownloadItem.getUrl());
                console.log("will start a download suggest name:" + webDownloadItem.getSuggestedFileName());

                if (this.testOnBeforeDownload) {
                  this.successTimes++
                  webDownloadItem.cancel()
                  Utils.stressingLog('WebDownloadDelegate.onBeforeDownload()', this.successTimes, this.stressTimes)
                  if (this.successTimes < this.stressTimes) {
                    try {
                      this.controller.startDownload(this.downloadUrl)
                    } catch (error) {
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      Utils.emitEvent(false, this.callBackId)
                    }
                  } else {
                    Utils.emitEvent(true, this.callBackId)
                  }
                } else {
                  if (this.testStart) {
                    try {
                      this.testStart = false
                      for (let i = 0; i < this.stressTimes; i++) {
                        webDownloadItem.start(this.savePath)
                        Utils.stressingLog('WebDownloadItem.start()', i + 1, this.stressTimes)
                      }
                      Utils.emitEvent(true, this.callBackId)
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(false, this.callBackId)
                    }
                    webDownloadItem.cancel()
                  } else if (this.testStartDownload) {
                    this.successTimes++
                    webDownloadItem.cancel()
                    Utils.stressingLog('WebViewController.startDownload()', this.successTimes, this.stressTimes)
                    if (this.successTimes < this.stressTimes) {
                      try {
                        this.controller.startDownload(this.downloadUrl)
                      } catch (error) {
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                        Utils.emitEvent(false, this.callBackId)
                      }
                    } else {
                      Utils.emitEvent(true, this.callBackId)
                    }
                  } else {
                    webDownloadItem.start(this.savePath);
                  }
                }
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webView.WebDownloadItem) => {
                if (this.testOnDownloadUpdated) {
                  this.successTimes++
                  webDownloadItem.cancel()
                  Utils.stressingLog('WebDownloadDelegate.onDownloadUpdated()', this.successTimes, this.stressTimes)
                  if (this.successTimes < this.stressTimes) {
                    try {
                      this.controller.startDownload(this.downloadUrl)
                    } catch (error) {
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      Utils.emitEvent(false, this.callBackId)
                    }
                  } else {
                    Utils.emitEvent(true, this.callBackId)
                  }
                }
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
                console.log("download failed method:" + webDownloadItem.getMethod());
                console.log("download failed guid: " + webDownloadItem.getGuid());
                console.log("download failed lastErrorCode: " + webDownloadItem.getLastErrorCode());
                webDownloadItem.cancel()
                if (this.testOnDownloadFailed) {
                  this.successTimes++
                  Utils.stressingLog('WebDownloadDelegate.onDownloadFailed()', this.successTimes, this.stressTimes)
                  if (this.successTimes < this.stressTimes) {
                    try {
                      this.controller.startDownload(this.downloadUrl)
                    } catch (error) {
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      Utils.emitEvent(false, this.callBackId)
                    }
                  } else {
                    Utils.emitEvent(true, this.callBackId)
                  }
                } else {
                  this.failedDownload = webDownloadItem;
                  this.failedDownloadSerializedData = webDownloadItem.serialize();
                }
              })
              this.delegate.onDownloadFinish((webDownloadItem: webView.WebDownloadItem) => {
                if (this.testOnDownloadFinish) {
                  this.successTimes++
                  Utils.stressingLog('WebDownloadDelegate.testOnDownloadFinish()', this.successTimes, this.stressTimes)
                  if (this.successTimes < this.stressTimes) {
                    try {
                      this.controller.startDownload(this.downloadUrlImg)
                    } catch (error) {
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      Utils.emitEvent(false, this.callBackId)
                    }
                  } else {
                    Utils.emitEvent(true, this.callBackId)
                  }
                }
                console.log("download finish method:" + webDownloadItem.getMethod());
                console.log("download finish guid: " + webDownloadItem.getGuid());
              })
              this.controller.setDownloadDelegate(this.delegate);
              webView.WebDownloadManager.setDownloadDelegate(this.delegate);
              this.hasInitDownloadDelegate = true
            } catch (error) {
              let e: business_error.BusinessError = error as business_error.BusinessError;
              console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
            }
          }
        })
    }
  }
}