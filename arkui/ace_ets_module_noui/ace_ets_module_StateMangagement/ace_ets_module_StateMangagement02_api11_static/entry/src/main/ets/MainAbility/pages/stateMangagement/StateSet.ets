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
  DatePicker,
  Divider,
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
@Entry
@Component
struct StateSetSample {
  @State message: Set<number> = new Set<number>([1, 2, 3])

  build() {
    Row() {
      Column() {

        Button('init set').id("stateSet_init").height('5%')
          .onClick(() => {
            this.message = new Set<number>([1, 2, 3])
          })

        Button('set new one').id("stateSet_set").height('5%')
          .onClick(() => {
            this.message.add(5)
          })

        Button('clear').id("stateSet_clear").height('5%')
          .onClick(() => {
            this.message.clear()
            if (Array.from(this.message.entries())) {
              this.message.add(0)
            }
          })

        Button('delete the first one').id("stateSet_delete").height('5%')
          .onClick(() => {
            this.message.delete(0)
          })

        ForEach(Array.from(this.message.entries()), (item: [number, number]) => {
          Text(`${item[0]}`).fontSize(9).id("stateSet_value_" + item[0]).height('5%')
          Divider()
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}