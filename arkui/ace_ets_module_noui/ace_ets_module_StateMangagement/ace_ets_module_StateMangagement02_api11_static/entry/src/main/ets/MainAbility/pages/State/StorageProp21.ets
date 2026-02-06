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
  Environment
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from "@ohos.hilog";
import common from '@ohos.app.ability.common';

AppStorage.clear()
enum KFC21{D = 1,H,Y}
Environment.envProps([
  { key: 'stringCode', defaultValue: 'en'},
  { key: 'numberCode', defaultValue: 2 as int},
  { key: 'booleanCode', defaultValue: true},
  { key: 'enumCode', defaultValue: KFC21.D as KFC21},
])


@Entry
@Component
struct StoragePropRef21 {
  @StoragePropRef('stringCode') stringCode: string = 'ab';
  @StoragePropRef('numberCode') numberCode: number = 1;
  @StoragePropRef('booleanCode') booleanCode: boolean = false;
  @StoragePropRef('enumCode') enumCode: KFC21 = KFC21.H;

  build() {
    Column() {
      Button(`button1: ${this.stringCode}`).width("100%").height('5%')
        .key("button1")
        .onClick((e: ClickEvent) => {
          this.stringCode = 'cd';
        })

      Button(`button2: ${this.numberCode}`).width("100%").height('5%')
        .key("button2")
        .onClick((e: ClickEvent) => {
          this.numberCode = 3
        })

      Button(`button3: ${this.booleanCode}`).width("100%").height('5%')
        .key("button3")
        .onClick((e: ClickEvent) => {
          this.booleanCode = false
        })

      Button(`button4: ${this.enumCode}`).width("100%").height('5%')
        .key("button4")
        .onClick((e: ClickEvent) => {
          this.enumCode = KFC21.Y
        })

    }
  }
}