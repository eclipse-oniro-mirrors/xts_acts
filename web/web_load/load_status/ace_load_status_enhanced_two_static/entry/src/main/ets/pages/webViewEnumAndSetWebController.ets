/*
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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

import { Entry, $rawfile, Component, Column, Row, Button, ClickEvent, CustomDialog, Web, CustomDialogController, MixedMode, CacheMode, FullScreenExitHandler, SslErrorEvent, OnWindowNewEvent} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import Utils from '../../src/test/Util.test';
import webView from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext'

@CustomDialog
struct NewWebViewComp {
  controller?: CustomDialogController
  webViewController1: webView.WebviewController = new webView.WebviewController(undefined)

  build() {
    Column() {
      Web({ src: "www.example.com", controller: this.webViewController1 })
        .javaScriptAccess(true)
        .multiWindowAccess(true)
        .allowWindowOpenMethod(true)
        .onWindowExit(() => {
          console.info("NewWebViewComp onWindowExit");
          if (this.controller) {
            this.controller?.close();
          }
        })
    }
  }
}


export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebViewEnumAndSetWebController {
  stringObj: StringFields  = new StringFields ();
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
  @State CacheMode: CacheMode = CacheMode.NONE
  @State cacheError: boolean = false
  @State errorCode: string = '0';
  @State block: Boolean = false
  @State FileSelectorMode: Number = 0
  @State MediaType: Number = 0
  @State userAgentPC:string = "";
  @State precomposedResult:boolean =  false;
  handler: FullScreenExitHandler | null = null
  dialogController: CustomDialogController | null = null
  popController: webView.WebviewController | null = null;
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State isTitle: boolean = false;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 141711,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(141711)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button("web clicks")
        .key('buttonEnumAndSetWebController')
        .onClick((e: ClickEvent) => {
          this.isReceive = -1;
          console.info("key==>" + this.stringObj.str)
          switch (this.stringObj.str) {
            case "emitCacheModeOnly": {
              this.controller.removeCache(true);
              this.cacheError = true
              this.CacheMode = CacheMode.ONLY
              this.isPageEnd = -1;
              this.controller.loadUrl("https://www.openharmony.cn")
              break;
            }
            case "emitCacheModeDefault": {
              this.CacheMode = CacheMode.DEFAULT
              this.isPageEnd = -1
              this.isTitle = false
              this.controller.loadUrl($rawfile('indexTwo.html'))
              this.controller.runJavaScript("getTitle()", (error, result) => {
                if(error) {
                  console.error(`ErrorCode: ${error?.code},  Message: ${error?.message}`);
                  Utils.emitEvent("", 141750)
                }
                else{
                Utils.emitEvent(result??"", 141750)
                }
              })
              break;
            }
            case "emitCacheModeOnline": {
              this.CacheMode = CacheMode.ONLINE
              this.isTitle = false;
              this.isPageEnd = -1;
              this.controller.loadUrl("https://www.example.com/")
              this.controller.getTitle()
              if ((this.controller.getTitle()).includes("Example Domain")) {
                Utils.emitEvent(true, 141760)
                console.log("title:" + this.controller.getTitle())
              }
              break;
            }
            case "emitCacheModeNone": {
              this.CacheMode = CacheMode.NONE
              this.isTitle = false;
              this.isPageEnd = -1;
              this.controller.loadUrl("https://www.example.com")
              Utils.emitEvent(this.controller.getTitle(), 141770)
              break;
            }
            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/NativeEmbedParamStatusDelete' })
              console.log('push URL success')
            }
          }
        })
      }


      Web({ src: $rawfile("fullScreenEnter.html"), controller: this.controller })
        .key("WebViewEnumAndSetWebControllerWebView")
        .blockNetwork(Boolean(this.block))
        .cacheMode(this.CacheMode)
        .mixedMode(MixedMode.ALL)
        .onPageEnd(()=>{
          this.isPageEnd = 0;
        })
        .onSslErrorEvent((event: SslErrorEvent) => {
          if (event) {
            console.log('onSslErrorEvent url: ' + event.url);
            console.log('onSslErrorEvent error: ' + event.error);
            console.log('onSslErrorEvent originalUrl: ' + event.originalUrl);
            console.log('onSslErrorEvent referrer: ' + event.referrer);
            console.log('onSslErrorEvent isFatalError: ' + event.isFatalError);
            console.log('onSslErrorEvent isMainFrame: ' + event.isMainFrame);
            console.log('onSslErrorEvent handler: ' + event.handler);
            event.handler.handleConfirm();
          }
        })
        .onTitleReceive((event) => {
          if (event) {
            this.isTitle = true;
            console.log('title:' + event.title);
          }
        })
        .onErrorReceive((event) => {
          if (event) {
            console.log("CacheMode >>>> ==> getErrorCode", event.error.getErrorCode())
            console.log("CacheMode >>>> ==> getErrorInfo", event.error.getErrorInfo())
          }
          if (this.cacheError) {
            Utils.emitEvent("cacheError", 141740)
            this.cacheError = false
          }
        })
        .onTouchIconUrlReceived((event) => {
          console.log('onTouchIconUrlReceived:' + event.url)
          console.log('onTouchIconUrlReceived:' + event.precomposed)
          this.precomposedResult = event.precomposed
        })
        .multiWindowAccess(true)
        .allowWindowOpenMethod(true)
        .onWindowNew((event:OnWindowNewEvent) => {
          if (this.dialogController) {
            this.dialogController?.close()
          }
          let popController: webView.WebviewController = new webView.WebviewController()
          this.dialogController = new CustomDialogController({
            builder: NewWebViewComp({ webViewController1: popController })
          })
          this.dialogController?.open()
          event.handler.setWebController(popController)
          setTimeout(() => {
            if (popController) {
              Utils.emitEvent(true, 1311)
            }
          }, 3000)
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
