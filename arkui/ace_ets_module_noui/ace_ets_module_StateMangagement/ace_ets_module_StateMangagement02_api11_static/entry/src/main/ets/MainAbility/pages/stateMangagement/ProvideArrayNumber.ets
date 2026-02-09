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
  DatePicker,
  Divider
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
struct ConsumeArrayNumberChild {
  @Consume message: Array<number>

  build() {
    Column() {

      Button('Consume init array').id('consumeArrayNumber_init').height('5%')
        .onClick((e: ClickEvent) => {
          this.message = [5, 6, 7, 8, 9]
        })

      Button('Consume add new one').id('consumeArrayNumber_add').height('5%')
        .onClick((e: ClickEvent) => {
          let lastIndex = this.message.length - 1
          this.message.push(this.message[lastIndex] + 1)
        })

      Button('Consume clear').id('consumeArrayNumber_clear').height('5%')
        .onClick((e: ClickEvent) => {
          this.message = []
          if (Array.from(this.message.entries())) {
            this.message.push(0)
          }
        })

      Button('Consume replace').id('consumeArrayNumber_replace').height('5%')
        .onClick((e: ClickEvent) => {
          if (this.message.length > 0) {
            this.message[0] = 99
          }
        })

      Button('Consume delete last').id('consumeArrayNumber_delete').height('5%')
        .onClick((e: ClickEvent) => {
          this.message.pop()
        })

      ForEach(Array.from(this.message.entries()), (item: [number, Number]) => {
        Text(`${item[1]} index: ${item[0]}`).fontSize(9).id('consumeArrayNumber_value_' + item[0])
          .height('5%')
        Divider()
      })
    }
  }
}

@Entry
@Component
struct ProvideArrayNumber {
  @Provide message: Array<number> = new Array<number>(1, 2, 3, 4, 5)
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('ProvideArrayNumber', router);
    } catch (error) {
      console.log('error ' + error);
    }
  }
  build() {
    Row() {
      Column() {
        Button('Provide init array').id('provideArrayNumber_init').height('5%')
          .onClick((e: ClickEvent) => {
            this.message = [1, 2, 3, 4, 5]
          })
        ConsumeArrayNumberChild()
      }
      .width('100%')
    }
    .height('100%')
  }
}
