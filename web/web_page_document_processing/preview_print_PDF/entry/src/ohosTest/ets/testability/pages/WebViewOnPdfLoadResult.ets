/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// xxx.ets
import { webview } from '@kit.ArkWeb';
import { waitForExist} from '../../test/WaitTest.test';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  @State eventInfoUrl:string = '';
  @State result:number = 0;
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State url: string = '';
  @State resultArr:PdfLoadResult[] = [PdfLoadResult.LOAD_SUCCESS,PdfLoadResult.PARSE_ERROR_FILE,PdfLoadResult.PARSE_ERROR_FORMAT ,PdfLoadResult.PARSE_ERROR_PASSWORD ,PdfLoadResult.PARSE_ERROR_HANDLER ]
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 300650,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide(): void {
    events_emitter.off(300650)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      if (eventData.data?.ACTION != null) {
        this.emitKey = eventData.data?.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click')
          .key('WebViewOnPdfScrollAtBottomKey')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, this.emitKey, 0);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            switch (this.emitKey) {
              case 'emitWebViewOnPdfLoadResult001': {
                console.info("emitWebViewOnPdfLoadResult001************")
                await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
                console.log('emitWebViewOnPdfLoadResult001_result' + this.result)
                if(canIUse('SystemCapability.Security.DiaService')) {
                  Utils.emitEvent(this.resultArr[this.result],300660)
                  console.log('6666')
                } else {
                  Utils.emitEvent(this.resultArr[0],300660)
                  console.log('9999')
                }
                break;
              }
              case 'emitWebViewOnPdfLoadResult002': {
                console.info('emitWebViewOnPdfLoadResult002********')
                await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
                console.log('result' + this.result)
                Utils.emitEvent(this.resultArr[1],300670)
                break;
              }
              case 'emitWebViewOnPdfLoadResult003': {
                console.info('emitWebViewOnPdfLoadResult003********')
                this.controller.loadUrl("resource://rawfile/error.pdf");
                await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
                console.log('emitWebViewOnPdfLoadResult003_result' + this.result)
                if(canIUse('SystemCapability.Security.DiaService')) {
                  Utils.emitEvent(this.resultArr[this.result],300680)
                  console.log('congcong');
                } else {
                  Utils.emitEvent(this.resultArr[2],300680)
                  console.log('longlong');
                }
                break;
              }
              case 'emitWebViewOnPdfLoadResult004': {
                console.info('emitWebViewOnPdfLoadResult004********')
                await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
                console.log('result' + this.result)
                Utils.emitEvent(this.resultArr[3],300690)
                break;
              }

              case 'emitWebViewOnPdfLoadResult005': {
                console.info('emitWebViewOnPdfLoadResult005********')
                await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
                console.log('result' + this.result)
                Utils.emitEvent(this.resultArr[4],300700)
                break;
              }
            }
          })
      }
      Web({ src: $rawfile('small.pdf'), controller: this.controller })
        .onPdfLoadEvent((eventInfo: OnPdfLoadEvent) => {
          console.info(`Load event callback called. url: ${eventInfo.url}, result: ${eventInfo.result}`)
          this.eventInfoUrl = eventInfo.url;
          this.result = eventInfo.result;
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url：' + event.url);
          this.isPageEnd = 0;
          this.url = event.url;
        })
    }
  }
}