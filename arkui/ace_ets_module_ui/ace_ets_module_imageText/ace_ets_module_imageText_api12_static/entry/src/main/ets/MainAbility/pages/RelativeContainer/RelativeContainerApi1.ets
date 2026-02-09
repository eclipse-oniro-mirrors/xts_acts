'use static';
/*
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
  Component,
  Column,
  ColumnOptions,
  Text,AlignRuleOption,
  Rating,
  Margin,
  Row,
  ClickEvent,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  Color,
  $r,
  RelativeContainer,
  HorizontalAlign,
  VerticalAlign,
  Direction,
  LocalizedBarrierDirection,
  BarrierDirection,
  BarrierStyle
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct RelativeContainerApi {
  build() {
    Column() {
      RelativeContainer() {
        Row().width(100).height(100)
          .backgroundColor('#FF3333')
          .id('row1')

        Row().width(100).height(100)
          .backgroundColor('#FFCC00')
          .alignRules({
            middle: {anchor: 'row1', align: HorizontalAlign.End},
            top: {anchor: 'row1', align: VerticalAlign.Bottom}
          } as AlignRuleOption)
          .id('row2')

        Row().width(100).height(100)
          .backgroundColor('#FF6633')
          .alignRules({
            // start: {anchor: 'barrier1', align: HorizontalAlign.End},
            top: {anchor: 'row1', align: VerticalAlign.Top}
          } as AlignRuleOption)
          .id('row3')

        Row().width(50).height(50)
          .backgroundColor('#FF9966')
          .alignRules({
            // start: {anchor: 'row1', align: HorizontalAlign.Start},
            top: {anchor: 'barrier2', align: VerticalAlign.Bottom}
          } as AlignRuleOption)
          .id('row4')
      }
      .key('RelativeContainerApi1')
      .direction(Direction.Rtl)
      .width(300).height(300)
      .margin({left: 50} as Margin)
      .barrier([{id: 'barrier1',direction: BarrierDirection.RIGHT, referencedId:['row1', 'row2']} as BarrierStyle,
        {id: 'barrier2',direction: BarrierDirection.BOTTOM, referencedId:['row1', 'row2']} as BarrierStyle])

      RelativeContainer() {
        Row().width(100).height(100)
          .backgroundColor('#FF3333')
          .id('row11')

        Row().width(100).height(100)
          .backgroundColor('#FFCC00')
          .alignRules({
            middle: {anchor: 'row11', align: HorizontalAlign.End},
            top: {anchor: 'row11', align: VerticalAlign.Bottom}
          } as AlignRuleOption)
          .id('row22')

        Row().width(100).height(100)
          .backgroundColor('#FF6633')
          .alignRules({
            left: {anchor: 'barrier11', align: HorizontalAlign.End},
            top: {anchor: 'row11', align: VerticalAlign.Top}
          } as AlignRuleOption)
          .id('row33')

        Row().width(50).height(50)
          .backgroundColor('#FF9966')
          .alignRules({
            left: {anchor: 'row11', align: HorizontalAlign.Start},
            top: {anchor: 'barrier22', align: VerticalAlign.Bottom}
          } as AlignRuleOption)
          .id('row44')
      }
      .key('RelativeContainerApi2')
      .width(300).height(300)
      .margin({left: 50} as Margin)
      .barrier([{id: 'barrier11', direction: BarrierDirection.RIGHT, referencedId:['row11', 'row22']} as BarrierStyle,
        {id: 'barrier22', direction: BarrierDirection.BOTTOM, referencedId:['row11', 'row22']} as BarrierStyle])
    }
    .height('100%')
  }
}