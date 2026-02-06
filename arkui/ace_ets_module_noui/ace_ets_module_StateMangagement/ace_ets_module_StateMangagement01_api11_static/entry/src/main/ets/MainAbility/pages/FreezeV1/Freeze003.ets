// 'use static';
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
// //003 测试自定义组件冻结V1  Navigation
// import prompt from '@system.prompt';
// import CommonFunc from '../../../MainAbility/common/Common';
// import {
//   Entry,
//   Column,
//   Component,
//   Button,
//   ClickEvent,
//   Text,
//   Row,
//   Scroll,
//   ButtonType,
//   Flex,
//   FlexDirection,
//   ItemAlign,
//   FlexAlign,
//   Alignment,
//   TextAlign,
//   TextOverflow,
//   FontWeight,NavPathInfo,
//   Profiler,ForEach,NavigationMode,
//   setAppBgColor,List,NavPathStack,Builder,Navigation,NavDestination,
//   FlexWrap,$r,Resource,IDataSource,DataChangeListener
// } from '@ohos.arkui.component'
// import {
//   State,
//   Link,
//   PropRef,Provide,Consume,Watch
// } from '@ohos.arkui.stateManagement'
// import { AppStorage } from '@ohos.arkui.stateManagement';
// import { UIContext, Router } from '@ohos.arkui.UIContext';
// import inspector from '@ohos.arkui.inspector';
// import CommonFunc from '../../../MainAbility/common/Common';
// import common from '@ohos.app.ability.common';
// import resourceManager from '@ohos.resourceManager';
//
// @Entry
// @Component
// struct MyNavigationTestStack {
//   @Provide({allowOverride :true}) pageInfo: NavPathStack = new NavPathStack();
//   @State @Watch('info') message: number = 0;
//   @State logNumber: number = 0;
//
//   info(propertyName: string) {
//   }
//
//   @Builder
//   PageMap(name: string) {
//     if (name === 'pageOne') {
//       pageOneStack({ message: this.message, logNumber: this.logNumber })
//     } else if (name === 'pageTwo') {
//       pageTwoStack({ message: this.message, logNumber: this.logNumber })
//     } else if (name === 'pageThree') {
//       pageThreeStack({ message: this.message, logNumber: this.logNumber })
//     }
//   }
//
//   build() {
//     Column() {
//       Button('change message')
//         .id('changeMessage')
//         .onClick(() => {
//           this.message++;
//         })
//         .height('5%')
//       Navigation(this.pageInfo) {
//         Column() {
//           Button('Next Page', { stateEffect: true, type: ButtonType.Capsule })
//             .width('80%')
//             .height('3%')
//
//             .onClick(() => {
//               this.pageInfo.pushPath(new NavPathInfo('pageOne',undefined)); //将name指定的NavDestination页面信息入栈
//             })
//             .id('NextPage0')
//         }
//       }.title('NavIndex')
//       .navDestination(this.PageMap)
//       .mode(NavigationMode.Stack)
//     }
//   }
// }
//
// @Component
// struct pageOneStack {
//   @Consume('pageInfo') pageInfo: NavPathStack;
//   @State index: number = 1;
//   @Link message: number;
//   @Link logNumber: number;
//
//   build() {
//     NavDestination() {
//       Column() {
//         NavigationContentMsgStack({ message: this.message, index: this.index, logNumber: this.logNumber })
//         Text('cur stack size:' + `${this.pageInfo.size()}`)
//           .fontSize(9)
//           .fontWeight(FontWeight.Bold)
//         Button('Next Page', { stateEffect: true, type: ButtonType.Capsule })
//           .width('80%')
//           .height('3%')
//
//           .onClick(() => {
//             this.pageInfo.pushPathByName('pageTwo', null);
//           })
//           .id('NextPage1')
//         Button('Back Page', { stateEffect: true, type: ButtonType.Capsule })
//           .width('80%')
//           .height('3%')
//
//           .onClick(() => {
//             this.pageInfo.pop();
//           })
//           .id('BackPage1')
//       }.width('100%').height('100%')
//     }.title('pageOne')
//     .onBackPressed(() => {
//       this.pageInfo.pop();
//       return true;
//     })
//   }
// }
//
// @Component
// struct pageTwoStack {
//   @Consume('pageInfo') pageInfo: NavPathStack;
//   @State index: number = 2;
//   @Link message: number;
//   @Link logNumber: number;
//
//   build() {
//     NavDestination() {
//       Column() {
//         NavigationContentMsgStack({ message: this.message, index: this.index, logNumber: this.logNumber })
//         Text('cur stack size:' + `${this.pageInfo.size()}`)
//           .fontSize(9)
//           .fontWeight(FontWeight.Bold)
//         Button('Next Page', { stateEffect: true, type: ButtonType.Capsule })
//           .width('80%')
//           .height('3%')
//
//           .onClick(() => {
//             this.pageInfo.pushPathByName('pageThree', null);
//           })
//           .id('NextPage2')
//         Button('Back Page', { stateEffect: true, type: ButtonType.Capsule })
//           .width('80%')
//           .height('3%')
//
//           .onClick(() => {
//             this.pageInfo.pop();
//           })
//           .id('BackPage2')
//       }.width('100%').height('100%')
//     }.title('pageTwo')
//     .onBackPressed(() => {
//       this.pageInfo.pop();
//       return true;
//     })
//   }
// }
//
// @Component
// struct pageThreeStack {
//   @Consume('pageInfo') pageInfo: NavPathStack;
//   @State index: number = 3;
//   @Link message: number;
//   @Link logNumber: number;
//
//   build() {
//     NavDestination() {
//       Column() {
//         NavigationContentMsgStack({ message: this.message, index: this.index, logNumber: this.logNumber })
//         Text('cur stack size:' + `${this.pageInfo.size()}`)
//           .fontSize(9)
//           .fontWeight(FontWeight.Bold)
//         Button('Next Page', { stateEffect: true, type: ButtonType.Capsule })
//           .width('80%')
//           .height('3%')
//
//           .onClick(() => {
//             this.pageInfo.pushPathByName('pageOne', null);
//           })
//           .id('NextPage3')
//         Button('Back Page', { stateEffect: true, type: ButtonType.Capsule })
//           .width('80%')
//           .height('3%')
//
//           .onClick(() => {
//             this.pageInfo.pop();
//           })
//           .id('BackPage3')
//       }.width('100%').height('100%')
//     }.title('pageThree')
//     .onBackPressed(() => {
//       this.pageInfo.pop();
//       return true;
//     })
//   }
// }
//
// // @Component({ freezeWhenInactive: true })
// @Component
// struct NavigationContentMsgStack {
//   @Link @Watch('info') message: number;
//   @Link index: number;
//   @Link logNumber: number;
//
//   info(propertyName: string) {
//     this.logNumber++;
//     prompt.showToast({
//       message: `NavigationContent message:${this.message} index:${this.index} logNumber:${this.logNumber}`,
//       duration: 500
//     })
//   }
//
//   build() {
//     Column() {
//       Text('msg:' + `${this.message}`)
//         .fontSize(9)
//         .fontWeight(FontWeight.Bold)
//       Text('index:' + `${this.index}`)
//         .fontSize(9)
//         .fontWeight(FontWeight.Bold)
//       Text('log number:' + `${this.logNumber}`)
//         .fontSize(9)
//         .fontWeight(FontWeight.Bold)
//     }
//   }
// }