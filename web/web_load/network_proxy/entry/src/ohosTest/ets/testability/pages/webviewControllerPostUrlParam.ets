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
      eventId: 173200,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }
  
  onPageHide() {
    events_emitter.off(173200)
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
        Button('webviewControllerPostUrlParam').key('webviewControllerPostUrlParamButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.str, 0);
          await waitForExist(()=>this.isPageEnd, this.str, 0);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          let postData: ArrayBuffer = new ArrayBuffer(2);
          switch (this.str) {
            case 'emitPostUrlNullUrl001': {
              try {
                console.info('test postUrl with null url');
                this.controller.postUrl(null, postData);
                Utils.emitEvent('success', 173210);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 173210);
              }
              break;
            }
            case 'emitPostUrlUndefinedUrl001': {
              try {
                console.info('test postUrl with undefined url');
                this.controller.postUrl(undefined, postData);
                Utils.emitEvent('success', 173220);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 173220);
              }
              break;
            }
            case 'emitPostUrlEmptyStringUrl001': {
              try {
                console.info('test postUrl with empty string url');
                this.controller.postUrl('', postData);
                Utils.emitEvent('success', 173230);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 173230);
              }
              break;
            }
            case 'emitPostUrlNullPostData001': {
              try {
                console.info('test postUrl with null postData');
                this.controller.postUrl('htt' + 'ps://www.example.com', null);
                Utils.emitEvent('success', 173240);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 173240);
              }
              break;
            }
            case 'emitPostUrlUndefinedPostData001': {
              try {
                console.info('test postUrl with undefined postData');
                this.controller.postUrl('htt' + 'ps://www.example.com', undefined);
                Utils.emitEvent('success', 173250);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 173250);
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
