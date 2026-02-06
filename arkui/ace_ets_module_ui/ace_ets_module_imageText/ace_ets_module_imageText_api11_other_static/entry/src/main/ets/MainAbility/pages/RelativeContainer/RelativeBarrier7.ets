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
struct RelativeBarrier7 {
  build() {
    Row() {
      RelativeContainer() {
        Button('A')
          .height(100)
          .width(100)
          .id('RelativeBarrier7Bt1')
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "__container__", align: HorizontalAlign.Start }
          } as AlignRuleOption)

        Button('B')
          .height(100)
          .width(150)
          .id('RelativeBarrier7Bt2')
          .alignRules({
            top: { anchor: "RelativeBarrier7Bt1", align: VerticalAlign.Bottom },
            left: { anchor: "RelativeBarrier7Bt1", align: HorizontalAlign.Start }
          } as AlignRuleOption)

        Button('C')
          .height(100)
          .width(100)
          .id('RelativeBarrier7Bt3')
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "barrier1", align: HorizontalAlign.Start }
          } as AlignRuleOption)


      }
      .id('RelativeBarrier7')
      .width(300)
      .height(300)
      .backgroundColor(Color.Grey)
      .margin({ left: 50 } as Margin)
      .barrier([
        {
          id: "barrier1",
          direction: BarrierDirection.RIGHT,
          referencedId: ["RelativeBarrier7Bt1", "RelativeBarrier7Bt6"]
        } as BarrierStyle
      ])
    }
    .height('100%')
  }
}