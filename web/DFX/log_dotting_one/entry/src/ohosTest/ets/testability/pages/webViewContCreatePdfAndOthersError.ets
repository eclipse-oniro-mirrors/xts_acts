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
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import { webview } from '@kit.ArkWeb';
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
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
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
        Button('createPdfAndOthersError').key('webViewContCreatePdfAndOthersError').onClick(() => {
          console.info('XXXXXXXX key==>' + this.str)
          switch (this.str) {
            case 'emitCreatePdfCallbackInitErr': {
              try {
                this.controllerNull.createPdf(this.pdfConfig, () => {
                })
              } catch (error) {
                console.error(`XXXXXXXX emitCreatePdfCallbackInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 17101)
              Utils.emitEvent(this.errorMsg, 17102)
              break;
            }
            case 'emitCreatePdfPromiseInitErr': {
              try {
                this.controllerNull.createPdf(this.pdfConfig).then(() => {
                })
              } catch (error) {
                console.error(`XXXXXXXX emitCreatePdfPromiseInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 17103)
              Utils.emitEvent(this.errorMsg, 17104)
              break;
            }
            case 'emitPrefetchPageInitErr': {
              try {
                this.controllerNull.prefetchPage('https://www.huawei.com', [{ headerKey: 'c', headerValue: 'z' }])
              } catch (error) {
                console.error(`XXXXXXXX emitPrefetchPageInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 17105)
              Utils.emitEvent(this.errorMsg, 17106)
              break;
            }
            case 'emitCreateWebPrintDocumentAdapterInitErr': {
              try {
                this.controllerNull.createWebPrintDocumentAdapter('example.pdf')
              } catch (error) {
                console.error(`XXXXXXXX emitCreateWebPrintDocumentAdapterInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 17107)
              Utils.emitEvent(this.errorMsg, 17108)
              break;
            }
            case 'emitSetScrollableInitErr': {
              try {
                this.controllerNull.setScrollable(true, webview.ScrollType.EVENT)
              } catch (error) {
                console.error(`XXXXXXXX emitSetScrollableInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 17109)
              Utils.emitEvent(this.errorMsg, 17110)
              break;
            }
            case 'emitGetScrollableInitErr': {
              try {
                this.controllerNull.getScrollable()
              } catch (error) {
                console.error(`XXXXXXXX emitGetScrollableInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 17111)
              Utils.emitEvent(this.errorMsg, 17112)
              break;
            }
            case 'emitSetPrintBackgroundInitErr': {
              try {
                this.controllerNull.setPrintBackground(false)
              } catch (error) {
                console.error(`XXXXXXXX emitGetScrollableInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 17113)
              Utils.emitEvent(this.errorMsg, 17114)
              break;
            }
            case 'emitGetPrintBackgroundInitErr': {
              try {
                this.controllerNull.getPrintBackground()
              } catch (error) {
                console.error(`XXXXXXXX emitGetPrintBackgroundInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 17115)
              Utils.emitEvent(this.errorMsg, 17116)
              break;
            }
            case 'emitStartCameraInitErr': {
              try {
                this.controllerNull.startCamera()
              } catch (error) {
                console.error(`XXXXXXXX testStartCameraInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 17117)
              Utils.emitEvent(this.errorMsg, 17118)
              break;
            }
            case 'emitStopCameraInitErr': {
              try {
                this.controllerNull.stopCamera()
              } catch (error) {
                console.error(`XXXXXXXX emitStopCameraInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 17119)
              Utils.emitEvent(this.errorMsg, 17120)
              break;
            }
            case 'emitCloseCameraInitErr': {
              try {
                this.controllerNull.closeCamera()
              } catch (error) {
                console.error(`XXXXXXXX emitCloseCameraInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 17121)
              Utils.emitEvent(this.errorMsg, 17122)
              break;
            }
            case 'emitPauseAllTimersInitErr': {
              try {
                webview.WebviewController.pauseAllTimers();
              } catch (error) {
                console.error(`XXXXXXXX emitPauseAllTimersInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 17123)
              Utils.emitEvent(this.errorMsg, 17124)
              break;
            }
            case 'emitResumeAllTimersInitErr': {
              try {
                webview.WebviewController.resumeAllTimers();
              } catch (error) {
                console.error(`XXXXXXXX emitResumeAllTimersInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 17125)
              Utils.emitEvent(this.errorMsg, 17126)
              break;
            }
            case 'emitStopAllMediaInitErr': {
              try {
                this.controllerNull.stopAllMedia()
              } catch (error) {
                console.error(`XXXXXXXX emitStopAllMediaInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 17127)
              Utils.emitEvent(this.errorMsg, 17128)
              break;
            }
            case 'emitResumeAllMediaInitErr': {
              try {
                webview.WebviewController.pauseAllTimers();
              } catch (error) {
                console.error(`XXXXXXXX emitResumeAllMediaInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 17129)
              Utils.emitEvent(this.errorMsg, 17130)
              break;
            }
            case 'emitPauseAllMediaInitErr': {
              try {
                webview.WebviewController.pauseAllTimers();
              } catch (error) {
                console.error(`XXXXXXXX emitPauseAllMediaInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 17131)
              Utils.emitEvent(this.errorMsg, 17132)
              break;
            }
            case 'emitCloseAllMediaPresentationsInitErr': {
              try {
                this.controllerNull.closeAllMediaPresentations();
              } catch (error) {
                console.error(`XXXXXXXX emitCloseAllMediaPresentationsInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 17133)
              Utils.emitEvent(this.errorMsg, 17134)
              break;
            }
            case 'emitGetMediaPlaybackStateInitErr': {
              try {
                this.controllerNull.getMediaPlaybackState();
              } catch (error) {
                console.error(`XXXXXXXX emitGetMediaPlaybackStateInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 17135)
              Utils.emitEvent(this.errorMsg, 17136)
              break;
            }
            case 'emitTerminateRenderProcessInitErr': {
              try {
                this.controllerNull.terminateRenderProcess();
              } catch (error) {
                console.error(`XXXXXXXX emitTerminateRenderProcessInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 17137)
              Utils.emitEvent(this.errorMsg, 17138)
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
                console.error(`XXXXXXXX emitPrecompileJavaScriptInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 17139)
              Utils.emitEvent(this.errorMsg, 17140)
              break;
            }
            case 'emitSetPathAllowingUniversalAccessInitErr': {
              try {
                this.controllerNull.setPathAllowingUniversalAccess([
                  getContext().resourceDir,
                  getContext().filesDir + '/example'
                ])
              } catch (error) {
                console.error(`XXXXXXXX emitSetPathAllowingUniversalAccessInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 17141)
              Utils.emitEvent(this.errorMsg, 17142)
              break;
            }
            case 'emitScrollByWithResultInitErr': {
              try {
                this.controllerNull.scrollByWithResult(50, 50)
              } catch (error) {
                console.error(`XXXXXXXX emitScrollByWithResultInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 17143)
              Utils.emitEvent(this.errorMsg, 17144)
              break;
            }
            case 'emitGetLastHitTestInitErr': {
              try {
                this.controllerNull.getLastHitTest()
              } catch (error) {
                console.error(`XXXXXXXX emitGetLastHitTestInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 17145)
              Utils.emitEvent(this.errorMsg, 17146)
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
    }
  }
}