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
import {Divider,Position,AttributeModifier, CommonAttribute, Stack, Row, Alignment, VerticalAlign,
  HorizontalAlign, RelativeContainer, Entry, Text, Column, Component, Button,
  ClickEvent } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MySelectModifier implements AttributeModifier<CommonAttribute> {
  public flag : boolean = true;
  applyNormalAttribute(instance: CommonAttribute): void {
    instance.markAnchor(this.flag ? undefined  : { x: -50, y: -0 } as Position  )
  }
}

@Entry
@Component
struct MarkAnchor {
  @State message: string = 'Hello World';
  @State modifier: MySelectModifier = new MySelectModifier()

  build() {
    Column() {
      Column() {
        Text('markAnchor-动态切换').fontSize(20).margin(15).width('90%')
        Button('Button')
          .fontSize(50)
          .attributeModifier(this.modifier)
          .id('common_markAnchor')
        Divider()
        Button('flag is' + this.modifier.flag).fontSize(20).id('changeButton')
          .onClick((e: ClickEvent) => {
            this.modifier.flag = !this.modifier.flag;
          })
      }
    }
  }
}