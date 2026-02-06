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
@Component
struct ConsumeSetChild {
  @Consume message: Set<number>;

  build() {
    Column() {

      Button('Consume init set').id("consumeSet_init").height('5%')
        .onClick(() => {
          this.message = new Set<number>([1, 2, 3])
        })

      Button('Consume set new one').id("consumeSet_set").height('5%')
        .onClick(() => {
          this.message.add(5)
        })

      Button('Consume clear').id("consumeSet_clear").height('5%')
        .onClick(() => {
          this.message.clear()
          if (Array.from(this.message.entries())) {
            this.message.add(0)
          }
        })

      Button('Consume delete').id("consumeSet_delete").height('5%')
        .onClick(() => {
          this.message.delete(0)
        })

      ForEach(Array.from(this.message.entries()), (item: [number, number]) => {
        Text(`${item[0]}`).fontSize(9).id("provideSet_value_" + item[0]).height('5%')
        Divider()
      })
    }
    .width('100%')
  }
}


@Entry
@Component
struct ProvideSetSample {
  @Provide message: Set<number> = new Set<number>([1, 2, 3])

  build() {
    Row() {
      Column() {
        Button('Provide init set').id("provideSet_add").height('5%')
          .onClick(() => {
            this.message = new Set<number>([1, 2, 3, 4])
          })

        ConsumeSetChild()
      }
      .width('100%')
    }
    .height('100%')
  }
}