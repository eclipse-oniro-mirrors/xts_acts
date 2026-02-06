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
import { LocalContext } from '../../test/GloablConfig';
import Utils from '../../test/Util';
import events_emitter from '@ohos.events.emitter';
import JSON from '@ohos.util.json';
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  delegate: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  webDownloadItem: webview.WebDownloadItem = new webview.WebDownloadItem()
  @State emitKey: string = '';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State isPause: boolean = true;
  @State isResume: boolean = true;

  private setPause = () => {
    this.isPause = false;
  }
  private setResume = () => {
    this.isResume = false;
  }
  private getPause = () => {
    return this.isPause;
  }
  private getResume = () => {
    return this.isResume;
  }

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
            this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download.');
              webDownloadItem.start(LocalContext.context.cacheDir + '/511/' + webDownloadItem.getSuggestedFileName());
              this.webDownloadItem = webDownloadItem
            })
            this.delegate.onDownloadUpdated(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update percentComplete1: ' + webDownloadItem.getPercentComplete());
              if (webDownloadItem.getPercentComplete() > 40 && (this.getPause() || this.getResume())) {
                console.log('download update state: ', webDownloadItem.getState());
                if(webDownloadItem.getState() == webview.WebDownloadState.IN_PROGRESS && this.getPause()) {
                  this.setPause()
                  this.webDownloadItem.pause()
                }
                if(webDownloadItem.getState() == webview.WebDownloadState.PAUSED && !this.getPause()) {
                  this.setResume()
                  this.webDownloadItem.resume()
                }
              }
              if (webDownloadItem.getPercentComplete() == 100) {
                console.log('download update percentComplete11: ' + webDownloadItem.getPercentComplete());
                Utils.emitEvent(webDownloadItem.getPercentComplete(), 131540)
                return
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
          try {
            this.controller.startDownload('https://' +
              'mirrors.huaweicloud.com/npm-software/v6.9.1.tar.gz');
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
      Web({ src: 'www.example.com', controller: this.controller })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
    }
  }
}