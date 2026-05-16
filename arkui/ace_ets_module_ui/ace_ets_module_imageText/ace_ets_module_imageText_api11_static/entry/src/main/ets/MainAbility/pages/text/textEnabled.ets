'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

//Text组件和事件禁用
import {
  Entry,
  Component,
  Column,
  Text,
  ClickEvent,
  ColumnOptions,
  MouseEvent,
  Margin,
  TextAlign,
  MouseButton,
  MouseAction,
  KeyEvent
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct textEnabledDemo {
  @State text1: string = 'onClick-禁用'
  @State text2: string = 'onTouch-禁用'
  @State text3: string = 'onKeyEvent-禁用'

  @State text4: string = '鼠标事件onHover-禁用'
  @State text5: string = '鼠标事件onMouse-禁用'
  @State action: string = ''
  @State mouseBtn: string = ''

  @State text6: string = '焦点事件-禁用'
  @State text7: string = '鼠标事件onMouse-禁用'

  build() {
    Column({ space: 0 } as ColumnOptions) {
      Text(this.text1).key("texEnd1")
        .border({width: 1})
        .textAlign(TextAlign.Center)
        .width('90%')
        .onClick((e:ClickEvent) => {
          this.text1 = '点击事件已触发'
        })
        .enabled(false)
        .height('10%')

      Text(this.text2).key("texEnd2")
        .border({width: 1})
        .textAlign(TextAlign.Center)
        .width('90%')
        .onTouch(() :void=> {
          this.text2 = '触摸事件已触发'
        })
        .enabled(false)
        .height('10%')

      Text(this.text3).key("texEnd3")
        .border({width: 1})
        .textAlign(TextAlign.Center)
        .width('90%')
        .onKeyEvent((event:KeyEvent):boolean => {
          this.text3 = '按键事件已触发'
          return true
        })
        .enabled(false)
        .height('10%')

      Text(this.text4).key("texEnd4")
        .border({width: 1})
        .textAlign(TextAlign.Center)
        .width('90%')
        .onHover(() :void=> {
          this.text4 = '鼠标事件onHover 已触发'
        })
        .enabled(false)
        .height('10%')

      Text(this.text5).key("texEnd5")
        .border({width: 1})
        .textAlign(TextAlign.Center)
        .width('90%')
        .onClick((event: ClickEvent) => {
          this.text5 = '鼠标事件onMouse 已触发'
        })
        .enabled(false)
        .height('10%')

      Text(this.text6).key("texEnd6")
        .border({width: 1})
        .textAlign(TextAlign.Center)
        .width('90%')
        .focusable(true)
        .onFocus(() => {
          this.text6 = '焦点事件onFocus 已触发'
        })
        .onBlur(() => {
          this.text6 = '焦点事件onBlur 已触发'
        })
        .enabled(false)
        .height('10%')

      Text(this.text7).key("texEnd7")
        .border({ width: 1 })
        .textAlign(TextAlign.Center)
        .width('90%')
        .onMouse((event: MouseEvent) => {
          switch (event.button) {
            case MouseButton.None:
              this.mouseBtn = 'None';
              break;
            case MouseButton.Left:
              this.mouseBtn = 'Left';
              break;
            case MouseButton.Right:
              this.mouseBtn = 'Right';
              break;
            case MouseButton.Back:
              this.mouseBtn = 'Back';
              break;
            case MouseButton.Forward:
              this.mouseBtn = 'Forward';
              break;
            case MouseButton.Middle:
              this.mouseBtn = 'Middle';
              break;
          }
          switch (event.action) {
            case MouseAction.Hover:
              this.action = 'Hover';
              break;
            case MouseAction.Press:
              this.action = 'Press';
              break;
            case MouseAction.Move:
              this.action = 'Move';
              break;
            case MouseAction.Release:
              this.action = 'Release';
              break;
          }
          this.text7 = '鼠标事件onMouse 已触发'
        })
        .enabled(false)
        .height('10%')
    }
    .width('100%').height('100%')
    .margin({ top: 20 } as Margin)
  }
}