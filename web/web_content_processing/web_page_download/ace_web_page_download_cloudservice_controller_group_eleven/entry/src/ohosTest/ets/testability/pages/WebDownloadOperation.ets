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
import events_emitter from '@ohos.events.emitter';
import { JSON } from '@kit.ArkTS';
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
  @State str: string = '';
  @State src: string | Resource = 'www.example.com';
  @State num: number = 0
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow(): void{
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 131100,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(131100);
  }

  public valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData.data != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build(){
    Column() {

      Button('web click')
        .key('subAceWebButton')
        .onClick(async () => {
        console.info('key==>' + this.str)
        await waitForExist(() => this.isPageEnd, this.str, 0);
        await waitForExist(() => this.isReceive, this.str, 0);
        this.isReceive = -1;
        switch (this.str) {
          case 'SUB_ACE_WEB_cancel_0100': {
            try {
              this.download = new webview.WebDownloadItem();
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'will start a download.');
                webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
                console.log(this.str + 'download update state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download failed guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download failed state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
                console.log(this.str + 'download error code: ' + webDownloadItem.getLastErrorCode());
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download finish guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download finish state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.controller.setDownloadDelegate(this.delegate);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.UNKNOWN);
              this.controller.startDownload('https://consumer.huawei.com/content/dam/' +
                'huawei-cbg-site/cn/mkt/mobileservices/2022/download/' +
                'PC107f1b3947c942ffaa14334a879065d8.2107261020.exe');
              console.log(this.str + '开始下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.IN_PROGRESS);
              this.download.pause();
              console.log(this.str + '暂停下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.PAUSED);
              this.download.cancel();
              console.log(this.str + '取消下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.CANCELED);
              console.log(this.str + '查看下载状态')
              if (this.download.getState() == webview.WebDownloadState.CANCELED) {
                Utils.emitEvent(this.download.getState(), 131110)
              }
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            break;
          }
          case 'SUB_ACE_WEB_cancel_0200': {
            try {
              this.download = new webview.WebDownloadItem();
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'will start a download.'+webDownloadItem.getSuggestedFileName());
                webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
                console.log(this.str + 'download update state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download failed guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download failed state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
                console.log(this.str + 'download error code: ' + webDownloadItem.getLastErrorCode());
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download finish guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download finish state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.controller.setDownloadDelegate(this.delegate);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.UNKNOWN);
              this.download.cancel();
              console.log(this.str + '取消下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.UNKNOWN);
              console.log(this.str + '查看下载状态')
              Utils.emitEvent(this.download.getState(), 131120)
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            break;
          }
          case 'SUB_ACE_WEB_cancel_0300': {
            try {
              this.download = new webview.WebDownloadItem();
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'will start a download.');
                webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
                console.log(this.str + 'download update state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download failed guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download failed state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
                console.log(this.str + 'download error code: ' + webDownloadItem.getLastErrorCode());
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download finish guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download finish state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.controller.setDownloadDelegate(this.delegate);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.UNKNOWN);
              this.controller.startDownload('https://consumer.huawei.com/content/dam/' +
                'huawei-cbg-site/cn/mkt/mobileservices/2022/download/' +
                'PC107f1b3947c942ffaa14334a879065d8.2107261020.exe');
              console.log(this.str + '开始下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.IN_PROGRESS);
              this.download.cancel();
              console.log(this.str + '取消下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.CANCELED);
              console.log(this.str + '查看下载状态')
              Utils.emitEvent(this.download.getState(), 131130)
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            break;
          }
          case 'SUB_ACE_WEB_cancel_0400': {
            try {
              this.download = new webview.WebDownloadItem();
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'will start a download.');
                webDownloadItem.start('/data/stora' + webDownloadItem.getSuggestedFileName());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
                console.log(this.str + 'download update state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download failed guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download failed state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
                console.log(this.str + 'download error code: ' + webDownloadItem.getLastErrorCode());
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download finish guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download finish state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.controller.setDownloadDelegate(this.delegate);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.UNKNOWN);
              this.controller.startDownload('https:' +
                '//www.example.com');
              console.log(this.str + '开始下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.INTERRUPTED);
              this.download.cancel();
              console.log(this.str + '取消下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.INTERRUPTED);
              console.log(this.str + '查看下载状态')
              Utils.emitEvent(this.download.getState(), 131140)
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            break;
          }
          case 'SUB_ACE_WEB_pause_0100': {
            try {
              this.download = new webview.WebDownloadItem();
              this.download.pause();
              console.log(this.str + '暂停下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              Utils.emitEvent(error.code + error.message, 131150)
            }
            break;
          }
          case 'SUB_ACE_WEB_pause_0200': {
            try {
              this.download = new webview.WebDownloadItem();
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'will start a download.');
                webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
                console.log(this.str + 'download update state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download failed guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download failed state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
                console.log(this.str + 'download error code: ' + webDownloadItem.getLastErrorCode());
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download finish guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download finish state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.controller.setDownloadDelegate(this.delegate);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              this.download.pause();
              console.log(this.str + '暂停下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              Utils.emitEvent(error.code + error.message, 131160)
            }
            break;
          }
          case 'SUB_ACE_WEB_pause_0300': {
            try {
              this.download = new webview.WebDownloadItem();
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'will start a download.');
                webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
                console.log(this.str + 'download update state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download failed guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download failed state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
                console.log(this.str + 'download error code: ' + webDownloadItem.getLastErrorCode());
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download finish guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download finish state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.controller.setDownloadDelegate(this.delegate);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.UNKNOWN);
              this.download.cancel();
              console.log(this.str + '取消下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.UNKNOWN);
              this.download.pause();
              console.log(this.str + '暂停下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              Utils.emitEvent(error.code + error.message, 131170)
            }
            break;
          }
          case 'SUB_ACE_WEB_pause_0400': {
            try {
              this.download = new webview.WebDownloadItem();
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'will start a download.');
                webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
                console.log(this.str + 'download update state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download failed guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download failed state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
                console.log(this.str + 'download error code: ' + webDownloadItem.getLastErrorCode());
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download finish guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download finish state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.controller.setDownloadDelegate(this.delegate);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.UNKNOWN);
              this.controller.startDownload('https://consumer.huawei.com/content/dam/' +
                'huawei-cbg-site/cn/mkt/mobileservices/2022/download/' +
                'PC107f1b3947c942ffaa14334a879065d8.2107261020.exe');
              console.log(this.str + '开始下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.IN_PROGRESS);
              this.download.pause();
              console.log(this.str + '暂停下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.PAUSED);
              this.download.resume();
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.IN_PROGRESS);
              console.log(this.str + '查看下载状态')
              let flag = this.download.getState();
              this.download.cancel()
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.CANCELED);
              Utils.emitEvent(flag, 131190)
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            break;
          }
          case 'SUB_ACE_WEB_pause_0500': {
            try {
              this.download = new webview.WebDownloadItem();
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'will start a download.');
                webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
                console.log(this.str + 'download update state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download failed guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download failed state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
                console.log(this.str + 'download error code: ' + webDownloadItem.getLastErrorCode());
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download finish guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download finish state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.controller.setDownloadDelegate(this.delegate);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.UNKNOWN);
              this.controller.startDownload('https:' +
                '//www.example.com');
              console.log(this.str + '开始下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.COMPLETED);
              this.download.pause();
              console.log(this.str + '暂停下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              Utils.emitEvent(error.code + error.message, 131200)
            }
            break;
          }
          case 'SUB_ACE_WEB_pause_0600': {
            try {
              this.download = new webview.WebDownloadItem();
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'will start a download.');
                webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
                console.log(this.str + 'download update state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download failed guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download failed state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
                console.log(this.str + 'download error code: ' + webDownloadItem.getLastErrorCode());
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download finish guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download finish state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.controller.setDownloadDelegate(this.delegate);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              webview.WebviewController.setConnectionTimeout(5);
              console.log(this.str + 'setConnectionTimeout: 5s');
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.UNKNOWN);
              this.controller.startDownload('https:' +
                '//shows.youtube.com');
              console.log(this.str + '开始下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.UNKNOWN);
              this.download.pause();
              console.log(this.str + '暂停下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              Utils.emitEvent(error.code + error.message, 131210)
            }
            break;
          }
          case 'SUB_ACE_WEB_resume_0100': {
            try {
              this.download = new webview.WebDownloadItem();
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'will start a download.');
                webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download failed guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download error code: ' + webDownloadItem.getLastErrorCode());
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download finish guid: ' + webDownloadItem.getGuid());
              })
              this.controller.setDownloadDelegate(this.delegate);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.UNKNOWN);
              this.download.resume();
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              Utils.emitEvent(error.code + error.message, 131220)
            }
            break;
          }
          case 'SUB_ACE_WEB_resume_0200': {
            try {
              this.download = new webview.WebDownloadItem();
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'will start a download.');
                webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
                console.log(this.str + 'download update state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download failed guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download failed state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
                console.log(this.str + 'download error code: ' + webDownloadItem.getLastErrorCode());
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download finish guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download finish state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.controller.setDownloadDelegate(this.delegate);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.UNKNOWN);
              this.controller.startDownload('https://consumer.huawei.com/content/dam/' +
                'huawei-cbg-site/cn/mkt/mobileservices/2022/download/' +
                'PC107f1b3947c942ffaa14334a879065d8.2107261020.exe');
              console.log(this.str + '开始下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.IN_PROGRESS);
              this.download.resume();
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              Utils.emitEvent(error.code + error.message, 131230)
            }
            break;
          }
          case 'SUB_ACE_WEB_resume_0300': {
            try {
              this.download = new webview.WebDownloadItem();
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'will start a download.');
                webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
                console.log(this.str + 'download update state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadFailed(async (webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download failed guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download failed state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
                await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.CANCELED);
                console.log(this.str + 'download error code: ' + webDownloadItem.getLastErrorCode());
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download finish guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download finish state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.controller.setDownloadDelegate(this.delegate);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.UNKNOWN);
              this.controller.startDownload('https://consumer.huawei.com/content/dam/' +
                'huawei-cbg-site/cn/mkt/mobileservices/2022/download/' +
                'PC107f1b3947c942ffaa14334a879065d8.2107261020.exe');
              console.log(this.str + '开始下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.IN_PROGRESS);
              this.download.cancel();
              console.log(this.str + '取消下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              this.download.resume();
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              Utils.emitEvent(error.code + error.message, 131240)
            }
            break;
          }
          case 'SUB_ACE_WEB_resume_0400': {
            try {
              this.download = new webview.WebDownloadItem();
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'will start a download.');
                webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
                console.log(this.str + 'download update state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download failed guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download failed state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
                console.log(this.str + 'download error code: ' + webDownloadItem.getLastErrorCode());
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download finish guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download finish state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.controller.setDownloadDelegate(this.delegate);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.UNKNOWN);
              this.controller.startDownload('https:' +
                '//www.example.com');
              console.log(this.str + '开始下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.COMPLETED);
              this.download.resume();
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              Utils.emitEvent(error.code + error.message, 131250)
            }
            break;
          }
          case 'SUB_ACE_WEB_resume_0500': {
            try {
              this.download = new webview.WebDownloadItem();
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'will start a download.');
                webDownloadItem.start('/data/storage/el2he/web/' + webDownloadItem.getSuggestedFileName());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
                console.log(this.str + 'download update state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download failed guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download failed state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
                console.log(this.str + 'download error code: ' + webDownloadItem.getLastErrorCode());
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download finish guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download finish state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.controller.setDownloadDelegate(this.delegate);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.UNKNOWN);
              this.controller.startDownload('https://consumer.huawei.com/content/dam/' +
                'huawei-cbg-site/cn/mkt/mobileservices/2022/download/' +
                'PC107f1b3947c942ffaa14334a879065d8.2107261020.exe');
              console.log(this.str + '开始下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.IN_PROGRESS);
              this.download.resume();
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              this.download.cancel();
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.CANCELED);
              Utils.emitEvent(error.code + error.message, 131260)
            }
            break;
          }
          case 'SUB_ACE_onDownloadUpdated_1000': {
            try {
              this.download = new webview.WebDownloadItem();
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'will start a download.');
                webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download failed guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download error code: ' + webDownloadItem.getLastErrorCode());
                Utils.emitEvent(webDownloadItem.getLastErrorCode(), 131270)
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download finish guid: ' + webDownloadItem.getGuid());
              })
              this.controller.setDownloadDelegate(this.delegate);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.UNKNOWN);
              this.controller.startDownload('https:' +
                '//dldir1.qq.c.15_240902_x64_01.exe');
              console.log(this.str + '开始下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            break;
          }
          case 'SUB_ACE_onDownloadUpdated_1001': {
            try {
              this.download = new webview.WebDownloadItem();
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'will start a download.');
                webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadUpdated(async (webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
                console.log('download update state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
                this.download.cancel();
                await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.CANCELED);
                Utils.emitEvent(true, 131280)
              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download failed guid: ' + webDownloadItem.getGuid());
                console.log('download failed state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
                console.log(this.str + 'download error code: ' + webDownloadItem.getLastErrorCode());
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download finish guid: ' + webDownloadItem.getGuid());
                console.log('download finish state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.controller.setDownloadDelegate(this.delegate);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.UNKNOWN);
              this.controller.startDownload('https://consumer.huawei.com/content/dam/' +
                'huawei-cbg-site/cn/mkt/mobileservices/2022/download/' +
                'PC107f1b3947c942ffaa14334a879065d8.2107261020.exe');
              console.log(this.str + '开始下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            break;
          }
          case 'SUB_ACE_onDownloadUpdated_1002': {
            try {
              this.download = new webview.WebDownloadItem();
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'will start a download.');
                webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
                if (webDownloadItem.getPercentComplete() == 100) {
                  Utils.emitEvent(100, 131290)
                }
              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download failed guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download error code: ' + webDownloadItem.getLastErrorCode());
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download finish guid: ' + webDownloadItem.getGuid());
              })
              this.controller.setDownloadDelegate(this.delegate);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.UNKNOWN);
              this.controller.startDownload('https:' +
                '//www.baidu.com');
              console.log(this.str + '开始下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            break;
          }
          case 'SUB_ACE_onDownloadUpdated_1003': {
            try {
              this.download = new webview.WebDownloadItem();
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'will start a download.');
                webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadUpdated(async (webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
                console.log('download update state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
                if (webDownloadItem.getPercentComplete() >= 2) {
                  this.download.cancel();
                  await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.CANCELED);
                  Utils.emitEvent(2, 131320)
                }
              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download failed guid: ' + webDownloadItem.getGuid());
                console.log('download failed state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
                console.log(this.str + 'download error code: ' + webDownloadItem.getLastErrorCode());
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log('download finish state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
                console.log(this.str + 'download finish guid: ' + webDownloadItem.getGuid());
              })
              this.controller.setDownloadDelegate(this.delegate);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.UNKNOWN);
              this.controller.startDownload('https://consumer.huawei.com/content/dam/' +
                'huawei-cbg-site/cn/mkt/mobileservices/2022/download/' +
                'PC107f1b3947c942ffaa14334a879065d8.2107261020.exe');
              console.log(this.str + '开始下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            break;
          }
          case 'SUB_ACE_onDownloadUpdated_1004': {
            try {
              this.download = new webview.WebDownloadItem();
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'will start a download.');
                webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadUpdated(async (webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
                console.log('download update state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
                if (webDownloadItem.getPercentComplete() >= 2) {
                  this.download.cancel();
                  await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.CANCELED);
                  Utils.emitEvent(2, 131340)
                }
              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download failed guid: ' + webDownloadItem.getGuid());
                console.log('download failed state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
                console.log(this.str + 'download error code: ' + webDownloadItem.getLastErrorCode());
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download finish guid: ' + webDownloadItem.getGuid());
                console.log('download finish state: ' + webDownloadItem.getState());
                this.download = webDownloadItem
              })
              this.controller.setDownloadDelegate(this.delegate);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.UNKNOWN);
              this.controller.startDownload('https://consumer.huawei.com/content/dam/' +
                'huawei-cbg-site/cn/mkt/mobileservices/2022/download/' +
                'PC107f1b3947c942ffaa14334a879065d8.2107261020.exe');
              console.log(this.str + '开始下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            break;
          }
          case 'SUB_ACE_WEB_onDownloadFinish_1000': {
            try {
              this.download = new webview.WebDownloadItem();
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'will start a download.');
                webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download failed guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download error code: ' + webDownloadItem.getLastErrorCode());
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download finish guid: ' + webDownloadItem.getGuid());
                Utils.emitEvent(webDownloadItem.getState(), 131350)
              })
              this.controller.setDownloadDelegate(this.delegate);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.UNKNOWN);
              this.controller.startDownload('https:' +
                '//www.baidu.com');
              console.log(this.str + '开始下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            break;
          }
          case 'SUB_ACE_WEB_onDownloadFinish_1002': {
            try {
              this.download = new webview.WebDownloadItem();
              this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'will start a download.');
                webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                this.download = webDownloadItem
              })
              this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download update percent complete: ' + webDownloadItem.getPercentComplete());
              })
              this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download failed guid: ' + webDownloadItem.getGuid());
                console.log(this.str + 'download error code: ' + webDownloadItem.getLastErrorCode());
                this.failedData = webDownloadItem.serialize();
              })
              this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                console.log(this.str + 'download finish guid: ' + webDownloadItem.getGuid());
                Utils.emitEvent(webDownloadItem.getState(), 131360)
              })
              this.controller.setDownloadDelegate(this.delegate);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            try {
              await waitForExist(() => this.download.getState(), this.str, webview.WebDownloadState.UNKNOWN);
              this.controller.startDownload('https://' +
                'mirrors.tuna.tsinghua.edu.cn/nodejs-release/index.json');
              console.log(this.str + '开始下载')
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            break;
          }
        }
      })
      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(true)
        .geolocationAccess(true)
        .onPageEnd((event) => {
          console.log(this.str + 'web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
    }
  }
}
