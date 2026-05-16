'use static';
/**
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

import events_emitter from '@ohos.events.emitter';
import {
  Entry,Builder,
  Column,
  Component,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Button,
  FontWeight,
  ButtonType,
  ClickEvent,
  Margin,
  FlexOptions,
  ColumnOptions,
  TextAlign,
  Scroll,
  Image,
  Color,
  TripleLengthDetents,
  $$,
  BlurStyle,
  SheetType,
  SheetDismiss,
  SheetSize
// $rawfile
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../../../hypium/index';
import testsuite from '../../../../src/test/List.test'
import {
  State
} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct onDetentsDidChangeExample {
  @State isShow: boolean = false
  @State DetentsChange: string = "DetentsChange"

  @Builder
  myBuilder() {
    Column() {
      Button("content1")
        .margin(10)
        .fontSize(20)

      Button("content2")
        .margin(10)
        .fontSize(20)
    }
    .width('100%')
  }

  build() {
    Column() {
      Text(this.DetentsChange).margin(30).id("DetentsChangeValue")
      Button("transition modal 1")
        .id("DetentsChange")
        .onClick((e:ClickEvent) => {
          this.isShow = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$(this.isShow), this.myBuilder, {
          detents: [SheetSize.MEDIUM, SheetSize.LARGE, 200] as TripleLengthDetents,
          backgroundColor: Color.Gray,
          blurStyle: BlurStyle.Thick,
          showClose: true,
          title: { title: "title", subtitle: "subtitle" },
          preferType: SheetType.BOTTOM,
          shouldDismiss: ((sheetDismiss: SheetDismiss) => {
            console.log("bind sheet shouldDismiss")
            sheetDismiss.dismiss()
          }),
          onDetentsDidChange: () => {
            this.DetentsChange = "DetentsChange success"
            console.log("BindSheet onDetentsDidChange.")
          }
        })
    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
  }
}