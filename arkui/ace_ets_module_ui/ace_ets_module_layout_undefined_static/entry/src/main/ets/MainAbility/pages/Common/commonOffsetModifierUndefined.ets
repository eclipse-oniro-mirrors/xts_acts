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
import {Position,AttributeModifier, CommonAttribute, Stack, Row, Alignment, VerticalAlign, HorizontalAlign,
  RelativeContainer, Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MySelectModifier implements AttributeModifier<CommonAttribute> {
  public flag : boolean = true;
  applyNormalAttribute(instance: CommonAttribute): void {
    instance.offset(this.flag ? { x: 15, y: 30 } as Position : undefined)
  }
}

@Entry
@Component
struct Align {
  @State message: string = 'Hello World';
  @State modifier: MySelectModifier = new MySelectModifier()

  build() {
    Column() {
      Column() {
        Text('1' + (this.modifier.flag ? '无offset' : 'offset(15,30)'))
          .size({ width: 120, height: 50 })
          .backgroundColor('#ffbbb2cb')
          .border({ width: 1 })
          .fontSize(16)
          .align(Alignment.Start)
          .id('MyText1')
          .attributeModifier(this.modifier)


        Column() {
          Button('flag is' + this.modifier.flag).fontSize(20).id('Common_Offset')
            .onClick((e: ClickEvent) => {
              this.modifier.flag = !this.modifier.flag;
            })
        }
      }
    }
  }
}