/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { webview } from '@kit.ArkWeb';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils.test';
import { waitForExist } from '../../test/WaitTest.test';
import { URL_EXAMPLE } from '../../test/Config.test';
import testNapi from 'libentry.so'

@Entry
@Component
struct WebArkWebCookieManagerSaveCookie {

  controller: webview.WebviewController = new webview.WebviewController('scheme-handler');
  @State str: string = ''
  @State isReceive: number = -1
  @State isPageEnd: number = -1


  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 147511,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(147511)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1
      }
    }
  }

  aboutToAppear() {
    console.info('start run testcase!!!')
    webview.WebviewController.initializeWebEngine();
  }


  build() {
    Column() {
      Row() {
          Button('ArkWebCookieManagerSaveCookie').key('ArkWebCookieManagerSaveCookieTest')
            .onClick(async () => {
              await waitForExist(()=>this.isReceive, 'ArkWebCookieManagerSaveCookieTest_isReceive', 1, 1000)
              await waitForExist(()=>this.isPageEnd, 'ArkWebCookieManagerSaveCookieTest_isPageEnd', 1, 1000)
              console.info('key==>' + this.str)
              this.isReceive = -1
              switch (this.str) {
                case 'OH_ArkWebCookieManager_SaveCookieSync001': {
                  webview.WebCookieManager.clearAllCookiesSync()
                  let getCookieValue:string = webview.WebCookieManager.fetchCookieSync(URL_EXAMPLE)
                  console.log('OH_ArkWebCookieManager_SaveCookieSync001 fetchCookieSync:' + getCookieValue)
                  let resultCode:number = testNapi.saveCookieSync()
                  console.log('OH_ArkWebCookieManager_SaveCookieSync001 saveCookieSync resultCode:' + String(resultCode))
                  Utils.emitEvent(String(resultCode),148650)
                  break
                }
                case 'OH_ArkWebCookieManager_SaveCookieSync002': {
                  webview.WebCookieManager.clearAllCookiesSync()
                  webview.WebCookieManager.configCookieSync(URL_EXAMPLE, 'yuShu=ZS')
                  let getCookieValue:string = webview.WebCookieManager.fetchCookieSync(URL_EXAMPLE)
                  console.log('OH_ArkWebCookieManager_SaveCookieSync002 fetchCookieSync:' + getCookieValue)
                  let resultCode:number = testNapi.saveCookieSync()
                  console.log('OH_ArkWebCookieManager_SaveCookieSync002 saveCookieSync resultCode:' + String(resultCode))
                  Utils.emitEvent(String(resultCode),148660)
                  break
                }
                case 'OH_ArkWebCookieManager_SaveCookieSync003': {
                  webview.WebCookieManager.clearAllCookiesSync()
                  webview.WebCookieManager.configCookieSync(URL_EXAMPLE, 'faker=skt')
                  let getCookieValue:string = webview.WebCookieManager.fetchCookieSync(URL_EXAMPLE)
                  console.log('OH_ArkWebCookieManager_SaveCookieSync003 fetchCookieSync:' + getCookieValue)
                  let resultValue:number = testNapi.saveCookieSyncThread()
                  console.log('OH_ArkWebCookieManager_SaveCookieSync003 saveCookieSyncThread resultValue:' + String(resultValue))
                  await waitForExist(()=>testNapi.getSaveCookieSyncThreadResult(), 'OH_ArkWebCookieManager_SaveCookieSync003_syncThread', 0, 1000)
                  let resultCode:number = testNapi.getSaveCookieSyncThreadResult()
                  console.log('OH_ArkWebCookieManager_SaveCookieSync003 getSaveCookieSyncThreadResult resultCode:' + String(resultCode))
                  Utils.emitEvent(String(resultCode),148670)
                  break
                }
                case 'OH_ArkWebCookieManager_SaveCookieAsync001': {
                  webview.WebCookieManager.clearAllCookiesSync()
                  webview.WebCookieManager.configCookieSync(URL_EXAMPLE, 'xiHu=hangZhou')
                  let getCookieValue:string = webview.WebCookieManager.fetchCookieSync(URL_EXAMPLE)
                  console.log('OH_ArkWebCookieManager_SaveCookieAsync001 fetchCookieSync:' + getCookieValue)
                  let resultValue:number = testNapi.saveCookieAsyncNullptr()
                  console.log('OH_ArkWebCookieManager_SaveCookieAsync001 saveCookieAsyncNullptr resultValue:' + String(resultValue))
                  Utils.emitEvent(String(resultValue),148680)
                  break
                }
                case 'OH_ArkWebCookieManager_SaveCookieAsync002': {
                  webview.WebCookieManager.clearAllCookiesSync()
                  webview.WebCookieManager.configCookieSync(URL_EXAMPLE, 'xiHu=hangZhou')
                  let getCookieValue:string = webview.WebCookieManager.fetchCookieSync(URL_EXAMPLE)
                  console.log('OH_ArkWebCookieManager_SaveCookieAsync002 fetchCookieSync:' + getCookieValue)
                  let resultValue:number = testNapi.saveCookieAsyncCallback()
                  console.log('OH_ArkWebCookieManager_SaveCookieAsync002 saveCookieAsyncCallback resultValue:' + String(resultValue))
                  await waitForExist(()=>testNapi.getSaveCookieAsyncCallbackResult(), 'OH_ArkWebCookieManager_SaveCookieAsync002_syncThread', 0, 1000)
                  let resultCode:number = testNapi.getSaveCookieAsyncCallbackResult()
                  console.log('OH_ArkWebCookieManager_SaveCookieAsync002 getSaveCookieAsyncCallbackResult resultCode:' + String(resultCode))
                  Utils.emitEvent(String(resultCode),148690)
                  break
                }
                case 'OH_ArkWebCookieManager_SaveCookieAsync003': {
                  webview.WebCookieManager.clearAllCookiesSync()
                  webview.WebCookieManager.configCookieSync(URL_EXAMPLE, 'xiHu=hangZhou')
                  let getCookieValue:string = webview.WebCookieManager.fetchCookieSync(URL_EXAMPLE)
                  console.log('OH_ArkWebCookieManager_SaveCookieAsync003 fetchCookieSync:' + getCookieValue)
                  let resultValue:number = testNapi.saveCookieAsyncThread()
                  console.log('OH_ArkWebCookieManager_SaveCookieAsync003 saveCookieAsyncNullptr resultValue:' + String(resultValue))
                  await waitForExist(()=>testNapi.getSaveCookieAsyncCallbackResult(), 'OH_ArkWebCookieManager_SaveCookieAsync003_syncThread', 0, 1000)
                  let resultCode:number = testNapi.getSaveCookieAsyncCallbackResult()
                  console.log('OH_ArkWebCookieManager_SaveCookieAsync003 getSaveCookieAsyncCallbackResult resultCode:' + String(resultCode))
                  Utils.emitEvent(String(resultCode),148700)
                  break
                }
                default :
                  break
              }
            })
        }
        Web({src: $rawfile('test.html'), controller: this.controller})
          .javaScriptAccess(true)
          .fileAccess(true)
          .onPageBegin((event) => {
            console.log('onPageBegin url:' + event.url)
          })
          .onPageEnd((event) => {
            console.log('onPageEnd url:' + event.url)
            this.isPageEnd = 1
          })
    }
  }
}
