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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { Driver, MouseButton, ON } from '@ohos.UiTest';

@Entry
@Component
struct WebViewOverviewModeAccessAndContextMenuMediaTypeImage {
  @State str: string = ""
  @State FileSelectorMode: Number = 0
  @State MediaType: Number = 0
  @State SslErrorCount: Number = 0
  @State mouse: Boolean = false
  controller: webView.WebviewController = new webView.WebviewController();

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

  build() {
    Column() {
      Row() {
        Button("web clicks").key('buttonOverviewModeAccessAndContextMenuMediaType').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitContextMenuMediaTypeImage": {
              this.mouse = false
              this.controller.loadUrl("resource://rawfile/indexLongClickImage.html")
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('webCenterPage'));
              await button.longClick();
              break;
            }
            case "emitOverviewModeAccessFalse": {
              this.controller.loadUrl("resource://rawfile/overView.html")
              await Utils.sleep(2000);
              this.controller.runJavaScript("getViewResult()", (error, result) => {
                console.info("getViewResult==>false" + result + error);
                Utils.emitEvent(result + '', 1292)
              });
              break;
            }
            case "emitContextMenuSourceTypeMouse": {
              this.mouse = true
              this.controller.loadUrl("resource://rawfile/indexLongClickImage.html")
              await Utils.sleep(2000);
              let webRect = Utils.getComponentRect('webCenterPage');
              let driver = Driver.create();
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_RIGHT);
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("indexThree.html"), controller: this.controller })
        .key("webCenterPage")
        .defaultFontSize(13)
        .textZoomRatio(100)
        .onShowFileSelector((event) => {
          if (event) {
            let fileSelectorObj: FileSelectorParam = event.fileSelector
            this.FileSelectorMode = fileSelectorObj.getMode()
          }
          return true
        })
        .onContextMenuShow((event) => {
          if (event) {
            event.result.closeContextMenu()
            if (this.mouse) {
              console.info("onContextMenuShow getSourceType = " + event.param.getSourceType())
              Utils.emitEvent(event.param.getSourceType(), 1981)
            } else {
              Utils.emitEvent(event.param.getMediaType(), 882)
            }
          }
          return true
        })
        .onSslErrorEventReceive((event) => {
          if (event) {
            this.SslErrorCount = event.error
          }
        })
        .overviewModeAccess(false)
    }
  }
}
