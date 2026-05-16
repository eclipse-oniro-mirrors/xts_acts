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
              webDownloadItem.start(LocalContext.context.cacheDir + '/311/' + webDownloadItem.getSuggestedFileName());
              this.webDownloadItem = webDownloadItem
            })
            this.delegate.onDownloadUpdated(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update guid1: ' + webDownloadItem.getPercentComplete());
              if (webDownloadItem.getPercentComplete() > 20) {
                webDownloadItem.cancel()
                console.log('download update guid21: ' + webDownloadItem.getPercentComplete());
                console.log('download update guid22: ' + this.webDownloadItem.getPercentComplete());
                LocalContext.context.eventHub.emit('DownloadGetPercentComplete3', this.webDownloadItem.getPercentComplete())
              }
            })
            this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download failed guid: ' + webDownloadItem.getGuid());
              LocalContext.context.eventHub.emit('DownloadGetPercentComplete3', webDownloadItem.getPercentComplete())
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
              '//mirrors.huaweicloud.com/npm-software/v6.9.1.tar.gz');
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
      Web({ src: 'www.example.com', controller: this.controller })
    }
  }
}