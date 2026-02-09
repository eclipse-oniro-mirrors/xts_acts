'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
  Observed,
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage,SubscribedAbstractProperty } from '@ohos.arkui.stateManagement';
import hilog from "@ohos.hilog";
AppStorage.clear()
AppStorage.setOrCreate('PropA', 122);
let storage37 = new LocalStorage();
let prop: SubscribedAbstractProperty<number> = AppStorage.link('PropA') as SubscribedAbstractProperty<number>
let prop137: SubscribedAbstractProperty<number> = AppStorage.link('sss') as SubscribedAbstractProperty<number>

// @Entry(storage37)
@Entry
@Component
struct LocalStorage37 {
  //@LocalStorageLink变量装饰器与LocalStorage中的'PropA'属性建立双向绑定
  @StoragePropRef('PropA') storLink: number = 1;
  @StoragePropRef('PropA1') storLink1: number = 47;
  @State link1Date: number | undefined = 0;
  @State link1Date2: number | undefined = 0;
 aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('Storage37', router);
    } catch (error) {
      console.log('error ' + error);
    }
  }
  build() {
    Column() {
      Text('' + prop137).id("text37_prop1").height('5%')
      Text('' + this.link1Date).id("text37_link1Date").height('5%')
      Text('' + this.link1Date2).id("text37_link1Date2").height('5%')
      Button(`click`).width('100%').height('5%')
        .key("Storage37Btn")
        .onClick((e: ClickEvent) => {
          this.link1Date = prop.get()
          this.link1Date2 = this.storLink1
        })
    }
  }
}