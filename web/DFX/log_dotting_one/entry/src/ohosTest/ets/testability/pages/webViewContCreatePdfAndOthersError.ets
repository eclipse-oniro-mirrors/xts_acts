/**
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

import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import { webview } from '@kit.ArkWeb';

const EVENT_ID_SET_EMIT_KEY = 110650;

class myInstance {
  applyNormalAttribute(webInstance: WebAttribute): void {
    webInstance.zoomAccess(false)
  }
}

@Entry
@Component
struct webViewContCreatePdfAndOthersError {
  controller: webview.WebviewController = new webview.WebviewController();
  controllerNull: webview.WebviewController = new webview.WebviewController();
  @State str: string = '';
  @State userAgent: string = 'Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)' +
    ' CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State zoomAccess: boolean = false;
  @State errorCode: string = '0';
  @State errorMsg: string = 'failed';
  @State factor: number = 1;
  @State searchString: string = 'test';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State editMenuOptions: EditMenuOptions = { onCreateMenu: this.onCreateMenu, onMenuItemClick: this.onMenuItemClick }
  optionsTrue: EmbedOptions = { supportDefaultIntrinsicSize: true };
  optionsFalse: EmbedOptions = { supportDefaultIntrinsicSize: false };

  onCreateMenu(menuItems: Array<TextMenuItem>): Array<TextMenuItem> {
    let items = menuItems.filter((menuItem) => {
      // 过滤用户需要的系统按键
      return (
        menuItem.id.equals(TextMenuItemId.CUT) ||
        menuItem.id.equals(TextMenuItemId.COPY) ||
        menuItem.id.equals((TextMenuItemId.PASTE))
      )
    });
    return items;
  }

  onMenuItemClick(menuItem: TextMenuItem, textRange: TextRange): boolean {
    if (menuItem.id.equals(TextMenuItemId.CUT)) {
      return true; // 返回true不执行系统回调
    } else if (menuItem.id.equals(TextMenuItemId.COPY)) {
      return false; // 返回false执行系统回调
    }
    return false; // 返回默认值false
  }

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
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
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
    Column() {
      Row() {
        Button('createPdfAndOthersError').key('webViewContCreatePdfAndOthersError').onClick(async () => {
          await Utils.waitForExist(()=>this.isPageEnd, 'webViewContCreatePdfAndOthersErrorIsPageEnd', 1, 1000);
          await Utils.waitForExist(()=>this.isReceive, 'webViewContCreatePdfAndOthersErrorIsReceive', 1, 1000);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case 'emitCreatePdfCallbackInitErr': {
              try {
                this.controllerNull.createPdf(this.pdfConfig, () => {
                })
              } catch (error) {
                console.error(`emitCreatePdfCallbackInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
                Utils.emitEvent(this.errorCode, 110660)
                Utils.emitEvent(this.errorMsg, 110670)
              }
              break;
            }
            case 'emitCreatePdfPromiseInitErr': {
              try {
                this.controllerNull.createPdf(this.pdfConfig).then(() => {
                })
              } catch (error) {
                console.error(`emitCreatePdfPromiseInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
                Utils.emitEvent(this.errorCode, 110680)
                Utils.emitEvent(this.errorMsg, 110690)
              }
              break;
            }
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
            case 'emitCreateWebPrintDocumentAdapterInitErr': {
              try {
                this.controllerNull.createWebPrintDocumentAdapter('example.pdf')
              } catch (error) {
                console.error(`emitCreateWebPrintDocumentAdapterInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
                Utils.emitEvent(this.errorCode, 110720)
                Utils.emitEvent(this.errorMsg, 110730)
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
            case 'emitSetPrintBackgroundInitErr': {
              try {
                this.controllerNull.setPrintBackground(false)
              } catch (error) {
                console.error(`emitGetScrollableInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
                Utils.emitEvent(this.errorCode, 110780)
                Utils.emitEvent(this.errorMsg, 110790)
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
            case 'emitStartCameraInitErr': {
              try {
                this.controllerNull.startCamera()
              } catch (error) {
                console.error(`testStartCameraInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
                Utils.emitEvent(this.errorCode, 110820)
                Utils.emitEvent(this.errorMsg, 110830)
              }
              break;
            }
            case 'emitStopCameraInitErr': {
              try {
                this.controllerNull.stopCamera()
              } catch (error) {
                console.error(`emitStopCameraInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
                Utils.emitEvent(this.errorCode, 110840)
                Utils.emitEvent(this.errorMsg, 110850)
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
            case 'emitTerminateRenderProcessInitErr': {
              try {
                this.controllerNull.terminateRenderProcess();
              } catch (error) {
                console.error(`emitTerminateRenderProcessInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
                Utils.emitEvent(this.errorCode, 111020)
                Utils.emitEvent(this.errorMsg, 111030)
              }
              break;
            }
            case 'emitPrecompileJavaScriptInitErr': {
              try {
                this.controllerNull.precompileJavaScript('https://', 'hawe', {
                  responseHeaders: [
                    {
                      headerKey: 'E-Tag',
                      headerValue: '68ZpTzuAFdm85xPNtr3EOzySP8Q'
                    }
                  ]
                }).then(() => {
                })
              } catch (error) {
                console.error(`emitPrecompileJavaScriptInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
                Utils.emitEvent(this.errorCode, 111040)
                Utils.emitEvent(this.errorMsg, 111050)
              }
              break;
            }
            case 'emitSetPathAllowingUniversalAccessInitErr': {
              try {
                this.controllerNull.setPathAllowingUniversalAccess([
                  getContext().resourceDir,
                  getContext().filesDir + '/example'
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
            case 'emitScrollByWithResultInitErr': {
              try {
                this.controllerNull.scrollByWithResult(50, 50)
              } catch (error) {
                console.error(`emitScrollByWithResultInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
                Utils.emitEvent(this.errorCode, 111080)
                Utils.emitEvent(this.errorMsg, 111090)
              }
              break;
            }
            case 'emitGetLastHitTestInitErr': {
              try {
                this.controllerNull.getHitTest()
              } catch (error) {
                console.error(`emitGetLastHitTestInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
                Utils.emitEvent(this.errorCode, 111100)
                Utils.emitEvent(this.errorMsg, 111110)
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .zoomAccess(this.zoomAccess)
        .enableHapticFeedback(true)
        .editMenuOptions(this.editMenuOptions)
        .enableNativeEmbedMode(true)
        .nativeEmbedOptions(this.optionsFalse)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}