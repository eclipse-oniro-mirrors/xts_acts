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
struct PropMapChild {
  @PropRef value: Map<number, string> = new Map<number, string>([[0, "a"], [1, "b"], [3, "c"]])

  build() {
    Column() {

      Button('child init map').id("propMap_init").height('5%')
        .onClick((e: ClickEvent) => {
          this.value = new Map<number, string>([[0, "a"], [1, "b"], [3, "c"]])
        })

      Button('child set new one').id("propMap_set").height('5%')
        .onClick((e: ClickEvent) => {
          this.value.set(4, "d")
        })

      Button('child clear').id("propMap_clear").height('5%')
        .onClick((e: ClickEvent) => {
          this.value.clear()
          if (Array.from(this.value.entries())) {
            this.value.set(0, "K")
          }
        })

      Button('child replace').id("propMap_replace").height('5%')
        .onClick((e: ClickEvent) => {
          this.value.set(0, "aa")
        })

      Button('child delete').id("propMap_delete").height('5%')
        .onClick((e: ClickEvent) => {
          this.value.delete(0)
        })

      ForEach(Array.from(this.value.entries()), (item: [Number, String]) => {
        Text(`${item[0]} ${item[1]}`).fontSize(9).id("propMap_value_" + item[1]).height('5%')
        Divider()
      })
    }
  }
}


@Entry
@Component
struct PropMapSample2 {
  @State message: Map<number, string> = new Map<number, string>([[0, "a"], [1, "b"], [3, "c"]])
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('PropMap', router);
    } catch (error) {
      console.log('error ' + error);
    }
  }
  build() {
    Row() {
      Column() {
        PropMapChild({ value: this.message })
      }
      .width('100%')
    }
    .height('100%')
  }
}