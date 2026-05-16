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
  // Environment
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage,Environment } from '@ohos.arkui.stateManagement';
import hilog from "@ohos.hilog";
import common from '@ohos.app.ability.common';


enum KFC19{K = 1,F,L}

@Entry
@Component
struct StorageProp19 {
  @StoragePropRef('stringCode') stringCode: string = 'en';
  @StoragePropRef('numberCode') numberCode: int = 2;
  @StoragePropRef('booleanCode') booleanCode: boolean = true;
  @StoragePropRef('enumCode') enumCode: KFC19 = KFC19.K;
  static {
    const router = AppStorage.get<Router>("router") as Router
    AppStorage.clear()
    AppStorage.setOrCreate<Router>('router', router);
    Environment.envProp<string>('stringCode', 'en');
    Environment.envProp<int>('numberCode', 2);
    Environment.envProp<boolean>('booleanCode', true);
    Environment.envProp<KFC19>('enumCode', KFC19.K);
  }
  build() {
    Column() {
      Button(`button1: ${this.stringCode}`).width("100%").height('5%')
        .key("button1")
        .onClick((e: ClickEvent) => {
          this.stringCode = 'arkUI';
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
          this.enumCode = KFC19.F
        })
    }
  }
}