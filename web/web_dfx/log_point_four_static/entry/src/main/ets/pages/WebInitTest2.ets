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

import { Entry, Component, Column, Row, Button, ClickEvent, Web, OnTitleReceiveEvent, EmbedOptions } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import Utils from '../../src/test/Util.test';
import webview from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { canIUse } from '@internal.full.global'
import Want from '@ohos.app.ability.Want';
import webNativeMessagingExtensionManager from '@ohos.web.webNativeMessagingExtensionManager';
import common from '@ohos.app.ability.common';
export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webViewController {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  controllerNull: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = ''
  @State title: string = 'test';
  @State errorCode: int = 0;
  @State errorMsg: string = 'failed';
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State zoomAccess: boolean = false;
  optionsTrue: EmbedOptions = { supportDefaultIntrinsicSize: true };
  optionsFalse: EmbedOptions = { supportDefaultIntrinsicSize: false };

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
        console.info(this.stringObj.str)
      }
    }
  }

  pdfConfig: webview.PdfConfiguration = {
    width: 8.27,
    height: 11.69,
    marginTop: 0,
    marginBottom: 0,
    marginRight: 0,
    marginLeft: 0,
    shouldPrintBackground: true
  }

  build() {
    Row() {
      Column() {
        Button('webViewContCreatePdfAndOthersErrorButton')
          .key('webViewContCreatePdfAndOthersErrorButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' +  this.stringObj.str)
            switch (this.stringObj.str) {
              case 'emitPrefetchPageInitErr': {
                try {
                  this.controllerNull.prefetchPage('https://www.huawei.com', [{ headerKey: 'c', headerValue: 'z' }])
                } catch (error) {
                  console.error(`emitPrefetchPageInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 110700)
                  Utils.emitEvent(this.errorMsg, 110710)
                }
                break;
              }
              case 'emitPrefetchPageInitErr002': {
                try {
                  let options = new webview.PrefetchOptions();
                  options.ignoreCacheControlNoStore = true;
                  options.minTimeBetweenPrefetchesMs = 100;
                  this.controllerNull.prefetchPage('https://www.huawei.com', [{ headerKey: 'c', headerValue: 'z' }], options)
                } catch (error) {
                  console.error(`emitPrefetchPageInitErr002 ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 110701)
                  Utils.emitEvent(this.errorMsg, 110711)
                }
                break;
              }
              case 'emitCreateWebPrintDocumentAdapterInitErr': {
                try {
                  this.controllerNull.createWebPrintDocumentAdapter('example.pdf')
                } catch (error) {
                  console.error(`emitCreateWebPrintDocumentAdapterInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 110701)
                  Utils.emitEvent(this.errorMsg, 110711)
                }
                break;
              }
              case 'emitSetScrollableInitErr': {
                try {
                  this.controllerNull.setScrollable(true, webview.ScrollType.EVENT)
                } catch (error) {
                  console.error(`emitSetScrollableInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 110740)
                  Utils.emitEvent(this.errorMsg, 110750)
                }
                break;
              }
              case 'emitGetScrollableInitErr': {
                try {
                  this.controllerNull.getScrollable()
                } catch (error) {
                  console.error(`emitGetScrollableInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 110760)
                  Utils.emitEvent(this.errorMsg, 110770)
                }
                break;
              }
              case 'emitGetPrintBackgroundInitErr': {
                try {
                  this.controllerNull.getPrintBackground()
                } catch (error) {
                  console.error(`emitGetPrintBackgroundInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 110800)
                  Utils.emitEvent(this.errorMsg, 110810)
                }
                break;
              }
              case 'emitCloseCameraInitErr': {
                try {
                  this.controllerNull.closeCamera()
                } catch (error) {
                  console.error(`emitCloseCameraInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 110860)
                  Utils.emitEvent(this.errorMsg, 110870)
                }
                break;
              }
              case 'emitStopAllMediaInitErr': {
                try {
                  this.controllerNull.stopAllMedia()
                } catch (error) {
                  console.error(`emitStopAllMediaInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 110920)
                  Utils.emitEvent(this.errorMsg, 110930)
                }
                break;
              }
              case 'emitResumeAllMediaInitErr': {
                try {
                  this.controllerNull.resumeAllMedia();
                } catch (error) {
                  console.error(`emitResumeAllMediaInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 110940)
                  Utils.emitEvent(this.errorMsg, 110950)
                }
                break;
              }
              case 'emitPauseAllMediaInitErr': {
                try {
                  this.controllerNull.pauseAllMedia();
                } catch (error) {
                  console.error(`emitPauseAllMediaInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 110960)
                  Utils.emitEvent(this.errorMsg, 110970)
                }
                break;
              }
              case 'emitCloseAllMediaPresentationsInitErr': {
                try {
                  this.controllerNull.closeAllMediaPresentations();
                } catch (error) {
                  console.error(`emitCloseAllMediaPresentationsInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 110980)
                  Utils.emitEvent(this.errorMsg, 110990)
                }
                break;
              }
              case 'emitGetMediaPlaybackStateInitErr': {
                try {
                  this.controllerNull.getMediaPlaybackState();
                } catch (error) {
                  console.error(`emitGetMediaPlaybackStateInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 111000)
                  Utils.emitEvent(this.errorMsg, 111010)
                }
                break;
              }
              case 'emitPrecompileJavaScriptInitErr': {
                try {
                  const result = this.controllerNull.precompileJavaScript('https://', 'hawe', {
                    responseHeaders: [
                      {
                        headerKey: 'E-Tag',
                        headerValue: '68ZpTzuAFdm85xPNtr3EOzySP8Q'
                      }
                    ]
                  })
                    console.log("precompileJavaScript 返回结果 = " + result);
                  if (result) {
                    Utils.emitEvent(true, 111040);
                  } else {
                    Utils.emitEvent(false, 111040);
                  }
                } catch (error) {
                  console.error(`emitPrecompileJavaScriptInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 111040)
                }
                break;
              }
              case 'emitSetPathAllowingUniversalAccessInitErr': {
                try {
                  let uiCtx = this.getUIContext();
                  if (!uiCtx) {
                    console.error("uiContext is null");
                    Utils.emitEvent(-1, 111060);
                    return;
                  }

                  let hostCtx = uiCtx.getHostContext();
                  if (!hostCtx) {
                    console.error("hostContext is null");
                    Utils.emitEvent(-1, 111060);
                    return;
                  }
                  this.controllerNull.setPathAllowingUniversalAccess([
                    hostCtx.resourceDir,
                    hostCtx.filesDir + '/example'
                  ])
                } catch (error) {
                  console.error(`emitSetPathAllowingUniversalAccessInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 111060)
                  Utils.emitEvent(this.errorMsg, 111070)
                }
                break;
              }
              case 'emitGetLastHitTestInitErr': {
                try {
                  this.controllerNull.getLastHitTest()
                } catch (error) {
                  console.error(`emitGetLastHitTestInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 111100)
                  Utils.emitEvent(this.errorMsg, 111110)
                }
                break;
              }
              case 'emitGetPageOffsetTestInitErr': {
                try {
                  let x = this.controllerNull.getPageOffset().x
                  let y = this.controllerNull.getPageOffset().y
                } catch (error) {
                  console.error(`emitGetPageOffsetTestInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 111120)
                  Utils.emitEvent(this.errorMsg, 111130)
                }
                break;
              }
            }
          })

        Web({ src: 'resource://rawfile/index.html', controller: this.controller })
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
          .fileAccess(this.fileAccess)
          .imageAccess(this.imageAccess)
          .domStorageAccess(this.domStorageAccess)
          .onlineImageAccess(this.onlineImageAccess)
          .zoomAccess(this.zoomAccess)
          .enableHapticFeedback(true)
          .enableNativeEmbedMode(true)
          .nativeEmbedOptions(this.optionsFalse)
          .onTitleReceive((event:OnTitleReceiveEvent):void => {
            if (event) {
              console.log('title:' + event.title);
              this.title = event.title
            }
          })

      }
    }
  }
}
