/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { Entry, Text, Column, Row, Component, Button, ClickEvent, Web, Callback,RenderProcessNotRespondingData,RenderProcessNotRespondingReason,OnPermissionRequestEvent,CameraCaptureStateChangeInfo } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { RecordData,BusinessError } from '@ohos.base';
@Entry
@Component
struct WebInitTest {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  controllerNull: webView.WebviewController = new webView.WebviewController(undefined);
  @State res: boolean = false;
  @State str: string = ''
  @State webInit: boolean = false
  @State isPrintBackground: boolean = true
  @State isOptimizeParserBudget: boolean = false

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
        this.str = strValue;
      }
    }
  }

  build() {
    Row(undefined) {
      Column(undefined) {
        Button('WebInitTestButton')
          .key('WebInitTestButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' + this.str)
            switch (this.str) {
              case 'emitSetPrintBackgroundOne': {
                try {
                  this.controller.setPrintBackground(!this.isPrintBackground);
                  console.info('setPrintBackground');
                  let res: boolean = this.controller.getPrintBackground();
                  console.info('getPrintBackground: ' + res);
                  Utils.emitEvent(res, 214)
                  console.info('emitSetPrintBackgroundOne  res: ' + res);
                } catch (error) {
                  console.error(`ErrorCode: ${JSON.stringify(error)}`);
                }
                break;
              }

              case 'emitSetPrintBackgroundStatic002': {
                try {
                  this.controller.setPrintBackground(this.isPrintBackground);
                  console.info('setPrintBackground');
                  let res: boolean = this.controller.getPrintBackground();
                  console.info('getPrintBackground: ' + res);
                  Utils.emitEvent(res, 202603251)
                  console.info('emitSetPrintBackgroundOne  res: ' + res);
                } catch (error) {
                  console.error(`ErrorCode: ${JSON.stringify(error)}`);
                }
                break;
              }

              case 'emitSetPrintBackgroundStatic003': {
                try {
                  this.controllerNull.setPrintBackground(!this.isPrintBackground);
                  console.info('setPrintBackground');
                  let res: boolean = this.controllerNull.getPrintBackground();
                  console.info('getPrintBackground: ' + res);
                  Utils.emitEvent(res, 202603252)
                  console.info('emitSetPrintBackgroundOne  res: ' + res);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                  Utils.emitEvent(`${error.code}`, 202603252);
                }
                break;
              }

              case 'emitWebViewNotRespondingReason_INPUT_TIMEOUT': {
                try {
                  this.controller.refresh()
                  this.controller.loadUrl("www.baidu.com")
                  Utils.emitEvent(RenderProcessNotRespondingReason.INPUT_TIMEOUT, 133826325)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                  Utils.emitEvent(`${error.code}`, 133826325);
                }
                break;
              }

              case 'emitOptimizeParserBudgetStatic': {
                try {
                  this.isOptimizeParserBudget = true
                  this.controller.refresh()
                  this.controller.loadUrl("www.baidu.com")
                  setTimeout(() => {
                    Utils.emitEvent(true, 133826326)
                  }, 2000)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                  Utils.emitEvent(`${error.code}`, 133826326);
                }
                break;
              }

              case 'emitonSwitchNextPage': {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/createPdf' })
                console.log('push URL success')
              }

            }
          })

                Web({ src: 'resource://rawfile/index.html', controller: this.controller })
                  .height('100%')
                  .width('100%')
                  .javaScriptAccess(true)
                  .geolocationAccess(true)
                  .databaseAccess(true)
                  .optimizeParserBudget(this.isOptimizeParserBudget)
                  .onRenderProcessNotResponding((data: RenderProcessNotRespondingData): void => {
                    console.log('onRenderProcessNotResponding: [jsStack]= ' + data.jsStack +
                      ', [process]=' + data.pid + ', [reason]=' + data.reason);
                    console.log('data.reason:' + RenderProcessNotRespondingReason.INPUT_TIMEOUT)
                    console.log('data.reason:' + RenderProcessNotRespondingReason.NAVIGATION_COMMIT_TIMEOUT)
                    setTimeout(() => {
                      this.controller.runJavaScript("stopBlockJs()", (error, result) => {
                        console.error(`The stopBlockJs() return error is: ${error}`);
                        console.log(`The stopBlockJs() return value is: ${result}`);
                      })
                    }, 2000)
                  })
              }
            }
          }
        }
