'use static';
/**
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

// import prompt from '@ohos.prompt'
// import emitter from '@ohos.events.emitter';
// import webview from '@ohos.web.webview'
// import { BusinessError } from '@ohos.base';
// import {
//   Entry, Component,
//   Column, ColumnOptions, List, ListItem, ListOptions,
//   Flex, FlexDirection, ItemAlign, FlexAlign, Web,
//   Text, TextAlign, Button, FontWeight, ClickEvent, Margin, Color, Row,
// } from '@ohos.arkui.component'
// import { State } from '@ohos.arkui.stateManagement';
//
// @Entry
// @Component
// struct WebComponent {
//   controller: webview.WebviewController = new webview.WebviewController();
//   @State isLoad: boolean = false;
//   @State hitTestValue: webview.WebHitTestType = webview.WebHitTestType.EditText;
//   @State hitTestValue8: webview.HitTestValue = {
//     type: webview.WebHitTestType.Phone,
//     extra: "hello"
//   } as webview.HitTestValue;
//   @State webStorage: webview.WebStorageOrigin = {
//     origin: 'prign',
//     usage: 2,
//     quota: 3
//   } as webview.WebStorageOrigin;
//   headers: Array<webview.WebHeader> = [{
//     headerKey: "requesstHeader",
//     headerValue: "requestValue"
//   } as webview.WebHeader]
//
//   aboutToAppear() {
//     console.info(`aboutToAppear HeaderV9 start`)
//   }
//
//   aboutToDisappear() {
//     console.info(`aboutToDisAppear HeaderV9 end`)
//   }
//
//   build() {
//     Column() {
//       Button('loadUrl').onClick((e:ClickEvent) => {
//         try {
//           this.controller.loadUrl('www.baidu.com', this.headers);
//           this.isLoad = true;
//           try {
//             let backData: emitter.EventData = {
//               data: {
//                 "STATUS": this.isLoad
//               } as Record<String, undefined|null|Object>
//             }
//             let backEvent: emitter.InnerEvent = {
//               eventId: 90201,
//               priority: emitter.EventPriority.LOW
//             }
//             console.info("loadUrl headerV9 to emit action state")
//             emitter.emit(backEvent, backData)
//           } catch (err:BusinessError) {
//             console.info("loadUrl headerV9 emit action state err: " + JSON.stringify((err as BusinessError).message))
//           }
//
//         } catch (error:BusinessError) {
//           console.error(`ErrorCode: ${error.code},  Message: ${(error as BusinessError).message}`);
//         }
//       }).key('btloadurl')
//       Button('getHitTest').onClick((e:ClickEvent) => {
//         try {
//           let hitTestType = this.controller.getLastHitTest(); // getHitTest
//           console.info("hitTestType: " + hitTestType);
//           try {
//             let backData: emitter.EventData = {
//               data: {
//                 "STATUS": this.hitTestValue
//               } as Record<String, undefined|null|Object>
//             }
//             let backEvent: emitter.InnerEvent = {
//               eventId: 90202,
//               priority: emitter.EventPriority.LOW
//             }
//             console.info("loadUrl hitTestType to emit action state")
//             emitter.emit(backEvent, backData)
//           } catch (err:BusinessError) {
//             console.info("loadUrl hitTestType emit action state err: " + JSON.stringify((err as BusinessError).message))
//           }
//
//         } catch (error:BusinessError) {
//           console.error(`ErrorCode: ${error.code},  Message: ${(error as BusinessError).message}`);
//         }
//       }).key('btngetHitTest')
//
//       Button('getHitTestValue').onClick((e:ClickEvent) => {
//         try {
//           let hitValue = this.controller.getLastHitTest(); // getHitTestValue
//           try {
//             let backData: emitter.EventData = {
//               data: {
//                 "STATUS": this.hitTestValue8
//               } as Record<String, undefined|null|Object>
//             }
//             let backEvent: emitter.InnerEvent = {
//               eventId: 90203,
//               priority: emitter.EventPriority.LOW
//             }
//             console.info("loadUrl getHitTestValue to emit action state")
//             emitter.emit(backEvent, backData)
//           } catch (err:BusinessError) {
//             console.info("loadUrl getHitTestValue emit action state err: " + JSON.stringify((err as BusinessError).message))
//           }
//           console.info("hitType: " + hitValue.type);
//           console.info("extra: " + hitValue.extra);
//         } catch (error:BusinessError) {
//           console.error(`ErrorCode: ${error.code},  Message: ${(error as BusinessError).message}`);
//         }
//       })
//
//       Button('getOrigins').onClick((e:ClickEvent) => {
//         try {
//           webview.WebStorage.getOrigins()
//             .then((origins:Array<webview.WebStorageOrigin>) => {
//               for (let i = 0; i < origins.length; i++) {
//                 console.log('origin: ' + origins[i].origin);
//                 console.log('usage: ' + origins[i].usage);
//                 console.log('quota: ' + origins[i].quota);
//               }
//             })
//             .catch((e: Error) => {
//               console.log('error: ' + e);
//             })
//         } catch (error:BusinessError) {
//           console.error(`ErrorCode: ${error.code}, Message: ${(error as BusinessError).message}`);
//         }
//       })
//       Button('getOriginsPromise').onClick((e:ClickEvent) => {
//         try {
//           webview.WebStorage.getOrigins()
//             .then((origins:Array<webview.WebStorageOrigin>) => {
//               for (let i = 0; i < origins.length; i++) {
//                 console.log('origin: ' + origins[i].origin);
//                 console.log('usage: ' + origins[i].usage);
//                 console.log('quota: ' + origins[i].quota);
//               }
//               try {
//                 let backData: emitter.EventData = {
//                   data: {
//                     "STATUS": this.webStorage.origin
//                   } as Record<String, undefined|null|Object>
//                 }
//                 let backEvent: emitter.InnerEvent = {
//                   eventId: 90204,
//                   priority: emitter.EventPriority.LOW
//                 }
//                 console.info("loadUrl getHitTestValue to emit action state")
//                 emitter.emit(backEvent, backData)
//               } catch (err:BusinessError) {
//                 console.info("loadUrl getHitTestValue emit action state err: " + JSON.stringify((err as BusinessError).message))
//               }
//             })
//             .catch((e: Error) => {
//               console.log('error: ' + e);
//             })
//         } catch (error:BusinessError) {
//           console.error(`ErrorCode: ${error.code}, Message: ${(error as BusinessError).message}`);
//         }
//
//       })
//       Button('getOriginQuota')
//         .onClick((e:ClickEvent) => {
//           try {
//             webview.WebStorage.getOriginQuota('file:///')
//               .then(quota => {
//                 console.info('quota: ' + quota);
//               })
//               .catch((e: Error) => {
//                 console.info('error: ' + e);
//               })
//           } catch (error:BusinessError) {
//             console.error(`ErrorCode: ${error.code}, Message: ${(error as BusinessError).message}`);
//           }
//
//         }).key('getOriginQuotakey')
//
//       Button('getOriginUsage')
//         .onClick((e:ClickEvent) => {
//           try {
//             webview.WebStorage.getOriginUsage('file:///')
//               .then(usage => {
//                 console.info('usage: ' + usage);
//                 try {
//                   let backData: emitter.EventData = {
//                     data: {
//                       "STATUS": usage
//                     } as Record<String, undefined|null|Object>
//                   }
//                   let backEvent: emitter.InnerEvent = {
//                     eventId: 90206,
//                     priority: emitter.EventPriority.LOW
//                   }
//                   console.info("getOriginUsage to emit action state")
//                   emitter.emit(backEvent, backData)
//                 } catch (err:BusinessError) {
//                   console.info("getOriginUsage emit action state err: " + JSON.stringify((err as BusinessError).message))
//                 }
//               })
//               .catch((e: Error) => {
//                 console.info('error: ' + e);
//               })
//           } catch (error:BusinessError) {
//             console.error(`ErrorCode: ${error.code}, Message: ${(error as BusinessError).message}`);
//           }
//         })
//
//       Button('saveCookieAsync')
//         .onClick((e:ClickEvent) => {
//           try {
//             webview.WebCookieManager.saveCookieAsync()
//               .then(() => {
//                 console.log("saveCookieAsyncCallback success!");
//               })
//               .catch((error: Error) => {
//                 console.error("error: " + error);
//               });
//             try {
//               let backData: emitter.EventData = {
//                 data: {
//                   "STATUS": this.isLoad
//                 } as Record<String, undefined|null|Object>
//               }
//               let backEvent: emitter.InnerEvent = {
//                 eventId: 90207,
//                 priority: emitter.EventPriority.LOW
//               }
//               console.info("saveCookieAsync to emit action state")
//               emitter.emit(backEvent, backData)
//             } catch (err:BusinessError) {
//               console.info("saveCookieAsync emit action state err: " + JSON.stringify((err as BusinessError).message))
//             }
//
//           } catch (error:BusinessError) {
//             console.error(`ErrorCode: ${error.code},  Message: ${(error as BusinessError).message}`);
//           }
//         })
//
//       Button('saveWebArchive')
//         .onClick((e:ClickEvent) => {
//           try {
//             this.controller.storeWebArchive("/data/storage/el2/base/", true)
//               .then(filename => {
//                 if (filename != null) {
//                   console.info(`save web archive success: ${filename}`)
//                 }
//                 try {
//                   let backData: emitter.EventData = {
//                     data: {
//                       "STATUS": filename
//                     } as Record<String, undefined|null|Object>
//                   }
//                   let backEvent: emitter.InnerEvent = {
//                     eventId: 90208,
//                     priority: emitter.EventPriority.LOW
//                   }
//                   console.info("saveCookieAsync to emit action state")
//                   emitter.emit(backEvent, backData)
//                 } catch (err:BusinessError) {
//                   console.info("saveCookieAsync emit action state err: " + JSON.stringify((err as BusinessError).message))
//                 }
//
//
//               })
//               .catch((error: Error) => {
//                 console.log('error: ' + JSON.stringify(error));
//               })
//           } catch (error:BusinessError) {
//             console.error(`ErrorCode: ${error.code},  Message: ${(error as BusinessError).message}`);
//           }
//         })
//       Web({ src: 'www.baidu.com', controller: this.controller })
//         .javaScriptAccess(true)
//         .onPageEnd(e => {
//           try {
//             this.controller.runJavaScript('test()')
//               .then((result) => {
//                 console.log('result: ' + result);
//                 try {
//                   let backData: emitter.EventData = {
//                     data: {
//                       "STATUS": result
//                     } as Record<String, undefined|null|Object>
//                   }
//                   let backEvent: emitter.InnerEvent = {
//                     eventId: 90209,
//                     priority: emitter.EventPriority.LOW
//                   }
//                   console.info("runJavaScript to emit action state")
//                   emitter.emit(backEvent, backData)
//                 } catch (err:BusinessError) {
//                   console.info("runJavaScript emit action state err: " + JSON.stringify((err as BusinessError).message))
//                 }
//               })
//               .catch((error: Error) => {
//                 console.error("error: " + error);
//               })
//             console.info('url: ', e.url);
//           } catch (error:BusinessError) {
//             console.error(`Errorcode: ${error.code}, Message: ${(error as BusinessError).message}`);
//           }
//         })
//
//       Web({ src: 'www.baidu.com', controller: this.controller }).key('webattr')
//
//     }
//   }
// }