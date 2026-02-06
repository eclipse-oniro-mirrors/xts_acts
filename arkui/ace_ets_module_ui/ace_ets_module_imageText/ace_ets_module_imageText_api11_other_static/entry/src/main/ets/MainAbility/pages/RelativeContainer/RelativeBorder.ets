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
  EdgeWidths,
  Axis,
  GuideLinePosition,
  AlignRuleOption
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct RelativeBorder {
  @State RelativeChain: ChainStyle = ChainStyle.SPREAD
  @State RelativePad: number = 0

  build() {
    Column() {
      RelativeContainer() {
        Row()
          .width(50)
          .height(50)
          .backgroundColor("#FF3333")
          .alignRules({
            left: { anchor: "guideLine1", align: HorizontalAlign.Start },
            right: { anchor: "RelativeBorderRow_2", align: HorizontalAlign.Start }
          } as AlignRuleOption)
          .id("RelativeBorderRow_1")
          .chainMode(Axis.Horizontal, this.RelativeChain)

        Row()
          .width(50)
          .height(50)
          .backgroundColor("#FFCC00")
          .alignRules({
            left: { anchor: "RelativeBorderRow_1", align: HorizontalAlign.End },
            right: { anchor: "RelativeBorderRow_3", align: HorizontalAlign.Start },
            top: { anchor: "RelativeBorderRow_1", align: VerticalAlign.Top }
          } as AlignRuleOption)
          .id("RelativeBorderRow_2")

        Row()
          .width(50)
          .height(50)
          .backgroundColor("#FF6633")
          .alignRules({
            left: { anchor: "RelativeBorderRow_2", align: HorizontalAlign.End },
            right: { anchor: "__container__", align: HorizontalAlign.End },
            top: { anchor: "RelativeBorderRow_1", align: VerticalAlign.Top }
          } as AlignRuleOption)
          .id("RelativeBorderRow_3")
      }
      .id('RelativeBorder')
      .width('100%')
      .height('80%')
      .backgroundColor(Color.Grey)
      .borderWidth({ top: this.RelativePad } as EdgeWidths)
      .guideLine([
        { id: "guideLine1", direction: Axis.Vertical, position: { start: 50 } as GuideLinePosition }
      ])

      Button('borderWidth 50').onClick((event: ClickEvent) => {
        this.RelativePad = 50
      }).key('addBorderWidth').id('addBorderWidth')

    }
    .height('100%')
  }
}
