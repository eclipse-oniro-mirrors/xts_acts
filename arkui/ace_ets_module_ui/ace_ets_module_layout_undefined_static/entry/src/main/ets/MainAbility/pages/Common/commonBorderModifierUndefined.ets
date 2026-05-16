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

import {  Entry,  Text,  Column,  ColumnOptions,  Component,  Button,  ClickEvent,  Color,  Row,  $r,
  BorderOptions,  BorderStyle,  AttributeModifier,  ButtonAttribute, TextAlign, GradientDirection, RepeatMode,
  BorderImageOption, TextAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MyModifier1 implements AttributeModifier<ButtonAttribute> {
  public isUndefined1: boolean = true;

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance
      .border(this.isUndefined1 ? undefined : { width: 5.0 } as BorderOptions)
  }
}

@Observed
export class MyModifier2 implements AttributeModifier<ButtonAttribute> {
  public isUndefined2: boolean = true;
  public isUndefined3: boolean = true;
  public isUndefined4: boolean = true;
  public isUndefined5: boolean = true;
  public isUndefined6: boolean = true;
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance
      .borderStyle(this.isUndefined2 ? undefined : BorderStyle.Dashed)
      .borderWidth(this.isUndefined3 ? undefined : 3.0)
      .borderColor(this.isUndefined4 ? undefined : Color.Red)
      .borderRadius(this.isUndefined5 ? undefined : 5.0)
      .borderImage(this.isUndefined6 ? undefined : {
        source: {
          angle: 90,
          direction: GradientDirection.Left,
          colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]]
        },
        slice: '10px',
        width: '10px',
        repeat: RepeatMode.Stretch,
        fill: false
      } as BorderImageOption)
  }
}

@Entry
@Component
struct Index {
  @State myModifier1: MyModifier1 = new MyModifier1();
  @State myModifier2: MyModifier2 = new MyModifier2();
  @State myModifier3: MyModifier2 = new MyModifier2();

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button('border1')
        .id('BorderM_1')
        .attributeModifier(this.myModifier1)
      Button('border2')
        .id('BorderM_2')
        .attributeModifier(this.myModifier2)
      Button('This is gradient color.')
        .id('BorderM_3')
        .attributeModifier(this.myModifier3)

      Row() {
        Button('btn1 : ' + this.myModifier1.isUndefined1)
          .id('BorderM_btn1')
          .onClick((e: ClickEvent) => {
            this.myModifier1.isUndefined1 = !this.myModifier1.isUndefined1
          })
        Button('btn2 : ' + this.myModifier2.isUndefined2)
          .id('BorderM_btn2')
          .onClick((e: ClickEvent) => {
            this.myModifier2.isUndefined2 = !this.myModifier2.isUndefined2
          })
        Button('btn3 : ' + this.myModifier2.isUndefined3)
          .id('BorderM_btn3')
          .onClick((e: ClickEvent) => {
            this.myModifier2.isUndefined3 = !this.myModifier2.isUndefined3
          })
      }

      Row() {
        Button('btn4 : ' + this.myModifier2.isUndefined4)
          .id('BorderM_btn4')
          .onClick((e: ClickEvent) => {
            this.myModifier2.isUndefined4 = !this.myModifier2.isUndefined4
          })
        Button('btn5 : ' + this.myModifier2.isUndefined5)
          .id('BorderM_btn5')
          .onClick((e: ClickEvent) => {
            this.myModifier2.isUndefined5 = !this.myModifier2.isUndefined5
          })
        Button('btn6 : ' + this.myModifier3.isUndefined6)
          .id('BorderM_btn6')
          .onClick((e: ClickEvent) => {
            this.myModifier3.isUndefined6 = !this.myModifier3.isUndefined6
          })
      }
    }
  }
}