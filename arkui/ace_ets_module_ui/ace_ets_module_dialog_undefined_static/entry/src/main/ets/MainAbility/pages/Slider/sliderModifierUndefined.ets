'use static';
/*
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
  Entry,
  Text,
  Column,
  ColumnOptions,
  Component,
  Button,
  ClickEvent,
  Color,
  Row,
  $r,
  Radio,
  RadioStyle,
  RowOptions,
  Slider,
  SliderOptions,
  SliderStyle,
  SliderAttribute,
  AttributeModifier
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MyModifier implements AttributeModifier<SliderAttribute> {
  public isUndefined1: boolean = true;
  public isUndefined2: boolean = true;
  public isUndefined3: boolean = true;
  public isUndefined4: boolean = true;
  public isUndefined5: boolean = true;

  applyNormalAttribute(instance: SliderAttribute): void {
    instance
      .stepColor(this.isUndefined1 ? undefined : Color.Red)
      .stepSize(this.isUndefined2 ? undefined : '8vp')
      .trackBorderRadius(this.isUndefined3 ? undefined : '1vp')
      .trackColor(this.isUndefined4 ? undefined : '#FFFFCC00')
      .trackThickness(this.isUndefined5 ? undefined : '25vp')
  }
}

@Entry
@Component
struct Index {
  @State myModifier : MyModifier = new MyModifier();
  build() {
    Column({ space: 5 } as ColumnOptions) {
      Slider({
        value: 4,
        min: 0,
        max: 10,
        style: SliderStyle.InSet
      } as SliderOptions)
        .id('SliderM_1')
        .showSteps(true)
        .attributeModifier(this.myModifier)
      Row() {
        Button('btn1 : ' + this.myModifier.isUndefined1)
          .id('SliderM_btn1')
          .onClick((e: ClickEvent) => {
            this.myModifier.isUndefined1 = !this.myModifier.isUndefined1
          })
        Button('btn2 : ' + this.myModifier.isUndefined2)
          .id('SliderM_btn2')
          .onClick((e: ClickEvent) => {
            this.myModifier.isUndefined2 = !this.myModifier.isUndefined2
          })
        Button('btn3 : ' + this.myModifier.isUndefined3)
          .id('SliderM_btn3')
          .onClick((e: ClickEvent) => {
            this.myModifier.isUndefined3 = !this.myModifier.isUndefined3
          })
      }

      Row() {

        Button('btn4 : ' + this.myModifier.isUndefined4)
          .id('SliderM_btn4')
          .onClick((e: ClickEvent) => {
            this.myModifier.isUndefined4 = !this.myModifier.isUndefined4
          })

        Button('btn5 : ' + this.myModifier.isUndefined5)
          .id('SliderM_btn5')
          .onClick((e: ClickEvent) => {
            this.myModifier.isUndefined5 = !this.myModifier.isUndefined5
          })
      }
    }
    .width('100%').height('100%')
  }
}