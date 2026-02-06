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
struct RelativeChain {
  @State RelativeChain: ChainStyle = ChainStyle.SPREAD

  build() {
    Column() {
      RelativeContainer() {
        Row()
          .width('20%')
          .height('50%')
          .backgroundColor("#FF3333")
          .alignRules({
            left: { anchor: "__container__", align: HorizontalAlign.Start },
            right: { anchor: "RelativeChainRow_2", align: HorizontalAlign.Start },
            center: { anchor: "__container__", align: VerticalAlign.Center }
          } as AlignRuleOption)
          .id("RelativeChainRow_1")
          .chainMode(Axis.Horizontal, this.RelativeChain)

        Row()
          .width('20%')
          .height('50%')
          .backgroundColor("#FFCC00")
          .alignRules({
            left: { anchor: "RelativeChainRow_1", align: HorizontalAlign.End },
            right: { anchor: "RelativeChainRow_3", align: HorizontalAlign.Start },
            top: { anchor: "RelativeChainRow_1", align: VerticalAlign.Top }
          } as AlignRuleOption)
          .id("RelativeChainRow_2")

        Row()
          .width('20%')
          .height('50%')
          .backgroundColor("#FF6633")
          .alignRules({
            left: { anchor: "RelativeChainRow_2", align: HorizontalAlign.End },
            right: { anchor: "__container__", align: HorizontalAlign.End },
            top: { anchor: "RelativeChainRow_1", align: VerticalAlign.Top }
          } as AlignRuleOption)
          .id("RelativeChainRow_3")
      }
      .id('RelativeChain')
      .width('50%')
      .height('50%')
      .margin({ left: 50, top: 50 } as Margin)
      .backgroundColor(Color.Grey)

      Row() {
        Button('SPREAD_INSIDE')
          .key('RelativeChainBt_1')
          .id('RelativeChainBt_1')
          .onClick((e: ClickEvent) => {
            this.RelativeChain = ChainStyle.SPREAD_INSIDE
          })
        Button('PACKED')
          .key('RelativeChainBt_2')
          .id('RelativeChainBt_2')
          .onClick((e: ClickEvent) => {
            this.RelativeChain = ChainStyle.PACKED
          })
      }

    }
    .height('100%')
  }
}