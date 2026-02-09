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
struct RelativeChain11 {
  @State RelativeChain: ChainStyle = ChainStyle.SPREAD
  @State RelativeWidth: string = '30%'
  @State RelativeHeight: string = '30%'
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
            bottom: { anchor: "RelativeChainRow11_2", align: VerticalAlign.Top },
            left: { anchor: "__container__", align: HorizontalAlign.Start },
            right: { anchor: "RelativeChainRow11_2", align: HorizontalAlign.Start }
          } as AlignRuleOption)
          .id("RelativeChainRow11_1")
          .chainMode(Axis.Horizontal, this.RelativeChain)
          .onClick((e: ClickEvent) => {
            this.text = 'show'
          })


        Row()
          .width(this.RelativeWidth)
          .height(this.RelativeHeight)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: { anchor: "RelativeChainRow11_1", align: VerticalAlign.Bottom },
            bottom: { anchor: "RelativeChainRow11_3", align: VerticalAlign.Top },
            left: { anchor: "RelativeChainRow11_1", align: HorizontalAlign.End },
            right: { anchor: "RelativeChainRow11_3", align: HorizontalAlign.Start }
          } as AlignRuleOption)
          .id("RelativeChainRow11_2")
          .onClick((e: ClickEvent) => {
            this.text = 'show'
          })


        Row()
          .width(this.RelativeWidth)
          .height(this.RelativeHeight)
          .backgroundColor("#FF6633")
          .alignRules({
            top: { anchor: "RelativeChainRow11_2", align: VerticalAlign.Bottom },
            bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
            left: { anchor: "RelativeChainRow11_2", align: HorizontalAlign.End },
            right: { anchor: "__container__", align: HorizontalAlign.End }
          } as AlignRuleOption)
          .id("RelativeChainRow11_3")
          .onClick((e: ClickEvent) => {
            this.text = 'show'
          })

      }
      .id('RelativeChain11')
      .width('70%')
      .height('30%')
      .margin({ left: 5, top: 5 } as Margin)
      .backgroundColor(Color.Grey)

      Text(this.text).key('RelativeChain11Text')
      // 三个子组件水平垂直方向都成链
      RelativeContainer() {
        Row()
          .width(this.RelativeWidth)
          .height(this.RelativeHeight)
          .backgroundColor("#FF3333")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            bottom: { anchor: "RelativeChainRow112_2", align: VerticalAlign.Top },
            left: { anchor: "__container__", align: HorizontalAlign.Start },
            right: { anchor: "RelativeChainRow112_2", align: HorizontalAlign.Start }
          } as AlignRuleOption)
          .id("RelativeChainRow112_1")
          .chainMode(Axis.Horizontal, this.RelativeChain)
          .chainMode(Axis.Vertical, this.RelativeChain)

        Row()
          .width(this.RelativeWidth)
          .height(this.RelativeHeight)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: { anchor: "RelativeChainRow112_1", align: VerticalAlign.Bottom },
            bottom: { anchor: "RelativeChainRow112_3", align: VerticalAlign.Top },
            left: { anchor: "RelativeChainRow112_1", align: HorizontalAlign.End },
            right: { anchor: "RelativeChainRow112_3", align: HorizontalAlign.Start }
          } as AlignRuleOption)
          .id("RelativeChainRow112_2")

        Row()
          .width(this.RelativeWidth)
          .height(this.RelativeHeight)
          .backgroundColor("#FF6633")
          .alignRules({
            top: { anchor: "RelativeChainRow112_2", align: VerticalAlign.Bottom },
            bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
            left: { anchor: "RelativeChainRow112_2", align: HorizontalAlign.End },
            right: { anchor: "__container__", align: HorizontalAlign.End }
          } as AlignRuleOption)
          .id("RelativeChainRow112_3")
      }
      .id('RelativeChain112')
      .width('70%')
      .height('50%')
      .margin({ left: 5, top: 5 } as Margin)
      .backgroundColor(Color.Grey)

    }
    .height('100%')
  }
}