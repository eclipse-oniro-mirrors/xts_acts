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
import { AppStorage,SubscribedAbstractProperty, AbstractProperty } from '@ohos.arkui.stateManagement';
import hilog from "@ohos.hilog";
const router = AppStorage.get<Router>("router") as Router
AppStorage.clear()
AppStorage.setOrCreate<Router>('router', router);
AppStorage.setOrCreate<number>('PropA', 160);
let storage38 = new LocalStorage();
let link381: AbstractProperty<number> = AppStorage.setAndRef<number>('PropA',47) as AbstractProperty<number>
let link382: AbstractProperty<number> = AppStorage.setAndRef<number>('qqq',47) as AbstractProperty<number>
const get_storage38 = (): LocalStorage => storage38
@Entry({ storage:'get_storage38' })
@Component
struct LocalStorage38 {
  @State link1Date: number | undefined = 0;
  @State link1Date2: number | undefined = 0;

  build() {
    Column() {
      Text('' + this.link1Date).id("text38_link1Date").height('5%')
      Text('' + this.link1Date2).id("text38_link1Date2").height('5%')
      Button(`click`).width('100%').height('5%')
        .key("Storage38Btn")
        .onClick((e: ClickEvent) => {
          this.link1Date = link381.get()
          this.link1Date2 = link382.get()

        })
    }
  }
}