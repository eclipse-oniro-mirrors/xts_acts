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
  controller: webview.WebviewController = new webview.WebviewController();
  delegate: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  webDownloadItem: webview.WebDownloadItem = new webview.WebDownloadItem()

  build(){
    Column() {
      Button('GetPercentComplete')
        .key('001')
        .onClick(() => {
          try {
            this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download.');
              webDownloadItem.start(LocalContext.context.cacheDir + '/611/' + webDownloadItem.getSuggestedFileName());
              this.webDownloadItem = webDownloadItem
            })
            this.delegate.onDownloadUpdated(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update guid1: ' + webDownloadItem.getPercentComplete());
              if (webDownloadItem.getPercentComplete() >= 90) {
                console.log('download update guid3: ' + webDownloadItem.getPercentComplete());
                LocalContext.context.eventHub.emit('DownloadGetPercentComplete6', webDownloadItem.getPercentComplete())
                return
              }
              if (webDownloadItem.getPercentComplete() >= 80) {
                webDownloadItem.pause()
                console.log('download update guid2: ' + this.webDownloadItem.getPercentComplete());
                await Utils.sleep(100)
                this.webDownloadItem.resume()
              }

            })
            this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download failed guid: ' + webDownloadItem.getGuid());
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
        .key('002')
        .onClick(() => {
          try {
            this.controller.startDownload('https:' +
              '//cd001.v78q.com/cs/104sem/Beyond Compare 文件对比工具_sm60000068e.exe');
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
      Web({ src: 'www.example.com', controller: this.controller })
    }
  }
}