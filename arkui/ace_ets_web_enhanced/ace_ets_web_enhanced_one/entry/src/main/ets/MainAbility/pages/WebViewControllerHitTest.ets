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

import webView from '@ohos.web.webview';
import business_error from '@ohos.base';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct WebViewControllerHitTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State hitType: number = -1
  hitTestValue?: webView.HitTestValue

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
    console.log("webView.WebHitTestType EditText: " + webView.WebHitTestType.EditText)
    console.log("webView.WebHitTestType Email: " + webView.WebHitTestType.Email)
    console.log("webView.WebHitTestType HttpAnchor: " + webView.WebHitTestType.HttpAnchor)
    console.log("webView.WebHitTestType HttpAnchorImg: " + webView.WebHitTestType.HttpAnchorImg)
    console.log("webView.WebHitTestType Img: " + webView.WebHitTestType.Img)
    console.log("webView.WebHitTestType Map: " + webView.WebHitTestType.Map)
    console.log("webView.WebHitTestType Phone: " + webView.WebHitTestType.Phone)
    console.log("webView.WebHitTestType Unknown: " + webView.WebHitTestType.Unknown)
  }

  build() {
    Row() {
      Column() {
        Button('WebViewControllerHitTestButton').key('WebViewControllerHitTestButton')
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {
              case "emitGetHitTestValue001": {
                try {
                  this.controller.loadUrl('resource://rawfile/hitTypeEditText.html')
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.sleep(3000)
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.type, 70101)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTestValue002": {
                try {
                  this.controller.loadUrl('resource://rawfile/hitTypeEmail.html')
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.sleep(3000)
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.type, 70103)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTestValue003": {
                try {
                  this.controller.loadUrl('resource://rawfile/hitTypeHttpAnchor.html')
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.sleep(3000)
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.type, 70105)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTestValue004": {
                try {
                  this.controller.loadUrl('resource://rawfile/hitTypeHttpAnchorImg.html')
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.sleep(3000)
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.type, 70107)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTestValue005": {
                try {
                  this.controller.loadUrl('resource://rawfile/hitTypeImg.html')
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.sleep(3000)
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.type, 70109)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTestValue006": {
                try {
                  this.controller.loadUrl('resource://rawfile/hitTypeMap.html')
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.sleep(3000)
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.type, 70111)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTestValue007": {
                try {
                  this.controller.loadUrl('resource://rawfile/hitTypePhone.html')
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.sleep(3000)
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.type, 70113)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTestValue008": {
                try {
                  this.controller.loadUrl('resource://rawfile/hitTypeUnknown.html')
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.sleep(3000)
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.type, 70115)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTestValue009": {
                try {
                  this.controller.loadUrl('resource://rawfile/hitTypeEmail.html')
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.sleep(3000)
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.extra, 70117)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTestValue010": {
                try {
                  this.controller.loadUrl('resource://rawfile/hitTypeHttpAnchor.html')
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.sleep(3000)
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.extra, 70119)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTestValue011": {
                try {
                  this.controller.loadUrl('resource://rawfile/hitTypeHttpAnchorImg.html')
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.sleep(3000)
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.extra, 70121)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTestValue012": {
                try {
                  this.controller.loadUrl('resource://rawfile/hitTypeImg.html')
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.sleep(3000)
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.extra, 70123)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTestValue013": {
                try {
                  this.controller.loadUrl('resource://rawfile/hitTypePhone.html')
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.sleep(3000)
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.extra, 70125)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTest001": {
                try {
                  this.controller.loadUrl('resource://rawfile/hitTypeEditText.html')
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.sleep(3000)
                  Utils.emitEvent(this.hitType, 70127)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTest002": {
                try {
                  this.controller.loadUrl('resource://rawfile/hitTypeEmail.html')
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.sleep(3000)
                  Utils.emitEvent(this.hitType, 70129)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTest003": {
                try {
                  this.controller.loadUrl('resource://rawfile/hitTypeHttpAnchor.html')
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.sleep(3000)
                  Utils.emitEvent(this.hitType, 70131)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTest004": {
                try {
                  this.controller.loadUrl('resource://rawfile/hitTypeHttpAnchorImg.html')
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.sleep(3000)
                  Utils.emitEvent(this.hitType, 70133)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTest005": {
                try {
                  this.controller.loadUrl('resource://rawfile/hitTypeImg.html')
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.sleep(3000)
                  Utils.emitEvent(this.hitType, 70135)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTest006": {
                try {
                  this.controller.loadUrl('resource://rawfile/hitTypeMap.html')
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.sleep(3000)
                  Utils.emitEvent(this.hitType, 70137)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTest007": {
                try {
                  this.controller.loadUrl('resource://rawfile/hitTypePhone.html')
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.sleep(3000)
                  Utils.emitEvent(this.hitType, 70139)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTest008": {
                try {
                  this.controller.loadUrl('resource://rawfile/hitTypeUnknown.html')
                  await Utils.sleep(3000)
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.sleep(3000)
                  Utils.emitEvent(this.hitType, 70141)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
            }
          })

        Web({ src: $rawfile('hitType.html'), controller: this.controller })
          .key('WebViewControllerHitTestWebView')
          .height('50%')
          .width('100%')
          .onClick(() => {
            try {
              this.hitType = this.controller.getHitTest()
              console.log("hitType: " + this.hitType)
              this.hitTestValue = this.controller.getHitTestValue();
              console.log("hitType: " + this.hitTestValue.type);
              console.log("extra: " + this.hitTestValue.extra);
            } catch (error) {
              let e: business_error.BusinessError = error as business_error.BusinessError;
              console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
            }
          })
          .javaScriptAccess(true)
          .onContextMenuShow((event) => {
            console.info("x onContextMenuShow")
            if (event) {
              console.info("x coord = " + event.param.x())
              console.info("link url = " + event.param.getLinkUrl())
            }
            return false
          });
      }
      .width('100%')
    }
    .height('100%')
  }
}