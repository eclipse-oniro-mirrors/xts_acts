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
  Select,
  AvoidanceMode,
  SelectOption,
  Font,
  SelectAttribute,
  AttributeModifier
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MyModifier implements AttributeModifier<SelectAttribute> {
  public isUndefined1: boolean = true;
  public isUndefined2: boolean = true;
  public isUndefined3: boolean = true;
  public isUndefined4: boolean = true;
  public isUndefined5: boolean = true;

  applyNormalAttribute(instance: SelectAttribute): void {
    instance
      .selected(this.isUndefined1 ? undefined : 2)
      .optionFont(this.isUndefined2 ? undefined : { size: 16, weight: 100 } as Font)
      .optionWidth(this.isUndefined3 ? undefined : '100px')
      .optionHeight(this.isUndefined4 ? undefined : '200px')
      .optionFontColor(this.isUndefined5 ? undefined : '#FFFF00FF')
  }
}

@Entry
@Component
struct Index {
  @State myModifier: MyModifier = new MyModifier();
  build() {
    Column({ space: 5 } as ColumnOptions) {
      Select([{ value: 'aaa', icon: $r('app.media.startIcon') },
        { value: 'bbb', icon: $r('app.media.startIcon') },
        { value: 'ccc', icon: $r('app.media.startIcon') }] as Array<SelectOption>)
        .id('SelectM_1')
        .attributeModifier(this.myModifier)

        .avoidance(AvoidanceMode.COVER_TARGET);
      Row() {
        Button('btn1 : ' + this.myModifier.isUndefined1)
          .id('SelectM_btn1')
          .onClick((e: ClickEvent) => {
            this.myModifier.isUndefined1 = !this.myModifier.isUndefined1
          })
        Button('btn2 : ' + this.myModifier.isUndefined2)
          .id('SelectM_btn2')
          .onClick((e: ClickEvent) => {
            this.myModifier.isUndefined2 = !this.myModifier.isUndefined2
          })
        Button('btn3 : ' + this.myModifier.isUndefined3)
          .id('SelectM_btn3')
          .onClick((e: ClickEvent) => {
            this.myModifier.isUndefined3 = !this.myModifier.isUndefined3
          })
      }

      Row() {
        Button('btn4 : ' + this.myModifier.isUndefined4)
          .id('SelectM_btn4')
          .onClick((e: ClickEvent) => {
            this.myModifier.isUndefined4 = !this.myModifier.isUndefined4
          })
        Button('btn5 : ' + this.myModifier.isUndefined5)
          .id('SelectM_btn5')
          .onClick((e: ClickEvent) => {
            this.myModifier.isUndefined5 = !this.myModifier.isUndefined5
          })
      }
    }
    .width('100%').height('100%')
  }
}