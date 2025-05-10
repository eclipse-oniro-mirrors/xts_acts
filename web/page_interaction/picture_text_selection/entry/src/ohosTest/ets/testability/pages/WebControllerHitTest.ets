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

import business_error from '@ohos.base';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct WebControllerHitTest {
  controller: WebController = new WebController();
  @State str: string = ""
  @State hitType: number = -1

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  aboutToAppear(): void {
    console.log("HitTestType EditText: " + HitTestType.EditText)
    console.log("HitTestType Email: " + HitTestType.Email)
    console.log("HitTestType HttpAnchor: " + HitTestType.HttpAnchor)
    console.log("HitTestType HttpAnchorImg: " + HitTestType.HttpAnchorImg)
    console.log("HitTestType Img: " + HitTestType.Img)
    console.log("HitTestType Map: " + HitTestType.Map)
    console.log("HitTestType Phone: " + HitTestType.Phone)
    console.log("HitTestType Unknown: " + HitTestType.Unknown)
  }

  build() {
    Row() {
      Column() {
        Button('WebControllerHitTestButton').key('WebControllerHitTestButton')
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {
              case "emitGetHitTest001": {
                try {
                  this.controller.loadUrl({ url: 'resource://rawfile/hitTypeEditText.html' })
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebControllerHitTestWebView')
                  await Utils.sleep(3000)
                  Utils.emitEvent(this.hitType, 70170)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTest002": {
                try {
                  this.controller.loadUrl({ url: 'resource://rawfile/hitTypeEmail.html' })
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebControllerHitTestWebView')
                  await Utils.sleep(3000)
                  Utils.emitEvent(this.hitType, 70172)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTest003": {
                try {
                  this.controller.loadUrl({ url: 'resource://rawfile/hitTypeHttpAnchor.html' })
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebControllerHitTestWebView')
                  await Utils.sleep(3000)
                  Utils.emitEvent(this.hitType, 70174)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTest004": {
                try {
                  this.controller.loadUrl({ url: 'resource://rawfile/hitTypeHttpAnchorImg.html' })
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebControllerHitTestWebView')
                  await Utils.sleep(3000)
                  Utils.emitEvent(this.hitType, 70176)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTest005": {
                try {
                  this.controller.loadUrl({ url: 'resource://rawfile/hitTypeImg.html' })
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebControllerHitTestWebView')
                  await Utils.sleep(3000)
                  Utils.emitEvent(this.hitType, 70178)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTest006": {
                try {
                  this.controller.loadUrl({ url: 'resource://rawfile/hitTypeMap.html' })
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebControllerHitTestWebView')
                  await Utils.sleep(3000)
                  Utils.emitEvent(this.hitType, 70180)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTest007": {
                try {
                  this.controller.loadUrl({ url: 'resource://rawfile/hitTypePhone.html' })
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebControllerHitTestWebView')
                  await Utils.sleep(3000)
                  Utils.emitEvent(this.hitType, 70182)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTest008": {
                try {
                  this.controller.loadUrl({ url: 'resource://rawfile/hitTypeUnknown.html' })
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebControllerHitTestWebView')
                  await Utils.sleep(3000)
                  Utils.emitEvent(this.hitType, 70184)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
            }
          })

        Web({ src: $rawfile('hitType.html'), controller: this.controller })
          .key('WebControllerHitTestWebView')
          .height('50%')
          .width('100%')
          .onClick(() => {
            try {
              this.hitType = this.controller.getHitTest()
              console.log("hitType: " + this.hitType)
            } catch (error) {
              let e: business_error.BusinessError = error as business_error.BusinessError;
              console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
            }
          })
          .javaScriptAccess(true)
      }
      .width('100%')
    }
    .height('100%')
  }
}