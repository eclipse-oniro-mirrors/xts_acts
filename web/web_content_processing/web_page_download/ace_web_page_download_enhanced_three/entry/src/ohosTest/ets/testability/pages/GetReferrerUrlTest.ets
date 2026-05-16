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
import webview from '@ohos.web.webview';
import business_error from '@ohos.base'
import Utils from '../../test/Utils';
import { EXAMPLE_HTTPS, DOWNLOAD_URL } from '../../test/Config.test'
import {  waitForExist } from '../../test/WaitTest';

@Entry
@Component
struct GetReferrerUrlTest {
  controller: webview.WebviewController = new webview.WebviewController();
  delegate: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  @State str: string = '';
  @State exampleUrl: string = EXAMPLE_HTTPS+'/'
  @State savePath: string = '';
  downloadingItem: webview.WebDownloadItem | null = null
  @State referrerUrls: string[] = []
  @State originalUrls: string[] = []
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State fullPath: string = '';
  @State referrerUrl: string = '';
  @State originalUrl: string = '';

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 260420,
      priority: events_emitter.EventPriority.LOW
    }
    console.log('AfterEach111 release the download progress')
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
    events_emitter.off(260420)
    events_emitter.off(11)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.savePath = Utils.getSandboxFileDir() + 'testDownloadFile'
        this.referrerUrl = ''
        this.originalUrl = ''
        this.isReceive = 0;
        this.setUpDownloadDelegate()
      }
    }
  }

  private setUpDownloadDelegate() {
    console.log('setupDownloadDelegate')
    this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
      console.info('will start a download, original URL:' + webDownloadItem.getOriginalUrl());
      console.info('will start a download, referrer URL:' + webDownloadItem.getReferrerUrl());
      // 传入一个下载路径，并开始下载。
      this.referrerUrl = webDownloadItem.getReferrerUrl()
      this.originalUrl = webDownloadItem.getOriginalUrl()
      webDownloadItem.start(this.savePath);
    })

    this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
      console.info('download update percent complete: ' + webDownloadItem.getPercentComplete());
    })

    this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
      console.error('download failed guid: ' + webDownloadItem.getGuid());
    })

    this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
      console.info('download finish guid: ' + webDownloadItem.getGuid());
    })
    this.controller.setDownloadDelegate(this.delegate);
  }

  build() {
    Column() {
      Row() {
        Button('GetReferrerUrlTestButton')
          .key('GetReferrerUrlTestButton').onClick(async () => {
          await waitForExist(() => this.isPageEnd, 'GetReferrerUrlTestisPageEnd', 0);
          await waitForExist(() => this.isReceive, 'GetReferrerUrlTestisReceive', 0);
          this.isReceive = -1;
          switch (this.str) {
            case 'testGetReferrerUrl001': {
              try {
                this.referrerUrl = ''
                this.controller.startDownload(DOWNLOAD_URL);
                await waitForExist(() => this.referrerUrl, this.str, this.exampleUrl);
                let result = false
                if (this.referrerUrl == this.exampleUrl) {
                  result = true
                }
                Utils.emitEvent(result, 26042001)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case 'testGetOriginal001': {
              try {
                this.originalUrl = ''
                this.controller.startDownload(DOWNLOAD_URL);
                await waitForExist(() => this.originalUrl, this.str, DOWNLOAD_URL);
                let result = false
                if (this.originalUrl == DOWNLOAD_URL) {
                  result = true
                }
                Utils.emitEvent(result, 26042002)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: EXAMPLE_HTTPS, controller: this.controller })
        .onPageBegin((event) => {
          console.log('onPageBegin url' + event.url)
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url' + event.url)
          this.isPageEnd = 0
        })
    }
  }
}
