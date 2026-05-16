/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import Utils from '../../src/test/Utils.test';
import { URL, URL2 } from '../../src/test/Config.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import web_webview from '@ohos.web.webview';
import webView from '@ohos.web.webview';
import { webview } from '@kit.ArkWeb';
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { State } from '@ohos.arkui.stateManagement';
import { canIUse } from '@internal.full.global';
import WebNativeMessagingExtensionAbility, { ConnectionInfo } from '@ohos.web.WebNativeMessagingExtensionAbility';
import { Want } from '@kit.AbilityKit';
import { Entry, Component, Column, MicrophoneCaptureState, MicrophoneCaptureStateChangeInfo, CameraCaptureState,
  GestureFocusMode, CameraCaptureStateChangeInfo, Button, Web, $rawfile, MixedMode, CustomDialog,
  CustomDialogController, NavigationPolicy, ClickEvent, OnDataResubmittedEvent } from '@ohos.arkui.component';
import { UIContext, Router } from '@ohos.arkui.UIContext'

@CustomDialog
struct NewWebViewComp {
  controller?: CustomDialogController
  webviewController1: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State text: boolean = false;
  @State mode: MixedMode = MixedMode.COMPATIBLE;

  build() {
    Column() {
      Web({ src: 'https://www.example.com', controller: this.webviewController1 })
        .javaScriptAccess(true)
        .multiWindowAccess(true)
        .webSerifFont('serif')
        .allowWindowOpenMethod(true)
        .zoomControlAccess(false)
        .mixedMode(this.mode)
        .imageAccess(true)
        .onWindowExit(() => {
          console.info('NewWebViewComp onWindowExit');
          if (this.controller) {
            this.controller?.close();
          }
        })
        .zoomAccess(this.text)
    }
  }
}

export class MyWebNativeMessagingExtension extends WebNativeMessagingExtensionAbility {
  onConnectNative(info: ConnectionInfo): void {
    const abilityWant : Want = {
      bundleName: 'com.open.harmony.logdottingeleventest.static',
      abilityName: 'EntryAbility'
    };
    try {
      const context = this.context; // Obtain the WebNativeMessagingExtensionContext instance.
      context.startAbility(abilityWant);
      console.info('Ability started successfully');
    } catch (err) {
      console.error(`Failed to start ability. Code: ${err.code}, Message: ${err.message}`);
    }
  }

  onDisconnectNative(info: ConnectionInfo): void {
    console.info('Web Native connection closed!');
    console.info(`Connection ID: ${info.connectionId}`);
    // Process the cleanup after the connection is disconnected.
  }

  onDestroy(): void {
    console.info('WebNativeMessagingExtensionAbility is about to be destroyed!');
    // Release resources or perform cleanup operations.
  }
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State isReceive: number = -1;
  @State scrollResult: boolean = false;
  @State enableDataDetector: boolean | undefined = true;
  @State metaViewport: boolean | undefined = undefined;
  @State enableSelectedDataDetector: boolean = true;
  @State setWebDestroyModeArr: String[] = ['webview.WebDestroyMode.FAST_MODE', 'webview.WebDestroyMode.NORMAL_MODE']
  @State isPageEnd: number = -1;
  @State str: string = '';
  @State newState : int = 0;
  @State navigationPolicy:number = 5;
  @State errorCode: int = 0;
  @State flag: Boolean = true
  @State MicrophoneCaptureStateArr:MicrophoneCaptureState[] = [MicrophoneCaptureState.NONE,MicrophoneCaptureState.PAUSED,MicrophoneCaptureState.ACTIVE]
  @State navigationPolicyArr: NavigationPolicy[] = [NavigationPolicy.NEW_POPUP,NavigationPolicy.NEW_WINDOW,NavigationPolicy.NEW_BACKGROUND_TAB,NavigationPolicy.NEW_FOREGROUND_TAB]
  @State dialogController: CustomDialogController | null = null;
  @State CameraCaptureStateArr:CameraCaptureState[] = [CameraCaptureState.NONE,CameraCaptureState.PAUSED,CameraCaptureState.ACTIVE]
  @State no_error: string = 'no error happened'
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  controllerNull: webView.WebviewController = new webView.WebviewController(undefined);

