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
import {
  Entry, Text, Column, Component, Button, ClickEvent, Color, Stack,Alignment,Scroll,
  TextAlign, Builder, ForEach, Row, TransitionType, ColumnOptions, SizeOptions, GuideLineStyle,
  AttributeModifier, Divider, VerticalAlign, LocalizedBarrierDirection,  LocalizedBarrierStyle,
  RelativeContainer, Axis, AlignRuleOption, FlexAlign, HorizontalAlign, Margin, BarrierStyle, BarrierDirection,
  $r, RelativeContainerAttribute  } from '@ohos.arkui.component'

import { State ,Observed} from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class BarrierModifierTest implements AttributeModifier<RelativeContainerAttribute> {
  public isUndefined: boolean = false;
  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    instance
      .barrier(this.isUndefined ? undefined :
        [{ id: 'barrier1', direction: BarrierDirection.RIGHT, referencedId: ['row1', 'row2'] } as BarrierStyle,
          {
            id: 'barrier2',
            direction: BarrierDirection.BOTTOM,
            referencedId: ['row1', 'row2']
          } as BarrierStyle] as Array<BarrierStyle>)
  }
}
@Observed
export class BarrierLocalizedModifierTest implements AttributeModifier<RelativeContainerAttribute> {
  public isUndefined: boolean = false;
  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    instance
      .barrier(this.isUndefined ? undefined :
        [{ id: 'barrier11', localizedDirection: LocalizedBarrierDirection.START, referencedId: ['row11', 'row12'] },
          {
            id: 'barrier12',
            localizedDirection: LocalizedBarrierDirection.TOP,
            referencedId: ['row11', 'row12']
          }] as Array<LocalizedBarrierStyle>)
  }
}

@Entry
@Component
struct ExampleM {
  @State modifier0:BarrierModifierTest = new BarrierModifierTest()
  @State modifier1:BarrierLocalizedModifierTest = new BarrierLocalizedModifierTest()
  build() {
    Column() {
      Text('barrier:').fontSize(20)
      RelativeContainer() {
        Row() {
        }
        .justifyContent(FlexAlign.Center)
        .width(50)
        .height(50)
        .backgroundColor('#a3cf62')
        .id('row1')

        Row() {
        }
        .justifyContent(FlexAlign.Center)
        .width(50)
        .height(50)
        .backgroundColor('#00ae9d')
        .alignRules({
          middle: { anchor: 'row1', align: HorizontalAlign.End },
          top: { anchor: 'row1', align: VerticalAlign.Bottom }
        } as AlignRuleOption)
        .id('row2')

        Row() {
        }
        .justifyContent(FlexAlign.Center)
        .width(50)
        .height(50)
        .backgroundColor('#0a59f7')
        .alignRules({
          left: { anchor: 'barrier1', align: HorizontalAlign.End },
          top: { anchor: 'row1', align: VerticalAlign.Top }
        } as AlignRuleOption)
        .id('row3')

        Row() {
        }
        .justifyContent(FlexAlign.Center)
        .width(25)
        .height(25)
        .backgroundColor('#da2ce0')
        .alignRules({
          left: { anchor: 'row1', align: HorizontalAlign.Start },
          top: { anchor: 'barrier2', align: VerticalAlign.Bottom }
        } as AlignRuleOption)
        .id('row4')
      }
      .width(150)
      .height(150)
      .border({ width: 2, color: '#6699FF' })
      .attributeModifier(this.modifier0)
      .id('relativeContainer_barrier')

      Divider()
      Button(this.modifier0.isUndefined ? 'barrier isUndefined = true' : 'isUndefined = false')
        .onClick(() => {
          this.modifier0.isUndefined= !this.modifier0.isUndefined
        }
        ).id('changeButton1')

      Text('barrier_localized:').fontSize(20)
      RelativeContainer() {
        Row() {
        }
        .justifyContent(FlexAlign.Center)
        .width(50)
        .height(50)
        .backgroundColor('#a3cf62')
        .id('row11')

        Row() {
        }
        .justifyContent(FlexAlign.Center)
        .width(50)
        .height(50)
        .backgroundColor('#00ae9d')
        .alignRules({
          middle: { anchor: 'row11', align: HorizontalAlign.End },
          top: { anchor: 'row11', align: VerticalAlign.Bottom }
        } as AlignRuleOption)
        .id('row12')

        Row() {
        }
        .justifyContent(FlexAlign.Center)
        .width(50)
        .height(50)
        .backgroundColor('#0a59f7')
        .alignRules({
          left: { anchor: 'barrier11', align: HorizontalAlign.End },
          top: { anchor: 'row11', align: VerticalAlign.Top }
        } as AlignRuleOption)
        .id('row13')

        Row() {
        }
        .justifyContent(FlexAlign.Center)
        .width(25)
        .height(25)
        .backgroundColor('#da2ce0')
        .alignRules({
          left: { anchor: 'row11', align: HorizontalAlign.Start },
          top: { anchor: 'barrier12', align: VerticalAlign.Bottom }
        } as AlignRuleOption)
        .id('row14')
      }
      .width(150)
      .height(150)
      .border({ width: 2, color: '#6699FF' })
      .attributeModifier(this.modifier1)
      .id('relativeContainer_barrier_localized')

      Divider()
      Button(this.modifier1.isUndefined ? 'barrier isUndefined = true' : 'isUndefined = false')
        .onClick(() => {
          this.modifier1.isUndefined = !this.modifier1.isUndefined
        }
        ).id('changeButton2')
    }
  }
}