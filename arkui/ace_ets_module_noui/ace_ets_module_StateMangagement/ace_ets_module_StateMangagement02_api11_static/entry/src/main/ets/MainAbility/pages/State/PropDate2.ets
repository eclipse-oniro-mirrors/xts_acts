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
import common from '@ohos.app.ability.common';

@Component
struct ChildDate2 {
  @PropRef selectedDate2: Date = new Date('2022-06-06')

  build() {
    Column() {
      Button('increase the Time by 1'+this.selectedDate2.getTime()).width("100%").height('5%')
        .id("setTime1")//更改id名字（setTime=》setTime1)
        .onClick(() => {
          this.selectedDate2.setTime(this.selectedDate2.getTime() + 1)
        })
      Button('increase the UTCFullYear by 1'+this.selectedDate2.getUTCFullYear()).width("100%").height('5%')
        .id("setUTCFullYear1")
        .onClick(() => {
          this.selectedDate2.setUTCFullYear(this.selectedDate2.getUTCFullYear() + 1)
        })
      Button('increase the UTCMonth by 1'+this.selectedDate2.getUTCMonth()).width("100%").height('5%')
        .id("setUTCMonth1")
        .onClick(() => {
          this.selectedDate2.setUTCMonth(this.selectedDate2.getUTCMonth() + 1)
        })
      Button('increase the UTCDate by 1'+this.selectedDate2.getUTCDate()).width("100%").height('5%')
        .id("getUTCDate1")
        .onClick(() => {
          this.selectedDate2.setUTCDate(this.selectedDate2.getUTCDate() + 1)
        })
      Button('increase the UTCHour by 1'+this.selectedDate2.getUTCHours()).width("100%").height('5%')
        .id("setUTCHours1")
        .onClick(() => {
          this.selectedDate2.setUTCHours(this.selectedDate2.getUTCHours() + 1)
        })
      Button('increase the UTCMinute by 1'+this.selectedDate2.getUTCMinutes()).width("100%").height('5%')
        .id("setUTCMinutes1")
        .onClick(() => {
          this.selectedDate2.setUTCMinutes(this.selectedDate2.getUTCMinutes() + 1)
        })
      Button('increase the UTCSecond by 1'+this.selectedDate2.getUTCSeconds()).width("100%").height('5%')
        .id("setUTCSeconds1")

        .onClick(() => {
          this.selectedDate2.setUTCSeconds(this.selectedDate2.getUTCSeconds() + 1)
        })
      Button('increase the UTCMillisecond by 1'+this.selectedDate2.getUTCMilliseconds()).width("100%").height('5%')
        .id("setUTCMilliseconds1")

        .onClick(() => {
          this.selectedDate2.setUTCMilliseconds(this.selectedDate2.getUTCMilliseconds() + 1)
        })
      Button("Reset").id("ChildDate2_reset").height('5%')
        .onClick(() => {
          this.selectedDate2 = new Date('2021-08-08')
        })

      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate2
      }).width("100%").height('5%')
    }
  }
}


@Entry
@Component
struct PropDate2 {
  @State selectedDate: Date = new Date('2021-08-08')

  build() {
    Column() {

      Button('increase the Time by 1'+this.selectedDate.getTime()).width("100%").height('5%')
        .id("setTime002")

        .onClick(() => {
          this.selectedDate.setTime(this.selectedDate.getTime() + 1)
        })
      Button('increase the UTCFullYear by 1'+this.selectedDate.getUTCFullYear()).width("100%").height('5%')
        .id("setUTCFullYear")

        .onClick(() => {
          this.selectedDate.setUTCFullYear(this.selectedDate.getUTCFullYear() + 1)
        })
      Button('increase the UTCMonth by 1'+this.selectedDate.getUTCMonth()).width("100%").height('5%')
        .id("setUTCMonth")

        .onClick(() => {
          this.selectedDate.setUTCMonth(this.selectedDate.getUTCMonth() + 1)
        })
      Button('increase the UTCDate by 1'+this.selectedDate.getUTCDate()).width("100%").height('5%')
        .id("setUTCDate")

        .onClick(() => {
          this.selectedDate.setUTCDate(this.selectedDate.getUTCDate() + 1)
        })
      Button('increase the UTCHour by 1'+this.selectedDate.getUTCHours()).width("100%").height('5%')
        .id("setUTCHours")

        .onClick(() => {
          this.selectedDate.setUTCHours(this.selectedDate.getUTCHours() + 1)
        })
      Button('increase the UTCMinute by 1'+this.selectedDate.getUTCMinutes()).width("100%").height('5%')
        .id("setUTCMinutes")

        .onClick(() => {
          this.selectedDate.setUTCMinutes(this.selectedDate.getUTCMinutes() + 1)
        })
      Button('increase the UTCSecond by 1'+this.selectedDate.getUTCSeconds()).width("100%").height('5%')
        .id("setUTCSeconds")

        .onClick(() => {
          this.selectedDate.setUTCSeconds(this.selectedDate.getUTCSeconds() + 1)
        })
      Button('increase the UTCMillisecond by 1'+this.selectedDate.getUTCMilliseconds()).width("100%").height('5%')

        .id("setUTCMilliseconds")
        .onClick(() => {
          this.selectedDate.setUTCMilliseconds(this.selectedDate.getUTCMilliseconds() + 1)
        })
      Button("Reset").id("PropDate2_reset").height('5%')
        .onClick(() => {
          this.selectedDate = new Date('2021-08-08')
        })

      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate
      }).id("Prop_Date2").width("100%").height('5%')
      ChildDate2({selectedDate2: this.selectedDate})
    }.width('100%')
  }
}