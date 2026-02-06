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
struct RelativeGuideLine6 {
  build() {
    Column() {
      RelativeContainer() {
        // 多个子组件 25 26
        Button('top')
          .width(100)
          .height(100)
          .backgroundColor(Color.White)
          .alignRules({
            left: { anchor: "guideLine1", align: HorizontalAlign.Start }
          } as AlignRuleOption)
          .key('RelButton6_1')
        Button('top')
          .width(70)
          .height(70)
          .alignRules({
            left: { anchor: "guideLine1", align: HorizontalAlign.Start }
          } as AlignRuleOption)
          .key('RelButton6_2')
        Button('top')
          .width(50)
          .height(50)
          .backgroundColor(Color.Green)
          .alignRules({
            left: { anchor: "guideLine1", align: HorizontalAlign.Start }
          } as AlignRuleOption)
          .key('RelButton6_3')

      }
      .key('RelativeGuideLine6')
      .width(300)
      .height(300)
      .margin({ left: 50, top: 5 } as Margin)
      .backgroundColor(Color.Grey)
      .guideLine([
        { id: "guideLine1", direction: Axis.Vertical, position: { start: 50 } }

      ])


      RelativeContainer() {
        // 多个子组件 25 26
        Button('top')
          .width(100)
          .height(100)
          .backgroundColor(Color.White)
          .zIndex(2)
          .alignRules({
            left: { anchor: "guideLine1", align: HorizontalAlign.Start }
          } as AlignRuleOption)
          .key('RelButton6_4')
        Button('top')
          .width(70)
          .height(70)
          .zIndex(1)
          .alignRules({
            left: { anchor: "guideLine1", align: HorizontalAlign.Start }
          } as AlignRuleOption)
          .key('RelButton6_5')
        Button('top')
          .width(50)
          .height(50)
          .zIndex(0)
          .backgroundColor(Color.Green)
          .alignRules({
            left: { anchor: "guideLine1", align: HorizontalAlign.Start }
          } as AlignRuleOption)
          .key('RelButton6_6')

      }
      .key('RelativeGuideLine6_2')
      .width(300)
      .height(300)
      .margin({ left: 50, top: 100 } as Margin)
      .backgroundColor(Color.Grey)
      .guideLine([
        { id: "guideLine1", direction: Axis.Vertical, position: { start: 50 } }

      ])

    }
    .height('100%')
  }
}