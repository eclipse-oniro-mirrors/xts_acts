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

import events_emitter from '@ohos.events.emitter';
import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import { URL } from '../../test/Config';
import Utils from '../../test/Utils';
import {waitForExist} from '../../test/WaitTest';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  @State emitKey: string = '';
  @State time: number = 0;
  @State counters: number = 0;
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 160000,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide(): void {
    events_emitter.off(160000)
    this.counters = 0;
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



  build() {
    Column() {
      Row() {
        Button('Test getSecurityLevel Error')
          .key('getSecurityLevelButton')
          .onClick(async () => {
            await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
            await waitForExist(()=>this.isReceive, this.emitKey, 0);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            if (this.emitKey === 'emitGetSecurityLevelError') {
              try {
                new webview.WebviewController().getSecurityLevel();
                Utils.emitEvent('fail', 160010);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`[TAO]ErrorCode: ${e.code},  Message: ${e.message}`);
                if (e.code == 17100001) {
                  Utils.emitEvent('success', 160010);
                } else {
                  Utils.emitEvent('fail', 160010);
                }
              }
            }
          });

        Button('runJavaScript')
          .key('navigationStartButton')
          .onClick(async () => {
            await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
            await waitForExist(()=>this.isReceive, this.emitKey, 0);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            if (this.emitKey === 'emitNavigationStartTick') {
              this.controller.loadUrl('resource://rawfile/navigationStart.html');
            }
          });
      }

      Web({ src: URL, controller: this.controller })
        .onFirstContentfulPaint(event => {
          if (event) {
            console.log('onFirstContentfulPaint:' + '[navigationStartTick]:' +
            event.navigationStartTick + ', [firstContentfulPaintMs]:' +
            event.firstContentfulPaintMs);
            this.time = event.navigationStartTick;
          }
        })
        .onPageEnd(() => {
          this.isPageEnd = 0;
          if (this.counters == 0) {
            this.counters = 1;
            return;
          }
          console.info(`runJavaScript onPageEnd`);
          try {
            this.controller.runJavaScript(
              'test()',
              (error, result) => {
                if (error) {
                  console.error(`runJavaScript ErrorCode1: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                  Utils.emitEvent('fail', 160020);
                } else {
                  console.info(`runJavaScript1 SUCCESS, ${Number(result).valueOf().toString().substring(0, 8)}`,
                    this.time.toString().substring(0, 8));

                  if (Number(result).valueOf().toString().substring(0, 8)) {
                    console.info(`runJavaScript onPageEnd result`);
                    Utils.emitEvent('success', 160020);
                  } else {
                    Utils.emitEvent('fail', 160020);
                  }
                }
              });
          } catch (error) {
            console.error(`runJavaScript ErrorCode2: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            Utils.emitEvent('fail', 160020);
          }
        })
        .javaScriptAccess(this.javaScriptAccess)
        .domStorageAccess(this.domStorageAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
    }
  }
}