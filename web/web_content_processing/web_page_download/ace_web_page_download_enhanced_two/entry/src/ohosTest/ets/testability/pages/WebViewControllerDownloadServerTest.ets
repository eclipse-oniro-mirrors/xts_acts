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
import { waitForExist } from '../../test/WaitTest';

@Entry
@Component
struct WebViewControllerDownloadServerTest {
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
  responseWeb: WebResourceResponse = new WebResourceResponse()
  @State savePath: string = Utils.getSandboxFileDir() + 'testDownloadServerFile.exe'
  @State responseCode: number = 200
  @State lastErrorCode: number = -1
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 131890,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(131890)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.lastErrorCode = -1
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebViewControllerDownloadServerTestButton')
          .key('WebViewControllerDownloadServerTestButton').onClick(async () => {
          console.info('key==>' + this.str)
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          switch (this.str) {
            case "testDownloadServer001": {
              try {
                this.responseCode = 400
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(()=>this.isPageEnd, this.str, 0);
                this.controller.startDownload(this.downloadUrl);
                await waitForExist(() => this.lastErrorCode, this.str, webView.WebDownloadErrorCode.SERVER_FAILED);
                console.log(this.str + 'lastErrorCode:' + this.lastErrorCode)
                Utils.emitEvent(this.lastErrorCode, 131900)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testDownloadServer002": {
              try {
                this.responseCode = 404
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(()=>this.isPageEnd, this.str, 0);
                this.controller.startDownload(this.downloadUrl);
                await waitForExist(() => this.lastErrorCode, this.str, webView.WebDownloadErrorCode.SERVER_BAD_CONTENT);
                console.log(this.str + 'lastErrorCode:' + this.lastErrorCode)
                Utils.emitEvent(this.lastErrorCode, 131910)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testDownloadServer003": {
              try {
                this.responseCode = 401
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(()=>this.isPageEnd, this.str, 0);
                this.controller.startDownload(this.downloadUrl);
                await waitForExist(() => this.lastErrorCode, this.str, 
                webView.WebDownloadErrorCode.SERVER_UNAUTHORIZED);
                console.log(this.str + 'lastErrorCode:' + this.lastErrorCode)
                Utils.emitEvent(this.lastErrorCode, 131920)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "testDownloadServer004": {
              try {
                this.responseCode = 403
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(()=>this.isPageEnd, this.str, 0);
                this.controller.startDownload(this.downloadUrl);
                await waitForExist(() => this.lastErrorCode, this.str, webView.WebDownloadErrorCode.SERVER_FORBIDDEN);
                console.log(this.str + 'lastErrorCode:' + this.lastErrorCode)
                Utils.emitEvent(this.lastErrorCode, 131930)
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
        .onInterceptRequest((event) => {
          if (event) {
            console.log('onInterceptRequest url:' + event.request.getRequestUrl())
          }
          this.responseWeb.setResponseEncoding('utf-8')
          this.responseWeb.setResponseMimeType('text/html')
          this.responseWeb.setResponseCode(this.responseCode)
          this.responseWeb.setReasonMessage('OK')

          return this.responseWeb
        })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
          if (!this.hasSetDownloadDelegate) {
            try {
              this.delegate.onBeforeDownload((webDownloadItem: webView.WebDownloadItem) => {
                console.log("will start a download.");
                console.log("will start a download， method:" + webDownloadItem.getMethod());
                console.log("will start a download， mime type:" + webDownloadItem.getMimeType());
                console.log("will start a download, url:" + webDownloadItem.getUrl());
                console.log("will start a download, suggest name:" + webDownloadItem.getSuggestedFileName());
                webDownloadItem.start(this.savePath);
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webView.WebDownloadItem) => {
                console.log("download update download state: " + webDownloadItem.getState());
                console.log("download update percent complete: " + webDownloadItem.getPercentComplete());
                console.log("download update full path: " + webDownloadItem.getFullPath());
                console.log("download update current speed: " + webDownloadItem.getCurrentSpeed());
                console.log("download update total bytes: " + webDownloadItem.getTotalBytes());
                console.log("download update received bytes: " + webDownloadItem.getReceivedBytes());
              })
              this.delegate.onDownloadFailed((webDownloadItem: webView.WebDownloadItem) => {
                console.log("download failed guid: " + webDownloadItem.getGuid());
                console.log("download failed lastErrorCode: " + webDownloadItem.getLastErrorCode());
                this.lastErrorCode = webDownloadItem.getLastErrorCode()
                webDownloadItem.cancel();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webView.WebDownloadItem) => {
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