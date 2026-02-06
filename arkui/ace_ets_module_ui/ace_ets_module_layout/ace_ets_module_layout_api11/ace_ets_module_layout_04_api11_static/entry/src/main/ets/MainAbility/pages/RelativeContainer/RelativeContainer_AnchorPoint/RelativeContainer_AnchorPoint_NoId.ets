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


import { MessageManager, Callback, Message } from './../../../common/MessageManager';
import { Entry, Component, Column,AlignRuleOption, HorizontalAlign, Row, RelativeContainer, Button, Text, Color, VerticalAlign } from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct RelativeContainer_AnchorPoint_NoId {
  onPageShow() {
    console.info('RelativeContainer_AnchorPoint_NoId onPageShow');
  }

  build() {
    Row() {
      RelativeContainer() {
        Row()
          .width(100)
          .height(100)
          .backgroundColor("#FF3333")
          .alignRules({
            left: { anchor: "__container__", align: HorizontalAlign.Start },
            top: { anchor: "__container__", align: VerticalAlign.Top }
          } as AlignRuleOption)
          .key("RelativeContainer_AnchorPoint_NoId_row1")
          .id("RelativeContainer_AnchorPoint_NoId_row1")

        Row()
          .width(100)
          .height(100)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            right: { anchor: "__container__", align: HorizontalAlign.End }
          } as AlignRuleOption)
          .key("RelativeContainer_AnchorPoint_NoId_row2")
        
      }
      .key("RelativeContainer_AnchorPoint_NoId_r1")
      .width(300).height(300)
      .border({ color: "#6699FF" })
    }
    .height('100%')
  }
}