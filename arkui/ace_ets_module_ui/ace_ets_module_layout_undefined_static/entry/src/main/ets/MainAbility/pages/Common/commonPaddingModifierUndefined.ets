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
import {Color,List,Padding,AttributeModifier, CommonAttribute, Stack, Row, Alignment, VerticalAlign, HorizontalAlign,
  RelativeContainer, Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MySelectModifier implements AttributeModifier<CommonAttribute> {
  public flag : boolean = true;
  applyNormalAttribute(instance: CommonAttribute): void {
    instance.padding(this.flag ? ({ top: 5, left: 10, bottom: 15, right: 20 } as Padding) : undefined )
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
        List() {
          Text('padding-动态切换(undefined/padding(10))')
            .fontSize(20)
            .margin(15)
            .width('90%')
          Row() {
            Row() {
              Row()
                .size({ width: '100%', height: '100%' })
                .backgroundColor(Color.Yellow)
            }
            .width(80)
            .height(80)
            .id('MyRow1')
            .attributeModifier(this.modifier)
            .margin(20)
            .backgroundColor(Color.White)
          }.backgroundColor(Color.Blue)
          .width('90%')

        }


        Column() {
          Button('flag is' + this.modifier.flag).fontSize(20).id('Common_Padding')
            .onClick((e: ClickEvent) => {
              this.modifier.flag = !this.modifier.flag;
            })
        }
      }
    }
  }
}