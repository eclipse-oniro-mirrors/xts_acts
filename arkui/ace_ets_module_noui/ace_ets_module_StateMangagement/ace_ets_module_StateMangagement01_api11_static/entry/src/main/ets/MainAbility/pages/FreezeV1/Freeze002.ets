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
// //002 测试自定义组件冻结V1  LazyForEach
//
// // Basic implementation of IDataSource to handle data listener
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
//   FontWeight,ListItem,
//   Profiler,ForEach,LazyForEach,
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
// import { Level } from '../../../../../hypium/index';
//
//
// class BasicDataSource implements IDataSource<string> {
//   private listeners: DataChangeListener[] = [];
//   private originDataArray: string[] = [];
//
//   public totalCount(): int {
//     return 0;
//   }
//
//   public getData(index: int): string {
//     return this.originDataArray[index as int];
//   }
//
//   // 该方法为框架侧调用，为LazyForEach组件向其数据源处添加listener监听
//   registerDataChangeListener(listener: DataChangeListener): void {
//     if (this.listeners.indexOf(listener) < 0) {
//       console.info('add listener');
//       this.listeners.push(listener);
//     }
//   }
//
//   // 该方法为框架侧调用，为对应的LazyForEach组件在数据源处去除listener监听
//   unregisterDataChangeListener(listener: DataChangeListener): void {
//     const pos = this.listeners.indexOf(listener);
//     if (pos >= 0) {
//       console.info('remove listener');
//       this.listeners.splice(pos, 1);
//     }
//   }
//
//   // 通知LazyForEach组件需要重载所有子组件
//   notifyDataReload(): void {
//     this.listeners.forEach(listener => {
//       listener.onDataReloaded();
//     })
//   }
//
//   // 通知LazyForEach组件需要在index对应索引处添加子组件
//   notifyDataAdd(index: int): void {
//     this.listeners.forEach(listener => {
//       listener.onDataAdd(index);
//     })
//   }
//
//   // 通知LazyForEach组件在index对应索引处数据有变化，需要重建该子组件
//   notifyDataChange(index: int): void {
//     this.listeners.forEach(listener => {
//       listener.onDataChange(index);
//     })
//   }
//
//   // 通知LazyForEach组件需要在index对应索引处删除该子组件
//   notifyDataDelete(index: int): void {
//     this.listeners.forEach(listener => {
//       listener.onDataDelete(index);
//     })
//   }
// }
//
// class MyDataSource extends BasicDataSource {
//   private dataArray: string[] = [];
//
//   public totalCount(): int {
//     return this.dataArray.length;
//   }
//
//   public getData(index: int): string {
//     return this.dataArray[index as  int ];
//   }
//
//   public addData(index: int, data: string): void {
//     this.dataArray.splice(index, 0, data);
//     this.notifyDataAdd(index);
//   }
//
//   public pushData(data: string): void {
//     this.dataArray.push(data);
//     this.notifyDataAdd(this.dataArray.length - 1);
//   }
// }
//
// @Entry
// @Component
// struct LForEachTest {
//   private data: MyDataSource = new MyDataSource();
//   @State @Watch('onMessageUpdated') message: number = 0;
//
//   onMessageUpdated(propertyName: string) {
//     console.info(`LazyforEach message callback func ${this.message}`)
//   }
//
//   aboutToAppear() {
//     for (let i = 0; i <= 20; i++) {
//       this.data.pushData(`Hello ${i}`)
//     }
//   }
//
//   build() {
//     Column() {
//       Button('change message').onClick(() => {
//         this.message++
//       })
//         .key('changeMessage')
//         .height('5%')
//       List() {
//         LazyForEach(this.data, (item: string) => {
//           ListItem() {
//             FreezeChild({ message: this.message, index: item })
//           }
//         }, (item: string) => item)
//       }.cachedCount(5).height(500)
//       .id('List')
//     }
//
//   }
// }
//
// // @Component({ freezeWhenInactive: true })
// @Component
// struct FreezeChild {
//   @Link @Watch('onMessageUpdated') message: number;
//   private index: string = '';
//
//   aboutToAppear() {
//     console.info(`FreezeChild aboutToAppear index: ${this.index}`)
//   }
//
//   onMessageUpdated(propertyName: string) {
//     prompt.showToast({
//       message: `FreezeChild message callback func ${this.message}, index: ${this.index}`,
//       duration: 500
//     })
//   }
//
//   build() {
//     Text('message' + `${this.message}, index: ${this.index}`)
//       .width('90%')
//       // .height(160) 原本就注释
//       .height('5%')
//       .backgroundColor(0xAFEEEE)
//       .textAlign(TextAlign.Center)
//       .fontSize(9)
//       .fontWeight(FontWeight.Bold)
//   }
// }