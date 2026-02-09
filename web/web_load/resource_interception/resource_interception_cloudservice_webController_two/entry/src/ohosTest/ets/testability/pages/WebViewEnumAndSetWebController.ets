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

const EVENT_ID_SET_EMIT_KEY = 202360;

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
  @State precomposedResult:boolean =  false;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  handler: FullScreenExitHandler | null = null
  dialogController: CustomDialogController | null = null
  popController: webView.WebviewController | null = null;
  controller: webView.WebviewController = new webView.WebviewController();

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY)
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
      Row() {
        Button("web clicks").key('buttonEnumAndSetWebController').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, 'buttonEnumAndSetWebControllerIsReceive', 1, 1000);
          console.info("key==>" + this.str)
          this.isReceive = -1;
          switch (this.str) {
            case "emitOnTouchIconUrlReceived": {
              this.controller.loadUrl("resource://rawfile/indexFour.html")
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
        .onErrorReceive((event) => {
          if (event) {
            console.log("CacheMode >>>> ==> getErrorCode", event.error.getErrorCode())
            console.log("CacheMode >>>> ==> getErrorInfo", event.error.getErrorInfo())
          }
          if (this.cacheError) {
            this.cacheError = false
            setTimeout(() => {
              this.controller.loadUrl("resource://rawfile/fullScreenEnter.html")
            }, 2000)
          }
        })
        .onTouchIconUrlReceived((event) => {
          console.log('onTouchIconUrlReceived:' + event.url)
          console.log('onTouchIconUrlReceived:' + event.precomposed)
          this.precomposedResult = event.precomposed
          Utils.emitEvent(event.url + '', 202370)
          setTimeout(() => {
            this.controller.loadUrl("resource://rawfile/fullScreenEnter.html")
          }, 2000)
        })
        .onScreenCaptureRequest((event) => {
          console.log("1361 case", JSON.stringify(event))
          return true
        })
        .onPermissionRequest((event) => {
          if (event) {
            event.request.deny()
            console.log("request : >>>>>", event.request.getOrigin())
            console.log("request : >>>>>", event.request.getAccessibleResource())
            console.log("request : >>>>>", event.request.grant(["VIDEO_CAPTURE", "AUDIO_CAPTURE"]))
          }
        })
        .multiWindowAccess(true)
        .allowWindowOpenMethod(true)
        .onWindowNew((event) => {
          if (this.dialogController) {
            this.dialogController.close()
          }
          let popController: webView.WebviewController = new webView.WebviewController()
          this.dialogController = new CustomDialogController({
            builder: NewWebViewComp({ webViewController1: popController })
          })
          this.dialogController.open()
          event.handler.setWebController(popController)
        })
        .onWindowExit(() => {
          console.info("closeWindow")
        })
        .onDataResubmitted((event) => {
          console.log('onDataResubmitted')
          event.handler.resend();
        })
        .onFullScreenEnter((event) => {
          this.handler = event.handler
        })
        .onFullScreenExit(() => {
          if (this.handler) {
            this.handler.exitFullScreen()
          }
        })
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
            this.MediaType = event.param.getMediaType()
          }
          return true
        })
        .javaScriptAccess(this.javaScriptAccess)
    }
  }
}