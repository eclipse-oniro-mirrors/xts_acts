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
// import webview from '@ohos.web.webview';
// import testsuite from '../../../../src/test/List.test';
// import {
//   Entry, Component, Web,
//   Column, ColumnOptions, List, ListItem, ListOptions, AlertDialogParamWithConfirm,AlertDialogParamWithButtons,
//   Flex, FlexDirection, ItemAlign, FlexAlign, WebContextMenuResult, FileSelectorResult, FileSelectorParam,
//   Text, TextAlign, Button, FontWeight, ClickEvent, Margin, Color, Row,
// } from '@ohos.arkui.component'
// import { State } from '@ohos.arkui.stateManagement';
// import { UIContext } from '@ohos.arkui.UIContext';
// const uiContext = new UIContext();
//
// @Entry
// @Component
// struct Index {      //web相关，不用管
//   controller: webview.WebviewController = new webview.WebviewController();
//   @State isSuccess: Boolean = false;
//   @State str: string = "emitUserAgent"
//   webConTextMenuResult: WebContextMenuResult = new WebContextMenuResult();
//   controllerWeb: webview.WebviewController = new webview.WebviewController();
//   fileSelector: FileSelectorResult = new FileSelectorResult();
//   fileSelectorParam: FileSelectorParam = new FileSelectorParam();
//
//   onPageShow() {
//     let valueChangeEvent: emitter.InnerEvent = {
//       eventId: 10,
//       priority: emitter.EventPriority.LOW
//     }
//     emitter.on(valueChangeEvent, this.valueChangeCallBack)
//   }
//
//   private valueChangeCallBack:(p1:emitter.EventData)=>void = (eventData: emitter.EventData):void => {
//     console.info("web page valueChangeCallBack");
//     if (eventData != null) {
//       console.info("valueChangeCallBack:" + JSON.stringify(eventData));
//       if ((eventData.data as ESObject).getProperty('ACTION') != null) {
//         this.str = (eventData.data as ESObject).getProperty('ACTION').toString() as string;
//       }
//     }
//   }
//
//   aboutToAppear() {
//     let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
//     let abilityDelegatorArguments  = AbilityDelegatorRegistry.getArguments()
//     console.info('start run testcase!!!')
//     Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
//   }
//
//   build() {
//     Column() {
//       Web({ src: 'www.baidu.com', controller: this.controller })
//         .onContextMenuShow((event) => {
//           console.info("x coord = " + event.param.x());
//           console.info("x coord = " + event.param.y());
//           console.info("link url = " + event.param.getLinkUrl());
//           console.info("source url = " + event.param.getSourceUrl());
//           console.info("source url = " + event.param.getUnfilteredLinkUrl());
//           console.info("source url = " + event.param.existsImageContents());
//           event.result.copyImage()
//           event.result.closeContextMenu()
//           this.isSuccess = true;
//           // Utils.emitEvent(this.isSuccess, 1101)
//           return true;
//         }).onWindowNew((event) => {
//         console.log("onWindowNew...");
//         let popController: webview.WebviewController = new webview.WebviewController();
//         event.handler.setWebController(popController);
//         this.isSuccess = true;
//         // Utils.emitEvent(this.isSuccess, 1102)
//       }).onShowFileSelector((event) => {
//         uiContext.showAlertDialog({
//           title: event.fileSelector.getTitle(),
//           message: 'isCapture:' + event.fileSelector.isCapture() + " mode:" + event.fileSelector.getMode() + 'acceptType:' + event.fileSelector.getAcceptType(),
//           confirm: {
//             value: 'upload',
//             action: () => {
//               let fileList: Array<string> = [
//                 '/data/storage/el2/base/test',
//               ]
//               event.result.handleFileList(fileList)
//             }
//           },
//           cancel: () => {
//             let fileList: Array<string> = []
//             event.result.handleFileList(fileList)
//           }
//         } as AlertDialogParamWithConfirm)
//         return true;
//       }).onAlert((event) => {
//         uiContext.showAlertDialog({
//           title: 'onAlert',
//           message: 'text',
//           primaryButton: {
//             value: 'cancel',
//             action: () => {
//               event.result.handleCancel()
//             }
//           },
//           secondaryButton: {
//             value: 'ok',
//             action: () => {
//               event.result.handlePromptConfirm("已經確認")
//             }
//           },
//           cancel: () => {
//             event.result.handleCancel()
//           }
//
//         } as AlertDialogParamWithButtons)
//         return true;
//       })
//
//       Web({ src: 'www.baidu.com', controller: this.controller })
//         .onShowFileSelector((event) => {
//           uiContext.showAlertDialog({
//             title: event.fileSelector.getTitle(),
//             message: 'isCapture:' + event.fileSelector.isCapture() + " mode:" + event.fileSelector.getMode() + 'acceptType:' + event.fileSelector.getAcceptType(),
//             confirm: {
//               value: 'upload',
//               action: () => {
//                 let fileList: Array<string> = [
//                   '/data/storage/el2/base/test',
//                 ]
//                 event.result.handleFileList(fileList)
//               }
//             },
//             cancel: () => {
//               let fileList: Array<string> = []
//               console.info("this is Capture " + event.fileSelector.isCapture());
//               console.info("this is getTitle" + event.fileSelector.getTitle());
//               console.info("this is getMode" + event.fileSelector.getMode());
//               console.info("this is getAcceptType" + event.fileSelector.getAcceptType().length);
//             }
//           } as AlertDialogParamWithConfirm)
//           return true;
//         })
//
//       //controller: webview.WebviewController = new webview.WebviewController();
//       Row() {
//         Button("webTest").key('web2').onClick((e:ClickEvent):void => {
//           console.info("key==>" + this.str);
//           switch (this.str) {
//             // add
//             case "emitHitTestValue":
//               // let hitValue = this.controller.HitTestValue(); // SDK 有 HitTestValue 但是报错：Property 'HitTestValue' does not exist on type 'WebviewController'
//               // console.info("hitType: " + hitValue.getType());
//               // console.info("extra: " + hitValue.getExtra());
//             // Utils.emitEvent(hitValue.getType(), 1103);
//             default:
//               console.info("can not match case")
//           }
//
//         })
//       }
//
//     }
//   }
// }
