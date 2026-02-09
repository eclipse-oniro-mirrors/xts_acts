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
  Observed
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from "@ohos.hilog";
import common from '@ohos.app.ability.common';
@Entry
@Component
struct StateDatePicker1 {
  @State selectedDate: Date = new Date('2021-08-08')
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('StateDate1', router);
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }
  build() {
    Column() {
      Button("Reset").id("StateDatePicker1_reset").height('5%')
        .onClick((e: ClickEvent) => {
          this.selectedDate = new Date('2021-08-08')
        })
      Text(''+ JSON.stringify(this.selectedDate)).id("date1").height('5%')
      Button('selectedDate to 2023-09-09').height('5%')
        .id("change_date")
        .onClick((e: ClickEvent) => {
          this.selectedDate = new Date('2023-09-09')
        })
      Button('increase the year by 1').height('5%')
        .id("setFullYear")
        .onClick((e: ClickEvent) => {
          this.selectedDate.setFullYear(this.selectedDate.getFullYear() + 1)
        })
      Button('increase the month by 1').height('5%')
        .id("setMonth")
        .onClick((e: ClickEvent) => {
          this.selectedDate.setMonth(this.selectedDate.getMonth() + 1)
        })
      Button('increase the day by 1').height('5%')
        .id("setDate")
        .onClick((e: ClickEvent) => {
          this.selectedDate.setDate(this.selectedDate.getDate() + 1)
        })
      Button('increase the hours by 1').height('5%')
        .id("setHours")
        .onClick((e: ClickEvent) => {
          this.selectedDate.setHours(this.selectedDate.getHours() + 1)
        })
      Button('increase the minute by 1').height('5%')
        .id("setMinutes")
        .onClick((e: ClickEvent) => {
          this.selectedDate.setMinutes(this.selectedDate.getMinutes() + 1)
        })
      Button('increase the Second by 1').height('5%')
        .id("setSeconds")
        .onClick((e: ClickEvent) => {
          this.selectedDate.setSeconds(this.selectedDate.getSeconds() + 1)
        })
      Button('increase the Millisecond by 1').height('5%')
        .id("setMilliseconds")
        .onClick((e: ClickEvent) => {
          this.selectedDate.setMilliseconds(this.selectedDate.getMilliseconds() + 1)
        })

      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate
      }).key("State_DatePicker1")
    }.width('100%')
  }
}