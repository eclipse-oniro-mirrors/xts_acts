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
import { Driver, ON, MouseButton } from '@ohos.UiTest';

@CustomDialog
struct NewWebViewComp {
  controller?: CustomDialogController
  webViewController1: webView.WebviewController = new webView.WebviewController()

  build() {
    Column() {
      Web({ src: "", controller: this.webViewController1 })
        .javaScriptAccess(true)
        .multiWindowAccess(false)
        .onWindowExit(() => {
          console.info("NewWebViewComp onWindowExit")
          if (this.controller) {
            this.controller.close()
          }
        })
    }
  }
}

@Entry
@Component
struct WebViewEnumAndSetWebController {
  @State str: string = ""
  @State javaScriptAccess: boolean = true
  @State mixedState: boolean = false
  @State zoomCounts: number = 200
  @State fontSize: number = 28
  @State checkEleResult: string = "";
  @State overviewModeAccess: boolean = true
  @State overviewScale: string = ""
  @State noOpenWindow: null = null
  @State outputStr: string = ''
  @State CacheMode: CacheMode = CacheMode.None
  @State cacheError: boolean = false
  @State errorCode: string = '0';
  @State block: Boolean = false
  @State FileSelectorMode: Number = 0
  @State MediaType: Number = 0
  @State userAgentPC:string = "";
  @State mouse: Boolean = false
  @State precomposedResult:boolean =  false;
  handler: FullScreenExitHandler | null = null
  dialogController: CustomDialogController | null = null
  popController: webView.WebviewController | null = null;
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
        Button("web clicks").key('buttonEnumAndSetWebController').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitFileSelectorModeFileOpenMultipleMode": {
              this.controller.loadUrl("resource://rawfile/indexFile1.html")
              await Utils.sleep(2000);
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('WebViewEnumAndSetWebControllerWebView'));
              await button.click();
              await Utils.sleep(2000);
              Utils.emitEvent(Number(this.FileSelectorMode), 862)
              break;
            }
            case "emitFileSelectorModeFileOpenFolderMode": {
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/indexFile2.html")
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('WebViewEnumAndSetWebControllerWebView'));
              await button.click();
              await Utils.sleep(2000);
              Utils.emitEvent(Number(this.FileSelectorMode), 863)
              break;
            }
            case "emitContextMenuMediaTypeImage": {
              this.mouse = false
              this.controller.loadUrl("resource://rawfile/indexLongClickImage.html")
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('WebViewEnumAndSetWebControllerWebView'));
              await button.longClick();
              break;
            }
            case "emitContextMenuSourceTypeMouse": {
              this.mouse = true
              this.controller.loadUrl("resource://rawfile/indexLongClickImage.html")
              await Utils.sleep(2000);
              let webRect = Utils.getComponentRect('WebViewEnumAndSetWebControllerWebView');
              let driver = Driver.create();
              let X = Utils.getRectHorizontalCenterX(webRect)
              let Y = Utils.getRectVerticalCenterY(webRect)
              await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_RIGHT);
              break;
            }
          }
        })
      }

      Row() {
        Image("media/icon.png")
          .width(110)
          .height(110)
          .border({ width: 1 })
          .overlay('jpg', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
          .key("images")
      }

      Web({ src: $rawfile("fullScreenEnter.html"), controller: this.controller })
        .key("WebViewEnumAndSetWebControllerWebView")
        .blockNetwork(Boolean(this.block))
        .cacheMode(this.CacheMode)
        .onShowFileSelector((event) => {
          if (event) {
            let fileSelectorObj: FileSelectorParam = event.fileSelector
            this.FileSelectorMode = fileSelectorObj.getMode()
          }
          return true
        })
        .multiWindowAccess(true)
        .allowWindowOpenMethod(true)
        .defaultFontSize(this.fontSize)
        .onConsole((event) => {
          if (event) {
            console.log('onConsole getMessage:' + event.message?.getMessage())
            console.log('onConsole getSourceId:' + event.message?.getSourceId())
            console.log('onConsole getLineNumber:' + event.message?.getLineNumber())
            console.log('onConsole getMessageLevel:' + event.message?.getMessageLevel())
          }
          return false
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
        .javaScriptAccess(this.javaScriptAccess)
    }
  }
}
