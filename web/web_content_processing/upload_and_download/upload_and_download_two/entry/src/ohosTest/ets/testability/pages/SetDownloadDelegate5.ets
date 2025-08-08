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
import { util } from '@kit.ArkTS';
import Utils from '../../test/Util';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  delegate: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  url: string = ''

  build(){
    Column() {
      Button('getCurrentSpeed')
        .key('001')
        .onClick(() => {
          try {
            this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download.');
              this.url = webDownloadItem.getUrl()
              webDownloadItem.start(LocalContext.context.cacheDir + webDownloadItem.getSuggestedFileName());
            })
            this.delegate.onDownloadUpdated(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update Complete: ' + webDownloadItem.getPercentComplete());
              if (webDownloadItem.getCurrentSpeed() > 0) {
                let state: webview.WebDownloadState = webDownloadItem.getState()
                LocalContext.context.eventHub.emit('SetDownloadDelegate5', this.url + state.toString())
                webDownloadItem.cancel()
              }
            })
            this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download failed Complete: ' + webDownloadItem.getGuid());
            })
            this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download finish Complete: ' + webDownloadItem.getGuid());
            })
            this.controller.setDownloadDelegate(this.delegate);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`);
          }
        })
      Button('startDownload')
        .key('002')
        .onClick(() => {
          try {
            this.controller.startDownload('https:' +
              '//mirrors.huaweicloud.com/npm-software/v6.14.16.tar.gz');
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
      Web({ src: 'www.example.com', controller: this.controller })
    }
  }
}