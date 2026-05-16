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
  Observed,
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from "@ohos.hilog";


AppStorage.clear()
AppStorage.setOrCreate('PropA', 47);
AppStorage.setOrCreate('LinkA', 47);
let LocalStorage12 = new LocalStorage();
LocalStorage12.set('PropA',48);

//let AppStorageKeys12 = LocalStorage12.keys() 原来就注释

// @Entry(LocalStorage12)
@Entry
@Component
struct Storage12 {
  @StorageLink('PropA') storLink: number = 1;
  @LocalStorageLink('PropA') localStorLink: number = 1;
  @State text: string = 'Init'
 aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('Storage12', router);
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column() {

      Text(this.text).key('Storage12Content').height('5%')

      //Size获取AppStorage中存在键值对的个数
      Button('获取键值对的个数')
        .onClick((e: ClickEvent) => {
          this.text = AppStorage.size() + ''
      }).key('Storage12Button111').height('5%')

      Text(`appKeys: ${Object.keys(LocalStorage12)}`).id("Storage12Text1").height('5%')

      //IsMutable返回属性键值key对应的属性是否可变，可变返回true （不可变返回false，没有实现，暂时全部返回true）
      Button('IsMutable').onClick((e: ClickEvent) => {
        // this.text = AppStorage.IsMutable('PropA') + '' 问题已上报
      }).key('Storage12Button2').height('5%')

    }
  }
}