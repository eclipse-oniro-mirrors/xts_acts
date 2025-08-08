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
import { URL } from '../../test/Config';
import { LocalContext } from '../../test/GloablConfig';
import Utils from '../../test/Util';

@Entry
@Component
struct WebComponent {
  controller1: webview.WebviewController = new webview.WebviewController();
  controller2: webview.WebviewController = new webview.WebviewController();
  controller3: webview.WebviewController = new webview.WebviewController();
  delegate1: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  delegate2: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  delegate3: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  webDownloadItem1: webview.WebDownloadItem = new webview.WebDownloadItem();
  webDownloadItem2: webview.WebDownloadItem = new webview.WebDownloadItem();
  webDownloadItem3: webview.WebDownloadItem = new webview.WebDownloadItem();

  build(){
    Column() {
      Button('GetPercentComplete')
        .key('001')
        .onClick(() => {
          try {
            this.delegate1.onBeforeDownload(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download.');
              webDownloadItem.start(LocalContext.context.cacheDir + '/7231/' + webDownloadItem.getSuggestedFileName());
              this.webDownloadItem1 = webDownloadItem
            })
            this.delegate1.onDownloadUpdated(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update guid1: ', webDownloadItem.getPercentComplete());
              if (webDownloadItem.getPercentComplete() >= 40) {
                LocalContext.context.eventHub.emit('DownloadGetPercentComplete71', webDownloadItem.getPercentComplete())
                webDownloadItem.cancel()
                return
              }
              if (webDownloadItem.getPercentComplete() >= 10) {
                await Utils.sleep(500)
                this.webDownloadItem1.pause()
                await Utils.sleep(500)
                this.webDownloadItem1.resume()
              }
            })
            this.delegate1.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download failed guid: ' + webDownloadItem.getGuid());
            })
            this.delegate1.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download finish guid: ' + webDownloadItem.getGuid());
            })
            this.controller1.setDownloadDelegate(this.delegate1);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }

          try {
            this.delegate2.onBeforeDownload(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download.');
              webDownloadItem.start(LocalContext.context.cacheDir + '/7232/' + webDownloadItem.getSuggestedFileName());
              this.webDownloadItem2 = webDownloadItem
            })
            this.delegate2.onDownloadUpdated(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update guid2: ' + webDownloadItem.getPercentComplete());
              if (webDownloadItem.getPercentComplete() >= 60) {
                LocalContext.context.eventHub.emit('DownloadGetPercentComplete72', webDownloadItem.getPercentComplete())
                webDownloadItem.cancel()
                return
              }
              if (webDownloadItem.getPercentComplete() >= 20) {
                await Utils.sleep(500)
                this.webDownloadItem2.pause()
                await Utils.sleep(500)
                this.webDownloadItem2.resume()
              }
            })
            this.delegate2.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download failed guid: ' + webDownloadItem.getGuid());
            })
            this.delegate2.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download finish guid: ' + webDownloadItem.getGuid());
            })
            this.controller2.setDownloadDelegate(this.delegate2);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }

          try {
            this.delegate3.onBeforeDownload(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download.');
              webDownloadItem.start(LocalContext.context.cacheDir + '/7223/' + webDownloadItem.getSuggestedFileName());
              this.webDownloadItem3 = webDownloadItem
            })
            this.delegate3.onDownloadUpdated(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update guid3: ' + webDownloadItem.getPercentComplete());
              if (webDownloadItem.getPercentComplete() >= 70) {
                LocalContext.context.eventHub.emit('DownloadGetPercentComplete73', webDownloadItem.getPercentComplete())
                webDownloadItem.cancel()
                return
              }
              if (webDownloadItem.getPercentComplete() >= 30) {
                await Utils.sleep(500)
                this.webDownloadItem3.pause()
                await Utils.sleep(500)
                this.webDownloadItem3.resume()
              }
            })
            this.delegate3.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download failed getCurrentSpeed3: ' + webDownloadItem.getCurrentSpeed());
            })
            this.delegate3.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download finish guid: ' + webDownloadItem.getGuid());
            })
            this.controller3.setDownloadDelegate(this.delegate3);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
      Button('startDownload')
        .key('002')
        .onClick(async () => {
          try {
            // 三个并行下载任务
            this.controller1.startDownload('https:' +
              '//mirrors.huaweicloud.com/npm-software/v6.10.2.tar.gz');
            this.controller2.startDownload('https:' +
              '//mirrors.huaweicloud.com/npm-software/v6.14.16.tar.gz');
            this.controller3.startDownload('https:' +
              '//mirrors.huaweicloud.com/npm-software/v6.9.1.tar.gz');
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
      Web({ src: 'www.example.com', controller: this.controller1 })
      Web({ src: 'www.example.com', controller: this.controller2 })
      Web({ src: 'www.example.com', controller: this.controller3 })
    }
  }
}