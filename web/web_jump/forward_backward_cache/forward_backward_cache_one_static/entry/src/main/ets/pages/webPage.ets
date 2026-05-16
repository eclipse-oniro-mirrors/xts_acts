/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { Entry, Text,Column, Component, Button, ClickEvent, Web, Row, Stack,ThreatType ,WebRotateEffect,WebResourceResponse,CopyOptions,WebLayoutMode} from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import { Callback, RecordData, BusinessError } from '@ohos.base'
import web_webview from '@ohos.web.webview';
import webview from '@ohos.web.webview';
import { UIContext, Router } from '@ohos.arkui.UIContext'

export class StringFields {
  public str: string = '';
}
@Entry
@Component
struct Second {
  stringObj: StringFields  = new StringFields ();
  @State outputStr: string = '';
  webviewCtl: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  webResourceResponse: WebResourceResponse = new WebResourceResponse();
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State str:string = ''
  @State isPageEnd: number = -1;
  @State isOnLoadStarted: number = -1;
  @State isOnResourceLoad: number = -1;
  @State isOnLoadFinished: number = -1;
  @State isOnInterceptRequest: number = -1;
  @State databaseAccess: boolean = true;
  @State copyOption: CopyOptions = CopyOptions.None;
  @State horizontalScrollBarAccess: boolean = true;
  @State enableNativeEmbedMode: boolean = true;
  @State ocr_switch: boolean | undefined = false;
  @State verticalScrollBar: boolean = true;
  @State javaScriptAccess: boolean = true;
  @State mode: WebLayoutMode | undefined = WebLayoutMode.NONE;
  @State enableWebAVSession: boolean | undefined = true;
  @State fileAccess: boolean | undefined = true;
  @State forceDisplayScrollBar: boolean | undefined = true;

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
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
    Column() {
      Row() {
        Button('web click').key('web').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {

            case "emitDatabaseAccessTrue": {
              this.databaseAccess = true;
              this.webviewCtl.runJavaScript('getDataResult()', (error, res) => {
                if (res) {
                  console.log("getDataResult==>" + res.toString());
                  Utils.emitEvent(res, 161000);
                }
              });

              break;
            }

            case "emitDatabaseAccessFalse": {
              this.databaseAccess = false;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("resource://rawfile/databaseAccess.html");
              this.webviewCtl.runJavaScript('getDataResult()', (error, res) => {
                if (res) {
                  console.log("getDataResult==>" + res.toString());
                  Utils.emitEvent(res, 161001);
                }
              });

              break;
            }

            case "emitEnableNativeEmbedModeTrue": {
              this.enableNativeEmbedMode = true;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.example.com");
              Utils.emitEvent(true, 161002);
              break;
            }

            case "emitEnableNativeEmbedModeFalse": {
              this.enableNativeEmbedMode = false;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.example.com");
              Utils.emitEvent(true, 161003);
              break;
            }

            case "emitCopyOptions1": {
              this.copyOption = CopyOptions.None;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.example.com");
              Utils.emitEvent(true, 161004);
              break;
            }

            case "emitCopyOptions2": {
              this.copyOption = CopyOptions.InApp;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.example.com");
              Utils.emitEvent(true, 161005);
              break;
            }

            case "emitCopyOptions3": {
              this.copyOption = CopyOptions.LocalDevice;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.example.com");
              Utils.emitEvent(true, 161006);
              break;
            }

            case "emitHorizontalScrollBarAccessTrue": {
              this.copyOption = CopyOptions.LocalDevice;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.example.com");
              Utils.emitEvent(true, 161007);
              break;
            }

            case "emitHorizontalScrollBarAccessFalse": {
              this.copyOption = CopyOptions.LocalDevice;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.example.com");
              Utils.emitEvent(true, 161008);
              break;
            }

            case "emitEnableImageAnalyzer01": {
              this.ocr_switch = true;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.example.com");
              Utils.emitEvent(true, 20230121)
              break;
            }
            case "emitEnableImageAnalyzer02": {
              this.ocr_switch = false;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.example.com");
              Utils.emitEvent(true, 20230122)
              break;
            }

            case "emitEnableImageAnalyzer03": {
              this.ocr_switch = undefined;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.example.com");
              Utils.emitEvent(true, 20230123)
              break;
            }

            case "emitVerticalScrollBarAccessTrue": {
              this.verticalScrollBar = true;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.example.com");
              Utils.emitEvent(true, 20230124)
              break;
            }

            case "emitVerticalScrollBarAccessFalse": {
              this.verticalScrollBar = false;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.example.com");
              Utils.emitEvent(true, 20230125)
              break;
            }

            case "emitJavaScriptAccessTrue": {
              this.javaScriptAccess = true;
              this.webviewCtl.runJavaScript('getDataResult()', (error, res) => {
                if (res) {
                  Utils.emitEvent(true, 20230126)
                }
              });
              break;
            }

            case "emitJavaScriptAccessFalse": {
              this.javaScriptAccess = false;
              this.webviewCtl.runJavaScript('getDataResult()', (error, res) => {
                if (res) {
                  Utils.emitEvent(true, 20230127)
                }
              });
              break;
            }

            case "emitLayoutMode01": {
              this.mode = WebLayoutMode.NONE;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.example.com");
              Utils.emitEvent(true, 202301271)
              break;
            }

            case "emitLayoutMode02": {
              this.mode = WebLayoutMode.FIT_CONTENT;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.example.com");
              Utils.emitEvent(true, 202301272)
              break;
            }

            case "emitLayoutMode03": {
              this.mode = undefined;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.example.com");
              Utils.emitEvent(true, 202301273)
              break;
            }

            case "enableWebAVSession01": {
              this.enableWebAVSession = true;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.example.com");
              Utils.emitEvent(true, 20230130)
              break;
            }

            case "enableWebAVSession02": {
              this.enableWebAVSession = false;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.example.com");
              Utils.emitEvent(true, 20230131)
              break;
            }

            case "enableWebAVSession03": {
              this.enableWebAVSession = undefined;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.example.com");
              Utils.emitEvent(true, 20230132)
              break;
            }

            case "fileAccess01": {
              this.fileAccess = true;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.example.com");
              Utils.emitEvent(true, 20230133)
              break;
            }

            case "fileAccess02": {
              this.fileAccess = false;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.example.com");
              Utils.emitEvent(true, 20230134)
              break;
            }

            case "fileAccess03": {
              this.fileAccess = undefined;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.example.com");
              Utils.emitEvent(true, 20230135)
              break;
            }


            case "forceDisplayScrollBar01": {
              this.fileAccess = true;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.example.com");
              Utils.emitEvent(true, 20230136)
              break;
            }


            case "forceDisplayScrollBar02": {
              this.fileAccess = false;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.example.com");
              Utils.emitEvent(true, 20230137)
              break;
            }


            case "forceDisplayScrollBar03": {
              this.fileAccess = undefined;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.example.com");
              Utils.emitEvent(true, 20230138)
              break;
            }





            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/onHttpAuthRequset' })
              console.log('push URL success')
            }
          }
        })
      }

      Web({ src: "resource://rawfile/databaseAccess.html", controller: this.webviewCtl })
        .databaseAccess(this.databaseAccess)
        .enableNativeEmbedMode(this.enableNativeEmbedMode)
        .copyOptions(this.copyOption)
        .horizontalScrollBarAccess(this.horizontalScrollBarAccess)
        .enableImageAnalyzer(this.ocr_switch)
        .verticalScrollBarAccess(this.verticalScrollBar)
        .javaScriptAccess(this.javaScriptAccess)
        .layoutMode(this.mode)
        .enableWebAVSession(this.enableWebAVSession)
        .fileAccess(this.fileAccess)
        .forceDisplayScrollBar(this.forceDisplayScrollBar)
    }

  }
}