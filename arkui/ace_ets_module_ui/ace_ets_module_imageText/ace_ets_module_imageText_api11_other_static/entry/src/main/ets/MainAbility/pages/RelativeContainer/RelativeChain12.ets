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
struct RelativeChain12 {
  @State RelativeChain: ChainStyle = ChainStyle.SPREAD
  @State RelativeWidth: number = 50
  @State RelativeHeight: number = 50
  @State text: string = ''

  build() {
    Column() {
      // 三个子组件水平垂直方向都成链，只设置水平链
      RelativeContainer() {
        Row()
          .width(this.RelativeWidth)
          .height(this.RelativeHeight)
          .backgroundColor("#FF3333")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "__container__", align: HorizontalAlign.Start },
            right: { anchor: "RelativeChainRow12_2", align: HorizontalAlign.Start }
          } as AlignRuleOption)
          .id("RelativeChainRow12_1")
          .chainMode(Axis.Horizontal, this.RelativeChain)


        Row()
          .width(this.RelativeWidth)
          .height(this.RelativeHeight)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "RelativeChainRow12_1", align: HorizontalAlign.End },
            right: { anchor: "RelativeChainRow12_3", align: HorizontalAlign.Start },
            bottom: { anchor: "RelativeChainRow12_4", align: VerticalAlign.Top }
          } as AlignRuleOption)
          .id("RelativeChainRow12_2")
          .chainMode(Axis.Vertical, ChainStyle.SPREAD_INSIDE)

        Row()
          .width(this.RelativeWidth)
          .height(this.RelativeHeight)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "RelativeChainRow12_2", align: HorizontalAlign.End },
            right: { anchor: "__container__", align: HorizontalAlign.End }
          } as AlignRuleOption)
          .id("RelativeChainRow12_3")


        Row()
          .width(this.RelativeWidth)
          .height(this.RelativeHeight)
          .backgroundColor("#FF6633")
          .alignRules({
            top: { anchor: "RelativeChainRow12_2", align: VerticalAlign.Bottom },
            left: { anchor: "RelativeChainRow12_2", align: HorizontalAlign.Start },
            bottom: { anchor: "RelativeChainRow12_5", align: VerticalAlign.Top }
          } as AlignRuleOption)
          .id("RelativeChainRow12_4")

        Row()
          .width(this.RelativeWidth)
          .height(this.RelativeHeight)
          .backgroundColor("#FF6633")
          .alignRules({
            top: { anchor: "RelativeChainRow12_4", align: VerticalAlign.Bottom },
            left: { anchor: "RelativeChainRow12_2", align: HorizontalAlign.Start },
            bottom: { anchor: "__container__", align: VerticalAlign.Bottom }
          } as AlignRuleOption)
          .id("RelativeChainRow12_5")

      }
      .id('RelativeChain12')
      .width(300)
      .height(300)
      .margin({ left: 50, top: 50 } as Margin)
      .backgroundColor(Color.Grey)

      Text(this.text).key('RelativeChain12Text')

      RelativeContainer() {
        Row()
          .width(this.RelativeWidth)
          .height(this.RelativeHeight)
          .backgroundColor("#FF3333")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "__container__", align: HorizontalAlign.Start },
            right: { anchor: "RelativeChainRow122_2", align: HorizontalAlign.Start }
          } as AlignRuleOption)
          .id("RelativeChainRow122_1")
          .chainMode(Axis.Horizontal, this.RelativeChain)
          .onClick((e: ClickEvent) => {
            this.text = 'show'
          })


        Row()
          .width(this.RelativeWidth)
          .height(this.RelativeHeight)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "RelativeChainRow122_1", align: HorizontalAlign.End },
            right: { anchor: "RelativeChainRow122_3", align: HorizontalAlign.Start },
            bottom: { anchor: "RelativeChainRow122_4", align: VerticalAlign.Top }
          } as AlignRuleOption)
          .id("RelativeChainRow122_2")
          .onClick((e: ClickEvent) => {
            this.text = 'show'
          })

        Row()
          .width(this.RelativeWidth)
          .height(this.RelativeHeight)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "RelativeChainRow122_2", align: HorizontalAlign.End },
            right: { anchor: "__container__", align: HorizontalAlign.End }
          } as AlignRuleOption)
          .id("RelativeChainRow122_3")
          .onClick((e: ClickEvent) => {
            this.text = 'show'
          })


        Row()
          .width(this.RelativeWidth)
          .height(this.RelativeHeight)
          .backgroundColor("#FF6633")
          .alignRules({
            top: { anchor: "RelativeChainRow122_2", align: VerticalAlign.Bottom },
            left: { anchor: "RelativeChainRow122_2", align: HorizontalAlign.Start },
            bottom: { anchor: "RelativeChainRow122_5", align: VerticalAlign.Top }
          } as AlignRuleOption)
          .id("RelativeChainRow122_4")
          .onClick((e: ClickEvent) => {
            this.text = 'show'
          })

        Row()
          .width(this.RelativeWidth)
          .height(this.RelativeHeight)
          .backgroundColor("#FF6633")
          .alignRules({
            top: { anchor: "RelativeChainRow122_4", align: VerticalAlign.Bottom },
            left: { anchor: "RelativeChainRow122_2", align: HorizontalAlign.Start },
            bottom: { anchor: "__container__", align: VerticalAlign.Bottom }
          } as AlignRuleOption)
          .id("RelativeChainRow122_5")
          .onClick((e: ClickEvent) => {
            this.text = 'show'
          })

      }
      .id('RelativeChain122')
      .width(300)
      .height(200)
      .margin({ left: 50, top: 50 } as Margin)
      .backgroundColor(Color.Grey)

    }
    .height('100%')
  }
}