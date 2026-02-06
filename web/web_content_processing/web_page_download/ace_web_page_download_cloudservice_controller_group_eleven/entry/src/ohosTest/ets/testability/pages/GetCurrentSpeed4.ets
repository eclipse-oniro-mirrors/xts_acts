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
  webDownloadItem1: webview.WebDownloadItem = new webview.WebDownloadItem();
  webDownloadItem2: webview.WebDownloadItem = new webview.WebDownloadItem();
  webDownloadItem3: webview.WebDownloadItem = new webview.WebDownloadItem();
  isPause: boolean = false;
  @State emitKey: string = '';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State flag1:boolean = false;
  @State flag2:number = 0;
  @State flag3:number = 0;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 130960,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(130960);
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
      Button('getGuid')
        .key('001')
        .onClick(async () => {
          console.info('key==>' + this.emitKey);
          await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
          await waitForExist(()=>this.isReceive, this.emitKey, 0);
          this.isReceive = -1;
          // 进行中
          try {
            console.log('ErrorCode download update speed guid');
            this.delegate1.onBeforeDownload(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('ErrorCode will start a download.');
              webDownloadItem.start(LocalContext.context.cacheDir + '/31/' + webDownloadItem.getSuggestedFileName());
              this.webDownloadItem1 = webDownloadItem
            })
            this.delegate1.onDownloadUpdated(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update speed guid1: ', webDownloadItem.getCurrentSpeed());
              if (webDownloadItem.getCurrentSpeed() > 0) {
                this.flag1 = true;
                webDownloadItem.pause()
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
            console.error(`ErrorCode2: ${(error as BusinessError).code},  Message2: ${(error as BusinessError).message}`);
          }

          // 暂停
          try {
            this.delegate2.onBeforeDownload(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download.');
              webDownloadItem.start(LocalContext.context.cacheDir + '/32/' + webDownloadItem.getSuggestedFileName());
              this.webDownloadItem2 = webDownloadItem
            })
            this.delegate2.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update speed guid2: ' + webDownloadItem.getCurrentSpeed());
              if (webDownloadItem.getCurrentSpeed() > 0) {
                webDownloadItem.pause()
                this.flag2 = this.webDownloadItem2.getCurrentSpeed();
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
            console.error(`ErrorCode3: ${(error as BusinessError).code},  Message3: ${(error as BusinessError).message}`);
          }

          // 取消
          try {
            this.delegate3.onBeforeDownload(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download.');
              webDownloadItem.start(LocalContext.context.cacheDir + '/23/' + webDownloadItem.getSuggestedFileName());
              this.webDownloadItem3 = webDownloadItem
            })
            this.delegate3.onDownloadUpdated(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update speed guid3: ' + webDownloadItem.getCurrentSpeed());
              if (webDownloadItem.getCurrentSpeed() > 0) {
                webDownloadItem.cancel()
                this.flag3 = this.webDownloadItem3.getCurrentSpeed();
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
            console.error(`ErrorCode4: ${(error as BusinessError).code},  Message4: ${(error as BusinessError).message}`);
          }
          try {
            this.controller1.startDownload('https:' +
              '//npmmirror.com/mirrors/node/v20.17.0/node-v20.17.0-x64.msi');
            this.controller2.startDownload('https:' +
              '//npmmirror.com/mirrors/node/v20.17.0/node-v20.17.0-x64.msi');
            this.controller3.startDownload('https:' +
              '//npmmirror.com/mirrors/node/v20.17.0/node-v20.17.0-x64.msi');
          } catch (error) {
            console.error(`ErrorCode1: ${(error as BusinessError).code},  Message1: ${(error as BusinessError).message}`);
          }
          try {
            await waitForExist(() => ''+this.flag1, this.emitKey + ' flag1', 'true');
            await waitForExist(() => this.flag2, this.emitKey + ' flag2', 0);
            await waitForExist(() => this.flag3, this.emitKey + ' flag3', 0);
            if(this.flag1 && this.flag2 == 0 && this.flag3 == 0) {
              Utils.emitEvent(true, 131020);
            }
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
      Web({ src: 'www1', controller: this.controller1 })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
      Web({ src: 'www2', controller: this.controller2 })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
      Web({ src: 'www3', controller: this.controller3 })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
    }
  }
}