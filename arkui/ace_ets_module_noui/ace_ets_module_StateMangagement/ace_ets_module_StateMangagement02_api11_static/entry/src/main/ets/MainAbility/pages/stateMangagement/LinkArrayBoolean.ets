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
struct LinkArrayBooleanChild {
  @Link value: Array<boolean> = new Array<boolean>(false,true)

  build() {
    Column() {
      Button('child init array').id('LinkArrayBoolean_init')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.value = [false, true, false]
        })

      Button('child add new one').id('LinkArrayBoolean_add')
        .height('5%')
        .onClick((e: ClickEvent) => {
          let lastIndex = this.value.length - 1
          this.value.push(this.value[lastIndex] == true ? false : true)
        })

      Button('child clear').id('LinkArrayBoolean_clear')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.value = []
          if (Array.from(this.value.entries())) {
            this.value.push(true)
          }
        })

      Button('child replace').id('LinkArrayBoolean_replace')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.value[0] = this.value[0] == true ? false : true
        })

      Button('child delete').id('LinkArrayBoolean_delete')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.value.shift()
        })

      ForEach(Array.from(this.value.entries()), (item: [number,Boolean]) => {
        Text(`${item[1]} index:${item[0]}`).fontSize(9).id('LinkArrayBoolean_value_' + `${item[0]}`).height('5%')
        Divider()
      })


    }
  }
}

@Entry
@Component
struct LinkArrayBoolean {
  @State message: Array<boolean> = [true, false, true]
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('LinkArrayBoolean', router);
    } catch (error) {
      console.log('error ' + error);
    }
  }
  build() {
    Row() {
      Column() {
        LinkArrayBooleanChild({ value: this.message })
      }
      .width('100%')
    }
    .height('100%')
  }
}