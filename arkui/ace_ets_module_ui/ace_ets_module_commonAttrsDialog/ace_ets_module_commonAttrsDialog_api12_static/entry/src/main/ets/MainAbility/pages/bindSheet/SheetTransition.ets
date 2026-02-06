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
  $$,
  SheetSize,
// $rawfile,
  SheetType
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
struct SheetTransitionExample {
  @State isShow: boolean = false
  @State SheetType: SheetType = SheetType.BOTTOM;
  @State SheetTypeValue: string = "value SheetType:";
  @State WidthValue: string = "value Width:";

  @Builder
  myBuilder() {
    Column() {
      Text("This is Model Sheet(bindSheet)").fontSize(20).margin(10)
      Text(this.SheetTypeValue).fontSize(20).id("SheetTypeValue").margin(10)
      Text(this.WidthValue).fontSize(20).id("WidthValue").margin(10)
      Button("Close Model Sheet")
        .margin(10)
        .fontSize(20)
        .onClick((e:ClickEvent) => {
          this.isShow = false;
        })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }

  build() {
    Column() {
      Button("Open Model Sheet")
        .id("SheetTransition")
        .onClick((e:ClickEvent) => {
          this.isShow = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$(this.isShow), this.myBuilder, {
          height: SheetSize.MEDIUM,
          backgroundColor: Color.Green,
          preferType: SheetType.BOTTOM,
          onTypeDidChange: (value: SheetType) => {
            this.SheetTypeValue = (`value SheetType:${this.SheetType = value}`)
            console.info(`value SheetType:${this.SheetType = value}`)
          },
          onWidthDidChange: (value: Int) => {
            this.WidthValue = (`value Width:${value}`)
            console.info(`value Width:${value}`)
          },
          onWillAppear: () => {
            console.log("BindSheet onWillAppear.")
          },
          onAppear: () => {
            console.log("BindSheet onAppear.")
          },
          onWillDisappear: () => {
            console.log("BindSheet onWillDisappear.")
          },
          onDisappear: () => {
            console.log("BindSheet onDisappear.")
          }
        })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}