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
import { Driver } from '@kit.TestKit';

const EVENT_ID_SET_SUITE_KEY = 176301;

@Entry
@Component
struct WebViewControllerHitTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State hitType: number = -1
  hitTestValue?: webView.HitTestValue

  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isGetHitType: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
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
            await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
            await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
            switch (this.str) {
              case "emitGetHitTestValue001": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/hitTypeEditText.html')
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  this.isGetHitType = -1;
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.waitForExist(()=>this.isGetHitType, this.str+' isGetHitType', 1, 1000);
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.type, 176310)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTestValue002": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/hitTypeEmail.html')
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  this.isGetHitType = -1;
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.waitForExist(()=>this.isGetHitType, this.str+' isGetHitType', 1, 1000);
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.type, 176320)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTestValue003": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/hitTypeHttpAnchor.html')
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  this.isGetHitType = -1;
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.waitForExist(()=>this.isGetHitType, this.str+' isGetHitType', 1, 1000);
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.type, 176330)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTestValue004": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/hitTypeHttpAnchorImg.html')
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  this.isGetHitType = -1;
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.waitForExist(()=>this.isGetHitType, this.str+' isGetHitType', 1, 1000);
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.type, 176340)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTestValue005": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/hitTypeImg.html')
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  this.isGetHitType = -1;
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.waitForExist(()=>this.isGetHitType, this.str+' isGetHitType', 1, 1000);
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.type, 176350)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTestValue006": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/hitTypeMap.html')
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  this.isGetHitType = -1;
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.waitForExist(()=>this.isGetHitType, this.str+' isGetHitType', 1, 1000);
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.type, 176360)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTestValue007": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/hitTypePhone.html')
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  this.isGetHitType = -1;
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.waitForExist(()=>this.isGetHitType, this.str+' isGetHitType', 1, 1000);
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.type, 176370)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTestValue008": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/hitTypeUnknown.html')
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  this.isGetHitType = -1;
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.waitForExist(()=>this.isGetHitType, this.str+' isGetHitType', 1, 1000);
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.type, 176380)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTestValue009": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/hitTypeEmail.html')
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  this.isGetHitType = -1;
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.waitForExist(()=>this.isGetHitType, this.str+' isGetHitType', 1, 1000);
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.extra, 176390)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTestValue010": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/hitTypeHttpAnchor.html')
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  this.isGetHitType = -1;
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.waitForExist(()=>this.isGetHitType, this.str+' isGetHitType', 1, 1000);
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.extra, 176400)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTestValue011": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/hitTypeHttpAnchorImg.html')
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  this.isGetHitType = -1;
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.waitForExist(()=>this.isGetHitType, this.str+' isGetHitType', 1, 1000);
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.extra, 176410)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTestValue012": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/hitTypeImg.html')
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  this.isGetHitType = -1;
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.waitForExist(()=>this.isGetHitType, this.str+' isGetHitType', 1, 1000);
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.extra, 176420)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTestValue013": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/hitTypePhone.html')
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  this.isGetHitType = -1;
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.waitForExist(()=>this.isGetHitType, this.str+' isGetHitType', 1, 1000);
                  if (this.hitTestValue) {
                    Utils.emitEvent(this.hitTestValue.extra, 176430)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTest001": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/hitTypeEditText.html')
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  this.isGetHitType = -1;
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.waitForExist(()=>this.isGetHitType, this.str+' isGetHitType', 1, 1000);
                  Utils.emitEvent(this.hitType, 176440)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTest002": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/hitTypeEmail.html')
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  this.isGetHitType = -1;
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.waitForExist(()=>this.isGetHitType, this.str+' isGetHitType', 1, 1000);
                  Utils.emitEvent(this.hitType, 176450)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTest003": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/hitTypeHttpAnchor.html')
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  this.isGetHitType = -1;
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.waitForExist(()=>this.isGetHitType, this.str+' isGetHitType', 1, 1000);
                  Utils.emitEvent(this.hitType, 176460)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTest004": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/hitTypeHttpAnchorImg.html')
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  this.isGetHitType = -1;
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.waitForExist(()=>this.isGetHitType, this.str+' isGetHitType', 1, 1000);
                  Utils.emitEvent(this.hitType, 176470)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTest005": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/hitTypeImg.html')
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  this.isGetHitType = -1;
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.waitForExist(()=>this.isGetHitType, this.str+' isGetHitType', 1, 1000);
                  Utils.emitEvent(this.hitType, 176480)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTest006": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/hitTypeMap.html')
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  this.isGetHitType = -1;
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.waitForExist(()=>this.isGetHitType, this.str+' isGetHitType', 1, 1000);
                  Utils.emitEvent(this.hitType, 176490)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTest007": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/hitTypePhone.html')
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  this.isGetHitType = -1;
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.waitForExist(()=>this.isGetHitType, this.str+' isGetHitType', 1, 1000);
                  Utils.emitEvent(this.hitType, 176500)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetHitTest008": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/hitTypeUnknown.html')
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  this.isGetHitType = -1;
                  await Utils.clickComponent('WebViewControllerHitTestWebView')
                  await Utils.waitForExist(()=>this.isGetHitType, this.str+' isGetHitType', 1, 1000);
                  Utils.emitEvent(this.hitType, 176510)
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
              this.isGetHitType = 1;
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
          })
          .onPageEnd((event) => {
            console.log('onPageEnd url:' + event.url);
            this.isPageEnd = 1;
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}