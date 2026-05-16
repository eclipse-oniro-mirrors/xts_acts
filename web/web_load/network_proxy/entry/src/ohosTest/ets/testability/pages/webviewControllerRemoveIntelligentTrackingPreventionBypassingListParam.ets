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
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 178800,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }
  
  onPageHide() {
    events_emitter.off(178800)
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
        Button('webviewControllerRemoveIntelligentTrackingPreventionBypassingListParam')
          .key('webviewControllerRemoveIntelligentTrackingPreventionBypassingListParamButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.str, 0);
          await waitForExist(()=>this.isPageEnd, this.str, 0);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case 'emitRemoveIntelligentTrackingPreventionBypassingListHostListNull001': {
              try {
                console.info('test removeIntelligentTrackingPreventionBypassingList with null hostList');
                webView.WebviewController.removeIntelligentTrackingPreventionBypassingList(null);
                Utils.emitEvent(false, 178810);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                if (e.code == 801) {
                  Utils.emitEvent(true, 178810);
                } else if (e.code == 401) {
                  Utils.emitEvent(true, 178810);
                } else {
                  Utils.emitEvent(false, 178810);
                }
              }
              break;
            }
            case 'emitRemoveIntelligentTrackingPreventionBypassingListHostListUndefined001': {
              try {
                console.info('test removeIntelligentTrackingPreventionBypassingList with undefined hostList');
                webView.WebviewController.removeIntelligentTrackingPreventionBypassingList(undefined);
                Utils.emitEvent(false, 178820);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                if (e.code == 801) {
                  Utils.emitEvent(true, 178820);
                } else if (e.code == 401) {
                  Utils.emitEvent(true, 178820);
                } else {
                  Utils.emitEvent(false, 178820);
                }

              }
              break;
            }
            case 'emitRemoveIntelligentTrackingPreventionBypassingListHostListEmptyArray001': {
              try {
                console.info('test removeIntelligentTrackingPreventionBypassingList with empty array hostList');
                let emptyArray: string[] = [];
                webView.WebviewController.removeIntelligentTrackingPreventionBypassingList(emptyArray);
                Utils.emitEvent(false, 178830);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                if (e.code == 801) {
                  Utils.emitEvent(true, 178830);
                } else if (e.code == 401) {
                  Utils.emitEvent(true, 178830);
                } else {
                  Utils.emitEvent(false, 178830);
                }
              }
              break;
            }
            case 'emitRemoveIntelligentTrackingPreventionBypassingListHostListNormal001': {
              try {
                console.info('test removeIntelligentTrackingPreventionBypassingList with normal hostList');
                let hostList: string[] = ['www.example.com', 'www.test.com'];
                webView.WebviewController.removeIntelligentTrackingPreventionBypassingList(hostList);
                Utils.emitEvent(true, 178840);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                if (e.code == 801) {
                  Utils.emitEvent(true, 178840);
                } else if (e.code == 401) {
                  Utils.emitEvent(false, 178840);
                } else {
                  Utils.emitEvent(false, 178840);
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