  aboutToAppear() {
    if (this.flag) {
      console.info('WebDestroyMode set to FAST_MODE, flag = true')
      webview.WebviewController.setWebDestroyMode(webview.WebDestroyMode.FAST_MODE)
    } else {
      console.info('WebDestroyMode set to NORMAL_MODE, flag = false')
      webview.WebviewController.setWebDestroyMode(webview.WebDestroyMode.NORMAL_MODE)
    }
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
        console.info('this.str has been updated to: ' + this.str);
      }
    }
  }

  build() {
    Column() {
      Button('web click')
        .key('WebViewNavigationPolicyButton')
        .onClick((e: ClickEvent) => {
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'emitWebViewNavigationPolicy001': {
              setTimeout(() => {
                this.controller.runJavaScript('connectNative()');
                console.log('connectNative 已调用');
              }, 1000);
              try {
                if (!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  console.info('this.navigationPolicy' + this.navigationPolicy)
                  Utils.emitEvent(this.navigationPolicy, 20260113)
                } else {
                  setTimeout(() => {
                    Utils.emitEvent(this.navigationPolicy, 20260113)
                    console.log('系统支持 HDSPattern.Standard，可以执行点击逻辑')
                  }, 4000)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'emitWebViewNavigationPolicy002': {
              try {
                this.controller.pageUp(false);
                if (!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  console.info('this.navigationPolicy' + this.navigationPolicy)
                  Utils.emitEvent(this.navigationPolicy, 20260114)
                } else {
                  this.isPageEnd = -1
                  this.controller.loadUrl('resource://rawfile/windowOpen.html')
                  console.log('系统支持 HDSPattern.Standard，可以执行点击逻辑')
                  Utils.emitEvent(this.navigationPolicy, 20260114)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break
            }

            case 'emitWebViewNavigationPolicy003': {
              try {
                this.controller.pageDown(false);
                if (!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  console.info('this.navigationPolicy' + this.navigationPolicy)
                  Utils.emitEvent(this.navigationPolicy, 20260115)
                } else {
                  console.log('系统支持 HDSPattern.Standard，可以执行点击逻辑')
                  Utils.emitEvent(this.navigationPolicy, 20260115)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break
            }

            case 'emitWebViewNavigationPolicy004': {
              try {
                if (!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  console.info('this.navigationPolicy' + this.navigationPolicy)
                  Utils.emitEvent(this.navigationPolicy, 20260116)
                } else {
                  console.log('系统支持 HDSPattern.Standard，可以执行点击逻辑')
                  Utils.emitEvent(this.navigationPolicy, 20260116)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break
            }

            case 'testHasImageError001': {
              try {
                this.controllerNull.hasImage((error, data) => {
                  if (error) {
                    console.info(`hasImage error: ` + JSON.stringify(error))
                    Utils.emitEvent(String(error.code), 115380)
                    return;
                  }
                  console.info('hasImage: ' + data);
                  Utils.emitEvent(this.no_error, 115380)
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 115380)
              }
              break;
            }

            case 'testHasImageError002': {
              try {
                this.controllerNull.hasImage().then((data) => {
                  console.info('hasImage: ' + data);
                  Utils.emitEvent(this.no_error, 115390)
                })
                  .catch((error) => {
                    console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 115390)
                  })
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 115390)
              }
              break;
            }

            case 'emitSetAppCustomUserAgent001': {
              try {
                let userAgent = webView.WebviewController.getDefaultUserAgent();
                console.log('userAgent===>' + userAgent);
                let customUserAgent = userAgent + ' setAppCustomUserAgent';
                webView.WebviewController.setAppCustomUserAgent(customUserAgent);
                setTimeout(() => {
                  this.controller.loadUrl('resource://rawfile/userAgentTwo.html')
                }, 1000)
                setTimeout(() => {
                  this.controller.runJavaScript('getUserAgent()', (error, result) => {
                    if (error) {
                      console.error(`runJavaScript ErrorCode: ${error.code},  Message: ${error.message}`);
                    }
                    if (result) {
                      console.info(`runJavaScript The test() return value is: ${result}`);
                      let isGetResult = result.includes('setAppCustomUserAgent');
                      console.log('isGetResult===>' + isGetResult);
                      Utils.emitEvent(isGetResult, 174020)
                    }
                  })
                }, 2000)
              } catch (error) {
                console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent(true, 174020)
                }
              }
              break;
            }

            case 'emitSetAppCustomUserAgent002': {
              try {
                let userAgent = webView.WebviewController.getDefaultUserAgent();
                console.log('userAgent===>' + userAgent);
                webView.WebviewController.setAppCustomUserAgent('');
                setTimeout(() => {
                  this.controller.loadUrl('resource://rawfile/userAgentTwo.html')
                }, 1000)
                setTimeout(() => {
                  this.controller.runJavaScript('getUserAgent()', (error, result) => {
                    if (error) {
                      console.error(`runJavaScript ErrorCode: ${error.code},  Message: ${error.message}`);
                    }
                    if (result) {
                      console.info(`runJavaScript The test() return value is: ${result}`);
                      let isGetResult = result.includes('setAppCustomUserAgent');
                      console.log('isGetResult===>' + isGetResult);
                      Utils.emitEvent(isGetResult, 174021)
                    }
                  })
                }, 2000)
              } catch (error) {
                console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent(true, 174021)
                }
              }
              break;
            }

            case 'emitSetUserAgentForHostsOverRange001': {
              try {
                let userAgent = webView.WebviewController.getDefaultUserAgent();
                console.log('userAgent===>' + userAgent);
                let customUserAgent = userAgent + ' setUserAgentForHosts';
                webView.WebviewController.setUserAgentForHosts(customUserAgent, ['test123.test.com']);
                setTimeout(() => {
                  this.controller.loadUrl('resource://rawfile/userAgentTwo.html')
                }, 1000)
                setTimeout(() => {
                  this.controller.runJavaScript('getUserAgent()', (error, result) => {
                    if (error) {
                      console.error(`runJavaScript ErrorCode: ${error.code},  Message: ${error.message}`);
                    }
                    if (result) {
                      console.info(`runJavaScript The test() return value is: ${result}`);
                      let isGetResult = result.includes('setUserAgentForHosts');
                      Utils.emitEvent(isGetResult, 174060)
                    }
                  })
                }, 2000)
              } catch (error) {
                console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent(true, 174060)
                }
              }
              break;
            }

            case 'emitSetUserAgentForHostsOverRange002': {
              try {
                let userAgent = webView.WebviewController.getDefaultUserAgent();
                console.log('userAgent===>' + userAgent);
                let customUserAgent = userAgent + ' setUserAgentForHosts';
                webView.WebviewController.setUserAgentForHosts('', ['test123.test.com']);
                setTimeout(() => {
                  this.controller.loadUrl('resource://rawfile/userAgentTwo.html')
                }, 1000)
                setTimeout(() => {
                  this.controller.runJavaScript('getUserAgent()', (error, result) => {
                    if (error) {
                      console.error(`runJavaScript ErrorCode: ${error.code},  Message: ${error.message}`);
                    }
                    if (result) {
                      console.info(`runJavaScript The test() return value is: ${result}`);
                      let isGetResult = result.includes('setUserAgentForHosts');
                      Utils.emitEvent(isGetResult, 174061)
                    }
                  })
                }, 2000)
              } catch (error) {
                console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent(true, 174061)
                }
              }
              break;
            }

            case 'emitSetSoftKeyboardBehaviorModeErr001': {
              try {
                this.controllerNull.setSoftKeyboardBehaviorMode(web_webview.WebSoftKeyboardBehaviorMode.DEFAULT);
              } catch (error) {
                console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                Utils.emitEvent(this.errorCode, 20151222)
              }
              break;
            }

            case 'emitSetSoftKeyboardBehaviorModeErr002': {
              try {
                this.controllerNull.setSoftKeyboardBehaviorMode(web_webview.WebSoftKeyboardBehaviorMode.DISABLE_AUTO_KEYBOARD_ON_ACTIVE);
              } catch (error) {
                console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                Utils.emitEvent(this.errorCode, 20151223)
              }
              break;
            }

            case 'emitOnCameraCaptureStateChange003': {
              try {
                if (!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  this.controller.startCamera();
                  Utils.emitEvent((this.CameraCaptureStateArr[2].valueOf()).toDouble(), 20260203);
                } else {
                  this.controller.startCamera();
                  Utils.emitEvent((this.CameraCaptureStateArr[2].valueOf()).toDouble(), 20260203);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'emitOnTextSelectionChange02': {
              setTimeout(() => {
                this.controller.loadUrl('resource://rawfile/onTextSelectionChange.html')
              }, 1000)
              setTimeout(() => {
                this.controller.runJavaScript('setSelection()');
                console.log('setSelection 已调用');
              }, 3000);
              break;
            }

            case 'emitOnMicrophoneCaptureStateChange004': {
              try {
                if (!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  Utils.emitEvent((this.MicrophoneCaptureStateArr[0].valueOf()).toDouble(), 20251231);
                } else {
                  this.controller.stopMicrophone();
                  setTimeout(() => {
                    Utils.emitEvent((this.MicrophoneCaptureStateArr[this.newState].valueOf()).toDouble(), 20251231);
                  }, 500)
                }

              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'emitEnableSelectedDataDetector001': {
              try {
                this.enableSelectedDataDetector = false;
                Utils.emitEvent('false', 20251232);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'emitEnableDataDetector001': {
              try {
                this.enableDataDetector = false;
                Utils.emitEvent('false', 20251233);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'emitEnableDataDetector002': {
              try {
                this.enableDataDetector = undefined;
                Utils.emitEvent('undefined', 20251234);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'emitWebViewMetaViewportTrue': {
              try {
                this.metaViewport = true;
                setTimeout(() => {
                  this.controller.loadUrl('resource://rawfile/metaViewport.html')
                }, 1000)
                setTimeout(() => {
                  this.controller.runJavaScript('isElementMetaViewport()',
                    (error: BusinessError<void> | null, result: String | undefined) => {
                      if (result) {
                        console.log('The isElementMetaViewport() return value is: ' + result)
                        Utils.emitEvent(result, 10002)
                      }
                    })
                }, 2000)
              } catch (error) {
                console.error('ErrorCode: ${error.code}, Message: ${error.message}');
              }
              break;
            }

            case 'emitwebViewSetWebDestroyMode001': {
              this.controller.loadUrl('resource://rawfile/metaViewport.html')
              Utils.emitEvent(this.setWebDestroyModeArr[0], 138560)
              break;
            }

            case 'emitwebViewSetWebDestroyMode002': {
              Utils.emitEvent(this.setWebDestroyModeArr[1], 138570)
              break;
            }

            case 'emitSetScrollbarMode001': {
              console.info('[WebView] enter emitSetScrollbarMode001')
              try {
                webview.WebviewController.setScrollbarMode(webview.ScrollbarMode.FORCE_DISPLAY_SCROLLBAR);
                console.info('[WebView] setScrollbarMode -> FORCE_DISPLAY_SCROLLBAR, value= ' +
                webview.ScrollbarMode.FORCE_DISPLAY_SCROLLBAR)
                Utils.emitEvent(webview.ScrollbarMode.FORCE_DISPLAY_SCROLLBAR, 20251208)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'emitOnDataResubmitted': {
              try {
                setTimeout(() => {
                  this.controller.loadUrl('resource://rawfile/onDataResubmitted.html');
                }, 1000)
                setTimeout(() => {
                  this.controller.refresh();
                }, 3000)
              } catch (error) {
                console.error('ErrorCode: ${error.code}, Message: ${error.message}');
              }
              break;
            }

            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/WebViewWindowFeatures' })
              console.log('push URL success')
            }
          }
        })

        Web({ src: ('resource://rawfile/windowOpen.html'), controller: this.controller })
          .key('WebViewNavigationPolicyWeb')
          .zoomAccess(true)
          .onDataResubmitted((event : OnDataResubmittedEvent) => {
            console.info('onDataResubmitted triggered');
            Utils.emitEvent('onDataResubmitted', 20251210)
            event.handler.resend();
          })
          .bypassVsyncCondition(undefined)
          .metaViewport(this.metaViewport)
          .enableDataDetector(this.enableDataDetector)
          .dataDetectorConfig(undefined)
          .backToTop(true)
          .gestureFocusMode(GestureFocusMode.DEFAULT)
          .attributeModifier(undefined)
          .enableSelectedDataDetector(this.enableSelectedDataDetector)
          .textAutosizing(false)
          .geolocationAccess(true)
          .onMicrophoneCaptureStateChange((event : MicrophoneCaptureStateChangeInfo)=>{
            console.info('Microphone from ', event.originalState, ' to ', event.newState);
            console.info('newState' + event.newState);
            this.newState = event.newState;
          })
          .onTextSelectionChange((selectionText: string) => {
            console.info(`Selected text: '${selectionText}'`);
            if (selectionText && selectionText.length > 0) {
              Utils.emitEvent('selectionText', 202601212);
            }
          })
          .javaScriptAccess(true)
          .enableAutoFill(false)
          .multiWindowAccess(true)
          .webStandardFont('sans-serif')
          .allowWindowOpenMethod(true)
          .onCameraCaptureStateChange((info : CameraCaptureStateChangeInfo)=>{
            console.info('Camera from ', info.originalState, ' to ', info.newState);
            console.info('newState' + info.newState);
            this.newState = info.newState;
          })
          .onPageEnd(() => {
            this.isPageEnd = 1
          })
          .onWindowNew((event) => {
            console.log('===== ArkTS onWindowNew 开始 =====');
            if (this.dialogController) {
              this.dialogController?.close();
            }

            let popController: web_webview.WebviewController = new web_webview.WebviewController(undefined);
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

            let popController: web_webview.WebviewController = new web_webview.WebviewController(undefined);
            this.dialogController = new CustomDialogController({
              builder: NewWebViewComp({ webviewController1: popController })
            })
            this.dialogController?.open();

            // 关键：必须设置 WebController
            event.handler.setWebController(popController);
            if (event) {
              this.navigationPolicy = event.navigationPolicy;
              console.log('onWindowNewExt isAlert', event.isAlert)
              console.log('onWindowNewExt isUserTrigger', event.isUserTrigger)
              console.log('onWindowNewExt targetUrl', event.targetUrl)
              console.log('onWindowNewExt handler', event.handler)

              console.log('onWindowNewExt navigationAction', event.navigationPolicy)
              console.log('onWindowNewExt height', event.windowFeatures.height)
              console.log('onWindowNewExt width', event.windowFeatures.width)
              console.log('onWindowNewExt x', event.windowFeatures.x)
              console.log('onWindowNewExt y', event.windowFeatures.y)
            }
            console.log('===== ArkTS onWindowNewExt 结束 =====');
          })
      }.height('20%')
  }
}
