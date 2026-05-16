/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import {
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web,
  UIContext,
  WebResourceResponse,
  Header
} from '@ohos.arkui.component'
import webview from '@ohos.web.webview'
import image from '@ohos.multimedia.image';
import emitter from '@ohos.events.emitter'
import events_emitter from '@ohos.events.emitter'
import Utils from '../../src/test/Utils.test';
import { BusinessError, Callback, RecordData } from '@ohos.base'
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { UIContext, Router } from '@ohos.arkui.UIContext'
export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebViewControllerPart3 {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  controllerOne: webview.WebviewController = new webview.WebviewController(undefined);
  controllerNull: webview.WebviewController = new webview.WebviewController(undefined);
  controllerTwo: webview.WebviewController = new webview.WebviewController(undefined);
  nativePort: webview.WebMessagePort | null = null;
  message: webview.WebMessageExt = new webview.WebMessageExt();
  @State str: string = ""
  @State pixelMap: image.PixelMap | undefined = undefined;
  @State javaScriptAccess: boolean = true
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = false;
  @State databaseAccess: boolean = true;
  @State registerJavaScriptProxyFlag: boolean = false;
  @State console: string = ""
  @State time: number = 0
  @State onScrollCallBack: boolean = false;
  @State onMessageEventCallBack: boolean = false;
  @State avoidHeight: int = 0;
  @State SiteIsolationModeArr: webview.SiteIsolationMode[] = [webview.SiteIsolationMode.PARTIAL,webview.SiteIsolationMode.STRICT]
  @State isEnableWholeWebPageDrawing: boolean = false;
  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    try {
      webview.WebviewController.enableWholeWebPageDrawing();
      this.isEnableWholeWebPageDrawing = true;
    } catch (error) {
      console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION vaclue: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        console.info('strValue has been updated to: ' + strValue);
        this.stringObj.str = strValue;
        console.info('this.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebViewController click").key('WebViewControllerTestButton').onClick((e: ClickEvent) => {
          console.info("key==>" +  this.stringObj.str)
          switch ( this.stringObj.str) {

            case "testRestoreWebState001": {
              try {
                this.controller.clearHistory()
                this.controller.loadUrl("resource://rawfile/index.html")
                let state = this.controller.serializeWebState()
                this.controller.clearHistory()
                this.controller.restoreWebState(state)
                let list = this.controller.getBackForwardEntries();
                let historyItem = list.getItemAtIndex(list.currentIndex);
                console.log('testRestoreWebState001 result is :' + historyItem.title);
                Utils.emitEvent(historyItem.title, 100083)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testRestoreWebState002": {
              try {
                this.controller.clearHistory()
                this.controller.loadUrl("resource://rawfile/index.html")
                let state = this.controller.serializeWebState()
                this.controller.clearHistory()
                this.controllerOne.restoreWebState(state)
                let list = this.controller.getBackForwardEntries();
                let historyItem = list.getItemAtIndex(list.currentIndex);
                console.log('testRestoreWebState001 result is :' + historyItem.title);
                Utils.emitEvent(historyItem.title, 1000831)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 1000831);
              }
            }
            
            case "testSerializeWebStateErrorCode001": {
              try {
                console.log("testSerializeWebStateErrorCode001");
                this.controller.clearHistory()
                this.controller.loadUrl("resource://rawfile/index.html")
                let state = this.controllerNull.serializeWebState()
                this.controller.clearHistory()
                Utils.emitEvent(state, 110083)
              } catch (error) {
                console.error(`serializeWebState ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 110083)
              }
              break;
            }

            case "testResumeMicrophoneErrorCode001": {
              try {
                this.controllerNull.resumeMicrophone();
              } catch (error) {
                console.error(`resumeMicrophone ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 120083)
              }
              break;
            }

            case "testPauseMicrophoneErrorCode001": {
              try {
                this.controllerNull.pauseMicrophone();
              } catch (error) {
                console.error(`PauseMicrophone ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 130083)
              }
              break;
            }

            case "testStopMicrophoneErrorCode001": {
              try {
                this.controllerNull.stopMicrophone();
              } catch (error) {
                console.error(`StopMicrophone ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 140083)
              }
              break;
            }

            case "testRequestFocusErrorCode001": {
              try {
                this.controllerNull.requestFocus();
              } catch (error) {
                console.error(`requestFocus ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 150083)
              }
              break;
            }

            case "testGetCustomUserAgentErrorCode001": {
              try {
                this.controllerNull.getCustomUserAgent();
              } catch (error) {
                console.error(`getCustomUserAgent ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 160083)
              }
              break;
            }

            case "testGetPageHeightErrorCode001": {
              try {
                this.controllerNull.getPageHeight();
              } catch (error) {
                console.error(`getPageHeight ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 101083)
              }
              break;
            }

            case 'testWebViewGetRenderProcessMode001': {
              try {
                webview.WebviewController.setRenderProcessMode(webview.RenderProcessMode.MULTIPLE);
                this.controller.refresh();
                let mode = webview.WebviewController.getRenderProcessMode();
                console.log('get Mode===>'+mode)
                Utils.emitEvent(mode, 108006);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'testWebViewGetRenderProcessMode002': {
              try {
                webview.WebviewController.setRenderProcessMode(webview.RenderProcessMode.SINGLE);
                this.controller.refresh();
                let mode = webview.WebviewController.getRenderProcessMode();
                console.log('get Mode===>'+mode)
                Utils.emitEvent(mode, 108003);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'emitWebSiteIsolationMode001': {
              try {
                webview.WebviewController.setSiteIsolationMode(webview.SiteIsolationMode.PARTIAL);
                let mode = webview.WebviewController.getSiteIsolationMode();
                Utils.emitEvent(mode, 20250920);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 20250920);
              }
              break;
            }

            case 'emitWebSiteIsolationMode002': {
              try {
                webview.WebviewController.setSiteIsolationMode(webview.SiteIsolationMode.STRICT);
                let mode = webview.WebviewController.getSiteIsolationMode();
                console.log("get mode STRICT = ", mode)
                Utils.emitEvent(mode, 20250921);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(1, 20250921);
              }
              break;
            }

            case "emitAvoidVisibleViewportBottom001": {
              this.avoidHeight += 50;
              this.controller.avoidVisibleViewportBottom(this.avoidHeight);
              setTimeout(() => {
                console.log("get controller.getScrollOffset().y = ", this.controller.getScrollOffset().y);
                Utils.emitEvent(this.controller.getScrollOffset().y, 153920)
              }, 2000);
              break;
            }

            case "emitAvoidVisibleViewportBottomErrCode001": {
              try {
                this.controllerNull.avoidVisibleViewportBottom(111);
                Utils.emitEvent(true, 20250827)
              } catch (error) {
                console.error(`emitAvoidVisibleViewportBottomErr ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 20250827)
              }
              break;
            }

            case "emitAvoidVisibleViewportBottomErrCode002": {
              let errorCode:int  = 0;
              try {
                this.controllerNull.avoidVisibleViewportBottom(111);;
              } catch (error) {
                console.error(`emitStopInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                errorCode = error.code;
              }
              if(webview.WebviewController.getActiveWebEngineVersion() == webview.ArkWebEngineVersion.M114) {
                Utils.emitEvent(errorCode, 20250910)
                console.log('emitAvoidVisibleViewportBottomErrorCode' + 'web_webview.ArkWebEngineVersion.M114')
              } else {
                Utils.emitEvent(801, 20250910)
                console.log('emitAvoidVisibleViewportBottomErrorCode' + 'web_webview.ArkWebEngineVersion.M132')
              }
              break;
            }

            case "emitEnableWholeWebPageDrawing001": {
              Utils.emitEvent(this.isEnableWholeWebPageDrawing, 20250830)
              break;
            }

            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: "pages/webViewControllerPart2" })
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
      Web({ src: 'resource://rawfile/indexTwo.html', controller: this.controllerTwo })
        .id('2')
        .key('web2')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
    }
  }
}
