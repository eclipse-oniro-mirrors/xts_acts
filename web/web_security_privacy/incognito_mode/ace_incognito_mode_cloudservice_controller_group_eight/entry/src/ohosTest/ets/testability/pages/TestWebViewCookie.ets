/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { webview } from '@kit.ArkWeb';
import { URL } from '../../test/Config';
import Utils from '../../test/Util';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct testWebView_Cookie {
  controller: webview.WebviewController = new webview.WebviewController();
  controller1: webview.WebviewController = new webview.WebviewController();
  origin: string = 'file:///';
  @State str: string = ''
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow(): void{
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 160210,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(160210)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData.data != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }


  aboutToAppear(): void{
    webview.WebCookieManager.clearAllCookiesSync()
  }

  build(){
    Column() {
      Button('configCookieSync1')
        .key('configCookieSync1')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookieSync(URL, 'a=b');
            Utils.emitEvent('success', 160220)
          } catch (error) {
            console.error(`ErrorCode: {(error as BusinessError).message}`);
            Utils.emitEvent(error.code, 160220)
          }
        })
      Web({ src: 'www.example.com', controller: this.controller, incognitoMode: true })

      Button('configCookieSync2')
        .key('configCookieSync2')
        .onClick(() => {
          try {
            webview.WebCookieManager.configCookieSync(URL, 'a=b');
            Utils.emitEvent('success', 160230);
          } catch (error) {
            console.error(`ErrorCode: {(error as BusinessError).message}`);
            Utils.emitEvent(error.code, 160230)
          }
        })
      Web({ src: 'www.example.com', controller: this.controller })

      Button('existCookie1')
        .key('existCookie1')
        .onClick(() => {
          let result = webview.WebCookieManager.existCookie();
          console.log('result: ' + result);
          Utils.emitEvent(result, 160240);
        })
      Web({ src: 'www.example.com', controller: this.controller, incognitoMode: true })


      Button('existCookie2')
        .key('existCookie2')
        .onClick(() => {
          let result = webview.WebCookieManager.existCookie();
          console.log('result: ' + result);
          Utils.emitEvent(result, 160250);
        })
      Web({ src: 'www.example.com', controller: this.controller })
    }
    .justifyContent(FlexAlign.Center)
  }
}