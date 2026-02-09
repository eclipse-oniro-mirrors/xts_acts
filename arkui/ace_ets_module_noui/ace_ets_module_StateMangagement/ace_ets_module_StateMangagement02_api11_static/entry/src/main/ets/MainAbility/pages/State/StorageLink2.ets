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
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from "@ohos.hilog";
import common from '@ohos.app.ability.common';
AppStorage.clear()
AppStorage.setOrCreate('Prop1', 47);
let para: Record<string, number> = { 'PropA': 47 }
let storageLink2 = new LocalStorage();
let storage_1 = new LocalStorage(para);
storageLink2.setOrCreate('Prop1',47);

@Entry
@Component
struct StorageLink2 {
  @StorageLink('Prop1') son1: number = 1;
  @StorageLink('Prop2') son2: number = 1;

  @State has1: boolean = false
  @State has2: boolean = true
  @State has3: boolean = false
  @State has4: boolean = false

  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('StorageLink2', router);
    } catch (error) {
      console.log('error ' + error);
    }
  }
  build() {
    Column() {
      Button(`has1: ${this.has1}`).width("100%").height('5%')
        .key("button_son111")
        .onClick((e: ClickEvent) => {
          this.has1 = AppStorage.has('Prop1')
        })
      Button(`has2: ${this.has2}`).width("100%").height('5%')
        .key("button_son2")
        .onClick((e: ClickEvent) => {
          this.has2 = AppStorage.has('Prop178')
        })

      Button(`has3: ${this.has3}`).width("100%").height('5%')
        .key("button_son3")
        .onClick((e: ClickEvent) => {
          this.has3 = AppStorage.set('Prop1',47)
        })
      Text("has3: "+this.has3 ).key('text').height('5%')
      Button(`has4: ${this.has4}`).width("100%").height('5%')
        .key("button_son4")
        .onClick((e: ClickEvent) => {
          this.has4 = storage_1.set('PropA',50)
        })

      Button(`son1: ${this.son1}`).width("100%").height('5%')
        .key("button_son5")
        .onClick((e: ClickEvent) => {
          AppStorage.setOrCreate('Prop1',48)
        })
      Button(`son2: ${this.son2}`).width("100%").height('5%')
        .key("button_son6")
        .onClick((e: ClickEvent) => {
          AppStorage.setOrCreate('Prop2',49)
        })
    }
  }
}