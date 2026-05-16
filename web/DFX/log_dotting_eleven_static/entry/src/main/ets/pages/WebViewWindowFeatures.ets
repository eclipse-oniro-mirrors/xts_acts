/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { $rawfile, Entry, Component, Column, Row, Button, ClickEvent, Web, CustomDialogController, CustomDialog, CustomDialog } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import Utils from '../../src/test/Utils.test';
import emitter from '@ohos.events.emitter';
import { JsProxyObject } from '../../src/test/Interfaces';
import { Callback } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import web_webview from '@ohos.web.webview'
import {canIUse} from '@internal.full.global'
import { Driver, ON } from '@ohos.UiTest';
let driver = Driver.create()

@CustomDialog
struct NewWebViewComp {
  controller?: CustomDialogController;
  webviewController1: web_webview.WebviewController = new web_webview.WebviewController(undefined);

  build() {
    Column() {
      Web({ src: 'www.example.com', controller: this.webviewController1 })
        .javaScriptAccess(true)
        .multiWindowAccess(true)
        .allowWindowOpenMethod(true)
        .onWindowExit(() => {
          console.info('NewWebViewComp onWindowExit');
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
struct WebViewWindowFeatures {
  stringObj: StringFields  = new StringFields ();
  @State message: string = 'Hello World';
  @State isReceive: number = -1;
  @State scrollResult: boolean = false;
  @State isPageEnd: number = -1;
  @State str: string = '';
  @State navigationPolicy:number = 5;
  @State isAlert:boolean = false;
  @State isUserTrigger:boolean = false;
  @State handlerNum:number = 1
  @State targetUrl:string = ''
  @State WindowHeight:number = 10;
  @State WindowWidth:number = 10;
  @State WindowX:number = 100;
  @State WindowY:number = 100;
  webTag: string = 'ArkWeb1';
  dialogController: CustomDialogController | null = null;
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);



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
      Button('web click')
        .key('WebViewWindowFeaturesButton')
        .onClick((e:ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {
            case 'emitWebViewWindowFeatures001': {
              try {
                if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {

                  Utils.emitEvent(this.WindowHeight, 20260123)
                } else {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile('window.open.html'))
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'emitWebViewWindowFeatures002': {
              try {
                if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {

                  Utils.emitEvent(this.WindowWidth, 20260124)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitWebViewWindowFeatures003': {
              try {
                if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {

                  Utils.emitEvent(this.WindowX, 20260125)
                }
              } catch (error) {

                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitWebViewWindowFeatures004': {
              try {
                if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {

                  Utils.emitEvent(this.WindowY, 20260126)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitWebViewWindowFeatures005': {
              try {
                if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {

                  Utils.emitEvent(this.isAlert, 20260127)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'emitWebViewWindowFeatures006': {
              try {
                if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {

                  Utils.emitEvent(this.isUserTrigger, 20260128)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'emitWebViewWindowFeatures007': {
              try {
                if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {

                  Utils.emitEvent(this.targetUrl, 20260129)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitWebViewWindowFeatures008': {
              try {
                if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {

                  Utils.emitEvent(this.navigationPolicy, 20260130)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/WebViewOnWindowNew' })
              console.log('push URL success')
            }
          }
        })


      Row() {
        Web({ src: $rawfile('window.open.html'), controller: this.controller })
          .key('WebViewWindowFeaturesWeb')
          .javaScriptAccess(true)
          .multiWindowAccess(true)
          .allowWindowOpenMethod(true)
          .onPageEnd(() => {
            this.isPageEnd = 1
          })
          .onWindowNew((event) => {
            console.log('===== ArkTS onWindowNew 开始 =====');
            if (this.dialogController) {
              this.dialogController?.close();
            }

            let popController: web_webview.WebviewController = new web_webview.WebviewController();
            this.dialogController = new CustomDialogController({
              builder: NewWebViewComp({ webviewController1: popController })
            })
            this.dialogController?.open();

            // 关键：必须设置 WebController
            event.handler.setWebController(popController);
            if (event) {
              console.log('onWindowNew isAlert', event.isAlert)
              console.log('onWindowNew isUserTrigger', event.isUserTrigger)
              console.log('onWindowNew targetUrl', event.targetUrl)
              console.log('onWindowNew handler', event.handler)

            }
            if (event) {
              console.log('event.url', event.targetUrl)
            }
            console.log('===== ArkTS onWindowNew 结束 =====');
          })
          .onWindowNewExt((event) => {
            console.log(' ===== ArkTS onWindowNewExt 开始 =====');

            if (this.dialogController) {
              this.dialogController?.close();
            }

            let popController: web_webview.WebviewController = new web_webview.WebviewController();
            this.dialogController = new CustomDialogController({
              builder: NewWebViewComp({ webviewController1: popController })
            })
            this.dialogController?.open();

            // 关键：必须设置 WebController
            event.handler.setWebController(popController);
            if (event) {
              this.navigationPolicy = event.navigationPolicy;
              this.isAlert = event.isAlert;
              this.isUserTrigger = event.isUserTrigger;
              this.targetUrl = event.targetUrl;
              this.handlerNum = JSON.stringify(event.handler).length
              console.log('onWindowNewExt isAlert', event.isAlert)
              console.log('onWindowNewExt isUserTrigger', event.isUserTrigger)
              console.log('onWindowNewExt targetUrl', event.targetUrl)
              console.log('onWindowNewExt handler length', JSON.stringify(event.handler).length)

              console.log('onWindowNewExt navigationAction', event.navigationPolicy)
              this.WindowHeight = event.windowFeatures.height;
              this.WindowWidth = event.windowFeatures.width;
              this.WindowX = event.windowFeatures.x;
              this.WindowY = event.windowFeatures.y;
              console.log('onWindowNewExt height', event.windowFeatures.height)
              console.log('onWindowNewExt width', event.windowFeatures.width)
              console.log('onWindowNewExt x', event.windowFeatures.x)
              console.log('onWindowNewExt y', event.windowFeatures.y)
            }
            console.log('===== ArkTS onWindowNewExt 结束 =====');
          })
      }.height('20%')
    }
    .height('100%')
    .width('100%')
  }
}



