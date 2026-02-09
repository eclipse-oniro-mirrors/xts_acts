/*
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

import Utils from '../../test/Utils';
import webview from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';
import { URL} from '../../test/Config.test';

@Entry
@Component
struct webPrefetchPageEnhancedTest {
  controller: webview.WebviewController = new webview.WebviewController();
  controllerTwo: webview.WebviewController = new webview.WebviewController();
  @State emitKey: string = '';
  @State msg: string = 'no error';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 119,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(119)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
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
        Button('prefetchPage click')
          .key('WebPrefetchPageEnhancedButton')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, this.emitKey, 0, 1000);
            await waitForExist(()=>this.isPageEnd, this.emitKey, 0, 1000);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            switch (this.emitKey) {
              case 'emitPrefetchPageWithHeader01': {
                try {
                  this.controller.prefetchPage(URL, [{ headerKey: 'headerKey', headerValue: 'headerValue' }]);
                  this.controller.loadUrl(URL);
                  Utils.emitEvent(this.msg, 2025091601);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(error.message, 2025091601);
                }
                break;
              }
              case 'emitPrefetchPageWithHeader02': {
                try {
                  this.controller.prefetchPage(URL, null);
                  this.controller.loadUrl(URL);
                  Utils.emitEvent(this.msg, 2025091602);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(error.message, 2025091602);
                }
                break;
              }
              case 'emitPrefetchPageWithHeader03': {
                try {
                  this.controller.prefetchPage(URL, undefined);
                  this.controller.loadUrl(URL);
                  Utils.emitEvent(this.msg, 2025091603);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(error.message, 2025091603);
                }
                break;
              }
              case 'emitPrefetchPageWithHeaderError01': {
                try {
                  this.controller.prefetchPage('123', [{ headerKey: 'headerKey', headerValue: 'headerValue' }]);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(error.code + error.message, 26020501);
                }
                break;
              }
              case 'emitPrefetchPageWithOptions01': {
                try {
                  let options = new webview.PrefetchOptions();
                  options.ignoreCacheControlNoStore = true;
                  options.minTimeBetweenPrefetchesMs = 100;
                  this.controller.prefetchPage(URL, [], options);
                  this.controller.loadUrl(URL);
                  Utils.emitEvent(this.msg, 2025091604);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(error.message, 2025091604);
                }
                break;
              }
              case 'emitPrefetchPageWithOptions02': {
                try {
                  let options = new webview.PrefetchOptions();
                  options.ignoreCacheControlNoStore = true;
                  options.minTimeBetweenPrefetchesMs = 100;
                  this.controller.prefetchPage(URL, [{ headerKey: 'headerKey', headerValue: 'headerValue' }], options);
                  this.controller.loadUrl(URL);
                  Utils.emitEvent(this.msg, 2025091605);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(error.message, 2025091605);
                }
                break;
              }
              case 'emitPrefetchPageWithOptions03': {
                try {
                  let options = new webview.PrefetchOptions();
                  options.ignoreCacheControlNoStore = false;
                  options.minTimeBetweenPrefetchesMs = -1;
                  this.controller.prefetchPage(URL, [{ headerKey: 'headerKey', headerValue: 'headerValue' }], options);
                  this.controller.loadUrl(URL);
                  Utils.emitEvent(this.msg, 2025091606);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(error.message, 2025091606);
                }
                break;
              }
              case 'emitPrefetchPageWithOptions04': {
                try {
                  let options = new webview.PrefetchOptions();
                  options.ignoreCacheControlNoStore = false;
                  options.minTimeBetweenPrefetchesMs = 0;
                  this.controller.prefetchPage(URL, [{ headerKey: 'headerKey', headerValue: 'headerValue' }], options);
                  this.controller.loadUrl(URL);
                  Utils.emitEvent(this.msg, 2025091607);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(error.message, 2025091607);
                }
                break;
              }
              case 'emitPrefetchPageWithOptions05': {
                try {
                  let options = new webview.PrefetchOptions();
                  options.ignoreCacheControlNoStore = true;
                  options.minTimeBetweenPrefetchesMs = 3.145;
                  this.controller.prefetchPage(URL, [{ headerKey: 'headerKey', headerValue: 'headerValue' }], options);
                  this.controller.loadUrl(URL);
                  Utils.emitEvent(this.msg, 2025091608);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(error.message, 2025091608);
                }
                break;
              }
              case 'emitPrefetchPageWithOptions06': {
                try {
                  let options = new webview.PrefetchOptions();
                  options.ignoreCacheControlNoStore = true;
                  options.minTimeBetweenPrefetchesMs = 501;
                  this.controller.prefetchPage(URL, [{ headerKey: 'headerKey', headerValue: 'headerValue' }], options);
                  this.controller.loadUrl(URL);
                  Utils.emitEvent(this.msg, 2025091609);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(error.message, 2025091609);
                }
                break;
              }
              case 'emitPrefetchPageWithOptions07': {
                try {
                  let options = new webview.PrefetchOptions();
                  options.ignoreCacheControlNoStore = true;
                  options.minTimeBetweenPrefetchesMs = 1e10;
                  this.controller.prefetchPage(URL, [{ headerKey: 'headerKey', headerValue: 'headerValue' }], options);
                  this.controller.loadUrl(URL);
                  Utils.emitEvent(this.msg, 2025091610);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(error.message, 2025091610);
                }
                break;
              }
              case 'emitPrefetchPageWithOptions08': {
                try {
                  let options = new webview.PrefetchOptions();
                  options.ignoreCacheControlNoStore = true;
                  options.minTimeBetweenPrefetchesMs = 999999999999999;
                  this.controller.prefetchPage(URL, [{ headerKey: 'headerKey', headerValue: 'headerValue' }], options);
                  this.controller.loadUrl(URL);
                  Utils.emitEvent(this.msg, 2025091611);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(error.message, 2025091611);
                }
                break;
              }
              case 'emitPrefetchPageWithOptions09': {
                try {
                  let options = new webview.PrefetchOptions();
                  options.minTimeBetweenPrefetchesMs = 100;
                  this.controller.prefetchPage(URL, [{ headerKey: 'headerKey', headerValue: 'headerValue' }], options);
                  this.controller.loadUrl(URL);
                  Utils.emitEvent(this.msg, 2025091612);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(error.message, 2025091612);
                }
                break;
              }
              case 'emitPrefetchPageWithOptions10': {
                try {
                  let options = new webview.PrefetchOptions();
                  options.ignoreCacheControlNoStore = true;
                  this.controller.prefetchPage(URL, [{ headerKey: 'headerKey', headerValue: 'headerValue' }], options);
                  this.controller.loadUrl(URL);
                  Utils.emitEvent(this.msg, 2025091613);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(error.message, 2025091613);
                }
                break;
              }
              case 'emitPrefetchPageWithOptions11': {
                try {
                  let options = new webview.PrefetchOptions();
                  this.controller.prefetchPage(URL, [{ headerKey: 'headerKey', headerValue: 'headerValue' }], options);
                  this.controller.loadUrl(URL);
                  Utils.emitEvent(this.msg, 2025091614);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(error.message, 2025091614);
                }
                break;
              }
              case 'emitPrefetchPageWithOptionsError01': {
                try {
                  let options = new webview.PrefetchOptions();
                  options.ignoreCacheControlNoStore = true;
                  options.minTimeBetweenPrefetchesMs = 100;
                  this.controllerTwo.prefetchPage(URL, [{ headerKey: 'headerKey', headerValue: 'headerValue' }], options);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(Number(error.code), 2025091615);
                }
                break;
              }
              case 'emitPrefetchPageWithOptionsError02': {
                try {
                  let options = new webview.PrefetchOptions();
                  options.ignoreCacheControlNoStore = true;
                  options.minTimeBetweenPrefetchesMs = 100;
                  this.controller.prefetchPage('123', [{ headerKey: 'headerKey', headerValue: 'headerValue' }], options);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(error.code + error.message, 2025091616);
                }
                break;
              }
            }
          })
      }
      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 0;
            console.log('onPageEnd url:' + event.url);
          }
        })
        .width('100%')
        .height('100%')
    }
  }
}
