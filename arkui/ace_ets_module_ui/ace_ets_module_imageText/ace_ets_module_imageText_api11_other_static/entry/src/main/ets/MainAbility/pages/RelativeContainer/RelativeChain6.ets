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
struct RelativeChain6 {
  @State RelativeChain: ChainStyle = ChainStyle.PACKED
  @State RelativeChainAxis: Axis = Axis.Horizontal

  build() {
    Column() {

      RelativeContainer() {
        Row()
          .width(50)
          .height(50)
          .backgroundColor("#FF3333")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "__container__", align: HorizontalAlign.Start },
            right: { anchor: "RelativeChainRow6_2", align: HorizontalAlign.Start },
            bias: { horizontal: 0.3 }
          } as AlignRuleOption)
          .id("RelativeChainRow6_1")
          .chainMode(Axis.Horizontal, this.RelativeChain)

        Row()
          .width(50)
          .height(50)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "RelativeChainRow6_1", align: HorizontalAlign.End },
            right: { anchor: "RelativeChainRow6_3", align: HorizontalAlign.Start },
            bias: { horizontal: 0.8 }
          } as AlignRuleOption)
          .id("RelativeChainRow6_2")
          .chainMode(Axis.Horizontal, this.RelativeChain)

        Row()
          .width(50)
          .height(50)
          .backgroundColor("#FF6633")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "RelativeChainRow6_2", align: HorizontalAlign.End },
            right: { anchor: "__container__", align: HorizontalAlign.End }
          } as AlignRuleOption)
          .id("RelativeChainRow6_3")
      }
      .id('RelativeChain6')
      .width(200)
      .height(200)
      .margin({ top: 50 } as Margin)
      .backgroundColor(Color.Grey)

      RelativeContainer() {
        Row()
          .width(100)
          .height(100)
          .backgroundColor("#FF3333")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "__container__", align: HorizontalAlign.Start },
            right: { anchor: "RelativeChainRow62_2", align: HorizontalAlign.Start },
            bias: { horizontal: 0.3 }
          } as AlignRuleOption)
          .id("RelativeChainRow62_1")
          .chainMode(Axis.Horizontal, ChainStyle.SPREAD)

        Row()
          .width(100)
          .height(100)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "RelativeChainRow62_1", align: HorizontalAlign.End },
            right: { anchor: "RelativeChainRow62_3", align: HorizontalAlign.Start }
          } as AlignRuleOption)
          .id("RelativeChainRow62_2")

        Row()
          .width(100)
          .height(100)
          .backgroundColor("#FF6633")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "RelativeChainRow62_2", align: HorizontalAlign.End },
            right: { anchor: "__container__", align: HorizontalAlign.End }
          } as AlignRuleOption)
          .id("RelativeChainRow62_3")
      }
      .id('RelativeChain62')
      .width(400)
      .height(200)
      .margin({ left: 50, top: 50 } as Margin)
      .backgroundColor(Color.Grey)

      RelativeContainer() {
        Row()
          .width(100)
          .height(100)
          .backgroundColor("#FF3333")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "__container__", align: HorizontalAlign.Start },
            right: { anchor: "RelativeChainRow63_2", align: HorizontalAlign.Start },
            bias: { horizontal: 0.3 }
          } as AlignRuleOption)
          .id("RelativeChainRow63_1")
          .chainMode(Axis.Horizontal, ChainStyle.SPREAD_INSIDE)

        Row()
          .width(100)
          .height(100)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "RelativeChainRow63_1", align: HorizontalAlign.End },
            right: { anchor: "RelativeChainRow63_3", align: HorizontalAlign.Start }
          } as AlignRuleOption)
          .id("RelativeChainRow63_2")

        Row()
          .width(100)
          .height(100)
          .backgroundColor("#FF6633")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "RelativeChainRow63_2", align: HorizontalAlign.End },
            right: { anchor: "__container__", align: HorizontalAlign.End }
          } as AlignRuleOption)
          .id("RelativeChainRow63_3")
      }
      .id('RelativeChain63')
      .width(400)
      .height(200)
      .margin({ left: 50, top: 50 } as Margin)
      .backgroundColor(Color.Grey)

    }
    .height('100%')
  }
}