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
struct RelativeChain7 {
  @State RelativeChain: ChainStyle = ChainStyle.SPREAD
  @State RelativeWidth: number = 50
  @State RelativeHeight: number = 50

  build() {
    Column() {
      RelativeContainer() {
        Row()
          .width(this.RelativeWidth)
          .height(this.RelativeHeight)
          .backgroundColor("#FF3333")
          .alignRules({
            left: { anchor: "__container__", align: HorizontalAlign.Start },
            right: { anchor: "RelativeChainRow7_2", align: HorizontalAlign.Start },
            center: { anchor: "__container__", align: VerticalAlign.Center }
          } as AlignRuleOption)
          .id("RelativeChainRow7_1")
          .chainMode(Axis.Horizontal, this.RelativeChain)

        Row()
          .width(this.RelativeWidth)
          .height(this.RelativeHeight)
          .backgroundColor("#FFCC00")
          .alignRules({
            left: { anchor: "RelativeChainRow7_1", align: HorizontalAlign.End },
            right: { anchor: "RelativeChainRow7_3", align: HorizontalAlign.Start },
            top: { anchor: "RelativeChainRow7_1", align: VerticalAlign.Top }
          } as AlignRuleOption)
          .id("RelativeChainRow7_2")

        Row()
          .width(this.RelativeWidth)
          .height(this.RelativeHeight)
          .backgroundColor("#FF6633")
          .alignRules({
            left: { anchor: "RelativeChainRow7_2", align: HorizontalAlign.End },
            right: { anchor: "__container__", align: HorizontalAlign.End },
            top: { anchor: "RelativeChainRow7_1", align: VerticalAlign.Top }
          } as AlignRuleOption)
          .id("RelativeChainRow7_3")
      }
      .id('RelativeChain7')
      .width('100%').height('60%')
      .backgroundColor(Color.Grey)

      Row() {
        Button('SPREAD_INSIDE')
          .key('RelativeChainBt_1')
          .onClick((e: ClickEvent) => {
            this.RelativeChain = ChainStyle.SPREAD_INSIDE
          })
        Button('PACKED')
          .key('RelativeChainBt_2')
          .onClick((e: ClickEvent) => {
            this.RelativeChain = ChainStyle.PACKED
          })
      }

      Row() {
        Button('改变宽度')
          .key('RelativeWidth')
          .id('RelativeWidth')
          .onClick((e: ClickEvent) => {
            this.RelativeWidth = 60
          })

        Button('改变高度')
          .key('RelativeHeight')
          .onClick((e: ClickEvent) => {
            this.RelativeHeight = 60
          })
      }

    }
    .height('100%')
  }
}