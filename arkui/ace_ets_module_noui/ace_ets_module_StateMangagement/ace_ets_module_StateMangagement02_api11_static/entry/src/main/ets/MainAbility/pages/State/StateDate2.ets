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
struct StateDatePicker2 {
  @State selectedDate: Date = new Date('2021-08-08')

  build() {
    Column() {
      Button("Reset").id("StateDatePicker2_reset").height('5%')
        .onClick((e: ClickEvent) => {
          this.selectedDate = new Date('2021-08-08')
        })
      Text(''+ JSON.stringify(this.selectedDate)).id("date2").height('5%')
      Button('increase the Time by 1').height('5%')
        .id("setTime")
        .onClick((e: ClickEvent) => {
          this.selectedDate.setTime(this.selectedDate.getTime() + 1)
        })
      Button('increase the UTCFullYear by 1').height('5%')
        .id("UTCFullYear")
        .onClick((e: ClickEvent) => {
          this.selectedDate.setUTCFullYear(this.selectedDate.getUTCFullYear() + 1)
        })
      Button('increase the UTCMonth by 1').height('5%')
        .id("UTCMonth")
        .onClick((e: ClickEvent) => {
          this.selectedDate.setUTCMonth(this.selectedDate.getUTCMonth() + 1)
        })
      Button('increase the UTCDate by 1').height('5%')
        .id("UTCDate")
        .onClick((e: ClickEvent) => {
          this.selectedDate.setUTCDate(this.selectedDate.getUTCDate() + 1)
        })
      Button('increase the UTCHour by 1').height('5%')
        .id("UTCHours")
        .onClick((e: ClickEvent) => {
          this.selectedDate.setUTCHours(this.selectedDate.getUTCHours() + 1)
        })
      Button('increase the UTCMinute by 1').height('5%')
        .id("UTCMinutes")
        .onClick((e: ClickEvent) => {
          this.selectedDate.setUTCMinutes(this.selectedDate.getUTCMinutes() + 1)
        })
      Button('increase the UTCSecond by 1').height('5%')
        .id("UTCSeconds")
        .onClick((e: ClickEvent) => {
          this.selectedDate.setUTCSeconds(this.selectedDate.getUTCSeconds() + 1)
        })
      Button('increase the UTCMillisecond by 1').height('5%')
        .id("UTCMilliseconds")
        .onClick((e: ClickEvent) => {
          this.selectedDate.setUTCMilliseconds(this.selectedDate.getUTCMilliseconds() + 1)
        })

      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate
      }).key("State_DatePicker2")
    }.width('100%')
  }
}