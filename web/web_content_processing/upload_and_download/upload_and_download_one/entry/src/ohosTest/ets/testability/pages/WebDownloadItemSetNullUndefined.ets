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
import webview from '@ohos.web.webview';
import business_error from '@ohos.base'
import Utils from '../../test/Utils';
import { waitForExist } from '../../test/WaitTest.test';
import { URL_EXAMPLE_HTTPS } from '../../test/Config.test';

@Entry
@Component
struct WebDownloadItem {
  controller: webview.WebviewController = new webview.WebviewController();
  delegate: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State result: string = 'WebDownloadItem';

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 260312,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(260312)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }


  setDownloadDelegate(operate: string){
    try {
      this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
        console.info('[onBeforeDownload] will start a download.');
        // 传入一个下载路径，并开始下载。
        try {
          switch (operate) {
            case 'startEmpty':
              console.info('[onBeforeDownload] webDownloadItem startEmpty start ');
              webDownloadItem.start('');
              console.info('[onBeforeDownload] webDownloadItem startEmpty success');
              this.result = 'success'
              break
            case 'startNull':
              console.info('[onBeforeDownload] webDownloadItem startNull start ');
              webDownloadItem.start(null);
              console.info('[onBeforeDownload] webDownloadItem startNull success');
              this.result = 'success'
              break
            case 'startUndefined':
              console.info('[onBeforeDownload] webDownloadItem startUndefined start ');
              webDownloadItem.start(undefined);
              console.info('[onBeforeDownload] webDownloadItem startUndefined success ');
              this.result = 'success'
              break
            default :
              webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
              break
          }
        } catch (error) {
          console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          this.result = `${(error as BusinessError).code}`
        }
        console.info('[onBeforeDownload] getUrl: ' + webDownloadItem.getUrl());
        console.info('[onBeforeDownload] getFullPath: ' + webDownloadItem.getFullPath());
        console.info('[onBeforeDownload] getSuggestedFileName: ' + webDownloadItem.getSuggestedFileName());
      })
      this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
        console.info('[onDownloadUpdated] getPercentComplete: ' + webDownloadItem.getPercentComplete());
        console.info('[onDownloadUpdated] getSuggestedFileName: ' + webDownloadItem.getSuggestedFileName());

      })
      this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
        console.error('[onDownloadFailed] getGuid: ' + webDownloadItem.getGuid());
      })
      this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
        console.info('[onDownloadFinish] getGuid: ' + webDownloadItem.getGuid());
        console.info('[onDownloadFinish] getUrl: ' + webDownloadItem.getUrl());
        console.info('[onDownloadFinish] getFullPath: ' + webDownloadItem.getFullPath());
        console.info('[onDownloadFinish] getSuggestedFileName: ' + webDownloadItem.getSuggestedFileName());

      })
      console.info('[setDownloadDelegate] start');
      this.controller.setDownloadDelegate(this.delegate);
      console.info('[setDownloadDelegate] run');
    } catch (error) {
      console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
    }
  }


  build() {
    Column() {
      Row() {
        Button('WebDownloadItemTest').key('WebDownloadItemButton').onClick(async () => {
          await waitForExist(()=>this.isPageEnd, 'WebDownloadItemTest_PageEnd', 0);
          await waitForExist(()=>this.isReceive, 'WebDownloadItemTest_Receive', 0);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case 'testStartEmpty': {
              this.result = 'testStartEmpty'
              try {
                this.setDownloadDelegate('startEmpty')
                this.controller.startDownload(URL_EXAMPLE_HTTPS)
                await waitForExist(() => this.result, 'testStartEmpty', 'success');
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              Utils.emitEvent(this.result, 26031201)
              break;
            }
            case 'testStartNull': {
              this.result = 'testStartNull'
              try {
                this.setDownloadDelegate('startNull')
                this.controller.startDownload(URL_EXAMPLE_HTTPS)
                await waitForExist(() => this.result, 'testStartNull', 'success');
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              Utils.emitEvent(this.result, 26031202)
              break;
            }
            case 'testStartUndefined': {
              this.result = 'testStartUndefined'
              try {
                this.setDownloadDelegate('startUndefined')
                this.controller.startDownload(URL_EXAMPLE_HTTPS)
                await waitForExist(() => this.result, 'testStartUndefined', 'success');
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              Utils.emitEvent(this.result, 26031203)
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('second.html'), controller: this.controller })
        .javaScriptAccess(true)
        .fileAccess(true)
        .imageAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        .databaseAccess(true)
        .onPageEnd((event) => {
          console.log('onPageEnd', event.url)
          this.isPageEnd = 0
        })
    }
  }
}