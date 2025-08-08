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

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  delegate: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  delegate1: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  controller1: webview.WebviewController = new webview.WebviewController();
  @State download: webview.WebDownloadItem = new webview.WebDownloadItem();
  failedData: Uint8Array = new Uint8Array();

  build(){
    Column() {
      Button('setDownloadDelegate fail')
        .key('setDownloadDelegate fail')
        .onClick(() => {
          try {
            this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download.');
              webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
            })
            this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update percent complete: ' + webDownloadItem.getPercentComplete());
            })
            this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download error code: ' + webDownloadItem.getLastErrorCode());
              console.log('download failed guid: ' + webDownloadItem.getGuid());
              this.failedData = webDownloadItem.serialize();
            })
            this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download finish guid: ' + webDownloadItem.getGuid());
            })
            this.controller.setDownloadDelegate(this.delegate);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })

      Button('setDownloadDelegate')
        .key('setDownloadDelegate')
        .onClick(() => {
          try {
            this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download.');
              webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
              this.download = webDownloadItem
            })
            this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update percent complete: ' + webDownloadItem.getPercentComplete());
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
        })

      Button('startDownload')
        .key('startDownload')
        .onClick(() => {

          try {
            console.log('开始下载')
            this.controller.startDownload('https:' +
              '//dldir1.qq.com/qqfile/qq/QQNT/Windows/QQ_9.9.15_240902_x64_01.exe');
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })

      Button('startDownload url 不可用')
        .key('startDownload1')
        .onClick(() => {
          try {
            console.log('开始下载')
            this.controller.startDownload('123.456.456');
          } catch (error) {
            Utils.emitEvent(error.code + error.message, 403)
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
      Button('resumeDownload')
        .key('resumeDownload')
        .onClick(() => {
          try {
            webview.WebDownloadManager.resumeDownload(webview.WebDownloadItem.deserialize(this.failedData));
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
      Button('pause')
        .key('pause')
        .onClick(() => {
          try {
            this.download.pause();
            console.log('暂停下载')
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            Utils.emitEvent(error.code + error.message, 400);
          }
        })
      Button('cancel')
        .key('cancel')
        .onClick(() => {
          try {
            this.download.cancel();
            console.log('取消下载')
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
      Button('resume')
        .key('resume')
        .onClick(() => {
          try {
            console.log('继续下载')
            this.download.resume();
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
      Button('查看下载状态')
        .key('state')
        .onClick(() => {
          try {
            console.log('查看下载状态')
            let status = this.download.getState();
            if (JSON.stringify(status) == '4') {
              Utils.emitEvent(JSON.stringify(status), 401)
            }
            console.log('查看下载状态===:' + JSON.stringify(status))
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })

      Button('setDownloadDelegateNotController')
        .key('setDownloadDelegateNotController')
        .onClick(() => {
          try {
            this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download.');
              webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
            })
            this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update percent complete: ' + webDownloadItem.getPercentComplete());
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
            Utils.emitEvent(error.code + error.message, 402);
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })

      Button('FILE_FAILED')
        .key('FILE_FAILED')
        .onClick(() => {
          try {
            this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download.');
              webDownloadItem.start('/data/123456' + webDownloadItem.getSuggestedFileName());
            })
            this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update percent complete: ' + webDownloadItem.getPercentComplete());
            })
            this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
              Utils.emitEvent(webDownloadItem.getLastErrorCode(), 404);
              console.log('download error code: ' + webDownloadItem.getLastErrorCode());
              console.log('download failed guid: ' + webDownloadItem.getGuid());
              this.failedData = webDownloadItem.serialize();
            })
            this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download finish guid: ' + webDownloadItem.getGuid());
            })
            this.controller.setDownloadDelegate(this.delegate);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })

      Button('111')
        .key('111')
        .onClick(() => {
          try {
            this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download.');
              webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
              this.download = webDownloadItem
            })
            this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update percent complete: ' + webDownloadItem.getPercentComplete());
            })
            this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download failed guid: ' + webDownloadItem.getGuid());
              console.log('download error code: ' + webDownloadItem.getLastErrorCode());
              Utils.emitEvent(webDownloadItem.getLastErrorCode(), 405);
              this.failedData = webDownloadItem.serialize();
            })
            this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download finish guid: ' + webDownloadItem.getGuid());
            })
            this.controller.setDownloadDelegate(this.delegate);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })

      Button('startDownloadUrlFail')
        .key('startDownloadUrlFail')
        .onClick(() => {
          try {
            console.log('开始下载')
            this.controller.startDownload('https:' +
              '//dldir1.qq.com/qqfile/');
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })


      Button('2')
        .key('2')
        .onClick(() => {
          try {
            this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download.');
              webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
              this.download = webDownloadItem
            })
            this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update percent complete: ' + webDownloadItem.getPercentComplete());
            })
            this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download failed guid: ' + webDownloadItem.getGuid());
              console.log('download error code: ' + webDownloadItem.getLastErrorCode());
              Utils.emitEvent(webDownloadItem.getLastErrorCode(), 406);
              this.failedData = webDownloadItem.serialize();
            })
            this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download finish guid: ' + webDownloadItem.getGuid());
            })
            this.controller.setDownloadDelegate(this.delegate);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })


      Button('startDownloadUrltimeout')
        .key('startDownloadUrltimeout')
        .onClick(() => {
          try {
            console.log('开始下载')
            webview.WebviewController.setConnectionTimeout(5)
            this.controller.startDownload('https:' +
              '//news.youtube.com/new');
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })

      Web({ src: 'www.example.com', controller: this.controller })
        .onErrorReceive((event) => {
          if (event) {
            console.log('getErrorInfo:' + event.error.getErrorInfo());
            console.log('getErrorCode:' + event.error.getErrorCode());
          }
        })
    }
  }
}