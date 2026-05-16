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
import {AttributeModifier, CommonAttribute, Stack, Row, Alignment, VerticalAlign, HorizontalAlign, RelativeContainer,
  Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MySelectModifier implements AttributeModifier<CommonAttribute> {
  public flag : boolean = true;
  applyNormalAttribute(instance: CommonAttribute): void {
    instance.align(this.flag ? Alignment.TopStart : undefined);
  }
}

@Entry
@Component
struct Align {
  @State message: string = 'Hello World';
  @State modifier: MySelectModifier = new MySelectModifier()
  // @State modifier1: MySelectModifier1 = new MySelectModifier1()

  build() {
    Column() {
      Column() {
        Text('align').fontSize(9).fontColor('#ffcccccc').width('90%')
        Stack() {
          Text('First show in bottom end')
          // .backgroundColor(0xD2B48C)
        }
        .width('90%')
        .height(50)
        .margin(5)
        .borderColor('#FFFFE4C4')
        .borderWidth(2)
        // .backgroundColor(0xFFE4C4)
        .id('common_align_undefined')
        .attributeModifier(this.modifier)



        Column() {
          Button('flag is' + this.modifier.flag).fontSize(20).id('changeButton')
            .onClick((e: ClickEvent) => {
              this.modifier.flag = !this.modifier.flag;
            })
        }
      }
    }
  }
}