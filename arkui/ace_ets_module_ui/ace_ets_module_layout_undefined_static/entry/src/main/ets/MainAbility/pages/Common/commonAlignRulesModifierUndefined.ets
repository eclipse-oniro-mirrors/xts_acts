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
import {AttributeModifier, CommonAttribute, LocalizedAlignRuleOptions, AlignRuleOption, FlexAlign, Stack, Row,
  Alignment, VerticalAlign, HorizontalAlign, RelativeContainer, Entry, Text, Column, Component, Button,
  ClickEvent } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MySelectModifier implements AttributeModifier<CommonAttribute> {
  public isNum: int = 0;
  public flag : boolean = true;
  applyNormalAttribute(instance: CommonAttribute): void {
    instance.alignRules(this.flag ? {
      top: { anchor: '__container__', align: VerticalAlign.Top },
      right: { anchor: '__container__', align: HorizontalAlign.End }
    } as AlignRuleOption : undefined)
  }
}

@Entry
@Component
struct Index {
  @State modifier: MySelectModifier = new MySelectModifier()

  build() {
    Column() {
        RelativeContainer() {
          Row() {
            Text('row1')
          }
          .justifyContent(FlexAlign.Center)
          .width(100)
          .height(100)
          .borderColor('#ffa3cf62')
          .borderWidth(2)
          .backgroundColor('#a3cf62')
          .alignRules({
            top: { anchor: '__container__', align: VerticalAlign.Top },
            left: { anchor: '__container__', align: HorizontalAlign.Start }
          } as AlignRuleOption)
          .id('MyRow1')

          Row() {
            Text('row2')
          }
          .justifyContent(FlexAlign.Center)
          .width(100)
          .height(100)
          .borderColor('#ff00ae9d')
          .borderWidth(2)
          .backgroundColor('#00ae9d')
          .attributeModifier(this.modifier)
          .id('MyRow2')
        }
        .width(300).height(100)
        .margin(50)
        .border({ width: 2, color: '#6699FF' })

      Column() {
        Button('flag is' + this.modifier.flag).fontSize(20).id('Common_AlignRules')
          .onClick((e: ClickEvent) => {
            this.modifier.flag = !this.modifier.flag;
          })
      }
    }
    .height('100%')
  }
}