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
struct WebViewControllerDownloadFileTest {
  controller: webView.WebviewController = new webView.WebviewController();
  delegate: webView.WebDownloadDelegate = new webView.WebDownloadDelegate();
  @State str: string = '';
  @State downloadUrl: string = 'https://consumer.huawei.com/content/dam/' +
    'huawei-cbg-site/cn/mkt/mobileservices/2022/download/' +
    'PC107f1b3947c942ffaa14334a879065d8.2107261020.exe'
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State hasSetDownloadDelegate: boolean = false;
  @State savePath: string = Utils.getSandboxFileDir() + 'testDownloadFileFile.exe'
  @State lastErrorCode: number = -1
  cancelDownloadItem: webView.WebDownloadItem | null = null
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 131940,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(131940)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.lastErrorCode = -1
        this.cancelDownloadItem = null
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebViewControllerDownloadFileTestButton')
          .key('WebViewControllerDownloadFileTestButton').onClick(async () => {
          console.info('key==>' + this.str)
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          switch (this.str) {
            case 'testDownloadFile001': {
              try {
                this.savePath = 'data/'
                this.controller.startDownload(this.downloadUrl);

                let check = (v1: number, v2: number):boolean => {
                  return v1 ? true:false;
                };
                await waitForAssert(() => this.lastErrorCode, check, webView.WebDownloadErrorCode.FILE_ACCESS_DENIED,
                  131950, this.str)

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'testDownloadFile002': {
              try {
                this.savePath = Utils.getSandboxFileDir() + 'testDownloadFileFile.exe'
                this.controller.startDownload(this.downloadUrl);
                waitForExist(()=>this.cancelDownloadItem, this.str)
                if (this.cancelDownloadItem) {
                  this.cancelDownloadItem.cancel()
                }

                let check = (v1: number, v2: number): boolean => {
                  return v1 ? true: false;
                }
                await waitForAssert(() => this.lastErrorCode, check, webView.WebDownloadErrorCode.USER_CANCELED,
                  131960, this.str)

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
                console.log('will start a download.');
                console.log('will start a download， method:' + webDownloadItem.getMethod());
                console.log('will start a download， mime type:' + webDownloadItem.getMimeType());
                console.log('will start a download, url:' + webDownloadItem.getUrl());
                console.log('will start a download, suggest name:' + webDownloadItem.getSuggestedFileName());
                webDownloadItem.start(this.savePath);
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webView.WebDownloadItem) => {
                console.log('download update download state: ' + webDownloadItem.getState());
                console.log('download update percent complete: ' + webDownloadItem.getPercentComplete());
                console.log('download update full path: ' + webDownloadItem.getFullPath());
                console.log('download update current speed: ' + webDownloadItem.getCurrentSpeed());
                console.log('download update total bytes: ' + webDownloadItem.getTotalBytes());
                console.log('download update received bytes: ' + webDownloadItem.getReceivedBytes());
                this.cancelDownloadItem = webDownloadItem;
              })
              this.delegate.onDownloadFailed((webDownloadItem: webView.WebDownloadItem) => {
                console.log('download failed guid: ' + webDownloadItem.getGuid());
                console.log('download failed lastErrorCode: ' + webDownloadItem.getLastErrorCode());
                this.lastErrorCode = webDownloadItem.getLastErrorCode()
                webDownloadItem.cancel();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webView.WebDownloadItem) => {
                console.log('download finish guid: ' + webDownloadItem.getGuid());
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