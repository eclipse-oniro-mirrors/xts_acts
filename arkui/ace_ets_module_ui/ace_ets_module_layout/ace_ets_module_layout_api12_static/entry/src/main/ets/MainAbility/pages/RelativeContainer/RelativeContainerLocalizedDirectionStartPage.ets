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
  Row,
  Color,
  LocalizedBarrierDirection,
  RelativeContainer,
  Button,
  AlignRuleOption,
  LocalizedBarrierStyle,
  Margin,
  BorderOptions,
  BarrierStyle,
  HorizontalAlign,
  VerticalAlign,
  BarrierDirection
} from '@ohos.arkui.component';

@Entry
@Component
struct RelativeContainerLocalizedDirectionStartPage {

  build() {
    Row() {
      RelativeContainer() {
        Button('A')
          .height(100)
          .width(100)
          .id('RelativeBarrierStartButton1')
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            right: { anchor: "__container__", align: HorizontalAlign.End }
          } as AlignRuleOption)

        Button('B')
          .height(100)
          .width(150)
          .id('RelativeBarrierStartButton2')
          .alignRules({
            top: { anchor: "RelativeBarrierStartButton1", align: VerticalAlign.Top },
            right: { anchor: "__container__", align: HorizontalAlign.End }
          } as AlignRuleOption)

        Button('C')
          .height(100)
          .width(100)
          .id('RelativeBarrierStartButton3')
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            right: { anchor: "barrier1", align: HorizontalAlign.Start }
          } as AlignRuleOption)


      }
      .id('RelativeBarrierLocalizedDirectionStart')
      .width(300)
      .height(300)
      .backgroundColor(Color.Grey)
      .margin({ left: 50 } as Margin)
      .barrier([
        {
          id: "barrier1",
          localizedDirection: LocalizedBarrierDirection.START,
          referencedId: ["RelativeBarrierStartButton1", "RelativeBarrierStartButton2"]
        }
      ] as Array<LocalizedBarrierStyle>)
    }
    .height('100%')
  }
}