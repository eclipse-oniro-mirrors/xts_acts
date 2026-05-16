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
  Dimension,
} from '@ohos.arkui.component'
import { TextModifier } from '@ohos.arkui.modifier'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'


@Entry
@Component
struct Index {
  @State isUndefined1: boolean = true;
  @State isUndefined2: boolean = true;
  @State isUndefined3: boolean = true;
  @State isUndefined4: boolean = true;
  @State isUndefined5: boolean = true;
  @State isUndefined6: boolean = true;

  @State cnt: int = 0
  @State optionTextModifier: TextModifier = new TextModifier().fontColor(Color.Pink);

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Select([{ value: 'aaa', icon: $r('app.media.startIcon') },
        { value: 'bbb', icon: $r('app.media.startIcon') },
        { value: 'ccc', icon: $r('app.media.startIcon') }] as Array<SelectOption>)
        .id('Select_1')
        .selected(this.isUndefined1 ? undefined : 2)
        .optionFont(this.isUndefined2 ? undefined : { size: 16, weight: 100 } as Font)
        .optionWidth(this.isUndefined3 ? undefined : '100px')
        .optionHeight(this.isUndefined4 ? undefined : '100px')
        .optionFontColor(this.isUndefined5 ? undefined : '#FFFF00FF')
        .avoidance(AvoidanceMode.COVER_TARGET);
      Select([{ value: 'aaa', icon: $r('app.media.startIcon') },
        { value: 'bbb', icon: $r('app.media.startIcon') },
        { value: 'ccc', icon: $r('app.media.startIcon') }] as Array<SelectOption>)
        .id('Select_2')
        .optionTextModifier(this.isUndefined6 ? undefined : this.optionTextModifier)
      Row() {
        Button('btn1 : ' + this.isUndefined1)
          .id('Select_btn1')
          .onClick((e: ClickEvent) => {
            this.isUndefined1 = !this.isUndefined1
          })
        Button('btn2 : ' + this.isUndefined2)
          .id('Select_btn2')
          .onClick((e: ClickEvent) => {
            this.isUndefined2 = !this.isUndefined2
          })
        Button('btn3 : ' + this.isUndefined3)
          .id('Select_btn3')
          .onClick((e: ClickEvent) => {
            this.isUndefined3 = !this.isUndefined3
          })
      }

      Row() {
        Button('btn4 : ' + this.isUndefined4)
          .id('Select_btn4')
          .onClick((e: ClickEvent) => {
            this.isUndefined4 = !this.isUndefined4
          })
        Button('btn5 : ' + this.isUndefined5)
          .id('Select_btn5')
          .onClick((e: ClickEvent) => {
            this.isUndefined5 = !this.isUndefined5
          })
        Button('btn6 : ' + this.isUndefined6)
          .id('Select_btn6')
          .onClick((e: ClickEvent) => {
            this.isUndefined6 = !this.isUndefined6
          })
      }
    }
    .width('100%').height('100%')
  }
}