'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Column, ColumnOptions, RowOptions, Component, Row, Button, ClickEvent, BlurStyle, Flex, FlexWrap,
  Color, TextPickerResult, FontWeight,TextPickerDialogOptions, TextPickerDialogOptionsExt } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct pickerDialogExample {
  private select: Int | Int[] = 0
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4', 'banana5']
  @State v: string = '';

  build(){
    Column() {
      Row({space:5} as RowOptions) {
        Button('1')
          .id('TextPickerDialog1')
          .onClick((e: ClickEvent) => {
            this.getUIContext().showTextPickerDialog({
              range: this.fruits,
              selected: this.select,
              enableHapticFeedback:true,
            } as TextPickerDialogOptionsExt)
          });

        Button('2')
          .id('TextPickerDialog2')
          .onClick((e: ClickEvent) => {
            this.getUIContext().showTextPickerDialog({
              range: this.fruits,
              selected: this.select,
              enableHapticFeedback:false,
            } as TextPickerDialogOptionsExt)
          });

      }
      Row({space:5} as RowOptions) {
        Button('3')
        .id('TextPickerDialog3')
        .onClick((e: ClickEvent) => {
          this.getUIContext().showTextPickerDialog({
            range: this.fruits,
            selected: this.select,
            enableHapticFeedback:undefined,
          } as TextPickerDialogOptionsExt)
        });

      }
    }
  }
}