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
  Builder,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FontWeight,
  Image,
  ItemAlign,
  Margin,
  Scroll,
  Text,
  TextAlign,
  $$,
  TripleLengthDetents,
  SheetDismiss,
  SheetSize,
  BlurStyle,
  SheetMode,
  SheetType
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';
import testsuite from '../../../../src/test/List.test';
import common from '@ohos.app.ability.common';

@Entry
@Component
struct SheetModeExample {
  @State isShow: boolean = false

  onPageShow() {
    console.info('Blank page show called');
    // AppStorage.setOrCreate<common.BaseContext>('abilityContext', this.getUIContext().getHostContext()!)
  }

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
      Button("transition modal 1")
        .id("SheetMode")
        .onClick((e: ClickEvent) => {
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
        preferType: SheetType.CENTER,
        mode: SheetMode.EMBEDDED,
        shouldDismiss: ((sheetDismiss: SheetDismiss) => {
          console.log("bind sheet shouldDismiss")
          sheetDismiss.dismiss()
        })
      })
    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
  }
}