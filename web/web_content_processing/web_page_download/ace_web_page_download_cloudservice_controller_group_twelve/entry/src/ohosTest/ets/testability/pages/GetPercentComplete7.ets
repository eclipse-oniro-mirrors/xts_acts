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
  @State emitKey: string = '';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State flag1:boolean = false;
  @State flag2:boolean = false;
  @State flag3:boolean = false;
  @State isPause1: boolean = true;
  @State isResume1: boolean = true;
  @State isPause2: boolean = true;
  @State isResume2: boolean = true;
  @State isPause3: boolean = true;
  @State isResume3: boolean = true;

  private setPause1 = () => {
    this.isPause1 = false;
  }
  private setResume1 = () => {
    this.isResume1 = false;
  }
  private getPause1 = () => {
    return this.isPause1;
  }
  private getResume1 = () => {
    return this.isResume1;
  }
  private setPause2 = () => {
    this.isPause2 = false;
  }
  private setResume2 = () => {
    this.isResume2 = false;
  }
  private getPause2 = () => {
    return this.isPause2;
  }
  private getResume2 = () => {
    return this.isResume2;
  }
  private setPause3 = () => {
    this.isPause3 = false;
  }
  private setResume3 = () => {
    this.isResume3 = false;
  }
  private getPause3 = () => {
    return this.isPause3;
  }
  private getResume3 = () => {
    return this.isResume3;
  }

  onPageShow(): void{
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 131370,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(131370);
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
              console.log('will start a download1.');
              webDownloadItem.start(LocalContext.context.cacheDir + '/7231/' + webDownloadItem.getSuggestedFileName());
              this.webDownloadItem1 = webDownloadItem
            })
            this.delegate1.onDownloadUpdated(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update percentComplete1: ', webDownloadItem.getPercentComplete());
              if (webDownloadItem.getPercentComplete() >= 10 && (this.getPause1() || this.getResume1())) {
                console.log('download update state1: ', webDownloadItem.getState());
                if(webDownloadItem.getState() == webview.WebDownloadState.IN_PROGRESS && this.getPause1()) {
                  this.setPause1()
                  this.webDownloadItem1.pause()
                }
                if(webDownloadItem.getState() == webview.WebDownloadState.PAUSED && !this.getPause1()) {
                  this.setResume1()
                  this.webDownloadItem1.resume()
                }
              }
              if (webDownloadItem.getPercentComplete() >= 40) {
                this.flag1 = true;
                webDownloadItem.cancel()
                return
              }
            })
            this.delegate1.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download failed guid1: ' + webDownloadItem.getGuid());
            })
            this.delegate1.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download finish guid1: ' + webDownloadItem.getGuid());
            })
            this.controller1.setDownloadDelegate(this.delegate1);
          } catch (error) {
            console.error(`ErrorCode1: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }

          try {
            this.delegate2.onBeforeDownload(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download2.');
              webDownloadItem.start(LocalContext.context.cacheDir + '/7232/' + webDownloadItem.getSuggestedFileName());
              this.webDownloadItem2 = webDownloadItem
            })
            this.delegate2.onDownloadUpdated(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update percentComplete2: ' + webDownloadItem.getPercentComplete());
              if (webDownloadItem.getPercentComplete() >= 20 && (this.getPause2() || this.getResume2())) {
                console.log('download update state2: ', webDownloadItem.getState());
                if (webDownloadItem.getState() == 0 && this.getPause2()) {
                  this.setPause2()
                  this.webDownloadItem2.pause()
                }
                if (webDownloadItem.getState() == 5 && !this.getPause2()) {
                  this.setResume2()
                  this.webDownloadItem2.resume()
                }
              }
              if (webDownloadItem.getPercentComplete() >= 60) {
                this.flag2 = true;
                webDownloadItem.cancel()
                return
              }
            })
            this.delegate2.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download failed guid2: ' + webDownloadItem.getGuid());
            })
            this.delegate2.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download finish guid2: ' + webDownloadItem.getGuid());
            })
            this.controller2.setDownloadDelegate(this.delegate2);
          } catch (error) {
            console.error(`ErrorCode2: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }

          try {
            this.delegate3.onBeforeDownload(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download3.');
              webDownloadItem.start(LocalContext.context.cacheDir + '/7223/' + webDownloadItem.getSuggestedFileName());
              this.webDownloadItem3 = webDownloadItem
            })
            this.delegate3.onDownloadUpdated(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update percentComplete3: ' + webDownloadItem.getPercentComplete());
              if (webDownloadItem.getPercentComplete() >= 30 && (this.getPause3() || this.getResume3())) {
                console.log('download update state3: ', webDownloadItem.getState());
                if (webDownloadItem.getState() == 0 && this.getPause3()) {
                  this.setPause3()
                  this.webDownloadItem3.pause()
                }
                if (webDownloadItem.getState() == 5 && !this.getPause3()) {
                  this.setResume3()
                  this.webDownloadItem3.resume()
                }
              }
              if (webDownloadItem.getPercentComplete() >= 70) {
                webDownloadItem.cancel()
                this.flag3 = true;
                return
              }
            })
            this.delegate3.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download failed getCurrentSpeed3: ' + webDownloadItem.getCurrentSpeed());
            })
            this.delegate3.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download finish guid3: ' + webDownloadItem.getGuid());
            })
            this.controller3.setDownloadDelegate(this.delegate3);
          } catch (error) {
            console.error(`ErrorCode3: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }

          try {
            // 三个并行下载任务
            this.controller1.startDownload('https://' +
              'mirrors.huaweicloud.com/npm-software/v6.14.16.tar.gz');
            this.controller2.startDownload('https://' +
              'mirrors.huaweicloud.com/npm-software/v6.14.2.tar.gz');
            this.controller3.startDownload('https://' +
              'mirrors.huaweicloud.com/npm-software/v6.10.2.tar.gz');
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }

          try {
            await waitForExist(() => ''+this.flag1, this.emitKey + ' flag1', 'true');
            await waitForExist(() => ''+this.flag2, this.emitKey + ' flag2', 'true');
            await waitForExist(() => ''+this.flag3, this.emitKey + ' flag3', 'true');
            if(this.flag1 && this.flag2 && this.flag3) {
              Utils.emitEvent(true, 131390)
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