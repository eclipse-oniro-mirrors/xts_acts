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
      Button('getGuid')
        .key('001')
        .onClick(() => {
          try {
            this.delegate1.onBeforeDownload(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download.');
              webDownloadItem.start(LocalContext.context.cacheDir + '/1/' + webDownloadItem.getSuggestedFileName());
            })
            this.delegate1.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update guid1: ' + webDownloadItem.getGuid(), webDownloadItem.getPercentComplete());
              if (webDownloadItem.getPercentComplete() == 100) {
                console.log('download update guid11: ' + webDownloadItem.getGuid(), webDownloadItem.getState());
                LocalContext.context.eventHub.emit('BeforeDownloadGetGuidUpdated100', webDownloadItem.getGuid())
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
              webDownloadItem.start(LocalContext.context.cacheDir + '/2/' + webDownloadItem.getSuggestedFileName());
            })
            this.delegate2.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update guid2: ' + webDownloadItem.getGuid(), webDownloadItem.getState());
              console.log('download getPercentComplete:'+webDownloadItem.getPercentComplete())
              if (webDownloadItem.getPercentComplete() > 10 &&
                webDownloadItem.getState() == webview.WebDownloadState.IN_PROGRESS) {
                console.log('download update guid21: ' + webDownloadItem.getGuid(), webDownloadItem.getState());
                webDownloadItem.pause()
                LocalContext.context.eventHub.emit('BeforeDownloadGetGuidUpdatedPause', webDownloadItem.getGuid())
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
              webDownloadItem.start(LocalContext.context.cacheDir + '/3/' + webDownloadItem.getSuggestedFileName());
            })
            this.delegate3.onDownloadUpdated(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update guid3: ' + webDownloadItem.getGuid());
              if (webDownloadItem.getPercentComplete() > 10 &&
                webDownloadItem.getState() == webview.WebDownloadState.IN_PROGRESS) {
                webDownloadItem.pause()
                await Utils.sleep(100)
                webDownloadItem.resume()
                LocalContext.context.eventHub.emit('BeforeDownloadGetGuidUpdatedResume', webDownloadItem.getGuid())
                await Utils.sleep(100)
                webDownloadItem.pause()
              }
            })
            this.delegate3.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download failed guid: ' + webDownloadItem.getGuid());
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
            this.controller1.startDownload('https://' +
              'mirrors.huaweicloud.com/npm-software/v6.10.2.tar.gz');
            this.controller2.startDownload('https://' +
              'mirrors.huaweicloud.com/npm-software/v6.14.16.tar.gz');
            this.controller3.startDownload('https://' +
              'mirrors.huaweicloud.com/npm-software/v6.14.2.tar.gz');
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