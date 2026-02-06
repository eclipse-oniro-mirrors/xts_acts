'use static';
// /*
//  * Copyright (c) 2025 Huawei Device Co., Ltd.
//  * Licensed under the Apache License, Version 2.0 (the "License");
//  * you may not use this file except in compliance with the License.
//  * You may obtain a copy of the License at
//  *
//  *     http://www.apache.org/licenses/LICENSE-2.0
//  *
//  * Unless required by applicable law or agreed to in writing, software
//  * distributed under the License is distributed on an "AS IS" BASIS,
//  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  * See the License for the specific language governing permissions and
//  * limitations under the License.
//  */
// import {
//   $rawfile,
//   AlertDialogParamWithButtons,
//   Button,
//   CacheMode,
//   ClickEvent,
//   Column,
//   Component,
//   Entry,
//   HitTestType,
//   Margin,
//   MessageLevel,
//   MixedMode,
//   OnAlertEvent,
//   OnBeforeUnloadEvent,
//   OnConfirmEvent,
//   OnConsoleEvent,
//   OnErrorReceiveEvent,
//   OnHttpErrorReceiveEvent,
//   OnLoadInterceptEvent,
//   OnRefreshAccessedHistoryEvent,
//   OnRenderExitedEvent,
//   OnShowFileSelectorEvent,
//   OnSslErrorEventReceiveEvent,
//   Row,
//   Text,
//   Web,
//   WebviewController
// } from '@ohos.arkui.component';
// import { State } from '@ohos.arkui.stateManagement';
// import webview from '@ohos.web.webview';
// import { BusinessError } from '@ohos.base';
//
// class TestObj {
//   constructor() {
//   }
//
//   test(data1: string, data2: string, data3: string): string {
//     console.log("data1:" + data1)
//     console.log("data2:" + data2)
//     console.log("data3:" + data3)
//     return "AceString"
//   }
//
//   toString(): string {
//     console.log('toString' + "interface instead.")
//     return JSON.stringify(this)
//   }
// }
//
// @Entry
// @Component
// struct WebComponent {
//   @State javaScriptAccess: boolean = true;
//   @State fileAccess: boolean = true;
//   @State geolocationAccess: boolean = true;
//   @State imageAccess: boolean = true;
//   @State domStorageAccess: boolean = false;
//   @State onlineImageAccess: boolean = true;
//   @State zoomAccess: boolean = true;
//   @State accessBackward: boolean = true;
//   @State accessForward: boolean = true;
//   @State accessStep: boolean = true;
//   @State password: boolean = true;
//   @State tableData: boolean = true;
//   @State wideViewModeAccess: boolean = true;
//   @State overviewModeAccess: boolean = true;
//   @State databaseAccess: boolean = true;
//   @State textZoomAtio: Int = 1;
//   @State mixedMode: MixedMode = MixedMode.None
//   @State cacheMode: CacheMode = CacheMode.None
//   @State getHitTest: HitTestType = HitTestType.Unknown
//   controller: WebviewController = new WebviewController();
//   cookie: webview.WebCookieManager = new webview.WebCookieManager()
//   webUrl: string = 'https://www.baidu.com'
//   testObj: TestObj = new TestObj()
//
//   build() {
//     Column() {
//       Row() {
//         Button('混合内容')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             this.mixedMode = MixedMode.All
//           })
//         Button('混合内容兼容性模式')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             this.mixedMode = MixedMode.Compatible
//           })
//         Button('不允许混合内容')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             this.mixedMode = MixedMode.None
//           })
//         Button('确认弹框')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             this.getUIContext().showAlertDialog(
//               {
//                 title: 'title',
//                 message: 'text',
//                 primaryButton: {
//                   value: 'cancel',
//                   action: () => {
//                     console.info('Callback when the first button is clicked')
//                   }
//                 },
//                 secondaryButton: {
//                   value: 'ok',
//                   action: () => {
//                     console.info('Callback when the second button is clicked')
//                   }
//                 },
//                 cancel: () => {
//                   console.info('Closed callbacks')
//                 }
//               } as AlertDialogParamWithButtons
//             )
//           })
//         Button('警告弹框')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             this.getUIContext().showAlertDialog(
//               {
//                 title: 'title',
//                 message: 'text',
//                 primaryButton: {
//                   value: 'cancel',
//                   action: () => {
//                     console.info('Callback when the first button is clicked')
//                   }
//                 },
//                 secondaryButton: {
//                   value: 'ok',
//                   action: () => {
//                     console.info('Callback when the second button is clicked')
//                   }
//                 },
//                 cancel: () => {
//                   console.info('Closed callbacks')
//                 }
//               } as AlertDialogParamWithButtons
//             )
//           })
//
//       }
//
//       Row() {
//         Button('先缓存后在线')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             this.cacheMode = CacheMode.Online
//           })
//         Button('加载缓存')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             this.cacheMode = CacheMode.Only
//           })
//         Button('加载在线')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             this.cacheMode = CacheMode.None
//           })
//         Button('设置cookie')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             webview.WebCookieManager.configCookieSync(this.webUrl, 'a=b')
//           })
//         Button('保存cookie')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             webview.WebCookieManager.saveCookieSync()
//           })
//       }
//
//       Row() {
//         Button(this.accessBackward ? '页面可后退' : '页面不可后退')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             this.accessBackward = this.controller.accessBackward()
//           })
//         Button(this.accessForward ? '页面可前进' : '页面不可前进')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             this.accessForward = this.controller.accessForward()
//           })
//         Button(this.accessStep ? '页面可前进1步' : '页面不可前进1步')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             this.accessStep = this.controller.accessStep(1)
//           })
//         Button('清空JavaScript方法')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             this.controller.deleteJavaScriptRegister('objName')
//           })
//         Button('Web组件获焦')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             this.controller.requestFocus()
//           })
//         Button('停止页面加载')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             this.controller.stop()
//           })
//       }
//
//       Row() {
//         Button('页面后退')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             this.controller.backward()
//           })
//         Button('页面前进')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             this.controller.forward()
//           })
//         Button('清理历史')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             this.controller.clearHistory()
//           })
//         Button('获取点击对象类型')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             let getHitTest = this.controller.getLastHitTest()
//             if (getHitTest.type == webview.WebHitTestType.EditText) {
//               console.log('this getHitTest : Edit');
//             } else if (getHitTest.type == webview.WebHitTestType.Email) {
//               console.log('this getHitTest : Email');
//             } else if (getHitTest.type == webview.WebHitTestType.HttpAnchor) {
//               console.log('this getHitTest : Http');
//             } else if (getHitTest.type == webview.WebHitTestType.HttpAnchorImg) {
//               console.log('this getHitTest : HttpImg');
//             } else if (getHitTest.type == webview.WebHitTestType.Img) {
//               console.log('this getHitTest : Img');
//             } else if (getHitTest.type == webview.WebHitTestType.Map) {
//               console.log('this getHitTest : Map');
//             } else if (getHitTest.type == webview.WebHitTestType.Phone) {
//               console.log('this getHitTest : Phone');
//             } else {
//               getHitTest.type = webview.WebHitTestType.Unknown
//               console.log('this getHitTest : Unknown');
//             }
//           })
//         Button('加载数据')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             this.controller.loadData(
//               "<html><body bgcolor=\"white\">Source : <pre> source:</pre></body></html>",
//               "text/html",
//               "UTF-8",
//               "https://www.baidu.com",
//               "https://www.gitee.com"
//             )
//           })
//         Button('加载URL')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             this.controller.loadUrl(
//               "https://www.baidu.com",
//               [{ headerKey: 'div', headerValue: 'div' }]
//             )
//           })
//       }
//
//       Row() {
//         Button('页面重新激活')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             this.controller.onActive()
//           })
//         Button('页面暂停渲染')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             this.controller.onInactive()
//           })
//         Button('刷新页面')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             this.controller.refresh()
//           })
//         Button('注册JavaScript')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             this.controller.registerJavaScriptProxy(
//               this.testObj,
//               'objName',
//               ['test', 'toString']
//             )
//           })
//         Button('执行JavaScript脚本')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             this.controller.runJavaScript(
//               'test()',
//               (err: BusinessError | null, result: string | undefined) => {
//                 console.log('run javascript result : ' + result);
//               }
//             )
//           })
//       }
//
//       Row() {
//         Button('onNewRequest')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             // this.controller.onNewRequest()
//           })
//         Button('onStartContinuation')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             // this.controller.onStartContinuation()
//           })
//         Button('onSaveData')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             // this.controller.onSaveData()
//           })
//         Button('onRestoreData')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             // this.controller.onRestoreData()
//           })
//         Button('onCompleteContinuation')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             // this.controller.onCompleteContinuation()
//           })
//         Button('onConfigurationUpdated')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             // this.controller.onConfigurationUpdated()
//           })
//         Button('extendViewModel')
//           .margin({ right: 10 } as Margin)
//           .fontSize(15)
//           .width(150)
//           .onClick((e: ClickEvent) => {
//             // this.controller.extendViewModel()
//           })
//       }
//
//       Web({ src: "", controller: this.controller })
//         .domStorageAccess(this.domStorageAccess)
//         .fileAccess(this.fileAccess)
//         .geolocationAccess(this.geolocationAccess)
//         .imageAccess(this.imageAccess)
//         .javaScriptAccess(this.javaScriptAccess)
//         .mixedMode(this.mixedMode)
//         .onlineImageAccess(this.onlineImageAccess)
//         .zoomAccess(this.zoomAccess)
//         .cacheMode(this.cacheMode)
//         .overviewModeAccess(this.overviewModeAccess)
//         .textZoomRatio(this.textZoomAtio)
//         .databaseAccess(this.databaseAccess)
//         .javaScriptProxy({
//           jsObject: this.testObj,
//           name: 'objName',
//           methodList: ['test', 'toString'],
//           controller: this.controller
//         })
//         .onPageBegin((e) => {
//           console.log("webTest : onPageBegin: " + e.url);
//         })
//         .onPageEnd(e => {
//           console.log("webTest : onPageEnd: " + e.url);
//           this.controller.runJavaScript('test()')
//         })
//         .onProgressChange((e) => {
//           console.log("webTest : onProgressChange: " + e.newProgress);
//         })
//         .onTitleReceive((e) => {
//           console.log("webTest : onProgressChange: " + e.title);
//         })
//         .onDownloadStart((e) => {
//           console.log("webTest : onDownloadStart url : " + e.url);
//           console.log("webTest : onDownloadStart userAgent : " + e.userAgent);
//           console.log("webTest : onDownloadStart contentDisposition : " + e.contentDisposition);
//           console.log("webTest : onDownloadStart mimetype : " + e.mimetype);
//           console.log("webTest : onDownloadStart contentLength : " + e.contentLength);
//         })
//         .onGeolocationHide(() => {
//           console.log("webTest : onGeolocationHide: ");
//         })
//         .onGeolocationShow((e) => {
//           console.log("webTest : onDownloadStart origin : " + e.origin);
//           e.geolocation.invoke(e.origin, true, true)
//           console.log("webTest : onDownloadStart origin : " + e.geolocation.invoke);
//         })
//         .onRequestSelected(() => {
//           console.log("webTest : onRequestSelected: ");
//         })
//         .onAlert((e: OnAlertEvent): boolean => {
//           console.log("webTest : onAlert: " + e.url);
//           console.log("webTest : onAlert: " + e.message);
//           console.log("webTest : onAlert .result : " + e.result);
//           // console.log("webTest : onAlert .result : " + e.result.handleCancel());
//           // console.log("webTest : onAlert .result : " + e.result.handleConfirm());
//           return true
//         })
//         .onBeforeUnload((e: OnBeforeUnloadEvent): boolean => {
//           console.log("webTest : onBeforeUnload: " + e.message);
//           console.log("webTest : onBeforeUnload .result : " + e.result);
//           // console.log("webTest : onBeforeUnload .result : " + e.result.handleCancel());
//           // console.log("webTest : onBeforeUnload .result : " + e.result.handleConfirm());
//           return true
//         })
//         .onConfirm((e: OnConfirmEvent): boolean => {
//           console.log("webTest : onConfirm: " + e.url);
//           console.log("webTest : onConfirm: " + e.message);
//           console.log("webTest : onConfirm .result : " + e.result);
//           // console.log("webTest : onConfirm .result : " + e.result.handleCancel());
//           // console.log("webTest : onConfirm .result : " + e.result.handleConfirm());
//           return true
//         })
//         .onConsole((e: OnConsoleEvent): boolean => {
//           console.log("webTest : onConsole .message : " + e.message);
//           console.log("webTest : onConsole .message : " + e.message.getMessage());
//           console.log("webTest : onConsole .message : " + e.message.getSourceId());
//           console.log("webTest : onConsole .message : " + e.message.getLineNumber());
//           let level = e.message.getMessageLevel()
//           if (level == MessageLevel.Debug) {
//             console.log("webTest : onConsole: level Debug");
//           } else if (level == MessageLevel.Error) {
//             console.log("webTest : onConsole: level Error");
//           } else if (level == MessageLevel.Info) {
//             console.log("webTest : onConsole: level Info");
//           } else if (level == MessageLevel.Log) {
//             console.log("webTest : onConsole: level Log");
//           } else {
//             level = MessageLevel.Warn
//             console.log("webTest : onConsole: level Warn");
//           }
//           return true
//         })
//         .onErrorReceive((e: OnErrorReceiveEvent) => {
//           console.log("webTest : onErrorReceive .request : " + e.request);
//           console.log("webTest : onErrorReceive .request : " + e.request.getRequestHeader());
//           console.log("webTest : onErrorReceive .request : " + e.request.getRequestUrl());
//           console.log("webTest : onErrorReceive .request : " + e.request.isRequestGesture());
//           console.log("webTest : onErrorReceive .request : " + e.request.isMainFrame());
//           console.log("webTest : onErrorReceive .request : " + e.request.isRedirect());
//
//           console.log("webTest : onErrorReceive .error : " + e.error);
//           console.log("webTest : onErrorReceive .error : " + e.error.getErrorInfo());
//           console.log("webTest : onErrorReceive .error : " + e.error.getErrorCode());
//         })
//         .onHttpErrorReceive((e: OnHttpErrorReceiveEvent) => {
//           console.log("webTest : onHttpErrorReceive .request : " + e.request);
//           console.log("webTest : onHttpErrorReceive .request : " + e.request.getRequestHeader());
//           console.log("webTest : onHttpErrorReceive .request : " + e.request.getRequestUrl());
//           console.log("webTest : onHttpErrorReceive .request : " + e.request.isRequestGesture());
//           console.log("webTest : onHttpErrorReceive .request : " + e.request.isMainFrame());
//           console.log("webTest : onHttpErrorReceive .request : " + e.request.isRedirect());
//
//         })
//         .onRefreshAccessedHistory((e: OnRefreshAccessedHistoryEvent) => {
//           console.log("webTest : onRefreshAccessedHistory .url : " + e.url);
//           console.log("webTest : onRefreshAccessedHistory .refreshed : " + e.isRefreshed);
//         })
//         .onLoadIntercept((e: OnLoadInterceptEvent): boolean => {
//           console.log("webTest : onUrlLoadIntercept .data : " + e.data);
//           return true
//         })
//         .onSslErrorEventReceive((e: OnSslErrorEventReceiveEvent) => {
//           console.log("webTest : onSslErrorReceive .handle : " + e.handler);
//           console.log("webTest : onSslErrorReceive .error : " + e.error);
//         })
//         .onRenderExited((e: OnRenderExitedEvent) => {
//           console.log("webTest : onRenderExited .renderExitReason : " + JSON.stringify(e.renderExitReason));
//         })
//         .onShowFileSelector((e: OnShowFileSelectorEvent): boolean => {
//           console.log("webTest : onFileSelectorShow .callback : " + e.result);
//           console.log("webTest : onFileSelectorShow .fileSelector : " + e.fileSelector);
//           return true
//         })
//
//     }
//   }
// }