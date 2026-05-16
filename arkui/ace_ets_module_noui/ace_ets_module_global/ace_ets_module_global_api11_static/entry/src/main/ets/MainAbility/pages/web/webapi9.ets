'use static';
// /**
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
// import emitter from '@ohos.events.emitter';
// import  AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
// import { Hypium } from '../../../../../hypium';
// import testsuite from '../../../../src/test/List.test';
// import webview from '@ohos.web.webview';
// import {
//   Entry, Component, AlertDialogParamWithButtons,
//   Column, ColumnOptions, List, ListItem, ListOptions, WebResourceResponse, MessageLevel,
//   Flex, FlexDirection, ItemAlign, FlexAlign, FullScreenExitHandler, ConsoleMessage,
//   Text, TextAlign, Button, FontWeight, ClickEvent, Margin, Color, Row, Web,
// } from '@ohos.arkui.component'
// import { State } from '@ohos.arkui.stateManagement';
// import { UIContext } from '@ohos.arkui.UIContext';
// const uiContext = new UIContext();
//
// interface MyTestObject {
//   test: (data1: string, data2: string, data3: string) => string;
//   toStr: () => void;
// }
//
// @Entry
// @Component
// struct Index {   web相关，不用管
//   @State isVoid: boolean = true;
//   handler: FullScreenExitHandler|null = null;
//   @State atio: Int = 150;
//   @State defaultSize: number = 13;
//   @State defaultFixed: Int = 8;
//   @State minLogicalSize: number = 1;
//   @State netWorkStatus: boolean = false;
//   ports: Array<webview.WebMessagePort> = new Array<webview.WebMessagePort>();
//   testObj:MyTestObject = {
//     test: (data1: string, data2: string, data3: string):string => {
//       console.log("data1:" + data1);
//       console.log("data2:" + data2);
//       console.log("data3:" + data3);
//       return "AceString";
//     },
//     toStr: () => {
//       console.log('toString' + "interface instead.");
//     }
//   } as MyTestObject
//   // message = new ConsoleMessage("1", "12", 23, MessageLevel.Debug);  // TypeError1 Expected 0 arguments, got 4.   No matching construct signature for arkui.component.web.ConsoleMessage("1", "12", Int, MessageLevel)
//   message = new ConsoleMessage();
//   controller: webview.WebviewController = new webview.WebviewController();
//   controllerTwo: webview.WebviewController = new webview.WebviewController();
//   @State str: string = "emitStoreWebArchive"
//
//   onPageShow() {
//     let valueChangeEvent: emitter.InnerEvent = {
//       eventId: 10,
//       priority: emitter.EventPriority.LOW
//     }
//     emitter.on(valueChangeEvent, this.valueChangeCallBack)
//   }
//
//   private valueChangeCallBack:(p1:emitter.EventData)=>void = (eventData: emitter.EventData) => {
//     console.info("web page valueChangeCallBack");
//     if (eventData != null) {
//       console.info("valueChangeCallBack:" + JSON.stringify(eventData));
//       if ((eventData.data as ESObject).getProperty('ACTION') != null) {
//         this.str = (eventData.data as ESObject).getProperty('ACTION').toString() as String;
//       }
//     }
//   }
//
//
//   aboutToAppear() {
//     let abilityDelegator  = AbilityDelegatorRegistry.getAbilityDelegator()
//     let abilityDelegatorArguments  = AbilityDelegatorRegistry.getArguments()
//     console.info('start run testcase!!!')
//     Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
//   }
//
//   build() {
//     Column() {
//       // add api9
//       Web({ src: 'www.baidu.com', controller: this.controller })
//         .multiWindowAccess(true).key('multiwindow')
//         .onWindowExit(() => {
//           console.log("onWindowExit...");
//           setTimeout(()=>{
//             // Utils.emitEvent(this.isVoid,800)
//           },1000)
//         }).
//       onWindowNew((event) => {
//         console.log("onWindowNew...");
//         let popController: webview.WebviewController = new webview.WebviewController();
//         event.handler.setWebController(popController);
//         setTimeout(()=>{
//           // Utils.emitEvent(this.isVoid,801)
//         },1000)
//
//       }).onFullScreenEnter((event) => {
//         console.log("onFullScreenEnter...");
//         this.handler = event.handler;
//         setTimeout(()=>{
//           // Utils.emitEvent(this.isVoid,802)
//         },1000)
//       }).onFullScreenExit(() => {
//         console.info("onFullScreenExit...");
//         this.handler!.exitFullScreen();
//       })
//
//       Web({ src: 'www.baidu.com', controller: this.controller })
//         .key('web2')
//         .webStandardFont("HarmonyOS-Sans-Condensed")
//         // .webSeriFont("HarmonyOS-Sans-Condensed")  // TypeError2 Property 'webSeriFont' does not exist on type 'WebAttribute'
//         // .webSanSeriFont("HarmonyOS-Sans-Condensed")
//         .webFixedFont("HarmonyOS-Sans-Condensed")
//         .webFantasyFont("HarmonyOS-Sans-Condensed")
//         .webCursiveFont("HarmonyOS-Sans-Condensed")
//         .defaultFixedFontSize(this.defaultFixed)
//         // .defaultFontSize(this.defaultFontSize) // TypeError3 Property 'defaultFontSize' does not exist on type 'Index'
//         // .minLogicalSize(this.minLogicalSize)  // Property 'minLogicalSize' does not exist on type 'WebAttribute'
//         .blockNetwork(false)
//         // .defaultFontSize()
//         .onSslErrorEventReceive((event) => {
//           uiContext.showAlertDialog({
//             title: 'onSslErrorEventReceive',
//             message: 'text',
//             primaryButton: {
//               value: 'confirm',
//               action: () => {
//                 event.handler.handleConfirm();
//               }
//             },
//             secondaryButton: {
//               value: 'cancel',
//               action: () => {
//                 event.handler.handleCancel();
//               }
//             },
//             cancel: () => {
//               event.handler.handleCancel();
//             }
//           } as AlertDialogParamWithButtons)
//           setTimeout(()=>{
//             // Utils.emitEvent(this.isVoid,803)
//           },1000)
//           // return true;  // TypeError4 Unexpected return value, enclosing method return type is void.
//         })
//         .textZoomRatio(this.atio)
//         // .tableData(true)  // TypeError5 Property 'tableData' does not exist on type 'WebAttribute'
//         .javaScriptProxy({
//           jsObject: this.testObj,
//           name: "objName",
//           methodList: ["test", "toString"],
//           controller: this.controller,
//         }).onConsole((event) => {
//         console.log('getMessage:' + event.message.getMessage());
//         console.log('getSourceId:' + event.message.getSourceId());
//         console.log('getLineNumber:' + event.message.getLineNumber());
//         console.log('getMessageLevel:' + event.message.getMessageLevel());
//         return false;
//       })
//         .onErrorReceive((event)=>{
//           event.request.getRequestMethod();
//         })
//         // .onTouchIconUrlRecevied((event)=>{ // TypeError6 Property 'onTouchIconUrlRecevied' does not exist on type 'WebAttribute'
//         //   event.url;
//         // })
//         .onFaviconReceived((event)=>{
//           event.favicon;
//         })
//         .onPageVisible((event)=>{
//           event.url
//         })
//         .onDataResubmitted((event)=>{
//           event.handler.resend
//         })
//         .onInterceptKeyEvent((e)=>{
//           e.keyCode;
//           return false;
//         })
//
//       Button("web click").key('webcomponentapi9').onClick((e:ClickEvent):void=>{
//         console.info("key==>"+this.str)
//         switch(this.str){
//           // add
//           case "emitGeturl":
//             let url = this.controllerTwo.getUrl();
//             // Utils.emitEvent(url,810);
//             break;
//           case "emitclearClientAuthenticationCache":
//             this.controllerTwo.clearClientAuthenticationCache();
//             // Utils.emitEvent(this.isVoid,811);
//             break;
//           case "emitclearSslCache":
//             this.controllerTwo.clearSslCache();
//             // Utils.emitEvent(this.isVoid,812);
//             break;
//           case "emitsearchNext":
//             this.controllerTwo.searchNext(true);
//             // Utils.emitEvent(this.isVoid,813);
//             break;
//           case "emitclearMatches":
//             this.controllerTwo.clearMatches();
//             // Utils.emitEvent(this.isVoid,814);
//             break;
//           case "emitDefaultUserAgent":
//             let usrAgent = webview.WebviewController.getDefaultUserAgent();
//             // Utils.emitEvent(usrAgent,815);
//             break;
//           case "emitgetWebId":
//             let webId = this.controllerTwo.getWebId();
//             // Utils.emitEvent(webId,816);
//             break;
//           case "emitpostMessage":
//             let sendPortArray:Array<webview.WebMessagePort> = [this.ports[1]!] as Array<webview.WebMessagePort>;
//             // let msgEvent = new WebMessageEvent();  // TypeError7 SDK没有
//             // msgEvent.setData("__init_port__");
//             // msgEvent.setPorts(sendPortArray);
//             // this.controller.postMessage({message: msgEvent, url: "*"});
//             break;
//           case "emitcreateWebMessagePorts":
//             this.ports = this.controller.createWebMessagePorts();
//             console.info("createWebMessagePorts size:" + this.ports!.length)
//             // Utils.emitEvent(this.ports!.length,817);
//             break;
//           case "emitdeleteSessionCookie":
//             webview.WebCookieManager.clearSessionCookieSync();  // deleteSessionCookie被平替
//             // Utils.emitEvent(this.isVoid,818);
//             break;
//           case "emitdeleteExpiredCookie":
//             // webview.WebCookieManager.deleteExpiredCookie();   // TypeError8 SDK没有 deleteExpiredCookie
//             // Utils.emitEvent(this.isVoid,810);
//             break;
//           case "emitexistCookie":
//             let vaue = webview.WebCookieManager.existCookie();
//             // Utils.emitEvent(vaue,820);
//             break;
//           case "emitgetCookie":
//             let value = webview.WebCookieManager.fetchCookieSync('www.baidu.com'); // getCookie被平替
//             console.info("value: " + value);
//             // Utils.emitEvent(value,821);
//             break;
//
//           case "emitsetCookie":
//             console.info("value: ");
//             webview.WebCookieManager.configCookieSync('www.baidu.com','a=b'); // setCookie被平替
//             // Utils.emitEvent(value02,822);
//             break;
//
//           case "emitsaveCookie":
//             webview.WebCookieManager.saveCookieAsync(); // saveCookie被平替
//             // Utils.emitEvent(this.isVoid,823);
//             break;
//           case "emitputAcceptFileURICookieEnabled":
//             // webview.WebCookieManager.putAcceptFileURICookieEnabled(false)   //TypeError9 SDK 没有 putAcceptFileURICookieEnabled
//             // Utils.emitEvent(this.isVoid,824);
//             break;
//           case "emitputAcceptThirdPartyCookieEnabled":
//             webview.WebCookieManager.putAcceptThirdPartyCookieEnabled(false)
//             // Utils.emitEvent(this.isVoid,825);
//             break;
//
//           case "emitisFileURICookieAllowed":
//             // let isAll = webview.WebCookieManager.isFileURICookieAllowed();  //TypeError10  SDK 没有 isFileURICookieAllowed
//             // Utils.emitEvent(isAll,826);
//             break;
//           case "emitisThirdPartyCookieAllowed":
//             let isThirdParty = webview.WebCookieManager.isThirdPartyCookieAllowed();
//             // Utils.emitEvent(isThirdParty,827);
//             break;
//           case "hasImage":
//             let flag = true
//             try{
//               this.controllerTwo.hasImage((err,data)=>{
//                 if(err) {
//                   console.info("has ImageError" + JSON.stringify(err))
//                   return;
//                 }
//                 // Utils.emitEvent(flag,828);
//               });
//             }catch(error:Error){
//               console.error(`ErrorCode:${error.code},Message:${error.message}`);
//             }
//             break;
//           case "hasImageTwo":
//             // let flag = true  //TypeError11 Variable 'flag' has already been declared.
//             try{
//               this.controllerTwo.hasImage().then((data)=>{
//                 // Utils.emitEvent(flag,829);
//               }).catch((error:Error)=>{
//                 console.error("error" +error)
//               })
//
//             }catch(error:Error){
//               console.error(`ErrorCode:${error.code},Message:${error.message}`);
//             }
//             break;
//           case "setNetworkAvailable":
//             this.controllerTwo.setNetworkAvailable(this.netWorkStatus);
//             // Utils.emitEvent(this.netWorkStatus,830);
//             break;
//           case "getFavicon":
//             let icon = "baidu"
//             this.controllerTwo.getFavicon();
//             // Utils.emitEvent(this.icon,831);
//             break;
//           case "getOriginalUrl":
//             this.controllerTwo.getOriginalUrl();
//             // Utils.emitEvent(this.netWorkStatus,832);
//             break;
//           case "history":
//             let res = 1;
//             let historyList = this.controllerTwo.getBackForwardEntries();
//             webview.WebviewController.initializeWebEngine();
//             // let historyItem = historyList.getItemIndex(this.res);  //TypeError12   Property 'getItemIndex' does not exist on type 'BackForwardList'
//             // historyItem.historyRawUrl
//             // Utils.emitEvent(this.netWorkStatus,833);
//             break;
//           case "pageUp":
//             // let res = true   // TypeError13 Variable 'res' has already been declared. [webapi9.ets:332:17]
//             this.controllerTwo.pageUp(true);
//             this.controllerTwo.pageDown(true);
//             this.controllerTwo.removeCache(true);
//             // Utils.emitEvent(this.res,834);
//             break;
//
//           default:
//             console.info("can not match case")
//         }
//       })
//     }
//
//   }
// }
