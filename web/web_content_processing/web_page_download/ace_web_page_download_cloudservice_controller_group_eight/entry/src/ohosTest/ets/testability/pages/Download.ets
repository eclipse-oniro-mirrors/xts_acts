/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import Utils from '../../test/Util';
import { wifi, wifiManager } from '@kit.ConnectivityKit';
import events_emitter from '@ohos.events.emitter';
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  delegate: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  delegate1: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  controller1: webview.WebviewController = new webview.WebviewController();
  @State download: webview.WebDownloadItem = new webview.WebDownloadItem();
  failedData: Uint8Array = new Uint8Array();
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 130860,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(130860);
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build(){
    Column() {
      Button('web click').key('downloadButton').onClick(async () => {
        console.info('key==>' + this.emitKey)
        await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
        await waitForExist(()=>this.isReceive, this.emitKey, 0);
        this.isReceive = -1;
        switch (this.emitKey) {
          case 'pause': {
            try {
              this.download.pause();
              console.log('暂停下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              Utils.emitEvent(error.code + error.message, 130870);
            }
            break;
          }
          case 'state': {
            try {
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log('will start a download.');
                webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.emitKey + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                console.log('download failed guid: ' + webDownloadItem.getGuid());
                console.log('download error code: ' + webDownloadItem.getLastErrorCode());
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log('download finish guid: ' + webDownloadItem.getGuid());
              })
              this.controller.setDownloadDelegate(this.delegate);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              console.log('开始下载')
              this.controller.startDownload('https:' +
                '//repo.huaweicloud.com/openharmony/os/3.0/hispark_aries.tar.gz');
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              this.download.cancel();
              console.log('取消下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.emitKey, 4);
              console.log('查看下载状态')
              let status = this.download.getState();
              if (JSON.stringify(status) == '4') {
                Utils.emitEvent(JSON.stringify(status), 130880)
              }
              console.log('查看下载状态===:' + JSON.stringify(status))
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            break;
          }
          case 'state1': {
            try {
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log('will start a download.');
                webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.emitKey + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                console.log('download failed guid: ' + webDownloadItem.getGuid());
                console.log('download error code: ' + webDownloadItem.getLastErrorCode());
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log('download finish guid: ' + webDownloadItem.getGuid());
              })
              this.controller.setDownloadDelegate(this.delegate);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              console.log('开始下载')
              this.controller.startDownload('https:' +
                '//repo.huaweicloud.com/openharmony/os/3.0/hispark_aries.tar.gz');
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              this.download.pause();
              console.log('暂停下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              this.download.resume();
              console.log('继续下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.emitKey, 4);
              this.download.cancel();
              console.log('取消下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.emitKey, 4);
              console.log('查看下载状态')
              let status = this.download.getState();
              if (JSON.stringify(status) == '4') {
                Utils.emitEvent(JSON.stringify(status), 130890)
              }
              console.log('查看下载状态===:' + JSON.stringify(status))
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            break;
          }
          case 'setDownloadDelegateNotController': {
            try {
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log('will start a download.');
                webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.emitKey + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                console.log('download failed guid: ' + webDownloadItem.getGuid());
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log('download finish guid: ' + webDownloadItem.getGuid());
              })
              this.controller1.setDownloadDelegate(this.delegate);
            } catch (error) {
              Utils.emitEvent(error.code + error.message, 130900);
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            break;
          }
          case 'startDownload1': {
            try {
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log('will start a download.');
                webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.emitKey + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                console.log('download failed guid: ' + webDownloadItem.getGuid());
                console.log('download error code: ' + webDownloadItem.getLastErrorCode());
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log('download finish guid: ' + webDownloadItem.getGuid());
              })
              this.controller.setDownloadDelegate(this.delegate);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              console.log('开始下载')
              this.controller.startDownload('123.456.456');
            } catch (error) {
              Utils.emitEvent(error.code + error.message, 130910)
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            break;
          }
        }
      })
      Web({ src: 'www.example.com', controller: this.controller })
        .onErrorReceive((event) => {
          if (event) {
            console.log('getErrorInfo:' + event.error.getErrorInfo());
            console.log('getErrorCode:' + event.error.getErrorCode());
          }
        })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
    }
  }
}