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
struct RelativeGuideLine5 {
  build() {
    Column() {
      RelativeContainer() {
        Button('top')
          .alignRules({
            top: { anchor: "guideLine1", align: VerticalAlign.Top },
            left: { anchor: "guideLine2", align: HorizontalAlign.Start },
            bottom: { anchor: "guideLine3", align: VerticalAlign.Top },
            right: { anchor: "guideLine4", align: HorizontalAlign.Start }
          } as AlignRuleOption)
          .key('RelButton5')

      }
      .key('RelativeGuideLine5')
      .width(300)
      .height(300)
      .margin({ left: 50, top: 100 } as Margin)
      .backgroundColor(Color.Grey)
      .guideLine([
        { id: "guideLine1", direction: Axis.Horizontal, position: { start: 100 } },
        { id: "guideLine2", direction: Axis.Vertical, position: { start: 100 } },
        { id: "guideLine3", direction: Axis.Horizontal, position: { end: 100 } },
        { id: "guideLine4", direction: Axis.Vertical, position: { end: 100 } }

      ])

    }
    .height('100%')
  }
}