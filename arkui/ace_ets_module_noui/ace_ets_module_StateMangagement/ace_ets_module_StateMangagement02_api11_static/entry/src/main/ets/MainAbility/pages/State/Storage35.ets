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
import { AppStorage,SubscribedAbstractProperty } from '@ohos.arkui.stateManagement';
import hilog from "@ohos.hilog";
const router = AppStorage.get<Router>("router") as Router
AppStorage.clear()
AppStorage.setOrCreate<Router>('router', router);
AppStorage.setOrCreate<number>('PropA', 121);
let storage35 = new LocalStorage();
let link351 = AppStorage.link<number>('PropA')
let link352 = AppStorage.link<number>('sss')
let link353 = link351?.get()

const get_storage35 = (): LocalStorage => storage35

@Entry({ storage:'get_storage35' })
@Component
struct LocalStorage35 {
  //@LocalStorageLink变量装饰器与LocalStorage中的'PropA'属性建立双向绑定
  @StorageLink('PropA') storLink1: number = 1;
  @State link1Date2: number | undefined = 0;

  build() {
    Column() {
      Text('' + link353).id("text35_link").height('5%')
      Text('' + link352).id("text35_link2").height('5%')
      Text('' + this.link1Date2).id("text35_link1Date2").height('5%')
      Button(`click`).width('100%').height('5%')
        .key("Storage35Btn")
        .onClick((e: ClickEvent) => {
          this.link1Date2 = this.storLink1
        })
    }
  }
}