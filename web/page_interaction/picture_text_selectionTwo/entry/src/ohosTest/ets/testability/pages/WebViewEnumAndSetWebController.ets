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

const EVENT_ID_SET_SUITE_KEY = 183401;
let driver = Driver.create();

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
  @State SourceTypeArr:ContextMenuSourceType[] = [ContextMenuSourceType.None,ContextMenuSourceType.Mouse,ContextMenuSourceType.LongPress]

  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isOnShowFileSelectorEnd: number = -1;

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

  build() {
    Column() {


      Web({ src: $rawfile("fullScreenEnter.html"), controller: this.controller })
        .key("WebViewEnumAndSetWebControllerWebView")
        .blockNetwork(Boolean(this.block))
        .cacheMode(this.CacheMode)
        .onShowFileSelector((event) => {
          if (event) {
            let fileSelectorObj: FileSelectorParam = event.fileSelector
            this.FileSelectorMode = fileSelectorObj.getMode()
          }
          this.isOnShowFileSelectorEnd = 1
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
              Utils.emitEvent(this.SourceTypeArr[event.param.getSourceType()], 183440)
            } else {
              Utils.emitEvent(event.param.getMediaType(), 183430)
            }
          }
          return true
        })
        .javaScriptAccess(this.javaScriptAccess)
        .height('30%')
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })

      Row() {
        Button("web clicks").key('buttonEnumAndSetWebController').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          switch (this.str) {
            case "emitFileSelectorModeFileOpenMultipleMode": {
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/indexFile1.html")
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let driver = Driver.create();
              let button = await driver.findComponent(ON.id('WebViewEnumAndSetWebControllerWebView'));
              await button.click();
              await Utils.waitForExist(()=>this.isOnShowFileSelectorEnd, this.str+' isOnShowFileSelectorEnd', 1, 1000);
              Utils.emitEvent(Number(this.FileSelectorMode), 862)
              break;
            }
            case "emitFileSelectorModeFileOpenFolderMode": {
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/indexFile2.html")
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('选择文件'));
              await buttonOne.click()
              await Utils.waitForExist(()=>this.isOnShowFileSelectorEnd, this.str+' isOnShowFileSelectorEnd', 1, 1000);
              Utils.emitEvent(Number(this.FileSelectorMode), 863)
              break;
            }
            case "emitContextMenuMediaTypeImage": {
              this.mouse = false
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/indexLongClickImage.html")
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let button = await driver.findComponent(ON.id('WebViewEnumAndSetWebControllerWebView'));
              await button.longClick();
              break;
            }
            case "emitContextMenuSourceTypeMouse": {
              this.mouse = true
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/indexLongClickImage.html")
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let webRect = Utils.getComponentRect('WebViewEnumAndSetWebControllerWebView');
              let downX = Math.round(globalThis.winLeft + webRect.left + (webRect.right - webRect.left) / 2);
              let downY = Math.round(globalThis.winTop + webRect.top + (webRect.bottom - webRect.top) / 2);
              await driver.mouseClick({ x: downX, y: downY }, MouseButton.MOUSE_BUTTON_RIGHT);
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
    }
  }
}
