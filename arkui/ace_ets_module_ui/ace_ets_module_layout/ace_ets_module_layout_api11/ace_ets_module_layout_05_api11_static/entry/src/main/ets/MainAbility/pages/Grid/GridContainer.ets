//'use static';
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
//
// import { MessageManager, Callback, Message } from './../../common/MessageManager';
// import {
//   Entry,
//   Text,
//   Column,
//   Component,
//   Button,
//   ClickEvent,
//   Scroller,
//   Scroll,
//   ForEach,
//   Search,
//   Color,
//   EdgeEffect,
//   ColumnOptions,
//   GridRow,
//   GutterOption,
//   BreakPoints,
//   GridRowColumnOption,
//   GridRowOptions,
//   GridRowDirection,
//   GridCol,
//   GridRowSizeOption,
//   BreakpointsReference,
//   Row,
//   GridColOptions,
//   Margin,
//   GridColColumnOption,
//   HorizontalAlign,
//   FlexDirection,
//   ItemAlign,
//   FlexAlign,
//   FontWeight,
//   TextAlign,
//   Flex
// } from '@ohos.arkui.component'
// import { State, AppStorage } from '@ohos.arkui.stateManagement'
//
// @Entry
// @Component
// struct gridContainer {
//   @State sizeType: SizeType = SizeType.XS
//   @State active: boolean = false
//   private content: string = "GridContainer Page"
//
//   onPageShow() {
//     console.info('GridContainer page show called');
//   }
//
//   onBuildDone() {
//     console.info('GridContainer page build done called');
//   }
//
//   build() {
//     Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
//       Text(`${this.content}`)
//         .fontSize(50)
//         .fontWeight(FontWeight.Bold)
//       Scroll() {
//         Column({ space: 5 } as ColumnOptions) {
//           // GridContainer({ columns: 12, sizeType: this.sizeType, gutter: 10, margin: 20 }) {
//           GridCol({ span: { xs: 12 }, offset: 0, order: 0 }) {
//             Row() {
//               Text('1')
//                 .useSizeType({
//                   xs: { span: 6, offset: 0 },
//                   sm: { span: 2, offset: 0 },
//                   md: { span: 2, offset: 0 },
//                   lg: { span: 2, offset: 0 }
//                 })
//                 .height(50).backgroundColor(0x4682B4).textAlign(TextAlign.Center)
//               Text('2').gridSpan(2)
//
//                 .height(50).backgroundColor(0x00BFFF).textAlign(TextAlign.Center)
//               Text('3').gridOffset(3)
//
//                 .height(50).backgroundColor(0x4682B4).textAlign(TextAlign.Center)
//             }
//           }.key('gridContainer')
//           .width('90%')
//           .alignItems(HorizontalAlign.Start)
//           .margin(20)
//
//           Text('Click Simulate to change the device width').fontSize(9).width('90%').fontColor(0xCCCCCC)
//           Row() {
//             Button('XS')
//               .onClick((e: ClickEvent) => {
//                 this.sizeType = SizeType.XS
//               }).backgroundColor(0x317aff)
//             Button('SM')
//               .onClick((e: ClickEvent) => {
//                 this.sizeType = SizeType.SM
//               }).backgroundColor(0x317aff)
//             Button('MD')
//               .onClick((e: ClickEvent) => {
//                 this.sizeType = SizeType.MD
//               }).backgroundColor(0x317aff)
//             Button('LG')
//               .onClick((e: ClickEvent) => {
//                 this.sizeType = SizeType.LG
//               }).backgroundColor(0x317aff)
//           }
//
//           // GridContainer({
//           //   columns: "auto",
//           //   sizeType: SizeType.MD,
//           //   gutter: '10',
//           //   margin: '20'
//           // }) {
//           GridCol({ span: 1, offset: 0, order: 1 }) {
//             Row() {
//               Text('1')
//                 .useSizeType({
//                   xs: { span: 6, offset: 0 },
//                   sm: { span: 2, offset: 0 },
//                   md: { span: 2, offset: 0 },
//                   lg: { span: 2, offset: 0 }
//                 })
//                 .height(50).backgroundColor(0x4682B4).textAlign(TextAlign.Center)
//               Text('2').gridSpan(2)
//
//                 .height(50).backgroundColor(0x00BFFF).textAlign(TextAlign.Center)
//               Text('3').gridOffset(3)
//
//                 .height(50).backgroundColor(0x4682B4).textAlign(TextAlign.Center)
//             }
//           }.key('gridContainer1')
//           .width('90%')
//           .alignItems(HorizontalAlign.Center)
//           .margin(20)
//
//           // GridContainer({
//           //   columns: 12,
//           //   sizeType: SizeType.SM,
//           //   gutter: 10,
//           //   margin: 20
//           // }) {
//           GridCol({ span: { sm: 12 }, offset: 0, order: 2 }) {
//             Row() {
//               Text('1')
//                 .useSizeType({
//                   xs: { span: 6, offset: 0 },
//                   sm: { span: 2, offset: 0 },
//                   md: { span: 2, offset: 0 },
//                   lg: { span: 2, offset: 0 }
//                 })
//                 .height(50).backgroundColor(0x4682B4).textAlign(TextAlign.Center)
//               Text('2').gridSpan(2)
//
//                 .height(50).backgroundColor(0x00BFFF).textAlign(TextAlign.Center)
//               Text('3').gridOffset(3)
//
//                 .height(50).backgroundColor(0x4682B4).textAlign(TextAlign.Center)
//             }
//           }.key('gridContainer2')
//           .width('90%')
//           .alignItems(HorizontalAlign.End)
//           .margin(20)
//
//           // GridContainer({
//           //   columns: 12,
//           //   sizeType: SizeType.LG,
//           //   gutter: 10,
//           //   margin: 20
//           // }) {
//           GridCol({ span: { lg: 12 }, offset: 0, order: 3 }) {
//             Row() {
//               Text('1')
//                 .useSizeType({
//                   xs: { span: 6, offset: 0 },
//                   sm: { span: 2, offset: 0 },
//                   md: { span: 2, offset: 0 },
//                   lg: { span: 2, offset: 0 }
//                 })
//                 .height(50).backgroundColor(0x4682B4).textAlign(TextAlign.Center)
//               Text('2').gridSpan(2)
//
//                 .height(50).backgroundColor(0x00BFFF).textAlign(TextAlign.Center)
//               Text('3').gridOffset(3)
//
//                 .height(50).backgroundColor(0x4682B4).textAlign(TextAlign.Center)
//             }
//           }.key('gridContainer3')
//           .width('90%')
//           .alignItems(HorizontalAlign.End)
//           .margin(20)
//
//           // GridContainer({
//           //   columns: 12,
//           //   sizeType: SizeType.Auto,
//           //   gutter: 10,
//           //   margin: 20
//           // }) {
//           GridCol({ span: 12, offset: 0, order: 4 }) {
//             Row() {
//               Text('1')
//                 .useSizeType({
//                   xs: { span: 6, offset: 0 },
//                   sm: { span: 2, offset: 0 },
//                   md: { span: 2, offset: 0 },
//                   lg: { span: 2, offset: 0 }
//                 })
//                 .height(50).backgroundColor(0x4682B4).textAlign(TextAlign.Center)
//               Text('2').gridSpan(2)
//
//                 .height(50).backgroundColor(0x00BFFF).textAlign(TextAlign.Center)
//               Text('3').gridOffset(3)
//
//                 .height(50).backgroundColor(0x4682B4).textAlign(TextAlign.Center)
//             }
//           }.key('gridContainer4')
//           .width('90%')
//           .alignItems(HorizontalAlign.End)
//           .margin(20)
//
//         }.width('100%').margin({ top: 5 } as Margin)
//       }
//     }
//     .key('flex')
//     .width('100%')
//     .height('100%')
//   }
// }
