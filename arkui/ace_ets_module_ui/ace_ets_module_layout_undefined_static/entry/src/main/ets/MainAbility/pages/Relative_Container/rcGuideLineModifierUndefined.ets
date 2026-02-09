'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {  Entry,  Text,  Column,  Component,  Button,  ClickEvent,  Color,  Stack,  Alignment,  Scroll,
  TextAlign,  Builder,  ForEach,  Row,  TransitionType,  ColumnOptions,  SizeOptions,  GuideLineStyle,
  Ellipse,  AttributeModifier,  Divider,  VerticalAlign,  RelativeContainer,  Axis,  AlignRuleOption,
  FlexAlign,  HorizontalAlign } from '@ohos.arkui.component'
import { $r } from '@ohos.arkui.component'
import { State ,Observed} from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct Example {
  @State isUndefined: boolean = false;
  build() {
    Column() {
      RelativeContainer() {
        Row()
          .width(20)
          .height(50)
          .backgroundColor('#a3cf62')
          .alignRules({
            left: { anchor: 'guideline1', align: HorizontalAlign.End },
            top: { anchor: 'guideline2', align: VerticalAlign.Top }
          } as AlignRuleOption)
          .id('row4')
      }
      .width(80)
      .height(80)
      .border({ width: 2, color: '#6699FF' })
      .guideLine(this.isUndefined ? undefined :
        ([{ id: 'guideline1', direction: Axis.Vertical, position: { start: 5 } } as GuideLineStyle,
          {
            id: 'guideline2',
            direction: Axis.Horizontal,
            position: { start: 5 }
          } as GuideLineStyle]) as Array<GuideLineStyle>)
      .id('relativeContainer_guideLine')

      Divider()

      Button(this.isUndefined ? 'isUndefined = true' : 'isUndefined = false')
        .onClick(() => {
          this.isUndefined = !this.isUndefined
          }
        ).id('changeButton')
    }.width('100%')
  }
}