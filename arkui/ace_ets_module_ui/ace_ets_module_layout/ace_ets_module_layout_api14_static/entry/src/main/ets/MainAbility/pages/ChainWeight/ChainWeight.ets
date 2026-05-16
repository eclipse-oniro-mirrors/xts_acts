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
  RelativeContainer,
  HorizontalAlign,
  Axis,
  ChainStyle,
  FlexAlign,
  AlignRuleOption
} from '@ohos.arkui.component';

@Entry
@Component
struct ChainWeight {
  build() {
    Row() {
      RelativeContainer() {
        Row() {
          Text('row1')
        }
        .id('row1')
        .justifyContent(FlexAlign.Center)
        .width(100)
        .height(100)
        .backgroundColor('#FF3333')
        .alignRules({
          left: { anchor: '__container__', align: HorizontalAlign.Start },
          right: { anchor: 'row2', align: HorizontalAlign.Start }
        } as AlignRuleOption)
        .chainMode(Axis.Horizontal, ChainStyle.PACKED)
        .chainWeight({ horizontal: 2 })

        Row() {
          Text('row2')
        }
        .id('row2')
        .justifyContent(FlexAlign.Center)
        .width(100)
        .height(100)
        .backgroundColor('#FFCC00')
        .alignRules({
          left: { anchor: 'row1', align: HorizontalAlign.End },
          right: { anchor: '__container__', align: HorizontalAlign.End }
        } as AlignRuleOption)
        .chainWeight({ horizontal: 1 })
      }
      .width(300).height(300)
      .margin({ left: 50 } as Margin)
      .border({ width: 2, color: '#6699FF' })
    }
    .height('100%')
  }
}