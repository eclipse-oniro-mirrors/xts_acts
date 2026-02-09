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
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Scroll,
  Padding,
  Position,
  Builder,
  Image,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  RelativeContainer,
  VerticalAlign,
  HorizontalAlign,
  BarrierDirection,
  ChainStyle,
  Axis,
  BarrierStyle,
  AlignRuleOption
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct RelativeGuideLine7 {
  @State relStart: number = 50
  @State relEnd: number = 50

  build() {
    Column() {
      RelativeContainer() {
        Button('top')
          .height(100)
          .alignRules({
            left: { anchor: "guideLine1", align: HorizontalAlign.Start },
            right: { anchor: "guideLine2", align: HorizontalAlign.Start }
          } as AlignRuleOption)
          .key('RelButton7')

      }
      .key('RelativeGuideLine7')
      .width(200)
      .height(200)
      .backgroundColor(Color.Grey)
      .guideLine([
        { id: "guideLine1", direction: Axis.Vertical, position: { start: this.relStart } },
        { id: "guideLine2", direction: Axis.Vertical, position: { end: this.relEnd } }
      ])

      Row() {
        Button('change 100')
          .key('RelButton100')
          .id('RelButton100')
          .onClick((e: ClickEvent) => {
            this.relStart = 60
            this.relEnd = 60
          })
      }

    }
    .height('100%')
  }
}