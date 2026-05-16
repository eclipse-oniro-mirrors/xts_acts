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
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,RelativeContainer,VerticalAlign,HorizontalAlign,AlignRuleOption
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct IndexCom {
  build() {
    Row() {

      RelativeContainer() {
        Row()
          .width(100)
          .height(100)
          .backgroundColor("#FF3333")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "__container__", align: HorizontalAlign.Start },
            bias: { horizontal: 0, vertical: 0 }
          } as AlignRuleOption)
          .id("row1")
          .key("row1common")

        Row()
          .width(100)
          .height(100)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            right: { anchor: "__container__", align: HorizontalAlign.End }
          } as AlignRuleOption)
          .id("row2")
          .key("row2common")

        Row().height(100)
          .backgroundColor("#FF6633")
          .alignRules({
            top: { anchor: "row1", align: VerticalAlign.Bottom },
            left: { anchor: "row1", align: HorizontalAlign.End },
            right: { anchor: "row2", align: HorizontalAlign.Start }
          } as AlignRuleOption)
          .id("row3")

        Row()
          .backgroundColor("#FF9966")
          .alignRules({
            top: { anchor: "row3", align: VerticalAlign.Bottom },
            bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
            left: { anchor: "__container__", align: HorizontalAlign.Start },
            right: { anchor: "row1", align: HorizontalAlign.End }
          } as AlignRuleOption)
          .id("row4")

        Row()
          .backgroundColor("#FF66FF")
          .alignRules({
            top: { anchor: "row3", align: VerticalAlign.Bottom },
            bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
            left: { anchor: "row2", align: HorizontalAlign.Start },
            right: { anchor: "__container__", align: HorizontalAlign.End }
          } as AlignRuleOption)
          .id("row5")
      }
      .width(300).height(300)

    }
    .height('100%')
  }
}