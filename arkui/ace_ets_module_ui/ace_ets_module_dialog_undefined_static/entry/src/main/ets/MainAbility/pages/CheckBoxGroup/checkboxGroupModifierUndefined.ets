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
  FlexAlign,
  ItemAlign,
  FlexDirection,
  Column,
  Component,
  Button,
  ClickEvent,
  Color,
  ColumnOptions,
  RowOptions,
  Row,
  Text,
  AttributeModifier,
  Checkbox,
  CheckboxGroup,
  CheckboxGroupAttribute,
  CheckBoxShape,
  CheckboxGroupResult,
  Margin,
  MarkStyle
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'

@Observed
export class MyCheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  public checkboxGroupCheckboxShapeMFlag : Boolean = true;
  public checkboxGroupMarkMFlag: Boolean = true;
  public checkboxGroupOnChangeMFlag: Boolean = true;
  public checkboxGroupSelectAllMFlag: Boolean = true;
  public checkboxGroupSelectedColorMFlag: Boolean = true;
  public checkboxGroupUnSelectedColorMFlag: Boolean = true;
  public onChangeText: string = '-1';
  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    instance
      .checkboxShape(this.checkboxGroupCheckboxShapeMFlag ? undefined : CheckBoxShape.ROUNDED_SQUARE)
      .mark(this.checkboxGroupMarkMFlag ? undefined : {
        strokeColor:Color.Red,
        size: 80,
        strokeWidth: 15
      } as MarkStyle)
      .onChange(this.checkboxGroupOnChangeMFlag ? undefined : (itemName: CheckboxGroupResult) => {
         this.onChangeText = 'onChange';
      })
      .selectAll(this.checkboxGroupSelectAllMFlag ? undefined : true)
      .selectedColor(this.checkboxGroupSelectedColorMFlag ? undefined : Color.Orange)
      .unselectedColor(this.checkboxGroupUnSelectedColorMFlag ? undefined : Color.Pink)
  }
}

@Entry
@Component
struct Index {
  @State modifier:MyCheckboxGroupModifier = new MyCheckboxGroupModifier()

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      CheckboxGroup({ group: 'checkboxGroup6' })
        .id('checkboxGroup_M_id1')
        .attributeModifier(this.modifier)
      Checkbox({ name: 'checkbox1', group: 'checkboxGroup6' })
        .id('checkboxGroup_M_checkbox1')
      Checkbox({ name: 'checkbox2', group: 'checkboxGroup6' })
      Checkbox({ name: 'checkbox3', group: 'checkboxGroup6' })

      Text('checkboxGroupMChangeText is ' + this.modifier.onChangeText)
        .id('checkboxGroup_onChange_M_Text')
        .fontSize(20)

      Column({ space: 5 } as ColumnOptions) {
        Button('reset_Text')
          .id('checkboxGroupOnChange_M_resetBtn')
          .onClick((e: ClickEvent) => {
            this.modifier.onChangeText = '-1';
          })

        Button('切换 selectAll → ' + (this.modifier.checkboxGroupSelectAllMFlag ? 'undefined' : 'true'))
          .id('checkboxGroupSelectAllM_Btn')
          .height('5%')
          .onClick(() => {
            this.modifier.checkboxGroupSelectAllMFlag = !this.modifier.checkboxGroupSelectAllMFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 selectedColor → ' + (this.modifier.checkboxGroupSelectedColorMFlag ? 'undefined' : 'Color.Orange'))
          .id('checkboxGroupSelectedColorM_Btn')
          .height('5%')
          .onClick(() => {
            this.modifier.checkboxGroupSelectedColorMFlag = !this.modifier.checkboxGroupSelectedColorMFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 unselectedColor → ' + (this.modifier.checkboxGroupUnSelectedColorMFlag ? 'undefined' : '#ffa600ff'))
          .id('checkboxGroupUnSelectedColorM_Btn')
          .height('5%')
          .onClick(() => {
            this.modifier.checkboxGroupUnSelectedColorMFlag = !this.modifier.checkboxGroupUnSelectedColorMFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 checkboxShape → ' + (this.modifier.checkboxGroupCheckboxShapeMFlag ? 'undefined' : 'CheckBoxShape.ROUNDED_SQUARE'))
          .id('checkboxGroupCheckboxShapeM_Btn')
          .height('5%')
          .onClick(() => {
            this.modifier.checkboxGroupCheckboxShapeMFlag = !this.modifier.checkboxGroupCheckboxShapeMFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 mark → ' + (this.modifier.checkboxGroupMarkMFlag ? 'undefined' : 'markChange'))
          .id('checkboxGroupMarkM_Btn')
          .height('5%')
          .onClick(() => {
            this.modifier.checkboxGroupMarkMFlag = !this.modifier.checkboxGroupMarkMFlag
          }).margin({ top: 5 } as Margin)
        Button('切换 onChange → ' + (this.modifier.checkboxGroupOnChangeMFlag ? 'undefined' : 'onChange'))
          .id('checkboxGroupOnChangeM_Btn')
          .height('5%')
          .onClick(() => {
            this.modifier.checkboxGroupOnChangeMFlag = !this.modifier.checkboxGroupOnChangeMFlag
          }).margin({ top: 5 } as Margin)
      }
    }
  }
}
