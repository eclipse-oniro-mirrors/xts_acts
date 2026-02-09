'use static';
/*
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
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Builder,
  NavPathStack,
  FontWeight,
  Navigation,
  NavDestination,
  NavigationMode,
  ButtonType,
  Color,
  DatePicker
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  Provide,
  PropRef,
  ObjectLink,
  Observed,
  Consume,
  StoragePropRef,
  StorageLink,
  LocalStorage,
  LocalStoragePropRef,
  LocalStorageLink,
  Observed
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
@Entry
@Component
struct PropString {
  @State stringA: string = "Hello"
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('PropString', router);
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }
  build() {
    Column() {
      Text('@PropRef 支持数据类型：string').fontSize(9).height('5%')
      Text('Father State: ' + this.stringA).width("100%").height('5%')
        .id("PropString_A")
        .onClick((e: ClickEvent) => {
          this.stringA = "Hi"
        })

      ChildPropString({ stringB: this.stringA })
    }.width('100%')

  }
}

@Component
struct ChildPropString {
  @PropRef stringB: string = '';

  build() {
    Column() {
      Text('@PropRef 单向的 内部修改不会改变父组件').fontSize(9).height('5%')
      Text('Child PropRef: ' + this.stringB).width("100%").height('5%')
        .id("ChildPropString_A")
        .onClick((e: ClickEvent) => {
          this.stringB = "World"
        })
    }.width('100%')

  }
}
