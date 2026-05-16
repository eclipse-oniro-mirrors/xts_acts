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
  Flex,
  ItemAlign,
  FlexDirection,
  FlexAttribute,
  Text,
  Column,
  Row,
  Component,
  Button,
  ClickEvent,
  OffsetOptions,
  TextPicker,
  FontWeight,
  TextOverflow,
  Margin,
  DividerOptions,
  ColumnOptions,
  FlexAlign,
  HorizontalAlign,
  Scroll,
  BarState,
  CrownSensitivity,
  CheckboxGroup,
  Checkbox,
  CheckBoxShape,
  MarkStyle,
  Color,
  CheckboxGroupResult
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct Index {
  @State checkboxGroupSelectAllFlag: boolean = true;
  @State checkboxGroupSelectedColorFlag: boolean = true;
  @State checkboxGroupUnSelectedColorFlag: boolean = true;
  @State checkboxGroupCheckboxShapeFlag: boolean = true;
  @State checkboxGroupMarkFlag: boolean = true;
  @State checkboxGroupOnChangeFlag: boolean = true;
  @State onChangeText: string = '-1';

  build() {
    Scroll() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        CheckboxGroup({ group: 'checkboxGroup4' })
          .id('checkboxGroup_id1')
          .selectAll(this.checkboxGroupSelectAllFlag ? undefined : true)
          .selectedColor(this.checkboxGroupSelectedColorFlag ? undefined: '#ff00ffea')
          .unselectedColor(this.checkboxGroupUnSelectedColorFlag ? undefined: '#ffa600ff')
          .checkboxShape(this.checkboxGroupCheckboxShapeFlag ? undefined : CheckBoxShape.ROUNDED_SQUARE)
          .mark(this.checkboxGroupMarkFlag ? undefined : {
            strokeColor:Color.Red,
            size: 80,
            strokeWidth: 15
          } as MarkStyle)
          .onChange(this.checkboxGroupOnChangeFlag ? undefined : (itemName: CheckboxGroupResult) => {
              this.onChangeText = 'onChange';
          })
        Checkbox({ name: 'checkbox1', group: 'checkboxGroup4' })
          .id('checkboxGroup_checkbox1')
        Checkbox({ name: 'checkbox2', group: 'checkboxGroup4' })
        Checkbox({ name: 'checkbox3', group: 'checkboxGroup4' })
        Text('onChange Text is ' + this.onChangeText)
          .id('checkboxGroupOnChange_Text')
          .fontSize(20)
        Button('reset_Text')
          .id('checkboxGroup_text_resetBtn')
          .onClick((e: ClickEvent) => {
            this.onChangeText = '-1';
          })

        Button('切换 selectAll → ' + (this.checkboxGroupSelectAllFlag ? 'undefined' : 'true'))
          .id('checkboxGroupSelectAll_Btn')
          .height('5%')
          .onClick(() => {
            this.checkboxGroupSelectAllFlag = !this.checkboxGroupSelectAllFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 selectedColor → ' + (this.checkboxGroupSelectedColorFlag ? 'undefined' : '#ff00ffea'))
          .id('checkboxGroupSelectedColor_Btn')
          .height('5%')
          .onClick(() => {
            this.checkboxGroupSelectedColorFlag = !this.checkboxGroupSelectedColorFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 unselectedColor → ' + (this.checkboxGroupUnSelectedColorFlag ? 'undefined' : '#ffa600ff'))
          .id('checkboxGroupUnSelectedColor_Btn')
          .height('5%')
          .onClick(() => {
            this.checkboxGroupUnSelectedColorFlag = !this.checkboxGroupUnSelectedColorFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 checkboxShape → ' + (this.checkboxGroupCheckboxShapeFlag ? 'undefined' : 'CheckBoxShape.ROUNDED_SQUARE'))
          .id('checkboxGroupCheckboxShape_Btn')
          .height('5%')
          .onClick(() => {
            this.checkboxGroupCheckboxShapeFlag = !this.checkboxGroupCheckboxShapeFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 mark → ' + (this.checkboxGroupMarkFlag ? 'undefined' : 'markChange'))
          .id('checkboxGroupMark_Btn')
          .height('5%')
          .onClick(() => {
            this.checkboxGroupMarkFlag = !this.checkboxGroupMarkFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 onChange → ' + (this.checkboxGroupOnChangeFlag ? 'undefined' : 'onChange'))
          .id('checkboxGroupOnChange_Btn')
          .height('5%')
          .onClick(() => {
            this.checkboxGroupOnChangeFlag = !this.checkboxGroupOnChangeFlag
          }).margin({ top: 5 } as Margin)

      }
      .width('100%')
    }
    .scrollBar(BarState.On)
  }
}