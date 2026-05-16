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
import {PixelRoundCalcPolicy, PixelRoundPolicy,List,AttributeModifier, CommonAttribute, Stack, Row, Alignment,
  VerticalAlign, HorizontalAlign, RelativeContainer, Entry, Text, Column, Component,
  Button, ClickEvent } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MySelectModifier implements AttributeModifier<CommonAttribute> {
  public flag : boolean = true;
  applyNormalAttribute(instance: CommonAttribute): void {
    instance.pixelRound(this.flag ? ({
      start: PixelRoundCalcPolicy.FORCE_CEIL,
      end: PixelRoundCalcPolicy.FORCE_CEIL
    } as PixelRoundPolicy) : undefined)
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
          Text(`pixelRound-动态切换(undefined/NO_FORCE_ROUND) 宽度:${this.curWidth.toFixed(1)}px`)
            .fontSize(20)
            .margin(15)
            .width('90%')
          Row() {
            Row()
              .width('100%')
              .height('100%')
              .backgroundColor('rgb(255, 255, 0)')
              .attributeModifier(this.modifier)
          }
          .id('MyRow2')
          .width(`${this.curWidth}px`)
          .height('300.6px')
          .backgroundColor('rgb(255, 0, 0)')
          .attributeModifier(this.modifier)
        }
      }
      .width('100%')
      .padding(10)
      .margin(25)
    }


        Column() {
          Button('flag is' + this.modifier.flag).fontSize(20).id('Common_PixelRound')
            .onClick((e: ClickEvent) => {
              this.modifier.flag = !this.modifier.flag;
            })
        }
      }
}