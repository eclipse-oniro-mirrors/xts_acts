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
import {BorderStyle,TextAlign,Position,List,AttributeModifier, CommonAttribute, Stack, Row, Alignment, VerticalAlign,
  HorizontalAlign, RelativeContainer, Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MySelectModifier implements AttributeModifier<CommonAttribute> {
  public flag : boolean = true;
  applyNormalAttribute(instance: CommonAttribute): void {
    instance.position(this.flag ? ({ x: 30, y: 10 } as Position) :undefined)
  }
}

@Entry
@Component
struct Align {
  @State message: string = 'Hello World';
  @State modifier: MySelectModifier = new MySelectModifier()
  @State curWidth: number = 300.8;

  build() {
    Column() {
      Column() {
        List() {
          Text('position-动态切换(undefined/position(30,10))')
            .fontSize(20)
            .margin(15)
            .width('90%')
          Row() {
            Text('1').size({ width: '30%', height: '50' })
              .backgroundColor('#ffdeb887')
              .border({ width: 1 })
              .fontSize(16)
              .textAlign(TextAlign.Center)
            Text('2 ' + (this.modifier.flag ? 'position(30,10)' : '无position' ))
              .size({ width: '60%', height: '30' })
              .backgroundColor('#ffbbb2cb')
              .border({ width: 1 })
              .fontSize(16)
              .align(Alignment.Start)
              .id('MyText2')
              .attributeModifier(this.modifier)
          }.width('90%').height(100).border({ width: 1, style: BorderStyle.Dashed })
        }

        Column() {
          Button('flag is' + this.modifier.flag).fontSize(20).id('Common_Position')
            .onClick((e: ClickEvent) => {
              this.modifier.flag = !this.modifier.flag;
            })
        }
      }
    }
  }
}