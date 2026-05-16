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
      eventId: 182000,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }
  
  onPageHide() {
    events_emitter.off(182000)
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
        .onPageEnd((event) => {
          console.log('onPageEnd ==>' + event.url);
          this.isPageEnd = 0;
        })


      Row() {
        Button('adsBlockManagerRemoveAdsBlockDisallowedListParam').key('adsBlockManagerRemoveAdsBlockDisallowedListParamButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.str, 0);
          await waitForExist(()=>this.isPageEnd, this.str, 0);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case 'emitRemoveAdsBlockDisallowedListNull001': {
              try {
                console.info('test AdsBlockManager.removeAdsBlockDisallowedList with null domainSuffixes');
                webView.AdsBlockManager.removeAdsBlockDisallowedList(null);
                Utils.emitEvent(false, 182010);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                if (e.code == 801) {
                  Utils.emitEvent(true, 182010);
                } else if (e.code == 401) {
                  Utils.emitEvent(true, 182010);
                } else {
                  Utils.emitEvent(false, 182010);
                }
              }
              break;
            }
            case 'emitRemoveAdsBlockDisallowedListUndefined001': {
              try {
                console.info('test AdsBlockManager.removeAdsBlockDisallowedList with undefined domainSuffixes');
                webView.AdsBlockManager.removeAdsBlockDisallowedList(undefined);
                Utils.emitEvent(false, 182020);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                if (e.code == 801) {
                  Utils.emitEvent(true, 182020);
                } else if (e.code == 401) {
                  Utils.emitEvent(true, 182020);
                } else {
                  Utils.emitEvent(false, 182020);
                }
              }
              break;
            }
            case 'emitRemoveAdsBlockDisallowedListValidArray001': {
              try {
                console.info('test AdsBlockManager.removeAdsBlockDisallowedList with valid non-empty array');
                let domainSuffixes: string[] = ['example.com', 'test.com', 'ads.example.org'];
                webView.AdsBlockManager.removeAdsBlockDisallowedList(domainSuffixes);
                Utils.emitEvent(true, 182030);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                if (e.code == 801) {
                  Utils.emitEvent(true, 182030);
                } else if (e.code == 401) {
                  Utils.emitEvent(false, 182030);
                } else {
                  Utils.emitEvent(false, 182030);
                }

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
