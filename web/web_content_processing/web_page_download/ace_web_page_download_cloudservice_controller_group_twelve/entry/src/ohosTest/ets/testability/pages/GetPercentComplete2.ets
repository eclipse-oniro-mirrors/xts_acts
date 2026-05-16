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
import events_emitter from '@ohos.events.emitter';
import JSON from '@ohos.util.json';
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct WebComponent {
  controller1: webview.WebviewController = new webview.WebviewController();
  controller2: webview.WebviewController = new webview.WebviewController();
  controller3: webview.WebviewController = new webview.WebviewController();
  delegate1: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  delegate2: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  delegate3: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  @State emitKey: string = '';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State flag1:boolean = false;
  @State flag2:boolean = false;
  @State flag3:boolean = false;

  onPageShow(): void{
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 131470,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(131470);
  }

  public valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData.data != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build(){
    Column() {
      Button('GetPercentComplete')
        .key('001')
        .onClick(async () => {
          console.info('key==>' + this.emitKey)
          await waitForExist(() => this.isPageEnd, this.emitKey, 0);
          await waitForExist(() => this.isReceive, this.emitKey, 0);
          this.isReceive = -1;
          try {
            this.delegate1.onBeforeDownload(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download.');
              webDownloadItem.start(LocalContext.context.cacheDir + '/231/' + webDownloadItem.getSuggestedFileName());
            })
            this.delegate1.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update percentComplete1: ', webDownloadItem.getPercentComplete());
              if (webDownloadItem.getPercentComplete() > 10 && webDownloadItem.getCurrentSpeed() > 0) {
                this.flag1 = true;
                webDownloadItem.cancel()
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
              webDownloadItem.start(LocalContext.context.cacheDir + '/232/' + webDownloadItem.getSuggestedFileName());
            })
            this.delegate2.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update percentComplete2: ' + webDownloadItem.getPercentComplete());
              if (webDownloadItem.getPercentComplete() > 10 && webDownloadItem.getCurrentSpeed() > 0) {
                this.flag2 = true;
                webDownloadItem.cancel()
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
              webDownloadItem.start(LocalContext.context.cacheDir + '/223/' + webDownloadItem.getSuggestedFileName());
            })
            this.delegate3.onDownloadUpdated(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update percentComplete3: ' + webDownloadItem.getPercentComplete());
              if (webDownloadItem.getPercentComplete() > 10 && webDownloadItem.getCurrentSpeed() > 0) {
                this.flag3 = true;
                webDownloadItem.cancel()
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
          try {
            // 三个并行下载任务
            this.controller1.startDownload('https://' +
              'mirrors.huaweicloud.com/npm-software/v6.14.2.tar.gz');
            this.controller2.startDownload('https://' +
              'mirrors.huaweicloud.com/npm-software/v6.10.2.tar.gz');
            this.controller3.startDownload('https://' +
              'mirrors.huaweicloud.com/npm-software/v6.14.16.tar.gz');
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }

          try {
            await waitForExist(() => ''+this.flag1, this.emitKey + ' flag1', 'true');
            await waitForExist(() => ''+this.flag2, this.emitKey + ' flag2', 'true');
            await waitForExist(() => ''+this.flag3, this.emitKey + ' flag3', 'true');
            if(this.flag1 && this.flag2 && this.flag3) {
              Utils.emitEvent(true, 131490)
            }
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
      Web({ src: 'www.example.com', controller: this.controller1 })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
      Web({ src: 'www.example.com', controller: this.controller2 })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
      Web({ src: 'www.example.com', controller: this.controller3 })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
    }
  }
}