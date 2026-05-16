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
  Component,
  Button,
  ClickEvent,
  $r,
  Row,
  Divider,
  ColumnOptions,
  BorderOptions,
  Color,
  Toggle,
  Blank,
  Margin,
  List,
  Padding,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Checkbox,
  CheckBoxShape,
  ResourceColor,
  MarkStyle
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct CheckboxSelectTest {
  @State checkbox1SelectParam: boolean | undefined  = false;
  @State checkboxSelectedColor: ResourceColor | undefined = undefined;
  @State checkboxUnselectedColor: ResourceColor | undefined = undefined;
  @State isOnChange: boolean = true;
  @State cnt : int = 0;
  @State isMarkUndefined: boolean = false;
  @State isShape: boolean = false;
  @State flag: boolean = false;
  @State flag02: boolean = false;
  private aaa:MarkStyle = {
    strokeColor: Color.Red,
    size: 80,
    strokeWidth: 15
  } as MarkStyle;

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Checkbox({ name: 'checkbox1', group: 'testGroup' })
          .select(this.isOnChange ? this.checkbox1SelectParam : undefined)
          .selectedColor(this.flag ? '#FF0000FF' : undefined)
          .unselectedColor(this.flag02 ? '#FF0000FF' : undefined)
          .mark(this.isMarkUndefined ? undefined : this.aaa as MarkStyle)
          .shape(this.isShape ? undefined : CheckBoxShape.ROUNDED_SQUARE)
          .width(30)
          .height(30)
          .id('MyCheckBox')
      }

      Flex({ justifyContent: FlexAlign.SpaceEvenly }) {
        Button('Checkbox1: 传true')
          .onClick(() => {
            this.checkbox1SelectParam = true;
          })
          .backgroundColor(0xed6f21)
          .fontColor(Color.White)
          .id('select_true')

        Button('Checkbox1: 传false')
          .onClick(() => {
            this.checkbox1SelectParam = false;
          })
          .backgroundColor(0xed6f21)
          .fontColor(Color.White)
          .id('select_false')

        Button('Checkbox1: 传undefined')
          .onClick(() => {
            this.checkbox1SelectParam = undefined;
          })
          .backgroundColor(0xed6f21)
          .fontColor(Color.White)
          .id('select_undefined')
      }
      Flex({ justifyContent: FlexAlign.SpaceEvenly }) {
        Button('change flag').onClick((event: ClickEvent) => {
          this.flag = !this.flag;
        })
          .id('selectedColor_flag')

        Button('change flag02').onClick((event: ClickEvent) => {
          this.flag02 = !this.flag02;
        })
          .id('selectedColor_flag02')

        Button('切换为红色（自定义）')
          .onClick(() => {
            this.checkboxSelectedColor = Color.Red;
          })
          .backgroundColor(0x39a2db)
          .fontColor(Color.White)
          .id('selectedColor_true')

        Button('切换为undefined（默认蓝色）')
          .onClick(() => {
            this.checkboxSelectedColor = undefined;
          })
          .backgroundColor(0x39a2db)
          .fontColor(Color.White)
          .id('selectedColor_undefined')
      }
      Flex({ justifyContent: FlexAlign.SpaceEvenly }) {
        Button('切换为红色（自定义）')
          .onClick(() => {
            this.checkboxUnselectedColor = Color.Red;
          })
          .backgroundColor(0x39a2db)
          .fontColor(Color.White)
          .id('unSelectedColor_true')

        Button('切换为undefined（默认灰色）')
          .onClick(() => {
            this.checkboxUnselectedColor = undefined;
          })
          .backgroundColor(0x39a2db)
          .fontColor(Color.White)
          .id('unSelectedColor_undefined')
      }
      Column() {
        Button(`onChange:${this.cnt}`).width(100).height(40).margin(30)
          .id('MyButton')
        Button('isOnChange: ' + this.isOnChange)
          .id('CheckBox_OnChange')
          .onClick((e: ClickEvent) => {
            this.isOnChange = !this.isOnChange
          })
          .height(20)
        Button('isMarkUndefined: ' + this.isMarkUndefined)
          .onClick(() => {
            this.isMarkUndefined = !this.isMarkUndefined
          })
          .id('CheckBox_Mark')
        Button('isShape: ' + this.isShape)
          .onClick(() => {
            this.isShape = !this.isShape
          })
          .id('CheckBox_Shape')
      }
    }
    .width('100%')
    .height('100%');
  }
}