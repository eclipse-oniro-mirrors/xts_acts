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


  build(){
    Column() {
      Button('GetPercentComplete')
        .key('001')
        .onClick(() => {
          try {
            this.delegate1.onBeforeDownload(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download.');
              LocalContext.context.eventHub.emit('DownloadGetPercentComplete101', webDownloadItem.getPercentComplete())
            })

            this.controller1.setDownloadDelegate(this.delegate1);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }

          try {
            this.delegate2.onBeforeDownload(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download.');
              LocalContext.context.eventHub.emit('DownloadGetPercentComplete102', webDownloadItem.getPercentComplete())
            })
            this.controller2.setDownloadDelegate(this.delegate2);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }

          try {
            this.delegate3.onBeforeDownload(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download.');
              LocalContext.context.eventHub.emit('DownloadGetPercentComplete103', webDownloadItem.getPercentComplete())
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
            this.controller1.startDownload('https://' +
              'mirrors.huaweicloud.com/npm-software/v6.10.2.tar.gz');
            this.controller2.startDownload('https://' +
              'mirrors.huaweicloud.com/npm-software/v6.14.2.tar.gz');
            this.controller3.startDownload('https://' +
              'mirrors.huaweicloud.com/npm-software/v6.14.16.tar.gz');
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