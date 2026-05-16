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
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import { BusinessError } from '@ohos.base';
import webView from '@ohos.web.webview';
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct Index {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 172900,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }
  
  onPageHide() {
    events_emitter.off(172900)
  }
  
  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .width('100%')
        .height('80%')
        .onPageEnd(() => {
          this.isPageEnd = 0;
        })
      
      Row() {
        Button('webviewControllerEnableBackForwardCacheParam').key('webviewControllerEnableBackForwardCacheParamButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.str, 0);
          await waitForExist(()=>this.isPageEnd, this.str, 0);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case 'emitEnableBackForwardCacheNativeEmbedTrue001': {
              try {
                console.info('test enableBackForwardCache with nativeEmbed true');
                let features: webView.BackForwardCacheSupportedFeatures = {
                  nativeEmbed: true,
                  mediaTakeOver: false
                };
                webView.WebviewController.enableBackForwardCache(features);
                Utils.emitEvent('success', 172910);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172910);
              }
              break;
            }
            case 'emitEnableBackForwardCacheNativeEmbedFalse001': {
              try {
                console.info('test enableBackForwardCache with nativeEmbed false');
                let features: webView.BackForwardCacheSupportedFeatures = {
                  nativeEmbed: false,
                  mediaTakeOver: false
                };
                webView.WebviewController.enableBackForwardCache(features);
                Utils.emitEvent('success', 172920);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172920);
              }
              break;
            }
            case 'emitEnableBackForwardCacheMediaTakeOverTrue001': {
              try {
                console.info('test enableBackForwardCache with mediaTakeOver true');
                let features: webView.BackForwardCacheSupportedFeatures = {
                  nativeEmbed: false,
                  mediaTakeOver: true
                };
                webView.WebviewController.enableBackForwardCache(features);
                Utils.emitEvent('success', 172930);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172930);
              }
              break;
            }
            case 'emitEnableBackForwardCacheMediaTakeOverFalse001': {
              try {
                console.info('test enableBackForwardCache with mediaTakeOver false');
                let features: webView.BackForwardCacheSupportedFeatures = {
                  nativeEmbed: false,
                  mediaTakeOver: false
                };
                webView.WebviewController.enableBackForwardCache(features);
                Utils.emitEvent('success', 172940);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172940);
              }
              break;
            }
            case 'emitEnableBackForwardCacheNull001': {
              try {
                console.info('test enableBackForwardCache with null features');
                webView.WebviewController.enableBackForwardCache(null);
                Utils.emitEvent('success', 172950);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172950);
              }
              break;
            }
            case 'emitEnableBackForwardCacheUndefined001': {
              try {
                console.info('test enableBackForwardCache with undefined features');
                webView.WebviewController.enableBackForwardCache(undefined);
                Utils.emitEvent('success', 172960);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172960);
              }
              break;
            }
            case 'emitEnableBackForwardCacheBothTrue001': {
              try {
                console.info('test enableBackForwardCache with both nativeEmbed and mediaTakeOver true');
                let features: webView.BackForwardCacheSupportedFeatures = {
                  nativeEmbed: true,
                  mediaTakeOver: true
                };
                webView.WebviewController.enableBackForwardCache(features);
                Utils.emitEvent('success', 172970);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172970);
              }
              break;
            }
            default:
              console.info('can not match case');
          }
        })
      }
    }
    .width('100%')
    .height('100%')
  }
}
