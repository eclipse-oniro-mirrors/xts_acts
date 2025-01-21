/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import business_error from '@ohos.base';

@Entry
@Component
struct webDownloadErrorCode {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerNull: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  delegate: webView.WebDownloadDelegate = new webView.WebDownloadDelegate();
  @State downloadUrl: string = 'https://consumer.huawei.com/content/dam/' +
  'huawei-cbg-site/cn/mkt/mobileservices/2022/download/' +
  'PC107f1b3947c942ffaa14334a879065d8.2107261020.exe'
  @State downloadUrlImg: string = 'https://consumer.huawei.com/content/dam/huawei-cbg-site/cn/mkt/pdp/tablets/' +
  'matepad-pro-11-2024/assets/imgs/pc/huawei-matepad-11-inch-Huawei-sound.png';
  @State hasSetDownloadDelegate: boolean = false;
  @State savePath: string = Utils.getSandboxFileDir() + 'testDownloadFile';
  downloadItem: webView.WebDownloadItem | null = null
  @State start: boolean = true;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)

    events_emitter.on({ eventId: 11, priority: events_emitter.EventPriority.LOW }, () => {
      console.info("AfterEach release the download progress.")
      if (this.downloadItem) {
        console.info("Call downloadingItem.cancel guid:" + this.downloadItem.getGuid())
        this.downloadItem.cancel()
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
        this.start = true;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebDownloadErrorCodeButton").key('WebDownloadErrorCodeButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "testSetDownloadDelegate001": {
              try {
                this.controllerNull.setDownloadDelegate(this.delegate)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 60000)
              }
              break;
            }
            case "testStartDownload001": {
              try {
                this.controllerNull.startDownload(this.downloadUrl)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 60010)
              }
              break;
            }
            case "testStartDownload002": {
              try {
                this.controller.startDownload('http://')
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 60011)
              }
              break;
            }
            case "testStartDownload003": {
              try {
                this.controller.startDownload(',,http://')
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 60012)
              }
              break;
            }
            case "testStartDownload004": {
              try {
                this.controller.startDownload('华为')
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 60013)
              }
              break;
            }
            case "testStartDownload005": {
              try {
                this.controller.startDownload('file://')
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 60014)
              }
              break;
            }
            case "testStartDownload006": {
              try {
                this.controller.startDownload('')
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 60015)
              }
              break;
            }
            case "testWebDownloadPause001": {
              try {
                this.start = false
                this.controller.startDownload(this.downloadUrl)
                await Utils.sleep(3000)
                if (this.downloadItem) {
                  this.downloadItem.pause()
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 60020)
              }
              break;
            }
            case "testWebDownloadPause002": {
              try {
                this.controller.startDownload(this.downloadUrl)
                await Utils.sleep(3000)
                if (this.downloadItem) {
                  this.downloadItem.cancel()
                }
                await Utils.sleep(3000)
                if (this.downloadItem) {
                  this.downloadItem.pause()
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 60022)
              }
              break;
            }
            case "testWebDownloadPause003": {
              try {
                this.controller.startDownload(this.downloadUrlImg)
                await Utils.sleep(6000)
                if (this.downloadItem) {
                  this.downloadItem.pause()
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 60024)
              }
              break;
            }
            case "testWebDownloadResume001": {
              try {
                this.start = false
                this.controller.startDownload(this.downloadUrl)
                await Utils.sleep(3000)
                if (this.downloadItem) {
                  this.downloadItem.resume()
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 60030)
              }
              break;
            }
            case "testWebDownloadResume002": {
              try {
                this.controller.startDownload(this.downloadUrl)
                await Utils.sleep(3000)
                if (this.downloadItem) {
                  this.downloadItem.resume()
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 60032)
              }
              break;
            }
            case "testWebDownloadResume003": {
              try {
                this.controller.startDownload(this.downloadUrl)
                await Utils.sleep(3000)
                if (this.downloadItem) {
                  this.downloadItem.cancel()
                }
                await Utils.sleep(3000)
                if (this.downloadItem) {
                  this.downloadItem.resume()
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 60034)
              }
              break;
            }
            case "testWebDownloadResume004": {
              try {
                this.controller.startDownload(this.downloadUrlImg)
                await Utils.sleep(6000)
                if (this.downloadItem) {
                  this.downloadItem.resume()
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 60036)
              }
              break;
            }
            case "testWebDownloadManagerResumeDownload001": {
              try {
                this.controller.startDownload(this.downloadUrlImg)
                await Utils.sleep(3000)
                if (this.downloadItem) {
                  webView.WebDownloadManager.resumeDownload(this.downloadItem)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 60040)
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(true)
        .fileAccess(true)
        .imageAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        .databaseAccess(true)
        .onPageEnd(() => {
          if (!this.hasSetDownloadDelegate) {
            try {
              this.delegate.onBeforeDownload((webDownloadItem: webView.WebDownloadItem) => {
                this.downloadItem = webDownloadItem;
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
                console.log("download update download guid: " + webDownloadItem.getGuid());
                console.log("download update download method:" + webDownloadItem.getMethod());
                console.log("download update download state: " + webDownloadItem.getState());
                console.log("download update percent complete: " + webDownloadItem.getPercentComplete());
                console.log("download update full path: " + webDownloadItem.getFullPath());
                console.log("download update current speed: " + webDownloadItem.getCurrentSpeed());
                console.log("download update total bytes: " + webDownloadItem.getTotalBytes());
                console.log("download update received bytes: " + webDownloadItem.getReceivedBytes());
                this.downloadItem = webDownloadItem;
              })
              this.delegate.onDownloadFailed((webDownloadItem: webView.WebDownloadItem) => {
                this.downloadItem = webDownloadItem;
                console.log("download failed method:" + webDownloadItem.getMethod());
                console.log("download failed guid: " + webDownloadItem.getGuid());
                console.log("download failed lastErrorCode: " + webDownloadItem.getLastErrorCode());
                webDownloadItem.cancel();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webView.WebDownloadItem) => {
                this.downloadItem = webDownloadItem;
                console.log("download finish method:" + webDownloadItem.getMethod());
                console.log("download finish guid: " + webDownloadItem.getGuid());
              })
              this.controller.setDownloadDelegate(this.delegate);
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
